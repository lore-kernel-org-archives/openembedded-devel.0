Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 026B9771F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y144so16735404wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W1sTxjY2TLIOvCqyFeyUzNrfYw27IANQSaHueFA+Vvg=;
	b=qZtj+AXU4I9dwwNwLMJFQgZ6ktgpYSHsA8QNKYRQL/JT64gCRboJiASBsqQ7NQ+aN8
	xN+Zh166XW9BxBreRwjRZaXyTLpdnLLaflO4tnuAMgwyrj+6t1LEgph4HEHw3h+AEc3e
	ddD7VSpMA6H1u+S5Bq4Lo/SHYLcwBczfYfBGXBiKIK3Omo5mJCwjzoTjMu2QS3clGYMY
	eaWMSsLBUbME4K10WRzVjiOnys+EJtmMZtXWFm/wYiqCPRPBubeFiHp7xuZmEe9kOOJ6
	ZYf7ba1L4ZUyIRjSOb7wejVvp/Czj9FirO/4dKVnOqM4p7eaLU7jAuCMc16diyPAntUt
	Toqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W1sTxjY2TLIOvCqyFeyUzNrfYw27IANQSaHueFA+Vvg=;
	b=T9gyAn1VjABB1nHVEpLCDaGUmtMw8EYVSGp3def1FzAjAww+xs4Lwjk+TWTF9AWegy
	HoHU1WAImwCgD0J73vSLF1x7am/jeM+Iba4acYatlgkMBqVpFmKGcGDmhii/7UKdURXt
	QY59ZgaChbVNsTcs4UGcLTzJlaIltqEx7P/dhfXqlWFSciDT4QKtO0ZS9v3M2vGqQa4s
	ugKhbcZPYp3eiqVlYjzoAwtA1bsMjCL7kREV0GF20TI7BzshTicPDdyVOpYJsWe7k8/7
	MZRjYyfshPEfJez5bNQSS+j8Gt0pbAydCsBRxnlBuHZFfuuNcrHBmADXUwLVmKWxXwF3
	a5rQ==
X-Gm-Message-State: AD7BkJJhglMBjsyh/1DF/AEY/4SIJwipHH7/jxsdyjokaZcy2383VI4UVuwhv8e6Pwo7WA==
X-Received: by 10.28.97.197 with SMTP id v188mr15025478wmb.67.1460317316475;
	Sun, 10 Apr 2016 12:41:56 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:11 +0200
Message-Id: <1460317290-4787-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 12/31] qtsensors: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtsensors_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 4fbd15b..6f2f1a3 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fbaca62cd0a7309f04bf82101c8e20dbbf423192"
+SRCREV = "7197e7f4b385315cb241043495cbfad58deb911a"
-- 
2.5.5


