Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id D110B7F2E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:39:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id p17so1082546wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kCJj4HNzYf0nz2HOMBkwaq0LONMwFVuvSgxiP9bsmG4=;
	b=C0LLihnr4VG5K0TZpa5lfSCU583nEYngAKZZlvF04HoMfIJwxFYpGOUcJt8kRUCvgd
	U6X1/9KhEjXx/e85BTy7Uye4CRr+dTQa07W9ZS97xjm5wHEWAOOxMkv+zHElQrGJRokn
	UXM2SfYS5TaERCDEYZoIkNquihjsYIahsIUDFEF21znDP8mgIpWPXMnJby6XNoM4MBm+
	qmWgnGuAxSRCiwsUTUjvsrh7PU33a8+pOgClxALATJ7c5CDvPyxxldH9OwCMTkYuiTrC
	M6MgqS5yMwl4IeGbRjd1t69QVIbc/hDHqUAa+Xa/YvusBMdSzT/xgaEj4EKl+rr0e77+
	hnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kCJj4HNzYf0nz2HOMBkwaq0LONMwFVuvSgxiP9bsmG4=;
	b=taIF/IG7CIVQMqnDRrDbYQcq1mGtJoUJyB1ZogrrG3B/18Rr2w7xFP2VBYAiq4zak6
	3xG+EzEJ2vU4WK56OjRinc//WpctWH54tdHEno7aZ3EJjWhEZDfLD/j57wF6cKugBoRx
	IX3ikOL9rbmoT7lqPAwNt+xwieF04D0aaGu143Zaa6WNLTTn9OIJfTy6RXwUE2Xst7Gz
	NtMJsEo91OLTBSkILgdGFL3/dQUeL/3jr7+4xkz3eKfdj/I0LSfBXPoJLKi4oV5FLLKl
	ycVMDuzrWW671ZQCj2izLMSF0+m9AsfcykkJh1855cSz0Z9P7//SofY8aS5ijsnkE+B/
	Y0PQ==
X-Gm-Message-State: APjAAAVQNfKR3oefHrQzG4ZfU0MrCIIiY9yb3wL5tPB9fSwywvLjBW7G
	E9zVIVR25BuSjt3BM4oplCOG6D9YVNA=
X-Google-Smtp-Source: APXvYqzgshH1gA5xw+v5T9hasZL2zLhCC24pskTah3sbq+eP9pswRnwX94/V1weq4Zcde5JrUugsiw==
X-Received: by 2002:a5d:6a12:: with SMTP id m18mr10234513wru.306.1565951993228;
	Fri, 16 Aug 2019 03:39:53 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t198sm6645636wmt.39.2019.08.16.03.39.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 03:39:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 10:39:52 +0000
Message-Id: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/7] freeradius: add runtime dependency on perl
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
X-List-Received-Date: Fri, 16 Aug 2019 10:39:53 -0000

* fixes:
  ERROR: QA Issue: /usr/bin/radcrypt contained in package freeradius-utils requires /usr/bin/perl, but no providers found in RDEPENDS_freeradius-utils? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.17.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index 5ab9a3fb44..e0b04c1101 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -224,4 +224,4 @@ FILES_${PN}-unixodbc = "${libdir}/rlm_sql_unixodbc.so*"
 FILES_${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
 
 RDEPENDS_${PN} += "perl"
-RDEPENDS_${PN}-utils = "${PN}"
+RDEPENDS_${PN}-utils = "${PN} perl"
-- 
2.17.1


