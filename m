Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8F57477196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:34 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a4so161854417wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8TRkRTJAVDCsybgwq6af4bNzQKZHlMmLLCevV9k5rhY=;
	b=mLc5qJp0aE11qxzMt/fgbAcJIthN41laY+uVIaunx1x9qcnxhjbO7w09oacMoC7kAp
	80a9uxEloyipi60S+RG4AkFVQ0aBLquLiSC6vo9xq69YWPh5Oju2KTugkplKbRr2n12d
	6JkzuXP7e0FCj9jKHFgfVEuO6FlwosT7Q91r2JvG11YfhQ/buaL2Yniug5xmA8ZWtpP4
	bnI29V1Ue6ofxNYJQVmR1+DDdyQ2Z36MvS++89GxYeQ3fn2AoHoG7G0RdEmMiRGC4fyk
	B1SMraGpbLXbGEf4V3XTNE4KT6ar124AuHYlebAZcsqWG8R7IaRfDaGntL9pslbPOiT2
	5FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8TRkRTJAVDCsybgwq6af4bNzQKZHlMmLLCevV9k5rhY=;
	b=DhibOazBMJGIxwgzvARbOqFws0sqaHu66xutHHaVyOJz5po7dG5hpstE9JCu063p1y
	KLCihL34rAW54KvTJSpYqOwUSyy0MeF8C+Gw+aWgVb/9aoz9PKqgpa83/lp0Qs/grVWx
	H9QwRMGj0qNWO8AGveDua4y3I9cOeOgGVhM976kSIdwzbjoIXOQgPsztsYpThQ4Io8Mo
	vog4KOKOC/m4CNUEkyvzdrA8oXANOjh7Ul5lg9k+CwYiRILMeToL9dIGrkDUaO1xkqEn
	IRdrlf3QkTMTW6CV7+0wPGmtENAsRMT/K0uxsCPdfUoNVdKwrephQO6Dyl0PseV7Nlp/
	nINQ==
X-Gm-Message-State: AG10YOR/xB5znXFXfJmArMe/vUgvHkhMlZ0XpxDIpI45JNvg3nb0faDo4AaKQ0D3vRVgBQ==
X-Received: by 10.28.180.84 with SMTP id d81mr12981020wmf.42.1456146574961;
	Mon, 22 Feb 2016 05:09:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t8sm24587062wjy.41.2016.02.22.05.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:10:21 +0100
Message-Id: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-networking 1/5] snort: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index a81aa7f..7d946af 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -84,3 +84,6 @@ FILES_${PN}-dev += " \
     ${libdir}/snort_dynamicrules/*.so \
     ${prefix}/src/snort_dynamicsrc \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/35137/
+PNBLACKLIST[snort] ?= "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
-- 
2.7.1


