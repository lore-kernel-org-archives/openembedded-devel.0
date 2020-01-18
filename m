Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5427FCCA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d16so25050498wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sE84qad/i4onRM66f1HmdpL3fPftZMqoWeN+m+CC9aw=;
	b=siXBXLyLe3DpJfGaCdjezvBI5NhXGQeHGUk/JHzi/AYulqqrG88iwVdrPg6CIb8bmc
	9P4n05YC8HFvZhiWXIW1UPazl3qii33Yyh3Md4AjldYHwBv1HuiMtDClDi5rVkGv5Jtl
	K2hp9O/kC4J9cjSaNs8yEQqFxvvvrYjKPIws/+WvM6cT3qu5Rth6yuMGePeY80yCUkll
	G6tq9Yrt0JEcgLjAGJgORRVJSqQBGGyYBx7PLp9NhYJDBsIjHmyaF6GaYL6GrKmg/BoR
	HqrWfNsYpHd8eBfKShpnpdS/3PJCQ0+o0E1F67jLs12PdiO1CnPd6sT+Wq8tkKJ/j7ag
	NHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sE84qad/i4onRM66f1HmdpL3fPftZMqoWeN+m+CC9aw=;
	b=e4wg/acjrw3iYBuNsBJocTmY9lnE3Jb9hPB2W4TWhdrtucYKdn03I6cWq0AYfhJivM
	X/KuUFiUq5PUjUNoiGgOdPF7oy+/KUgBEWenwcjgO9JKfXFoZ9nQlSUAfBXD8h9gMaSh
	+Vq5fZKJEJ6IM2E86RZ1xF8x+X9JE4X8KOUBOqo7SLMP6yjttY6JGTdgqDvl3bJxF1jF
	jSIek2z8o2P4i9Dpkei5T06QZ/0BLA+NGu/QdL4Y+bZDP+UsnCFfcSGkSBwhxlywUTiE
	mjeAgUeTqTfyKfrhUJ9UwFgIPmHGKHW1LwyHjeQnxzBuwDJQWzCaHwAN47KqY8tZILNa
	VU+A==
X-Gm-Message-State: APjAAAUyg1Q+Cy0VV+vVq79nv0tytmLjScKIdlx7PmkOPP/cIZsFpGrB
	eZf5wFV0sAungJjAuBQ/SQdtW6p0d6E=
X-Google-Smtp-Source: APXvYqzbphAC2+Y/zGVSZIymnbxHpsy9syDksha+BTUgxKcSuMRIQ5LGB2sPp90unCx/CIytJ2ntPw==
X-Received: by 2002:a5d:6ca1:: with SMTP id a1mr7879859wra.36.1579346902245;
	Sat, 18 Jan 2020 03:28:22 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:52 +0100
Message-Id: <20200118112757.5287-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/23] orage: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/orage/orage_4.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
index 9662b614f..ae8180233 100644
--- a/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
+++ b/meta-xfce/recipes-apps/orage/orage_4.12.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "gtk+ xfce4-panel libical popt"
 
-inherit xfce-app
+inherit xfce-app mime-xdg
 
 SRC_URI += "file://0001-drop-setting-is_utc-member-of-icaltimetype.patch"
 
-- 
2.21.0


