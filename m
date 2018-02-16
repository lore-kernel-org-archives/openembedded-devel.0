Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7696F78093
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 21:35:09 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id n7so4221359wrn.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CZpKXeTuq1ph8xkTmCsTBhEmwXj3qmrL2evbj3OjLok=;
	b=rmEfq0ryzr/N7Ozg8gd/L3hCvTG2sy1BbnkDRZ+BQc0tqMK8Tsp1TOxKiajZ8hQwiJ
	IQ3M1fXRWpBUvuohJEdxF2WhxDxG0JKZu/ckoZImFxmP/0FMWTzH5A8MxRvXu31DwUSZ
	UZW54DGyaWbJEqiaQe1YDKaLcXEJs36lOK8CKgn84/qknZsXRdpy0hpbiYwbyqakQKYA
	p1AJais5gt/ve8ANW0Rj33nggvae8RPRXpTJl75nzz41f18lpaQG5hMnTcqEhWD9MYTo
	hw5kDR0BzA8E7P/9TwzfY8Wn15DI/vu4pEaWBbG/QPkqpPdu8Wo5yuPFMoBhTj343+Vk
	27lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CZpKXeTuq1ph8xkTmCsTBhEmwXj3qmrL2evbj3OjLok=;
	b=djypFM8VtRob10onnQZsbjKRbZ6xk12hAysaZ3MMJE+JCH9vAF3u8MFHpei9dtzsJ9
	Sk1NPm6BfBKwLAFeNsfgKCyD+7Ggbl3bmNSQT8oeJ2SNgePERp+bCnLZcemn2liI3ix8
	90fw//sxCVHqMYk+wd9V19qHPSob1fC7/I7cHoFA2vTKeUFZ/fusuyO3GY0NTE+VVLZb
	67VY5WUzkDZcK4cbsDqtVltLGDAfe/JZg0oHkwZC/ahLHK6MJ0379oGnRkWcWeDDDySP
	CHj1011nKkJpMA41cRY8rFl9Uwn1k4oopB+3r9s1eFPlFTSOVYmJ3j++T4HlFJZnb3pv
	7BxA==
X-Gm-Message-State: APf1xPDsGYBulG9Y2OhGEXPJR2ak6Ig718gqgcuCGYPBrMRrrAOeLo/O
	YmkBCQi0O5Y4Q8VwlkWShOzlvg==
X-Google-Smtp-Source: AH8x22732U/dAmEq1mpiJkHwOSNbGZYnN0bftM1CBbIv/jCDF201ASkeROvkcwNLh0btJFSvVID2Zg==
X-Received: by 10.223.150.194 with SMTP id u60mr6552820wrb.47.1518816910061;
	Fri, 16 Feb 2018 13:35:10 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x19sm17700373wrd.7.2018.02.16.13.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 13:35:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Feb 2018 21:35:11 +0000
Message-Id: <20180216213511.117-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Fri, 16 Feb 2018 21:35:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index e490176241..a63842cadc 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -87,7 +87,7 @@ do_configure() {
 }
 
 do_compile () {
-    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
+    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
 }
 
 do_install() {
-- 
2.15.1


