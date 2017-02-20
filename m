Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5FEC871D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:18 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z61so12067378wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=knA8vYDusFcV7cSq2Qaf+TVRtp+Q2+DjaILAMmc63TQ=;
	b=GB7tw+BDRlL40jxIAmz4Aa4XWG8gUezRPO90Paf3buDDxta0KBgl8RbSlkNDlnN++b
	TIXhPUPlZMbV4f7fBue8i3O0lw5hCr7SJFHgDkmnw7TMC6eVGBxzash00NAYnvWhmZP3
	7pOLQH/vZYOnIzEltc7KQfYts9HtBOn37hmw3pR69pOK7QKi8IFkIHUJ0v49WjbsGGD+
	/5Wggmemxt6MXGANmoUSTBwQL0H4Ok3TYQC8iKSWPYcIRI4zjQd7J+KAHGokP9RYRbRK
	sW4i7S09cIXoYAEfjeaSwsdb9b90Kqeg77X2fMe1EigHKJ+NBG6Tc2Jgw+/RRIYDgouK
	qYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=knA8vYDusFcV7cSq2Qaf+TVRtp+Q2+DjaILAMmc63TQ=;
	b=gPO4F98xu1Akptea4779b5Nwi/ChQBJa1ZfKQTlS66h50X38f+jvZkZ9yJsgyoR2OE
	n3H/rpGprvEXjdXu2nfjVFkhEnaj518ad+zNWUQ6o99/KvlA4OQtyNzwFeK3JvCBbO71
	ugwBfgFUKH7CQ9PMHnb1aJ4fR+fddOZ9RZHK/H87HwoWwORuVlGgdY8eJZqg6LPSdKfN
	kU0hzrYubgZ84eh/qtg9jYPIRnwd13iucbV9iVHDk5EQG9AwLVl7tUffw70eBIxB69Jr
	1hL/pdJqen0QWXtzgHzI8L6z4Z1HyjkzMv31718a0cAQLnNjKf50ep0aJ6fFrUUeIciI
	/uqQ==
X-Gm-Message-State: AMke39mImqvZGw12FgFgYcxQbkxTbhjbUwTwRSurjKhSMETkvdaM/UYazB0+PtQYAU59Kw==
X-Received: by 10.223.181.129 with SMTP id c1mr1685933wre.147.1487614038900;
	Mon, 20 Feb 2017 10:07:18 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:19 +0100
Message-Id: <20170220180700.29836-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 03/44] libidl: unblacklist - libidl-native is back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
index 6a3ac55..86dfcf2 100644
--- a/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
+++ b/meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb
@@ -11,5 +11,3 @@ inherit autotools pkgconfig binconfig
 
 SRC_URI[md5sum] = "bb8e10a218fac793a52d404d14adedcb"
 SRC_URI[sha256sum] = "c5d24d8c096546353fbc7cedf208392d5a02afe9d56ebcc1cccb258d7c4d2220"
-
-PNBLACKLIST[libidl] ?= "Depends on blacklisted libidl-native"
-- 
2.9.3


