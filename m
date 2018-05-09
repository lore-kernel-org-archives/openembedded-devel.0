Return-Path: <robert_joslyn@selinc.com>
X-Greylist: delayed 1777 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 May 2018 21:34:22 UTC
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id 10B4B750BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 21:34:22 +0000 (UTC)
Received: from pps.filterd (valiant.selinc.com [127.0.0.1])
	by valiant.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w49L2XqV021979
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 May 2018 14:04:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=to : subject :
	message-id : from : date : content-type : content-transfer-encoding :
	mime-version; s=SELinc2017;
	bh=JXh55ldXtVT3gHH5dKMEStghJZHBW3Inoefs7C56HTo=;
	b=KV0YaGZ65GCrTLkMOZwLdz2wcQCg2bdHvsaSJAKkmTdk9FAXDcwt9pzrJHl/NcREloPp
	96rw3zvYp8L8u9h7lZnoHvP7E2AkxT9lXFizo/+oDFL1NzQPU77/hju/MiDAIgdzPyNM
	mzAjEaUDvzvFRLdmbxJQtwhdzrDCDyPVdzY8/Dx/idXdW0u/ZOHQ6wlhW5TIL9bLm+EL
	8Fh2q+3wnPAemZg2v/2P8ZETBISx94Lr1/59kTxk8+QpJ/KD65ZXd/3IZ+wnn0OKMwWN
	vWFGbEtBkiBZSx0KgQO58azdDmwd37JuC5xLGnyTg1BNLhoxvsF6hNkKpJbjKwrCWAAA
	gg== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by valiant.selinc.com with ESMTP id 2hsapvfgxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 14:04:47 -0700
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/09/2018 02:00:36 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/09/2018 02:00:36 PM,
	Serialize complete at 05/09/2018 02:00:36 PM,
	S/MIME Sign failed at 05/09/2018 02:00:37 PM: The cryptographic key was
	not found,
	S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/09/2018 02:04:27 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/09/2018 02:04:27 PM,
	Serialize complete at 05/09/2018 02:04:27 PM,
	S/MIME Sign failed at 05/09/2018 02:04:27 PM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 05/09/2018 02:04:46 PM,
	Serialize complete at 05/09/2018 02:04:46 PM
To: openembedded-devel@lists.openembedded.org
X-KeepSent: C304E1FF:C64CA001-88258288:006EE4FE;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OFC304E1FF.C64CA001-ON88258288.006EE4FE-88258288.0073C3D0@selinc.com>
From: robert_joslyn@selinc.com
Date: Wed, 9 May 2018 14:04:27 -0700
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8888
	signatures=668698
Subject: meson.bbclass broken on rocko
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
X-List-Received-Date: Wed, 09 May 2018 21:34:24 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

I have a build based on poky that makes use of meson.bbclass from meta-oe=20
that is now broken after a recent update to OE-core. When using the latest=
=20
rocko branches from poky and meta-oe, my meson builds end up with the=20
wrong paths to ld and libc. For example, running ldd on one of my=20
binaries:

linux-vdso.so.1 (0x00007fff4f9ee000)
libc.so.6 =3D>=20
/home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib=
/libc.so.6=20
(0x00007f1136f8c000)
/home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-linux/lib=
/ld-linux-x86-64.so.2=20
(0x00007f1137560000)

Those paths going into my home directory are obviously not correct. I=20
bisected the issue, and commit cead3c4925d39f8adc328007d8a8c1b23cc72842 in=
=20
openembedded-core is when the problem starts:=20
https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__cgit.openembedded.org=
_openembedded-2Dcore_commit_-3Fh-3Drocko-26id-3Dcead3c4925d39f8adc328007d8a=
8c1b23cc72842&d=3DDwIBAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=
=3DFXexzueMZc3SeYPHXBmsGdHLENOHmHsvnD0cO1_Z0j2tHI6VqrQPNkHBCZO8dAdc&m=3DJSV=
ZRc5Fq4IsIwtkdFHpTXsgF8aCQ0vP6j_F7dT5tYc&s=3DOutJG7fOSrT6ANwnnyxx12eHu6yepO=
-b2NWHJeP93x0&e=3D

When using the tip of rocko, I can make the issue go away by removing this=
=20
export from meson.bbclass:
=20
export LDFLAGS =3D "${BUILD_LDFLAGS}"

I'm not really familiar with how this works, but it looks like the change=20
to BUILD_LDFLAGS in uninative.bbclass is forcing the binaries to use the=20
uninative ld, which isn't desired here. I assume meson.bbclass should not=20
be setting LDFLAGS using ${BUILD_LDFLAGS}.

I can send a patch removing this export, but it feels like all the exports=
=20
in meson.bbclass are incorrect. The class has been reworked and moved to=20
OE-core for sumo, so I can send a patch backporting the entire class if=20
that is preferred.

Thanks,
Robert

