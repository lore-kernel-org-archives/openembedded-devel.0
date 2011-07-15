Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1QheUT-0000M5-3t
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 11:15:21 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p6F8mfPH003319
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 10:48:41 +0200
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p6F8meXR005919
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 10:48:41 +0200
Received: from DEMCHP99ET5MSX.ww902.siemens.net (139.25.131.175) by
	DEMCHP99ET0MSX.ww902.siemens.net (139.25.131.181) with Microsoft SMTP
	Server (TLS) id 8.3.106.1; Fri, 15 Jul 2011 10:48:40 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET5MSX.ww902.siemens.net ([139.25.131.175]) with mapi;
	Fri, 15 Jul 2011 10:48:40 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jul 2011 10:48:38 +0200
Thread-Topic: PSTAGE_MIRROR not working with file:// uri
Thread-Index: AcxCy/2YMyocLmaaToqiTtBhS9tkag==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E0157569474@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: PSTAGE_MIRROR not working with file:// uri
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2011 09:15:21 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

[bitbake 1.12 / OE 2010.12]

I am facing a quite strange issue with packaged-staging (INHERIT +=3D "pack=
aged-staging" in local.conf) when trying to use a pre-built toolchain.

1. First I build the toolchain:
  $ bitbake meta-toolchain

2. Then I save out the ${PSTAGE_DIR} somewhere and remove ${TMPDIR}:
  $ rsync -a --delete ${PSTAGE_DIR} /path/to/pstage_mirror
  $ rm -rf ${TMPDIR}

3. Now I restore only the staging dir, and build something:
  $ mkdir -p ${PSTAGE_DIR}
  $ rsync -a /path/to/pstage_mirror ${PSTAGE_DIR}
  $ time bitbake busybox

  =3D> works fine: packaged staging is working as expected, the toolchain i=
s not rebuilt and busybox is built in few minutes.

4. Now, rather than manually restoring the ${PSTAGE_DIR}, I want to use PST=
AGE_MIRROR. The point is, if the URI for PSTAGE_MIRROR is anything but file=
://, it works fine, e.g.:
  ## put PSTAGE_MIRROR =3D http://localhost:pstage_mirror in local.conf, an=
d=20
  ## configure the web server to make this uri points to /path/to/pstage_mi=
rror
  $ rm -rf ${TMPDIR}
  $ time bitbake busybox
 =20
  =3D> it works fine.
But if I set PSTAGE_MIRROR =3D "file:///path/to/pstage_mirror"

  =3D> does not work, the prebuilt packages are not used and everything get=
s re-compiled.



I looked inside the class packaged-staging.bbclass, to try to figure out th=
e problem.
The pre-built package is fetched during do_setscene. In the function packag=
estage_scenefunc(), there is following code:

    stagepkg =3D bb.data.expand("${PSTAGE_PKG}", d)
    if not os.path.exists(stagepkg):
        staging_fetch(stagepkg, d)

    if os.path.exists(stagepkg):
        ...

stagepkg points to the ipk file in ${PSTAGE_DIR} (which is not yet present)=
.
The problem is, after returning from staging_fetch(), the file is still not=
 present:

        # Try a fetch from the pstage mirror, if it fails just return and
        # we will build the package
        bb.debug(1, "Attempting to fetch staging package %s" % (bn))
        try:
            bb.fetch.init([srcuri], pd)
            bb.fetch.go(pd, [srcuri])
        except Exception, ex:
            bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex)=
)
        else:
            bb.debug(1, "Fetched staging package %s" % bn)

=3D> bb.fetch.go() does not throw an exception, _but_ the file has not been=
 fetched.


I guess this must already have worked, mainly because of this comment in th=
e .bbclass:

  # To use the prebuilt pstage packages, save them away..
  # $ rsync --delete -a tmp/pstage/ /there/oe/build/pstage_mirror
  # .. and use it as mirror in your conf/local.conf:
  # PSTAGE_MIRROR =3D "file:///there/oe/build/pstage_mirror"

So I wondered if someone can confirm that PSTAGE_MIRROR has already worked =
with a file:/// uri,
and could see what I am missing here.

With Kind regards,
   Fabrice


