Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 224067BDE3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 22:13:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o8so13122400qkk.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ol7P4SgAk1BhsjAs0J8EIJ5y36SMOS2cqlxXCTOw8Uk=;
	b=riCXuL9ptFDBjBQ6pkBjZlzMJKPYmP1wq0tAs+DEvDQcm39P7/E/fXUlqOdc3YTIdh
	oOrT9C6WYIQ5bmryxeaJa1jLK8iANMrI5mGfM2SbtQAW/fEhAs5tFQEJ6ehQ3mzdS200
	tqLKzQa0IGNoUpbn2NTz77YysM77djSmTIFfUXgtYNhUfU3blJJtTYdQR9/moCEsm+ei
	eufdeiz/+fGZAJ1xbT0soKBPeCOJdqzb6/WKME/67Ms2I9cFqHgJ/wSB//lnLpF+lxyM
	rzmPzjYnNDuoIOVIM4yeFzlQunbsiwVGkGJgFdgeNQeFP6A9eNQBOd0GI2dZg7gS72g+
	KdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ol7P4SgAk1BhsjAs0J8EIJ5y36SMOS2cqlxXCTOw8Uk=;
	b=Hca/fj8Evpy7aAuG53M8QEsrsfP6LzHKIgqj047sV2bGxLDtq4aKzVUbXygHiwS4z/
	HpvJ+7VhJoJYNNijawmslGtVRyx10CBRd3CZCJPjm8yIx1YeBPCRCQnpBmuxv5w0gjtE
	XTyp47tKTVWs9iYoKompHXVxbPfUQlV6bKl0gQ/sKMtTI/jJrkWIRdMqBFl8gYQ2O4mi
	FYlf3SccoZwqD+8YPLzpdRXPIGqofwYZFpTWxS9LyoB5f5DVpILvCOCVldme9PLbNtvK
	N5SupWZTn16Hvc8Jr8OFp3CoJC+hexWfUhefuPHYNwmwPA6JtV9we4x7w1QolXS6FWrF
	o1ow==
X-Gm-Message-State: AJcUukcpe/Wq+0V0sXVjgJrKakXGFEP55M5LYKgr9iMuNhvEWRNDym9p
	fFhI023GRyGHKXZDxtjZm6SxCqfx
X-Google-Smtp-Source: ALg8bN4Ejp+6CV3KXGyYb6OEXAFZ0L16UWam+cjBLkkrtkTf0RSgLHrVL8WOl6RG8eTLYPUfPWOMqQ==
X-Received: by 2002:a37:5b47:: with SMTP id p68mr25733703qkb.299.1548108782926;
	Mon, 21 Jan 2019 14:13:02 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	v50sm64083489qtc.7.2019.01.21.14.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 14:13:02 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2019 17:12:43 -0500
Message-Id: <20190121221243.26254-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121221243.26254-1-maxime.roussinbelanger@gmail.com>
References: <20190121221243.26254-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libvncserver: fix configure argument on openssl when disabled
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
X-List-Received-Date: Mon, 21 Jan 2019 22:13:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When openssl is not included in the PACKAGECONFIG it
shouldn't try to compile with openssl.

libvncserver CMakeLists.txt activates all of its options and
tries to find libssl.so. CMake finds it inside the native
sysroot which could be the wrong architecture when linking.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index d8f51c751d..b493f7f01e 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
-PACKAGECONFIG[openssl] = ",,openssl"
+PACKAGECONFIG[openssl] = ",-DWITH_OPENSSL=OFF,openssl"
 PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
 PACKAGECONFIG[systemd] = ",,systemd"
 PACKAGECONFIG[sdl] = ",,libsdl2"
-- 
2.20.1


