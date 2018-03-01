Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 14CA6788BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id m12so8244810wrm.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bAAaPVKFKOEEskC5VpDRKu3OBBShqssNvZgg20r56sE=;
	b=pot20dL5P9vrxdrj22erkmlwLOV5e5jyNr7KhFhSLE/B4tRRZH8FIb3vGyaBHkepBa
	zs4Nyq+kRQeIxW+LR3eLKJxrxOrjzwI1DKZcL8pZB/9O7EifRdbBIxqC0Bhow1Hix6d5
	8byUWcCZQHqA6UFSsgzq98B7t6d/OKTHJLjlqQ3zIyvyQg6dopWivG0LJrqbusiUVnce
	i4+iqptzAsR7pNt9cjjwg62AgUP5QRURrfJJBVmgSS+tRIfRfumQpZAK2BEk4Jk8Wf6K
	JKK2B1m1+4NsSCfcD71UOZzIQAR0OM97P2YwNJEKXmjIbB0W1rwQ02Jun2e5HLDutx7O
	McQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bAAaPVKFKOEEskC5VpDRKu3OBBShqssNvZgg20r56sE=;
	b=GqkyktBHXIyUxDVy6EnYckkb8QLLaa+6HyTuEpxB5t2r2b5nuFe02Tjs1KPb6sJz1v
	NpOTCZ8qmySVPo6DecDhI7JA4Vmw17ddVIVxflMY03T25yv1GMkILk0QXWewgskl0I8M
	MeN+J9gLWwLGrjFjT7UwIcWcuYWf4xAyzEFLNI1YSmo2kQX58kofkJJP9WVqh2gRNAnv
	oeB9Y/T9WE5WoOueq7IoIUhNjILHALkHzmw7NOsidr+NLzBMVeOKwRJtDI9Gv80NCaND
	78PCHJQKgUpecMwAsc7+C7yRG2eIsgZXnp8GNlTJDd92aw7czBASgo5NGY1zDSNQZ9fx
	ajyw==
X-Gm-Message-State: APf1xPDtfbyX3/YOOdrAjjdNAjebOWYChWMCQtUltJqRv3hrf3rjbqWs
	1z8z+QpXWblHOMFr6xJ1WfB2Qw==
X-Google-Smtp-Source: AG47ELs92E7+wTyLUimVu3TRwxYa7joG5h3TY03Wg7axvBiX+vZWCeRswbu14KdawB2DbXLHo+Mk0w==
X-Received: by 10.223.199.207 with SMTP id y15mr3450441wrg.158.1519945324594; 
	Thu, 01 Mar 2018 15:02:04 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:38 +0100
Message-Id: <20180301230148.2284-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] devilspie2: update 0.42 -> 0.43
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While at it, add a comment to desktop file.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../devilspie/{devilspie2_0.42.bb => devilspie2_0.43.bb}              | 4 ++--
 meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop           | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.42.bb => devilspie2_0.43.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
index ae2ec5a59..a4636dcf1 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://default.lua \
     file://devilspie2.desktop \
 "
-SRC_URI[md5sum] = "f205409e921aa2d86481f1b8d518da45"
-SRC_URI[sha256sum] = "11f5bc310fba4df404c057461ffb3fadac8ef51d211008c665c48f587a5a3f85"
+SRC_URI[md5sum] = "26eed0b5b4af5c7e13c551eceaeab832"
+SRC_URI[sha256sum] = "ecffc17c62b41e196b72340192a90c4223329df041f135e74c0990860595f828"
 
 inherit pkgconfig gettext
 
diff --git a/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop b/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
index e34e881cd..b80904a0d 100644
--- a/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
+++ b/meta-gnome/recipes-gnome/devilspie/files/devilspie2.desktop
@@ -1,5 +1,6 @@
 [Desktop Entry]
 Type=Application
 Name=Devilspie2
+Comment=Perform scripted actions on windows as they are created
 Exec=devilspie2 -f /etc/devilspie2
 
-- 
2.14.3


