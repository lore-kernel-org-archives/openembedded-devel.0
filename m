Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52E6C0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15102.1737828198498879796
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOIiRz86;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216281bc30fso73734515ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828198; x=1738432998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50HGGyQZlZXbv0J+Ry+ZPm/4l0EuovizBnhM6hdvwwk=;
        b=TOIiRz8677olsP6rEKxfP1PY6QzIQCh7LPi5eVEjtsOkEykiLdRiSMoKJgAvdV0++g
         QitKxO44SD3QY9vWIsW5xVschhR1p/hYSVTKrX8naHesXkQxJC7dwnewJKY70jKkNhSg
         XfdzZ5BvyIo5pQyi7hVrELXoiU3l88LsLb8pckIZWYsf1t+mjgDRwU5mNTSjI8l9Mc7V
         QXhTa4wISSZy4I6WrJ1edzlsxLBCzCrv0VIpe61JEJkef48ox7waCiESPGyoelrPlDFm
         bCm7rYTbNzZ2VFrtRO/YOpdADZ/0loRWtUMWmEidDvIF6v8aBmlexUIMEAvf26yzL9qf
         s4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828198; x=1738432998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50HGGyQZlZXbv0J+Ry+ZPm/4l0EuovizBnhM6hdvwwk=;
        b=HywBiD+5cvMzI7ySp7YxqXZHM2AzVbdOpY7oSQmo48tYVYqKlBjOhR3j45MNvUD+Hb
         lryHFmiSQ56Z58Xmr8u8vj4tgzmPUhKi36u4oKzaHjEG/lCLzcC44XFXv1ozX+aH78ZV
         2DVK+qcM5hj/m9eUYx8cbsEWLEDu99YvrQ6+BTXMIwLk3lIXBqhIEJdSOlsgiaZkreZJ
         KmmFxdXaKjXhQp6XO1nQfAbZ0VbHXj7Be5tvG4iPX4SsNTf9Fx/a2O3LeydhjhEwLkQl
         poKy8fogzyqL1GyXtxUPOfRMZPN65tClN9Kg/CbM5Ul92Zs1PNUtmH7NI8J69eVHrD68
         4jiw==
X-Gm-Message-State: AOJu0YyEIHh0XAk7HEjQ86DwxpHej+Fgf3NTHsYUxBMjCykwGRx0zYo7
	XurMMFWqouFlVTzJrclrefKkK/7AVTPguoTvRVi0LdbfvmKlQFcFCcqGAA==
X-Gm-Gg: ASbGncvkyETdHRT1vIwNbx6QfSGSWa3PMtUQTy4t3NakmQe8tKAWL6mKjDgyhlhJBmn
	D99KTvtp8PVRA4xTEGucw6KdCP+MTMSrdkJppsjhgw9ztEiPnwdgndZ8C8b6quYN2U0bA38oeLQ
	SQydcVU9jUudlK+SOr1CWbKGlCePhWnVIDFAHPERii36WM2WtbO8sMO8Yb+F1EFybgCxZNYmx28
	KspC1vidqNoYauwzIUFqxuo/OtLR34Jz6M0m0hETYP4ZLS04c7mz4aYWRjHUuo9ipYw9TyrZucL
	9huM+qt0OiG5vhTlYpYvTF5HyXk=
X-Google-Smtp-Source: AGHT+IEu8EDl0u9mFV+/DK3fw/7Pg/AUN4ppHP2N/xBWuwYEOyFtca+zeLtUjKp3AyWEfRTxGfIa5A==
X-Received: by 2002:a05:6a21:999e:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1eb2148cc78mr56220310637.13.1737828197747;
        Sat, 25 Jan 2025 10:03:17 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 08/14] procmail: patch CVE-2014-3618
Date: Sat, 25 Jan 2025 10:03:02 -0800
Message-ID: <20250125180308.7856-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115091

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-20%2Bdeb7u1/debian/patches/CVE-2014-3618.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8378820dab0b6955fb0e2b27f24a1626f9124e5b)
[Fixup for styhead context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../procmail/procmail/CVE-2014-3618.patch     | 29 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
new file mode 100644
index 0000000000..b041924361
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
@@ -0,0 +1,29 @@
+Description: Fix heap-overflow in formail
+ CVE-2014-3618: Heap-overflow in formail when processing
+ specially-crafted email headers.
+Origin: http://www.openwall.com/lists/oss-security/2014/09/03/8
+Bug-Debian: https://bugs.debian.org/704675
+Bug-Debian: https://bugs.debian.org/760443
+Forwarded: not-needed
+Last-Update: 2014-09-04
+
+CVE: CVE-2014-3618
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -84,12 +84,11 @@ normal:	   *target++= *start++;
+ 	case '"':*target++=delim='"';start++;
+       }
+      ;{ int i;
+-	do
++	while(*start)
+ 	   if((i= *target++= *start++)==delim)	 /* corresponding delimiter? */
+ 	      break;
+ 	   else if(i=='\\'&&*start)		    /* skip quoted character */
+ 	      *target++= *start++;
+-	while(*start);						/* anything? */
+       }
+      hitspc=2;
+    }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index abb87f9935..4806bf5f80 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-compile-errors.patch \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
-    file://man-file-mailstat.1-from-debian.patch"
+    file://man-file-mailstat.1-from-debian.patch \
+    file://CVE-2014-3618.patch \
+"
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
-- 
2.43.0


