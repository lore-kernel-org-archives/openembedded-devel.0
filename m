Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 06803731E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 03:49:45 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9633369ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 20:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cjvUPJNMVFrrrTzloKQdTsMQ99CFTLfQJrgJ71KcbRc=;
	b=fGpR07/WJkKrXoLdoFzqz+0r0/HiTBptuixkdBuUz7X2Ix2s1r19DuRs62SiKVh4y4
	ouKzKBQwP3BH5kqPSVpSj1fDZX3ILqyd/CERahGVuo8GSMA1cakLSf+tTtl/wgnHfTHy
	FxZ1SHY074SGR0FIFD62inZrXn0zT0tgjx9/vR8zxu4Jij8f95wryl90HWwc8Q6hTaoM
	qdxF2cM+wPkjaenbth5F2HvKxI4YZrv0p4ZoGFGgGE/HZiUoigH3V6tQnI72uViwemXa
	h0YPfMigPEiTSvTMmZ8mHwqoRbsqSD/v8l3lrgVplPrfG3MX6Bsu9vw9jWaW8YedZBjA
	Q1Mw==
X-Gm-Message-State: AD7BkJJF8NW4Or1anlDlbDkNMyfAKG992z7VIHWkojqoibkqFmExQ2lkZzbAkLTL+YMlaA==
X-Received: by 10.37.50.149 with SMTP id y143mr323557yby.10.1459997334565;
	Wed, 06 Apr 2016 19:48:54 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:17 -0400
Message-Id: <1459997302-25271-6-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 06/11] libdbd-sqlite-perl: update to 1.50
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
X-List-Received-Date: Thu, 07 Apr 2016 03:49:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libdb/{libdbd-sqlite-perl_1.40.bb => libdbd-sqlite-perl_1.50.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.40.bb => libdbd-sqlite-perl_1.50.bb} (88%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.40.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb
similarity index 88%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.40.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb
index fad03d8..68bfd66 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.40.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.50.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "b9876882186499583428b14cf5c0e29c"
-SRC_URI[sha256sum] = "21fb65e740b6265512c82232b4ad8f75c19ac84c216830112656274eb8e375fb"
+SRC_URI[md5sum] = "d56eebfb5f2a14be9413b025e7dca9fe"
+SRC_URI[sha256sum] = "3ac513ab73944fd7d4b672e1fe885dc522b6369d38f46a68e67e0045bf159ce1"
 
 S = "${WORKDIR}/DBD-SQLite-${PV}"
 
-- 
1.9.1


