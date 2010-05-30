Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin@ti.com>) id 1OIoGj-000596-Vb
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 21:34:00 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o4UJQiRi030414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:44 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o4UJQiLS018939
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:44 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o4UJQild015864
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 14:26:44 -0500 (CDT)
Received: from dlee02.ent.ti.com ([157.170.170.17]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Sun, 30 May 2010 14:26:44 -0500
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 30 May 2010 14:26:43 -0500
Thread-Topic: [oe] Examples of srctree and gitver
Thread-Index: AcsAFocph8alxZ8NR4mcavy+nS2NiwAFh/mw
Message-ID: <A24693684029E5489D1D202277BE894455A0F301@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
	<Pine.LNX.4.64.1005301226590.27172@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.1005301226590.27172@juice.ott.cti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: martin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 19:34:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2010 at 11:27:45, Michael Smith wrote:

> On Sun, 30 May 2010, Ambrose, Martin wrote:

> > Are there any recipes/examples which use these classes?
>=20

> # Strip off the leading 'v' from the Linux kernel git tags
> GITVER_NO_V =3D "${@'${GITVER}'[1:]}"
> PV =3D "${GITVER_NO_V}"
>=20

Thanks for the pointer.

Looking at the class I see=20
    ver =3D popen(["git", "describe", "--tags"], cwd=3Dpath)               =
                                                                           =
                                                                           =
               =20
    if not ver:                                                            =
                                                                           =
                                                                           =
           =20
        ver =3D popen(["git", "rev-parse", "--short", "HEAD"], cwd=3Dpath)

Normally I work on a named branch so the PV here becomes the capitalized
branch name. My preference would be the shortened commit id which is the
fallback option above. I guess no way to get this functionality unless I
either don't work a branch or locally modify gitver.bbclass.

Regards,=20
Martin


