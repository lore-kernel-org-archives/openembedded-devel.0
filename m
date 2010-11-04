Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PDy4F-0004ta-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 12:33:31 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	oA4BWRiR010037 for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Nov 2010 12:32:28 +0100
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id oA4BWRPt000990
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Nov 2010 12:32:27 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Thu, 4 Nov 2010 12:32:27 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Nov 2010 12:32:26 +0100
Thread-Topic: packaged-staging
Thread-Index: Act8E/TAdZAxru5ZQKWKTsVWKRHmjw==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3A429F2@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.14
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: packaged-staging
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
X-List-Received-Date: Thu, 04 Nov 2010 11:33:33 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to use packaged staging, following the description found here:
http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gi=
ves/
http://blog.denix.org/2008/09/getting-dangerous-with-packaged-staging.html

I set:

DEPLOY_DIR_PSTAGE =3D "${OEBASE}/pstage"

, and then:

$ bitbake base-image
$ rm -rf ${TMPDIR}
$ bitbake base-image

During build I noticed a lot of messages like:
NOTE: Staging package found, using it for <...>/org.openembedded/recipes/ge=
ttext/gettext-native_0.17.bb

But finally the last step fails:

ERROR: function do_rootfs failed

|  * ERROR: Cannot satisfy the following dependencies for task-boot:
| 	 *  kernel *  base-files *  base-passwd *  busybox *  modutils-initscrip=
ts *  netbase *  update-alternatives *
|  * Cannot find package task-boot.
|  * Cannot find package util-linux-mount.
|  * Cannot find package util-linux-umount.
|  * Cannot find package dropbear.
|  * Cannot find package angstrom-version.
|  * Cannot find package hotplug-ng.
|  * Cannot find package libgcc1.
|  * Cannot find package libstdc++6.
|  * Cannot find package initscripts.
|  * Cannot find package sysvinit.
|  * Cannot find package sysvinit-pidof.
|  * Cannot find package tinylogin.
|  * Cannot find package opkg-nogpg.
|  * Cannot find package angstrom-version.
|  * Cannot find package angstrom-feed-configs.
|  * Cannot find package opkg-collateral.
NOTE: Task failed: /home/projects/oe-stable-2009/build/taurus/work/taurus-a=
ngstrom-linux-gnueabi/base-image-1.0-r0/temp/log.do_rootfs.10147

Some remarks:
- It does not help trying to bitbake the indicated missing packages
  but for each package, I need to:
     bitbake <package> -f -c package_write
- After a first build, cross-compiler is installer in ${TEMPDIR}/cross/armv=
5te/bin
  (which is added to the $PATH for oe_runmake)
  But after a packaged-staging build, this directory does not exist;
  the cross-compiler is actually installed in ${TEMPDIR}/cross/bin
  =3D> every do_compile fails
  to circumvent this, I had to :
     cd ${TEMPDIR}/cross
     mkdir armv5te
     ln -s ../bin armv5te

I saw Frans Meulenbroeks already had the same issue:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg03=
314.html

Did someone find a solution?

With kind regards,
   Fabrice Aeschbacher



