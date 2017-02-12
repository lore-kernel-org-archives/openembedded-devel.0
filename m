Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61A7C71E5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o16so21531172wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=T7THDNCV0KdDDje4SLGnedMayeogh5b5oxS4B5qx16c=;
	b=EE0EPuJ8hBwUVvPKWoQx4g1tzoCsizgZPPCXxz8YkIVF/TSyzwmUQbWItlCpY0xjBG
	+56iTQihotlP5Of89Hiuh1WK9xkChvSmh2WnS6heZhdBUuj0MR0KqjWn5K5bJsqDEqvL
	z4o5KZxakcRvqorVxoXrTYN6xkjfOYNg9qAT+g8UHng13RPVgS520WNydMC4tpUNFQFT
	i6ep05XbVgUbHO3NjWIV/5z18zr4HxLhzy49pyshpsgyt5KW+nvdLtdw/xGWMP1NhyzP
	KwYN2HHnljngHFv7NBsmwEbgRZO+hwnJecKq8yXhbKdBP4Of6xinEdBvduPmYasovIcn
	KAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T7THDNCV0KdDDje4SLGnedMayeogh5b5oxS4B5qx16c=;
	b=axncaKwH2ks7rjT2FRtq5IpPP2IAv/G5yg1+uvDZHkkhOO4KOR3dxZzjcPoAJXXXUR
	bJTIW5CyqOt8mbd+mbzbQ6pPCGjVH4C4BD65FmGlJDyz3vYUIjkgslwnhsuP4pZpGib/
	2BTySnOq0oYNJy9VczETayjj4xBG4iAvUKBAc3uhr81jac3ohkZ1dcd/aazRrLu/2USQ
	qlV4DRjCw8g0xYMjRm7t2d4QL087Wf5qz66698YghKj8FB3CbJhUcLyZMZ+3IKZZbWHE
	8kZrDopfyFZ+09NyHzhP+E6MARykCqUTvtY3txO/3uoSU0xN5fK/sMj68KwOci6ILIDB
	G6AA==
X-Gm-Message-State: AMke39mHnUDtWS6jpVLOpaU7JhrF05fWYORHMQc0avhDMMwk5SCEUnpLa/zuKWcF8GLOKg==
X-Received: by 10.223.163.75 with SMTP id d11mr16584546wrb.87.1486933353860;
	Sun, 12 Feb 2017 13:02:33 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:11 +0100
Message-Id: <20170212210216.867-7-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] evolution-data-server: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index aecf6a7..ff3365b 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -31,7 +31,7 @@ S = "${WORKDIR}/git"
 inherit autotools gtk-doc pkgconfig gettext gobject-introspection
 
 # -ldb needs this on some platforms
-LDFLAGS += "-lpthread"
+LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
 
 # Parallel make shows many issues with this source code.
 # Current problems seem to be duplicate execution of the calander/backends
-- 
2.9.3


