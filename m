Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953A1EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 20:53:22 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.18334.1690491199158443263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 13:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=gkP1KKju;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=WmnrYxQt;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7FBEC320079B;
	Thu, 27 Jul 2023 16:53:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 27 Jul 2023 16:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1690491198; x=
	1690577598; bh=jhVXIluAp7CIZG5ovapCvyNqNYV94tDn5rJdfs3oXZ0=; b=g
	kP1KKju6MceQ/MqeqOcWmsbKj5OpW2WyV0Zi6bDXISfli94yHxX3gjFV8OHfu8qI
	ztndjaLgwYF1+o003cQoqmPSL4lKvN5DZdXJz+sC95ZgAFDjua9JMlmKWljCTAql
	uoDN3T4Svee6VzMMerkTvVWk/sdQGaEiUTPzs+PokSrZofnYEMVUBGi4xvIezVmy
	p2DvVhSMTVF47bJUeUDQ0nTt4W3vTrnmCnmxZrQbwVPYEUg8ixPrGC1Qhv0IKNyg
	EnhhjQCGMXsywR0du2T4Ks1zHA+rsb4J4Q+8hUk8VpnDeRqhNb+3ETCpMkStehR6
	KVA5c2FV8N6x4Ez5/sc7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1690491198; x=
	1690577598; bh=jhVXIluAp7CIZG5ovapCvyNqNYV94tDn5rJdfs3oXZ0=; b=W
	mnrYxQtfMTyeon1irXj7fRSPeSk8t4z1ckwBJo87WmoZY4kwM0k+UEzXlHw2aHRg
	G3yX4Vg1a3EPUrol5g2ofpxQWmckCtjnqGuPbzh0ijBJU7M+HnGZXaoLKYnrV3lW
	t0Gz9eaErpLozcU6ouYEMb7jLK0t3l4hg4z7JXcJg3q1rzZNCwLivdWLUTfMED1J
	+s9dfedmrRHfaUGaMw0Q4KdwAY01E4ApvA/VanNEPK8l4PTf2oR9ZrPE+Rlx6v+n
	DX6IE04rOrh3W1BkoPTWf8+MK8dvu85qGfcSPQ51R+vopKlI5SA6C+8NXTGsndGq
	DF5r9YnGKxnbgBc96kINg==
X-ME-Sender: <xms:PdnCZGysbxNcsy4ajwNiHI_e6maq0V_MJdhPt-sMrGUoKhW82ZZ0vQ>
    <xme:PdnCZCSO-37kKkCW5gXzdj1LLn5Df3XhU3bL-ZDq9q-2h6D54cIaiUmuiojarADgL
    ED1yVCDY0Yil9Qm2g>
X-ME-Received: <xmr:PdnCZIU1YEsuAc98a8bpZgDH7VWAX-RV3dCayFBuwkX-_KzIJiJ0p-oDvblGg8KjtavH2wdMkTTrTmQME7Znm4QnD-oeXoC3_d35yOSZGYyT0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieeggdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptghvuhgs
    rhhughhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepjefhhfeike
    ejgeevtdfgueeihfduveegtedutdeuudehfeefheeiffetgfejuedvnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:PdnCZMizi3mzi1lSVON0zAMC7QWI3TaWizfOGdrw-waZEthYlnzsQA>
    <xmx:PdnCZIAApaxMZuN1rpUdH_8fxchxcp_t3DUFvhNL36tLV_vWEZIjrg>
    <xmx:PdnCZNLSmreXk_1q_eIf2ln5aYf-ATTqEi40Hcnaxk8CzMpJh4zSrA>
    <xmx:PtnCZDqeKvgQUeISx-cQpRIg9TfWU6PxfNYTcpprEhR1R287ej8SBA>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jul 2023 16:53:17 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH v2 2/2] nvme-cli: upgrade 1.13 -> 2.5
Date: Thu, 27 Jul 2023 22:53:09 +0200
Message-Id: <20230727205309.41265-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727205309.41265-1-cvubrugier@fastmail.fm>
References: <20230727205309.41265-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 20:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104062

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../{nvme-cli_1.13.bb => nvme-cli_2.5.bb}      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_1.13.bb => nvme-cli_2.5.bb} (65%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
similarity index 65%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
index 1055fa42a..dd273e24d 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
@@ -2,22 +2,20 @@ SUMMARY = "NVMe management command line interface"
 AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
-DEPENDS = "util-linux"
-PV .= "+git${SRCPV}"
+LICENSE = "GPL-2.0-only & CC0-1.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
+                    file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
+                    file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
+DEPENDS = "json-c libnvme"
+SRCREV = "d6c07e0de9be777009ebb9ab7475bee1ae3e0e95"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
-SRCREV = "f0e9569df9289d6ee55ba2c23615cc7c73a9b088"
 
 S = "${WORKDIR}/git"
 
-inherit bash-completion systemd
+inherit bash-completion meson pkgconfig systemd
 
-do_install() {
-    oe_runmake install-spec DESTDIR=${D} PREFIX=${prefix} \
-        UDEVDIR=${nonarch_base_libdir}/udev SYSTEMDDIR=${systemd_unitdir}
-}
+EXTRA_OEMESON += "-Dsystemddir=${systemd_unitdir}/system"
 
 pkg_postinst_ontarget:${PN}() {
     ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
-- 
2.30.2


