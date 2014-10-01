Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id DB4137172F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:35 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so948774wiv.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=n47p9aUnLumtOZOZnZRJXs/8vVn3e55rgYeY8m2DEzc=;
	b=GcJKpAbzLCYo+vJUVAztHi8DZ7HixV/7vdCctIaPSBfxT6Jifviq2K1w4zZ+LtTUJQ
	b6jgP7A2sH+ps5cADpgrPIVsJSoTlkVpPeh6dQrQbKoGS/I1POSCIggFXWM2J6ShD4FZ
	8aBTgG5cf0+CePnducfcUhQDUMP1BYzBCHrvoBX2KnF/Qd/rdoynIqBnE+d040H5Kt4f
	l805IW3zC4GNVaT6Rw9RXE04DdtM0OAplQu19JMVgiYXdvblKGZiAsktv+iAtshQYVdh
	KJEuSdSrL2Gj/PxZqdjYLelB3SARi/sg3s/U6JaKzvThovXdToa8Qaxgm24xkYs7/SW/
	hl6Q==
X-Received: by 10.180.10.9 with SMTP id e9mr12129264wib.74.1412151576620;
	Wed, 01 Oct 2014 01:19:36 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:13 +0200
Message-Id: <1412151555-19865-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 13/15] xfce4-whiskermenu-plugin: initial add 1.3.2
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
X-List-Received-Date: Wed, 01 Oct 2014 08:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../whisker/xfce4-whiskermenu-plugin_1.3.2.bb                  | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
new file mode 100644
index 0000000..dd3d8fd
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "An alternate menu for the Xfce desktop environment"
+HOMEPAGE = "http://gottcode.org/xfce4-whiskermenu-plugin/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin cmake
+
+SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
+SRC_URI[md5sum] = "f4de7546588952f84df8a4ad3552c526"
+SRC_URI[sha256sum] = "a104b2266675a3ea3c7b98aab7b075a351d813ea29098504031a62f365e5a0fc"
-- 
1.8.3.1


