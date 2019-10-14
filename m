Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF977F34E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 22:20:57 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a6so18702698wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FWGkkdXCfwRojADAsF/8v0cB02xy8jdiYa7X7++hVEI=;
	b=U61+uz926vay7Jp71Gayoa5oDUPye04JdkXPnUupK4sZOgNyfN3/0b1iCT4tPUtcOP
	3DePysDe41TL6+wQxu8RmobqCyaB3wSRAjIArjodGKWwZRHW17I3sEsZIzmuHaW1AFv/
	LIjGkk/iMUVUmEaBtJyBGJo5ojXARQesGnlrfc1NdyFRAuGOU6KFONKyrjy3aiaRlCl5
	L09G950Kr7k4r57CDZ/bZz4l0PqG81MuUjDYQjPxJ9FtIAAberRdC4GZPuJzwxl4666x
	rnLRt1qPfsf09FjmGf9UToM+WWW3mJa70g+FWRflOenoammpFhdWc/Lse1EDHMCNeuTW
	+K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FWGkkdXCfwRojADAsF/8v0cB02xy8jdiYa7X7++hVEI=;
	b=hyDTxDkydCCnf8h59p5oMh3xpYYrx0So4hZqobE5kLtYx9JxFzyLoikTyoEcfBmvFg
	pHLj0BvhLbGyeB3oEwe6x7/N590gqtWDrqBEx2odieEq0MOSG47bX0MHbvbL3+X84+C2
	3jpk6XMz8BpI13Chs6sKvvS+DC5iVKKdzU5XLhWuaQkzjkkBqzK3/+q0SYflaSzZxt/l
	2yD+pqtwWsJwSLOxqfWv2pz9maoZIU1VbCCs/zo7O5l/0tGs8hW81IWWGxcrT4bxCZzH
	YO0VKBhy8AsItYxX+Jxko81yETxloTkgEUIETKdyHMAkJqWvRSHbuj5NgpRe0WmahQjZ
	vRLA==
X-Gm-Message-State: APjAAAW2MfGuChYGQ4v//QKNaEoTkwt8hPuGyCwuuZqb4nXnd7cOfrS3
	V1OWIM5h/N0BuEgjXmXiVL+kVAeM
X-Google-Smtp-Source: APXvYqxFAudqRWqUbGpMntsVC8OIWcJzbVZ0gpkKpYfcavvVur9O7LI/mnmyiIJle/i+3psFuQAdzQ==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr16141544wmt.108.1571091658204;
	Mon, 14 Oct 2019 15:20:58 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F135A0825FC0019871DE783.dip0.t-ipconnect.de.
	[2003:f0:7f13:5a08:25fc:19:871d:e783])
	by smtp.gmail.com with ESMTPSA id
	a2sm32920987wrt.45.2019.10.14.15.20.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 15:20:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:20:47 +0200
Message-Id: <20191014222047.22306-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014222047.22306-1-schnitzeltony@gmail.com>
References: <20191014222047.22306-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] menulibre: upgrade 2.2.0 -> 2.2.1
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
X-List-Received-Date: Mon, 14 Oct 2019 22:20:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../menulibre/{menulibre_2.2.0.bb => menulibre_2.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/menulibre/{menulibre_2.2.0.bb => menulibre_2.2.1.bb} (86%)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
similarity index 86%
rename from meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
rename to meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
index 1e9e5f1a1..8196e6c17 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
@@ -14,8 +14,8 @@ inherit distutils3 gtk-icon-cache distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "9690848dbf9196c3f7baa574e90378d8"
-SRC_URI[sha256sum] = "546fec87f451c8f5c220d02b1f36dd850f4ce9ab607f8e9711ed8f2009e349fe"
+SRC_URI[md5sum] = "8460ea844a5998c5f722bccb5ce8627a"
+SRC_URI[sha256sum] = "5b3ef8e6073d584f6accf282fa1eb649185ee42eb22fab70231491c7377d7e8f"
 
 do_compile() {
 }
-- 
2.21.0


