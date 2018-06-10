Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id B4A8975350
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:09:01 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k16-v6so17800462wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=giKmPwBlgMpXt+0r9I8JCUKA2Wwh2+7wHDAqhm+zc7M=;
	b=PmbN+g5T9eXJRbnEYedORQo4MtQdsnQZ7zUPNev8Yfp4vKXqTKe9DL4TtJZFgxDe+u
	ffGSceopguxTZWRTAqfUKkoRdgRkGqK5KUauESWp0mAW+o8Z4cnV0HTwgKFcXlXFGrI6
	uq2FzjRYMiS3blhvmRCJ7GcCtLEV/d2wGZiw3+jCiaqM34nJL6Tr1GSM11n3wxNgnYl3
	GrlCagOPLO+1s6TbrcRJJ+jfzgr9yGVtoipxMmjB3fev1E7wo1Vi3AJeFdEaETsfxEA8
	CQGePd/9W6cHwTwJvCs8V8k5i264HfB+boFjcwgL4JgpSXvkGKXwnLQFaRgj0KS3NKLA
	JKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=giKmPwBlgMpXt+0r9I8JCUKA2Wwh2+7wHDAqhm+zc7M=;
	b=cgYXzQb95NcsqzOZ83lPEwO6cFNLKiYJhivWg96J75TdIQdEHx/kQ6kMDUUJoafh0/
	n+RTMPHxtjzZOf2oR52BgRbz1HIm/3L2Bt+ETKC5lRHV9iZhp79/fmaxvV63GP+sX4I3
	JddcaZ05Qfmi6TeWM0VEEznmzJ1Q9HAlMMuhcTyv8PewyxNXhcEzyB0yOb/rbQMz/vK/
	2wofSwkELy6rH9VB6I97I/7CCQoYCmhmaGsMMKBWxVOZHACYiyr8Qbma78PY3ppAm826
	Y7tFc5rjRs0X5M79gAiad85Hpk4lyJnLQXex8zDVuluIK1HPlyiSNKeU0r2dSF9cD7VW
	hazQ==
X-Gm-Message-State: APt69E0J8vdb/JCr4i9ORNoyA6VkfwBg27XDwc9HLoWPbNO/IqMVOV8A
	tEEWSyPg04V57dHd0OBD81Lfpg==
X-Google-Smtp-Source: ADUXVKK8IvtQucbIHPDoyoSVTERh2fILnGtaE2+Uq1UJx0KTKmPG0a4s1f4/6ZHvXIHJyOcWv9HP/w==
X-Received: by 2002:adf:8ab9:: with SMTP id
	y54-v6mr9918083wry.98.1528643342216; 
	Sun, 10 Jun 2018 08:09:02 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.09.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:09:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:21 +0200
Message-Id: <20180610150821.9536-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 19/19] thunar-plugin.bbclass: pack GTK3 plugins properly
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
X-List-Received-Date: Sun, 10 Jun 2018 15:09:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no GTK2 thunar plugins left in meta-xfce so remove
${libdir}/thunarx-2/*.so.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
index 447f02cee..692f121d8 100644
--- a/meta-xfce/classes/thunar-plugin.bbclass
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -6,4 +6,4 @@ DEPENDS += "thunar"
 
 SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
 
-FILES_${PN} += "${libdir}/thunarx-2/*.so"
+FILES_${PN} += "${libdir}/thunarx-3/*.so"
-- 
2.14.3


