Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 98256755FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:37:29 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8U7bTAi018479 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 02:37:29 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015093002372955-778500 ;
	Wed, 30 Sep 2015 02:37:29 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 10:37:28 +0300
Message-Id: <1443598648-2302-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/30/2015 02:37:29 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/30/2015 02:37:29 AM,
	Serialize complete at 09/30/2015 02:37:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-30_02:, , signatures=0
Subject: [meta-oe][PATCH] meta-oe: recipes-devtools: add debootstrap recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 07:37:33 -0000

debootstrap is a tool which will install a Debian base system into a
subdirectory of another, already installed system.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../debootstrap/debootstrap/devices.tar.gz         | Bin 0 -> 767 bytes
 .../debootstrap/debootstrap_1.0.67.bb              |  25 +++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz b/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..20eaba3ad22b1e47f6037dea2a0db73eb262ab25
GIT binary patch
literal 767
zcmZwCeNfAB0LSqWmeAtza1IGwl2gu8?#%BF38A~LD<bo7h$gz-O%L*wNtiRbQnsk`
z(3pqn#&sTlp0iDMQABENY{##e)U{2&eLs%Bz5jXr{SHz33;x#M&souaLK7WS=$o3O
zXx$>ZsnQ25NgZhQuh6w=YnJPhSA_*FtCl6pGAj<PKe_LvYWpB{Z(CFF=|<g|kc_w7
z?`-GPXd&0V`I^2X#r|-cu)U#Y?zq5hM`kwW@BS8ZS^bh#b}cRRrnE%5cOGWy!e#!&
zo_Q|Y)^Blk6aQ|-GQOyuUOn~9A`}`d;uOb8k0lZJ7vOs#WB%p%Fz((I8j)YVl@8sB
z)oNd!Qi@SVS~kOpjVKXKZewGuBvbwZTy89NwU^*c*W9OXvZQxqw`I*dTI=(3`b1G5
z)5IAF_1DAnm>tjwtw&-whEU0bhh3G^$714fW_S;+>2E{qdMet5KqIYj-)Lh{ukV$_
zD-qv-6PR!mNf>EIju8bM+wUlXaeX>{w5fqC(vwYIM%YP3Nz{E|{P|jsdH%sk4P>d6
z99tZDjmGg>x;G+se=71kWJV?;eQaSbjz6~ywz=xO7g~sNLygAH)b_DMpIhQ>F2C92
z@^5pwT0UmVSF%J!UAN~K2h++Jn0TAmU^Ra>SRx?iNz?vkqmVH2CW<%&Xb>2vW)(Ul
z^f6INMqwv&Hq$aEo36eUfubL%Y9ta(Ynh#`rY^1O0Eac*A@wmAt-Wj}oy8WM!yyhs
zu40fd4Ox4-na6gfyw*XgcwG89Ot6k;)}}*LinC#_$RY=MFFN4Gofwq*NT-hpM&9RP
zpAP#fO_I0{JZeXnl!gb%sYKBgmHXh|8PfU4EWVCo)7==jgBQy&T1V$q+kL6!FnUF%
zo(j|^dWhAlDp_bW6aGm)^+riUD={L7BiiioTiyj&UE09`UmU1%V&#rLi34eKTF8|i
lg`pYfzz_{`no;0}G-+Dtic5)C{)_x|f?q~cv>;m`_yZJ@!>9lN

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
new file mode 100644
index 0000000..3169e80
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Install a Debian system into a subdirectory"
+HOMEPAGE = "https://wiki.debian.org/Debootstrap"
+SECTION = "devel"
+PRIORITY = "optional"
+LICENSE = "debootstrap-custom-license"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
+
+inherit autotools pkgconfig
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI  = "\
+    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz \
+    file://devices.tar.gz;unpack=0 \
+"
+
+SRC_URI[md5sum] = "eacabfe2e45415af60b1d74c3a23418a"
+SRC_URI[sha256sum] = "0a12e0a2bbff185d47711a716b1f2734856100e8784361203e834fed0cffa51b"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_install_prepend() {
+    cp ${WORKDIR}/devices.tar.gz ${S}
+    cd "${S}"
+}
-- 
2.1.4


