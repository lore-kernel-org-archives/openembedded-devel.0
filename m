Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD7AC41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 21:10:01 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.955.1690319397150861702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 14:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=USRMv1cn;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gPhHSqlM;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.25, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7E7415C010D;
	Tue, 25 Jul 2023 17:09:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 25 Jul 2023 17:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1690319396; x=
	1690405796; bh=BQbNMUA6AfGbryEewKC7zCdsxO0xul0Oe2GHNjqiSFE=; b=U
	SRMv1cnqxR51qX5EntjkW2RofVIpZKU6Xxrb+ZKe3oFkmeNZ9iMHP5Ox7Gxm9p8v
	e7JW7LJofVUQxXS6PCxX/XgdR+BgjPaxGduEffK58Uf6gyogof87n0YxklxlVHos
	mn4p8R+xcXqrBNvccYKenXEY4bhvCHVs8Sz0Y0PjZ/xGIB6J62kUga8Oyoqyr5Wp
	1zw7zY5v7fa/arUKDzTWovVh0kNhNvAumhvt+MxjHQezTxr6Sip/YkUvsln85LaD
	lsRsk3Q7YJ3FFtAcv6i3Nx51uxfdu/QrQ+7F8TijSez5KLIHBWIBfYAMhtQxO5mm
	JtnbYLLwR42lzrQ9fP7OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1690319396; x=
	1690405796; bh=BQbNMUA6AfGbryEewKC7zCdsxO0xul0Oe2GHNjqiSFE=; b=g
	PhHSqlMJ3efaJDBuFEGqGgMEy2/iicKEs03cvY+4+tH+agf2aikV1gvE87k7EQUy
	dvh42YMQ3FV7tfbVvLdYKBdFE/tqjzaWEgd8+ga8UY0vdPHFggzWiNYnbe8N0l1f
	cuhdEQBw7G3Nwu3Mw9hnJlB4AlwPhG7lntRVb7onwEpMOLEyplSpGaZVpA5KTpld
	nU1PQAfTtrtVwqQZKHhf4sDqO/d0EePL8RGy2mKVE9lw8RS0nja8hT9fEtPXSoMc
	BXhGhD3HRfXAbyC+BLbwi4Fwj3sSSOl8Q+i7gHjyuq22JoiBi7zp1CHO1BZ5qXp0
	mTrurG1xulnVIDh7uV78w==
X-ME-Sender: <xms:JDrAZHqt4fvcc9idxrZlFK7EVrAy_T0X8aM9CycqnhDTmxtwy_rsqw>
    <xme:JDrAZBqVYAGnDvggUFp4xTHQqPCGNSOckmb90T8BlxUaTazaHT3KO3dSvq29jeips
    WTTt5QvzoGhf3xwhw>
X-ME-Received: <xmr:JDrAZEMwbVOBp5kZRHrNJaA_C7lmBNjcbL0yi_956ZMmJBh8Dw8zOZ-kLUL7y56DKOxkZEdFsDuxO5CRHppxk3W0wt4QduRhZbsix9TgJQMIwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedtgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptghvuhgs
    rhhughhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepjefhhfeike
    ejgeevtdfgueeihfduveegtedutdeuudehfeefheeiffetgfejuedvnecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:JDrAZK4qgXtagcML_n2jA8SGH1lZcIj4b4b-f_FDNk0XPPKC9jrcOg>
    <xmx:JDrAZG5EAxvMfNNvHNu3G6d6R7BB_cPSukDdTSSN4p0JP0uYt7t6fQ>
    <xmx:JDrAZCiTLWqB6hlZ7hKi8ZqTjlCAw4w9CnW6D61dcjZL5gtvrjZsdA>
    <xmx:JDrAZLjyCFE_38PJGWCa1G1kIyNEYtkjPefArMbzTTRKhXvxX19Xdg>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jul 2023 17:09:55 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH 2/2] nvme-cli: upgrade 1.13 -> 2.5
Date: Tue, 25 Jul 2023 23:09:25 +0200
Message-Id: <20230725210925.158485-2-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725210925.158485-1-cvubrugier@fastmail.fm>
References: <20230725210925.158485-1-cvubrugier@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 21:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104027

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Update the recipe to match the changes introduced in nvme-cli v2.0.

 * Add dependency on libnvme since the code base is split between
   nvme-cli and libnvme.
 * Add dependency on json-c.
 * Remove dependency on util-linux since libuuid is no longer needed.
 * Add license information for files from CCAN.
 * Use Meson to build the project.

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../{nvme-cli_1.13.bb => nvme-cli_2.5.bb}      | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_1.13.bb => nvme-cli_2.5.bb} (65%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
similarity index 65%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.5.bb
index 1055fa42a9..dd273e24d0 100644
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
2.40.1


