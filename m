Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0425C78A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:09 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id j8-v6so2142673pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NRG4cIP46VDRBnAxki5n70R3sKR6aaaPUoLj+KqcYTs=;
	b=FRwXDjpuOdgzFxRHtLjVWi4ZZLmnEDjYFbAJHvcgZPBzwC5hIw5o4599WM2DwsJ45A
	GR46qgVQyXmkeqlM9hSfRnL5dkJKctWX6p9iAAlBnX1/YrSB12QgqoaLg8QS7cU/xxxE
	dUKKR8SLjro7ueHuELYmICQOG3FPr+lgYX89gK9D+D44Af4Bjrj7lc4h0AIJIuZENtt3
	G4VmBJOUl39t5PLj1mXsVVYMsSAy3uBBUsIeuSBibluWtLC0tOnXYtSCuo2AWfuMb7+n
	/aNs444eF42Q6NXzAdwYpDAZByld0xQlBMct+zpDzRUDJAgYXl6lEF8X+nAyim/Nc8hq
	W/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NRG4cIP46VDRBnAxki5n70R3sKR6aaaPUoLj+KqcYTs=;
	b=I/lckE8X81IAdMPBW7PYD3R89k7vLLBA9dIqXu04EZyu9jY4NuUZPCGrwozXW2GH/H
	k2I89YNlOcM5CT0ocLKo0lFtvQ6BYmsmiCDPA6yk5vDvDoV+ADIcOYuOkiKdW6nkH/BR
	KBllfhmW3/XDY7rhobiQfpyJy5Nfik9HUEGfwIQ9jUp+YZ8w/QkU2X34KJCUW+tNa66X
	5eo6xhWPLQtD/tJ09zZPHbE11nh3S2VckersLZjOE/7UZeivqUEZwSV0Qs/Pw2WliKbj
	MGd87I4ACOLBrMb7hIdSGZ3H9ARs76LrrGSCcSl5JwOYnJLSlq7BJ2XRXR7nRCIoVaLb
	0jNg==
X-Gm-Message-State: APzg51BxF52VvBYNSW5GtEOlWHn/ixIVqrjchzf8sGiXC95irH9Hr6ku
	9IDLBeMWVgvaJQFDurLVZ/k48LUx
X-Google-Smtp-Source: ANB0VdYTekcY7deZgufzep9uV1MKR4RVC9vfT5H8fagip7Lsh0AXFilmNTq7eTdO1Cwz0Qd56COFLA==
X-Received: by 2002:a63:e70e:: with SMTP id
	b14-v6mr25631370pgi.68.1536087489956; 
	Tue, 04 Sep 2018 11:58:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:49 -0700
Message-Id: <20180904185750.23747-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904185750.23747-1-raj.khem@gmail.com>
References: <20180904185750.23747-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] uw-imap_2007f: Depend on openssl10
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 4c055e54ca..ed56714a0f 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
-DEPENDS = "openssl virtual/crypt"
+DEPENDS = "openssl10 virtual/crypt"
 
 SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
-- 
2.18.0


