Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 31E5776947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:14 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so165551528wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=c7A64HVWTrJFgQFFvtkn9jO41w+UeCkhP3yPhZkyiRA=;
	b=d06STHnbBMgX6UeVS740YxvCKadhpL59qrRqST3okx3Jc2acEwuyMaorP4he0iUskQ
	UYmEEXAZ4hmfdwLyFiGNAviUGhtx7W1Nh9q5oYwPkCpzbWeA5h3zuEtzR+WaMBOnIELC
	CYWrOiJrr2oi0jBriFZJlFGjD0mQb9Ty1z7Lj3nQ0Vz9PWgMVvCnCCIZJbmK+iZ//KNt
	3k6e/jsVbCSOpz0tTnuO167e+Hpml6HqpRKX5u208N6rvmGbjv5ljXUSRwlLbvONhoHF
	4JGerWx+T47ULrd+92i9VfDqXsPcOyC6DgRu5cbltLXf1zGVv4+pIDpekwLlJKoPC58L
	I9KQ==
X-Received: by 10.194.87.4 with SMTP id t4mr58658270wjz.84.1439279894305;
	Tue, 11 Aug 2015 00:58:14 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:27 +0200
Message-Id: <1439279859-1815-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/17] xfce4-cpufreq-plugin: update to 1.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Aug 2015 07:58:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-cpufreq-plugin_1.1.1.bb => xfce4-cpufreq-plugin_1.1.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.1.bb => xfce4-cpufreq-plugin_1.1.2.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb
index 224f85f..ac2a811 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "cc3447ee6663f2946fce86308ba3566b"
-SRC_URI[sha256sum] = "474c45c007e65bfc107d6bcc902330c5e964906e6da120af48f7e2dba7f5cae7"
+SRC_URI[md5sum] = "bfc4c8277cb009439fb4c7aec8679126"
+SRC_URI[sha256sum] = "fd9ca91b99e830c6b0962a07eb269ce814ed773cd6008081771fd04060fe6ce9"
-- 
2.1.0


