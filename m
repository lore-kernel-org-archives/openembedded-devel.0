Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2BA7CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:46 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t1so22468126wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vGZtlB4Bpn/jUtGmH2E2SQmzbjawBtNqjnY/1qhGGH8=;
	b=gMcbTmiUS5BkEt2ZkT//pg2ai0quSfeZHy8EJ5gzv/55RZCxuTgHALEXoRwXCNs0fu
	LGtsd9pVSrl5gM7J3tZVZf9d+/vPOH9ox+lih1132T48RnKX8b88OwXNBFpnTgkWIHTP
	aXws9GNpIpzruOEVYSDLZ3FiRaiQiwOw/1IW6tpkgyo5r2zG8rv1BiuGpuFpv6bTLZnH
	H6tR03CXImm07jxoiHdKP637KxxF6+tktwlDV480+P/bM2WYEFcitDuOQ3ARTEAGO0ZL
	zvnZhksI/ZUb0BuoHh4+G5ezUbb9efKevoGtz79ZPr/DSWE4pgl0LZmnxVkjMzD8Hsix
	te/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vGZtlB4Bpn/jUtGmH2E2SQmzbjawBtNqjnY/1qhGGH8=;
	b=J+1ksnVzoNmffWQ4fpZaJX9CINFBh2uxxVfi6tYrKRniQhi5B2ljsreq6bsnglOEGZ
	6EX2bkeHj+CF1XyitzPghXGnCPEuaS8aniJ0y3iRo3ZZn11bB2kRjNUTawf1W1AT6NYD
	xKhvqed6/k1nNN3yCnbFp+IKdP6sblkVhbLrSIDOgRMKLhzQ8FTtOhDmREseP5+JG1KY
	h6wtyhaOyrqv9OeNTEXVHecnRqt/1qRtZ3ZiPHpHZwPaxYNTKw49GgHIc55xgW+IKKT+
	FKaW3EFmWA8UtzQrn7PFZZnCIO7bzJEx14H9uIxKc6OELeUJPigeZlFG2Pp0vhTSOEZq
	Dhhg==
X-Gm-Message-State: APjAAAWISv7E5QilRnx3WSSbAXdd3YeLrzFXObXJA7DpOFLpn8OfJN7O
	m6rRU3wn03tU5CXBT47ezHS/hztg
X-Google-Smtp-Source: APXvYqxIu9m0mrPDENrbs0pLsuOPu77kFOIOWPxoaUEy0vm+0kqNEF69HbVIdPgbFIR6L0K5bm/KWQ==
X-Received: by 2002:a5d:44c1:: with SMTP id z1mr33595329wrr.162.1574147867041; 
	Mon, 18 Nov 2019 23:17:47 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:28 +0100
Message-Id: <20191119071730.2682-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] gnome-settings-daemon: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
index d6af7a72e..ba1e734da 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gobject-introspection gettext distro_features_check upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection gettext distro_features_check upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "528b0b7cc2dd22c6026a9c8739c71fa7"
 SRC_URI[archive.sha256sum] = "7ce4979817866911a94ecb75b36db56797e038c0c524c5c1a81aefccafc17337"
-- 
2.21.0


