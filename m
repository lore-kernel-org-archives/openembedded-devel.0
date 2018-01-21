Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D05937881E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:37:42 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v15so2889597wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+zmHWFbarAqzp9YfgkEksTid2kZqPgLfXokHoRw0XZg=;
	b=fUHG6yK4og8m93JKlBvebA95oBBfsHbUfphbVylXFBK9/RrgeZU/5G38TwbPnlk00P
	j9UK3ZGBSrDxefr8lHkeyKItHb47+N1WyhinOrFWBonyWoH6UkGGl5i+1IpkRKalCNdm
	DfK0R5FOXrIPSub3Si/WtVYXPsYZts10pa691BwR8Q1KguJGQEi8NQEz0XDRVkyHUXK1
	s3BrMhGCmO5kLA2PEqctQthaTU13LtOGjul6MgGtjp+luyLZrdDa74WREjbCu/Gw71th
	JFzAd/O1UknS2BZ3lofT/hbW1wssCzY7DJfIBy7tjNsOEy6IifjxXTVSBC50Z+YZ8Nca
	1+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+zmHWFbarAqzp9YfgkEksTid2kZqPgLfXokHoRw0XZg=;
	b=kp8OKQ+/Yk1VbO2lv6DjdKOy+A5VOLW40Io8MCsmZVE1v8/nmznu1uLdEm5Nsj2gxk
	H3mGNS6cNqg0MpgQ2qmjf5/hZd+I6ggop2L4ekAqH2rfrrTNjUm1IZR4YMbpSNyZB3Iq
	ulAMp2b4ASRjT+qkqthBv+Zsi1maZ9weejDll7fMyW+9s8pb5xjkr9rhfvjzdSTknsye
	rm5st1byaFKRpRpFfHs/Ds64UXj71uNmty9x7Gt+t+oO4EsIVmSARXhtNS7Xd/ZsxZTE
	26HfgIv0xXtVHRcHx5bZaudPUt+GbMMGhazJdeTwpw6/RfxpokVqwS87umld9sWCF6qD
	xBng==
X-Gm-Message-State: AKwxytcxur+f527Fle7Z3Ab1/pOtlADOw7LF66w4C5K30h0YwTdeYP61
	yoO/+KRIbUO9gAoYVaetPCWVDQ==
X-Google-Smtp-Source: AH8x224xN3F+qfR0eTl+ki7hYA7Of1npHxkZXtBgUrYMRWY5mqpC4wCvBrLjwyaSwi9c7kjxYkfJFA==
X-Received: by 10.223.185.92 with SMTP id b28mr3661677wrg.196.1516541863582;
	Sun, 21 Jan 2018 05:37:43 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c19sm2951777wmd.5.2018.01.21.05.37.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 21 Jan 2018 05:37:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 14:37:39 +0100
Message-Id: <20180121133739.6230-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180121133739.6230-1-Martin.Jansa@gmail.com>
References: <20180121133739.6230-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] mariadb: use Unix Makefiles OECMAKE generator
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
X-List-Received-Date: Sun, 21 Jan 2018 13:37:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 263b3139e7..a29d441e14 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -82,6 +82,10 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
+# With Ninja it fails with:
+# make: *** No rule to make target `install'.  Stop.
+OECMAKE_GENERATOR = "Unix Makefiles"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.16.0


