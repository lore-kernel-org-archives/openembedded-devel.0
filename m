Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 174C078391
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 11:28:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e204so4614978wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/AS6lWdmjP70YWBM4so135JaKQ2q2X1cLpjXg0kS3B0=;
	b=Z1JtyCkPCRFvqKOGP5h/lxibpIxaz5u2tioSnrkrCE1ThLGU48/FwtFx4ZwNjs6oq7
	TRiN0M4B3G9XJDigazIMmgGxJj5uWAenve0qs7ISDfsHj4ysSyouO1hpZWkYX5DNXSf4
	WI0hirzSClwOYlIbidyEb8a9YBiM2Loo7lVjBI6MKCxeqU3ap5KQTcfKZ9jwuZb8yyl7
	xaOfE+iyA1HM1Pkj5yTudgU75tdoP2agJoKuqZB7enIKQss7SIfAyodAgheLB21WqxMz
	y7ufxVWUexQEShvk1FGF4p8STANS+tgizA2AR4NaCuairZ2KdebjrrtfBVtXXU5pRZhE
	HkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/AS6lWdmjP70YWBM4so135JaKQ2q2X1cLpjXg0kS3B0=;
	b=ZHoILlHGZKBOAnzFyqzCEA/aUJ/V1IuJaFOxo1JC3tauBmo1i56HClxk9t4UZUQnzs
	/xc0li6BB2XGMLqXmSGkmFOVmUox9o8+g8LJxtOHkXw4hS2dHySnU1jIvVOedTM9xsk2
	79rAESPX1wlqf7qbgV8QmAHV1njsU6QUtDA5+O2CkdKtpN3y9Cx6Z1uHA+SBlLNjgwPt
	wxv+NwFWt4pbbd+5Z5xduFFC2eyIbX/GQ9DpOmcWdSJclHjzY0nwuzAAioUYfUcfK5Fh
	qLF9hLc7azb0orQ1uQlyupnRPKuLul52BRiJ0zPlC4oyDClXX2ks7YA5bJSVbViB04K5
	mjsg==
X-Gm-Message-State: AHYfb5j5ymNc8GPCyH8bKZBK1TDffcuzYwdPo/FLLUqRZJCb21+DvW5o
	QE9gsswM6HkajuQR
X-Received: by 10.28.151.204 with SMTP id z195mr317983wmd.173.1504178892085;
	Thu, 31 Aug 2017 04:28:12 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v17sm6759483wrg.23.2017.08.31.04.28.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 04:28:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 13:30:07 +0200
Message-Id: <20170831113008.7247-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] layer.conf: exclude android-tools->android-tools-conf from siggen
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
X-List-Received-Date: Thu, 31 Aug 2017 11:28:12 -0000

* when android-tools were moved from meta-smartphone/meta-android to
  meta-oe this part was overlooked and my jenkins jobs didn't detect
  it because I was still including meta-android layer.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index f0d21ed50..5097f4b95 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -41,6 +41,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  android-tools->android-tools-conf \
   usb-modeswitch-data->usb-modeswitch \
   lmsensors->lmsensors-config \
   phoronix-test-suite->bash \
-- 
2.14.1


