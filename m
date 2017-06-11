Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id D861C781EB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:54:27 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g76so16368608wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pQ4u7nrNDlV61D6lby/V0GRft/mFpyiBmX+q2RQjiOE=;
	b=tOhxEljr+VAEtJ8HNPSA/RaFZRLu/Rx0JK4rak8goydbBnO+aJc8wf6M6IbzptIOrS
	9vjpUnaeZjbRVr/W4czomjbkReNmvDzhhm8HOgLs4AMH0313NqCMJH3iDqXuZ8E3jwnk
	xXNUvkTd5UiZFC8ISD50r7NRnjgQd4ui75lykWrz4YI3PqL3Q/fb0WnA1aSJ8nLw4yqr
	L9A7emJdzmh43hV1abNnDwmkxrnB/6gX5aAfISOijzDqUE5MFohdZFcRsdjoiUifDT2t
	GE3pJufFeWwP6dic6WXtUcdj1dPsXaReG1kyRQDNepYJBXljOugom67kkicjnLgG08Om
	2mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pQ4u7nrNDlV61D6lby/V0GRft/mFpyiBmX+q2RQjiOE=;
	b=nZbCeCI5b1XJDx7HptV0WMWKEMItHv/ZRsfVpSRzSwYy2QcRHfbYuZeNKeKyAS2dCm
	GJx1hkISrVAAVdbFaQwxK7+CV6nacaudhbH4rS4UMqCHNea5S2kDTLsavzYaiYvyrx/h
	Yqp3ZxTYU0wAMLlkpVaHVlm9YcWAmpPzvDaNSwfmhxY8lB0XIqkDe3gbdFG8fTH5z5t9
	Mt0UPDE7WibwGmAcfLtmRWBOv8hh1ufV4dvi0fyxibGuC+DImYjVhnqnzA5/OL7PFIFM
	J9Vpp8yYrV54ICx8aHGcXeklX7ocf2gEeyRjJmHI5BYcQg4DQ2UzfMsALW4/gFMHGxpW
	/O7g==
X-Gm-Message-State: AODbwcCtiE5tk+PrNvuKdEOYR83stcjMgZhPXmcfJmCrgOZ2Aahl1ur7
	supiwsMgJSmdBYXSvSA=
X-Received: by 10.80.137.97 with SMTP id f30mr19722561edf.152.1497185668132;
	Sun, 11 Jun 2017 05:54:28 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	e17sm3785130ede.14.2017.06.11.05.54.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:54:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 14:54:20 +0200
Message-Id: <1497185660-1837-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] dos2unix.bbclass: add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 12:54:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Class for use to convert all CRLF line terminators to LF provided
that some projects are being developed/maintained on Windows so they
have different line terminators(CRLF) vs on Linux(LF), which can
cause annoying patching errors during git push/checkout processes.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/classes/dos2unix.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/classes/dos2unix.bbclass

diff --git a/meta-oe/classes/dos2unix.bbclass b/meta-oe/classes/dos2unix.bbclass
new file mode 100644
index 0000000..1bad998
--- /dev/null
+++ b/meta-oe/classes/dos2unix.bbclass
@@ -0,0 +1,14 @@
+# Class for use to convert all CRLF line terminators to LF
+# provided that some projects are being developed/maintained
+# on Windows so they have different line terminators(CRLF) vs
+# on Linux(LF), which can cause annoying patching errors during
+# git push/checkout processes.
+
+do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"
+
+# Convert CRLF line terminators to LF
+do_convert_crlf_to_lf () {
+    find ${S} -type f -exec dos2unix {} \;
+}
+
+addtask convert_crlf_to_lf after do_unpack before do_patch
-- 
2.7.4


