Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1F5CEB2D7
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:11:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8210.1763212265862722740
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1Np3XJZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775638d819so16439645e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763212264; x=1763817064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKyaZpQTRr8Flb2ivQlwAxM9vmqtvf9AF35FprXHqg0=;
        b=M1Np3XJZ6dRrB+Xwbu8EwwDTvkR1ER6cgAH+ozXzXcfwi1wDu3L6M1HxZSePcNCPCj
         yYaJ7NVqFvmA1Igyhot8GSA0OtTq7j72Gd4bnHdmLJb95DwaZssKTyIHaa1cRR843qAE
         OR2gPedrdN4wxwXQ9jKUHIRzftve3PaCWSic7EcSil1ug9JssRyvqCVapmqK8NgPCc66
         ixWLPYcL0aDjowrowuF7plZVtsDgJ4s+iekPWUr3YCoe6hH+b5WVhM4n/AWN/bX+2yIN
         71ekXObSu/eLbC6rIf1+g4c9IDENZDR2oHtvS1UiPqqIo/rG0XGnSSuJo1/78exgk2EH
         ZvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763212264; x=1763817064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKyaZpQTRr8Flb2ivQlwAxM9vmqtvf9AF35FprXHqg0=;
        b=bLEKqFoODtH4SAVeutKTeJf0j4S7KqhmZZqtiFWLHocdwy2w8KBP9RTv1nGfvbux+q
         2lAZ+YdwpOV8CMeHOxv1tgw7ax2p+bweP2LNY1Z3npIjNfowI5vTjtkq2tj9r/hdP6R8
         de1SrVzREyCcT2tq1Ed1g5JAfZcXOWfwddei37MYbcrAP6N+Q1AT5V8OMCPCUOsAhisa
         p9ukK9AIt4iOC0h3FEJWPNFV6NTX9GkZYYuMY0OH08i74oNgkeGryTByTGZMyo3z8izS
         YgAj67zaK1zJjKFdERFDZfTUWW7d8GRUneI99xnmOqqma/ZQMSl/BKWQ6Q48PwRB/zUf
         CR2w==
X-Gm-Message-State: AOJu0YxS4zmPb7LQKJvEOvcXmRfNdEbRYKfs8sUJvetxx7P5GNiZFt1T
	WZ0t0sQBge2i/Xrei0zL9RmdCfIDGc0Jal2nr38jjd+P6+Rluec/7JI1Bx0+MctV
X-Gm-Gg: ASbGncttrW1kkdP3mkKrqScT67iKp2+bKYApCMhCV7T6x1qb1Lg2jncRPjSAXiQpS7p
	yNWfN9rs+dPdjjCRStXjutxG/pgeFTVp+qHthMtLZrHUgMlBOfujio66bzV7A81EnGqZjhbPno/
	8zd6vWuwGaMfto/gxIdFzm5sbNewpWn2dtpFPwuW1pJj3sH1FzSbUtbjaCQ/ySfkS4MDC5u/NDH
	4xaL3nZHYM6AI48HUg2RIvxn8qBhGlltJhny/50iiUWTA0VUERnhm19+igXVLT3UNU3knT0DnGQ
	sAVD3bbX18iIieyb2aEIXfYAXOllE/pLsdsdJDOra4QOheb9DI9gkEx5pZjOOY8kIP3f6aSRMo6
	L/NFoCzyBl1Ay13llpAD0hQb6EhfhLkGWoUp3LqxRJr4aE+7uSiA3Ypoi9iO8Ay5RZCj5JqvgMw
	==
X-Google-Smtp-Source: AGHT+IGDOlwwEL7jjO2q75Lvh7cUW5osM9IZXyjpggxgnW4whOl0vu45VBl5xT0woRjvp4sZUi06Bw==
X-Received: by 2002:a05:600c:3550:b0:45f:2922:2aef with SMTP id 5b1f17b1804b1-4778feb0fe0mr61547695e9.28.1763212263850;
        Sat, 15 Nov 2025 05:11:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm42868995e9.13.2025.11.15.05.11.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:11:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/6] rsyslog: set status for CVE-2015-3243
Date: Sat, 15 Nov 2025 14:10:54 +0100
Message-ID: <20251115131059.1146238-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121730

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243

The issue is about file permissions: by default rsyslog creates world-readable
files. In case a log message contains some sensitive information, then that's
exposed to every user on the system.

However the rsyslog.conf file that is shipped with the recipe solves it: it
already sets non-world-readable default permissions on all files, so this
vulnerability is fixed in the default OE recipe.

See also this package in OpenSuse[1], where it is solved the same way.

[1]: https://build.opensuse.org/requests/619439/changes (rsyslog.conf.in)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 38ea8a4617ad395b2addd24bd1f6b57a8242fa0b)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 1 +
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index dbfefb7597..388c4e70bb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -13,6 +13,7 @@ $ModLoad imklog   # kernel logging (formerly provided by rklogd)
 
 #
 # Set the default permissions
+# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
 #
 $FileOwner root
 $FileGroup adm
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
index a39de3acb5..eaa77d726e 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2206.0.bb
@@ -36,6 +36,9 @@ SRC_URI[sha256sum] = "a1377218b26c0767a7a3f67d166d5338af7c24b455d35ec99974e18e68
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+# The default rsyslog.conf file contains the fix
+CVE_CHECK_IGNORE += "CVE-2015-3243"
+
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"

