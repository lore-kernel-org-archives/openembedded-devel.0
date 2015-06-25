Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6195B75A33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:36 +0000 (UTC)
Received: by wguu7 with SMTP id u7so61351960wgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=6I2FU4n3rMOKmU0ZljfTEWm/wQZVdAaLWXDgkfredFU=;
	b=ySZyp/FNiS6vONVsQ094NI1VoHJvOqfe+DAIEWJzxM4jCehp1pdQov172aDL57wKE5
	7EbZIhc1/15IeRL2+D6CPgR+ZIImQ0WvWRD2Ls/IZDG6iWT1M6jVQcEtTFHQjfHEOMgS
	zQs9Ry6fjy4JwUiVYoYw+aNpkeDwVHxxbAZhEWdBIeNixnw5zZom49BwRb/IG/QTvFj/
	VHRkIOVMeCffjq0qo8m4cuG/HJhDcruTb3Kg0IRpBKCglwVhUt7byUGTqG58Yn/rCgXt
	i6QDUSR7elvX9c5HewWDwGAftILNcnKhsOgT9RZNuIHBBa27XolmMIExK+YXTUMEYlDT
	rRIw==
X-Received: by 10.180.24.165 with SMTP id v5mr5328265wif.63.1435235797918;
	Thu, 25 Jun 2015 05:36:37 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:54 +0200
Message-Id: <1435235754-7339-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] gnome-settings-daemon: fix PACKAGECONFIG
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

detected by new oe-core feature

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index f45acab..e06c5f9 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -13,7 +13,7 @@ SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
 PACKAGECONFIG[smartcard] = "--enable-smartcard-support,--disable-smartcard-support,nss"
 
-- 
1.9.3


