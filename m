Received: from [206.190.48.166] (helo=web52403.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lucian_ion_2000@yahoo.com>) id 1MRhpq-0005nk-4P
	for openembedded-devel@openembedded.org; Fri, 17 Jul 2009 09:26:26 +0200
Received: (qmail 86111 invoked by uid 60001); 17 Jul 2009 07:12:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1247814768; bh=gOoa26eLu+fVp9j6/EOOx46X/QMd+afUc1ZR5ebQlw0=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=EScCeNtQbMcxEahjH8WZU4hYEl6HK6+fHpNhL/KrZyiWiZlZUnZnrdBMQUvb9TxUtgV0z7SFwZAf6seG1Evkri1NwHpC8Bax1cRGjxDbWBj5Mx70OtU1KCWTwvzFStqCK3Nj4bFAIzyEwGBYfsWdwFaArvqpuo5PqnQtfm74jEw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=oTf/y9W45ALWwyYSDM4HxpMoYlvWGzJAY4BKUk2Mth2drz3tnDrLzg3x51NPj0eLa7rVMQpV8uMggJFqwgIVJfyhQYNT2ekU3aVJX2zGmyPIzOk607X6oypolSZgMAkxpdWu5M7RFVJNVCVZnNllbHnf5jRvT1DWK/qrwQLjM2Q=;
Message-ID: <736225.85365.qm@web52403.mail.re2.yahoo.com>
X-YMail-OSG: ufFW1HEVM1mJJcX4HIEoqXYGva7dRfX0.gcMYVPlT7icRpHjWNeRxK0U7w6RW2jU1wkzLbdF.nQASnLK9Jl9pCgjW_c_k_HjR3CsOJidhsZ3OF1mm8kxVhbiY4FHadEPL.dEBf.2Tl2OO07Ty_YHqVanBJtP3V.pEEIQQq03BMPH.3XpqKYMFcXPoiFbmhvvU8B8.S6Tzq.SktiwsWQHBjdbM3beUiEWI6VkXiOYrH_fdFaZup6fp3_H8mo5bxING4OJE7Ix0F6LrpsgqKbxzP.Ayoq.pKIHdrVMt3Wipo1gAhhR7V2HqVBb.73n2lKbsf9EZiWJCOM8FzEJLz1VtMM96BYpA68c
Received: from [87.198.251.22] by web52403.mail.re2.yahoo.com via HTTP;
	Fri, 17 Jul 2009 00:12:48 PDT
X-Mailer: YahooMailRC/1358.21 YahooMailWebService/0.7.289.15
References: <E1MRRlx-0004ks-DE@melo.openembedded.org>
Date: Fri, 17 Jul 2009 00:12:48 -0700 (PDT)
From: Lucian Ion <lucian_ion_2000@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1MRRlx-0004ks-DE@melo.openembedded.org>
MIME-Version: 1.0
Subject: After updating today it fails to build angstrom gpe-image.
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
X-List-Received-Date: Fri, 17 Jul 2009 07:26:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


My build fails:=0A=0Abitbake gpe-image=0AWARNING: No matches in filesystem =
for /home/luciani/stuff/openembedded/build/ in COLLECTIONS=0A__builtin__:74=
: DeprecationWarning: the sets module is deprecated=0A__builtin__:74: Depre=
cationWarning: the sets module is deprecated=0ANOTE: Handling BitBake files=
: - (6985/6985) [100 %]=0ANOTE: Parsing finished. 6693 cached, 0 parsed, 29=
2 skipped, 0 masked.=0ANOTE: Cache is clean, not saving.=0ANOTE: Resolving =
any missing task queue dependencies=0ANOTE: Runtime target 'bluez-utils-dbu=
s' is unbuildable, removing...=0AMissing or unbuildable dependency chain wa=
s: ['bluez-utils-dbus', 'bluez-libs-3.36']=0AERROR: Required build target '=
gpe-image' has no buildable providers.=0AMissing or unbuildable dependency =
chain was: ['gpe-image', 'task-gpe-base', 'bluez-utils-dbus', 'bluez-libs-3=
.36']=0A=0A=0ALatest update today:=0A=0ARemoved recipes/linux/linux-omap-2.=
6.29/isp/base/0001-omap3-Add-base-address-definitions-and-resources-fo.patc=
h                                             =0ARemoved recipes/linux/linu=
x-omap-2.6.29/isp/standalone/0001-Resizer-and-Previewer-driver-added-to-com=
mit.patch                                              =0ARemoved recipes/l=
inux/linux-omap_2.6.30+2.6.31-rc1.bb                                       =
                                                                =0AMerge ma=
de by recursive.                                                           =
                                                                         =
=0A classes/angstrom.bbclass                           |   19 +            =
                                                                           =
         =0A conf/distro/angstrom-2008.1.conf                   |    3 +   =
                                                                           =
                  =0A conf/distro/include/angstrom.inc                   | =
   3 +                                                                     =
                           =0A conf/machine/include/omap3.inc              =
       |    2 +-                                                           =
                                    =0A recipes/libopie/libopie2_cvs.bb    =
                |   15 +-                                                  =
                                             =0A recipes/libqpe/libqpe-opie=
_cvs.bb                  |    4 +-                                         =
                                                      =0A .../linux/linux-2=
.6.29+2.6.30-rc4/tx25/defconfig   |  255 ++-                               =
                                                               =0A .../linu=
x/linux-omap-2.6.29/beagleboard/defconfig  |   58 +-                       =
                                                                        =0A=
 ...base-address-definitions-and-resources-fo.patch |  153 -               =
                                                                           =
      =0A ...er-Basic-Resizer-refreshed-with-latest-gi.patch | 1890 +++++++=
++++++                                                                     =
               =0A ...MAP3-Resizer-V4L2-buf-layer-issues-fixed.patch} |   3=
5 +-                                                                       =
                        =0A .../0025-OMAP3-Resizer-Build-issues-fixed.patch=
    |   36 +                                                               =
                                 =0A ...izer-and-Previewer-driver-added-to-=
commit.patch | 2915 --------------------=0A recipes/linux/linux-omap_2.6.29=
.bb                 |    6 +-=0A recipes/linux/linux-omap_2.6.30+2.6.31-rc1=
.bb      |   28 -=0A recipes/linux/linux_2.6.29+2.6.30-rc4.bb           |  =
  2 +-=0A recipes/mythtv/mythtv_svn.bb                       |   41 +-=0A .=
../opie-taskbar/opie-taskbar/server-pro-cvs.patch |   68 +=0A recipes/opie-=
taskbar/opie-taskbar_cvs.bb           |    4 +-=0A 19 files changed, 2365 i=
nsertions(+), 3172 deletions(-)=0A create mode 100644 classes/angstrom.bbcl=
ass=0A delete mode 100644 recipes/linux/linux-omap-2.6.29/isp/base/0001-oma=
p3-Add-base-address-definitions-and-resources-fo.patch=0A create mode 10064=
4 recipes/linux/linux-omap-2.6.29/isp/resizer/0023-OMAP-Resizer-Basic-Resiz=
er-refreshed-with-latest-gi.patch=0A rename recipes/linux/linux-omap-2.6.29=
/isp/{standalone/0002-Resizer-bug-fixes-on-top-of-1.0.2-release.patch =3D> =
resizer/0024-OMAP3-Resizer-V4L2-buf-layer-issues-fixed.patch} (96%)=0A crea=
te mode 100644 recipes/linux/linux-omap-2.6.29/isp/resizer/0025-OMAP3-Resiz=
er-Build-issues-fixed.patch=0A delete mode 100644 recipes/linux/linux-omap-=
2.6.29/isp/standalone/0001-Resizer-and-Previewer-driver-added-to-commit.pat=
ch=0A delete mode 100644 recipes/linux/linux-omap_2.6.30+2.6.31-rc1.bb=0A c=
reate mode 100644 recipes/opie-taskbar/opie-taskbar/server-pro-cvs.patch=0A=
=0A=0A=0ARegards,=0ALucian=0A=0A=0A      


