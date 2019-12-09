Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 287B47FB11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q10so14092786wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E3E2QMVe9iGuXGHa2x6HkpaAdGVAaWJV8yfFoWR0ozw=;
	b=WIhsEQJt/Fas81G9Way9pChhGHh4Ete9yTvn4rR8CibfHOnYq8EmZphaqK1mGMEkbx
	DMH6LYaznLAl/4C40lffKkBaHt9ZVtlJ4jRLT2XtvnJYu8d6RL5VEoKz1TK6ywEFr9P9
	sV8vxXp9jjdLWTckRsgYEq3YFhgKa1/9Xo1h61d8V2vnoxq6g6IH1bXyZYw4rw22FON1
	ma9I+ePRjxY5QJhjfsGNm+/sYWd3EVp957cPwcXh0OSZn2H+VTUQ+iWU6y9j1Rs4yPV1
	Vyofo/Wzlluh0onc8pWaSo8+yq4uNhEapBxOtvj6QJ5fm05ZVorbahMM2O31sTD35npb
	VY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E3E2QMVe9iGuXGHa2x6HkpaAdGVAaWJV8yfFoWR0ozw=;
	b=sgNA37N8ho73lPthET6xf/qBScX25paSF+/icfWACBHsAN1kWwlu3WsJ8XQC/qv4iD
	UdxWxDcEhN6oL+j0l6KGXTdNFH0ArNgaD98r1xsxwVEPRqtvSqgIyQJg75r9fSxX7cQx
	IRKvpiFgC3SnHxTj0F8quyUQWtpcQg6mjsw9wzfMKQ9YrYTngT8slIAltlKaZf7HdUJk
	faQwnKkdAJTfCGw08rekiuWW8cOIRasapPyuhLPmey3G7vkPZwWghBvdZ8IuoXp1Tuo1
	C9uuYUNv9uI0plLZV/CiX9KXtM5VoWwd4shB3LGc4G3dba8/CZF1rGHYSplsTC395rQV
	sCbQ==
X-Gm-Message-State: APjAAAVWKYvmApHVIvw0baSol0vjp3mu++fKMr7udJvE5e6wX+cDK9ss
	Djqi/AFd//w1G03jpaPr2ZbJqzNb
X-Google-Smtp-Source: APXvYqwilQCrIfDK5IuiLH1gYKyh+DLuJmOupr9aOcbuo9r4XaUUs2biTTuT+rPuvZQUOWjW84bc9Q==
X-Received: by 2002:a05:6000:1047:: with SMTP id
	c7mr28550019wrx.341.1575851959647; 
	Sun, 08 Dec 2019 16:39:19 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:38 +0100
Message-Id: <20191209003840.3383-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 27/29] file-roller: remove nautilus from DEPENDS
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nautilus is added by PACKAGECONFIG[nautilus] conditionally

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
index 7dcf3e9ec..54acb6039 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.2.bb
@@ -7,7 +7,6 @@ GNOMEBASEBUILDCLASS = "meson"
 DEPENDS = " \
     glib-2.0-native \
     gtk+3 \
-    nautilus \
     libarchive \
     libnotify \
 "
-- 
2.21.0


