Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E39B7F4AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:00 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id t14so4879227plr.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r2AyO/WQvRZ9sNs3cuD15tETOtYs8K7k8AVeND1FY/Q=;
	b=f/fDWP6vst9Yd6Wwnbu15gqUFRZigGO9oyRa/r/TBoVIcKu0MvhaMie/jQCNeXjQSr
	8ooP+ULPlHrw7TCoGe8tH7cnTq8K+pmA6a48eQNSKGvnMwxWoxWUqztMNS9hKduqiNQC
	XxS8k1dxpzOkufFOf6lnKwUAqZAB64XZECs0ijTA58gNfRV9YeqjzgWWTgF/MQdsdDlb
	oB1TfRNdJr5TlGvi0r0eR3ArTcEnX6CSSHvPLWydHl3RmR16JeZtVxskyXDQQoUnVHQa
	nV5V8k8DzlDKdIJ4pGKQcd2JtWTFPb+8yXwrCtH176c3O/ftg1V0O/dMsvURApfFIxRq
	WP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r2AyO/WQvRZ9sNs3cuD15tETOtYs8K7k8AVeND1FY/Q=;
	b=TzvXoicyRCi9EHSN8zmrTJXB6ALdbo1iJsmaInnUBwKRtcI/1GWTHXUEQYheCQCjw/
	DD5AyZodbrcC+G4tu/PtsNQVNWCqDc9d16QeDSRW697D8DCfNyWz6W/LYqQ2XrFI2wLr
	RfrYUPjqUmGPMYBAK2hKpEhLc5psp1Gsc14hvQmkVOVO6lFG3kFYR6fogXs7/hR8n06v
	G4WVdGyPHaz/VsuSOKFFfGGFDqtigzb8uU7sxIZkblOrhJl45yrKcRU0QVnyJOGzG0e/
	Q2T2CvHEPRHCdydf1JTBP0IcWYHjaDB+kdcFkr0vUNHEJgmsrG8zOBV8+96JdPqD3YY7
	YfEQ==
X-Gm-Message-State: APjAAAUtnmWMQ7DqTsp5t2cLntADWvbLBl/6Kjgu0qRfbzXEd0yOs5Wl
	h5hhs7s6W2RHdTTfFkIYWSSF3MbW
X-Google-Smtp-Source: APXvYqwndKiavW6KO5YemEIonv7NOqEiII614KRxqCpmP4N9yXLhC65N9zxpbFq/Lpn7gnwbAdFQVA==
X-Received: by 2002:a17:902:1ab:: with SMTP id
	b40mr22567974plb.136.1567287121251; 
	Sat, 31 Aug 2019 14:32:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:36 -0700
Message-Id: <d7d321dddf507ba60ffea63f6ff01aa7c42046bc.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 15/23] freeradius: add runtime dependency on perl
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:00 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: QA Issue: /usr/bin/radcrypt contained in package freeradius-utils requires /usr/bin/perl, but no providers found in RDEPENDS_freeradius-utils? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index 5ab9a3f..e0b04c1 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -224,4 +224,4 @@ FILES_${PN}-unixodbc = "${libdir}/rlm_sql_unixodbc.so*"
 FILES_${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
 
 RDEPENDS_${PN} += "perl"
-RDEPENDS_${PN}-utils = "${PN}"
+RDEPENDS_${PN}-utils = "${PN} perl"
-- 
2.7.4


