Return-Path: <dave.lerner@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83E7A6011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 17:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBSHEmNj028600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 09:14:49 -0800
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.244]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Mon, 28 Dec 2015 09:14:48 -0800
From: "Lerner, Dave" <dave.lerner@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] qtwebengine link errors agains icu
Thread-Index: AdE92jUNenR6giY9T/i5KAFx8Nr1xw==
Date: Mon, 28 Dec 2015 17:14:48 +0000
Message-ID: <011977994B5AE74ABA2BD08E983BAAABDBE8EAD6@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.44.99]
MIME-Version: 1.0
Subject: [meta-qt5] qtwebengine link errors agains icu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Dec 2015 17:14:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On branches jethro and jethro-next I get several link errors building qtweb=
engine like:=0A=
...=0A=
qtwebengine/5.5.1+gitAUTOINC+qtwebengine_146ebe26dc-r0/git/src/3rdparty/chr=
omium/ui/gfx/render_text.cc:1186: error: undefined reference to 'icu_52::Un=
icodeString::UnicodeString(unsigned short const*)'=0A=
/ord-dlerner-d81/dlerner/poky_19/qtwebengine-qtqtuick-errors-jethro/tmp/wor=
k/core2-64-poky-linux/qtwebengine/5.5.1+gitAUTOINC+qtwebengine_146ebe26dc-r=
0/git/src/3rdparty/chromium/ui/gfx/render_text.cc:1186: error: undefined re=
ference to 'icu_52::StringCharacterIterator::StringCharacterIterator(icu_52=
::UnicodeString const&)'=0A=
...=0A=
=0A=
My local.conf includes=0A=
MACHINE ?=3D "qemux86-64"=0A=
PACKAGECONFIG_pn-qtbase_append =3D " accessibility"=0A=
IMAGE_INSTALL_append +=3D " qtbase qtbase-fonts qtbase-plugins qtwebengine"=
=0A=
PREFERRED_PROVIDER_jpeg =3D "libjpeg-turbo"=0A=
PREFERRED_PROVIDER_jpeg-native =3D "libjpeg-turbo-native"=0A=
=0A=
This bug is referenced upstream in Task-number: QTBUG-49693 and the bug is =
already fixed in the repo referenced by the meta-qt5 recipe at  git://githu=
b.com/qtproject/qtwebengine.git commit 1847e158e09e24af704b02c8fb30adbf04d3=
befa branch 5.5, 17 commits after the current meta-qt5 qtwebengine_git.bb S=
RCREV_qtwebengine =3D "ce095e94b6861".   =0A=
=0A=
The change below corrects the link issue.=0A=
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch=
 \=0A=
     file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch=
 \=0A=
 "=0A=
-SRCREV_qtwebengine =3D "ce095e94b686196629244073990530441b9b5f4f"=0A=
+SRCREV_qtwebengine =3D "1847e158e09e24af704b02c8fb30adbf04d3befa"=0A=
=0A=
Regards,=0A=
Dave=

