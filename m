Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48511.1795411825286257894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q7q/9Wk7;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so3977524c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411825; x=1796016625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPwq1EttnfZUwr3vtMEQOfpPZXJkOuTpQQB0rf0uonA=;
        b=q7q/9Wk7oZjo9jW8lnH/ZEjKyzCNi/71/5DgSfLj8RpEzz7UIbFXctzoBQwf0iUOvd
         5Cy2/xkQYeQGjAd6N/+ZLw5jjGL7msApJolivW4dOfq6Byqt/4QH3JxKHZw0CK0Qbuls
         +z9vwp+LeVyyzNIVmjO2EA4MPtVsVn5MX8QiiGWkqlJNtF2mTnPzVMqs49ehxGyF/WSe
         4WBGzmiHuZvq8nlZCM4J3kDR3janHap6NhBW2pm7XakmXwWLDN7a1uEQ5SAeRuDYgwAC
         Ha36Hzif3kBfOs6NWT6v5R8UXxZUjDTamqS+p8ruoOtamOBjsm/pn+3Zt6mgNZz50DR0
         T8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411825; x=1796016625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPwq1EttnfZUwr3vtMEQOfpPZXJkOuTpQQB0rf0uonA=;
        b=YhosllWKHzfinD7S/KpfqvvmkTjEUUxA3IIVGFziUwO9P76FG/kQ5wmDx8E7YcW2h+
         ojtcWkHEKWiDUqBxLU4khMH7xIVEfaNlrEvARSnPqKDMfwwcnSEK2GNIaWqA1iOJmmIW
         ++OCTk9hMo5XO3Kw7geVU7dE3b95wbwy4g8hRCxTP8FVaoa1ZYpc1PAcgxrR8ngoDq2l
         SMpQhiI3Thndihd6PnhaJ7cCKD1In/tCnk5G0s19Nqi+lxlrdbDhp8wes89kWYeL1UTH
         Ue/3V6pPli0nlNUrtejG9gtCG7gBbm1nSWKs8CtCCr9+9APH+kbHaNxbss649yO/F9U1
         ncbg==
X-Gm-Message-State: APuU4Z/XjpCPS/z6yZz5qA+gsTlt0X+CXV9VKKtW29htAObqOyb4dU0l
	7vyvxY1+DvqOwig4lzjOSrz6bH5fTpfAAEbt6IRT497fDlQhSAbnyDhLDC9Q6Xf39v4=
X-Gm-Gg: AZFdTZdDYFg7K1rYBfsP9A6TnhHNBFsJDOuUYXeVJsohkCwCxkj/QTwESoFOVD6AKYd
	gmdk5fzCBFbhtajkct9vtmPMimrFyVBNE/z04AJGP9F9aW6rZPT7biRqgfuZGWBCn4bI5vU5aWA
	3vJ5UvRMLAHOkXZhSwXkmT65xcdw6pW3ddGxKYgqxWW0mdOUyfS1n9yQPj9522T6chxF7JI+UiB
	Z/t2fFA5c2CHIWJFF9LpVl9Dkl8CZDuAhHbmg1exMbagdeOl00CzdrD/sX+s7Qn9jDSmXFi9viS
	307W5+KL+AKfZA1E99l0wc0kDZP3rC6slBnPuuEgtVVcJcIAzv+IXUqUSoe2jvq7Nf3cOCxp1Au
	0hG93ACDstWMbtn4HxraM8Uf40bv0sEj+Auh5meyiDLDDT4H9qHLj6HPcJwjP6G/6EU9Yke6PH9
	cjNIrJMzU9O7oaSCFZcFaSHJf1rINqvsRxQcjjXjMeUJwqEaUWJzNPCNzrgYM86s+dIUsGbJA/a
	k3GgnDYMq/F87fATjs5+aFin9+KSg6dHfC8gmB44KDocfv0+7uo4IiqDFNK4pqVNweWPZt20KRr
	tmo8bkjrJhWUyalLSywh3DBvs0vaYLwcybLztSouZKPcltCa3mQc+HtxkrjUsCsKyp9nvcghlT5
	loCleE2/on6M9fq6IZgZMESsVgflySF/G4SEZkz7K3OcLWPdjTtPYV1nNQjMCnmW0MTzkmPV4Wq
	o/teXqPnv0CKddDYJ4OAesg9/aVxCrmXqrn+k+XGlMapPbdQvAiyezbTPSz+OlbyIl9m5YUXbDh
	O+7Y73UYJ8ISPCYVcvBkra91Z+ihyo0VNqtO3tGCKIjx304QXdSB5Hpt0pscTHLolNsIY/1Oy67
	in2dCA==
X-Received: by 2002:a05:7022:e0d:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b55668c573mr15190220c88.0.1795411824578;
        Sun, 22 Nov 2026 21:30:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 5/9] llhttp: upgrade 9.4.3 -> 9.4.4
Date: Sun, 22 Nov 2026 21:28:39 -0800
Message-ID: <20261123052953.3658549-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132810
Content-Type: text/plain; charset="utf-8"

Small release: relaxed (lenient) header values go back through the
fast scanner, with regression tests added, and the QUERY method is
reclassified as standardized (RFC 10008).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/llhttp/{llhttp_9.4.3.bb => llhttp_9.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/llhttp/{llhttp_9.4.3.bb => llhttp_9.4.4.bb} (94%)

diff --git a/meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb b/meta-networking/recipes-support/llhttp/llhttp_9.4.4.bb
similarity index 94%
rename from meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb
rename to meta-networking/recipes-support/llhttp/llhttp_9.4.4.bb
index 98e65bf08e..b926601cdf 100644
--- a/meta-networking/recipes-support/llhttp/llhttp_9.4.3.bb
+++ b/meta-networking/recipes-support/llhttp/llhttp_9.4.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9e4e583cb28b7e0c2ef8df4832706e96"
 # The release/v* tags carry the generated sources and live on the "release"
 # branch, which shares no history with "main".
 SRC_URI = "git://github.com/nodejs/llhttp.git;protocol=https;branch=release;tag=release/v${PV}"
-SRCREV = "0e815792b167a9bd8ace259b95b7da953776c288"
+SRCREV = "816485216511b86459b2e6478190e14c38c14891"
 
 inherit cmake
 
