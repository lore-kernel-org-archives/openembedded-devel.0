Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3561C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:23:01 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75162.1782663772748030512
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ioSnGfwD;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so4915510eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663772; x=1783268572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXnAGc5Rj4jmSRaMEwRzzWJ/iL/pI2H6xmU2WLwYST8=;
        b=ioSnGfwD7DLHVzIGY74wOHnhlibMxl4MrKBqgQvJEwwqaD5jZtt4sROEf/BFNX5giD
         /L4FcfR0Pd4tAzqTpfBpWYNEbiM6Xja0f6fvgqSRXVdItLiudIn+fuHyf4sbTvIudd9/
         g2DA3MC2BBA16LIuLpaTPJRbp8KsbmBb0l0frUUngSDUpWnIl83WrOvPnefucIIhCaN8
         AxQDWGwNhC/owCYhiKHZcWDCkMsljsd94oF7fiBeXSep5Lc4Ef9VkPY0fFCfAu4OirtS
         SjwmZjG1KUg7f7Olse9Id2VTusnauiqjPFbd1ENfdhsfPzFQjYSXTKljUyg4H8lCgShC
         TTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663772; x=1783268572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXnAGc5Rj4jmSRaMEwRzzWJ/iL/pI2H6xmU2WLwYST8=;
        b=ij5RZkNtK38SG/g/oWlBTdbCSLoVDjRMRzI8M9Yegnsz6jrXmWCMeVxzsEFbRZYnnq
         bnoK60X/3jeynlPKiDDJ2w+eWZiBpOYW12QTcN4wPf6Pl1XcFDZ92mTqRlLlYwsWly0L
         ruUjzfURk9j15++9Faq8fZH9H/uMvVPQ6EPgdi6tAPfo4QKxTD3sd7V/nfNHnF2Hm8sn
         JBdbDVhtUHekZTtHykKM0YgxiEe9aKqX8CRTYrLbkVbo0pRRBBW3SSaeWZos1bqJCVQ9
         +t3lZZCI5Thr2HZW44wx+xLLjQKhWpwe1R4NaLhPzqBlHxMSzjq6VqZZkLQB6FU7hGx7
         EWVw==
X-Gm-Message-State: AOJu0YxqgxsbvjXec2vdvTIoYqKIh407V+ygG//eU1aV+TG7w85jx+vI
	2j2NI/94Pb3g/Mmo3OaajABSGrScZaLbr4/pJ4ZxV9R7x1TwCTM1bV4hBKI9O1Y9c7QcNA==
X-Gm-Gg: AfdE7cnCJNiVDa2SACToJH+V3cT0o7hdCc2PWpnsqRQujdpCmNCOerop9R9epQTCROu
	R3eDUfcPxIivmBbMUfzSME4P78AcdlPdSxVWFm2l9gM8gfcJ8wVOA3ZAvB0gxRnUZBYL2PXyWj3
	HCbU9cwiebCMxP05rV/s1xYFgMSXjWJehbLnIPHMR6I35voaAtihC8W+MFK6lqcIIp/R3hUHe3o
	WMTQ87i5VDL1diSO6Mob+wYVMTdg4kD3R4Jy6fC17HuqUJ6VZWcc1O/05i/fNS+WZWKO5ACEF6w
	YCvxazqP7OK/bjZCDbtXxwHOtKH+j0LYd9vP/SxgP0IVcsvD+fMG5JxNeawfVLdtS3B0NEHhoSr
	YvKZ+LouzWotDLt3LO00c3O7FRHo/xRvYjQ3dG4jTSNtPXwmWc0Qc2MIl9xR0WHK2GXZMJaNbqU
	dDJsd9aNsWlfnqRXOvCCwKbs1qAKo4PaCEltQrxc10IwjpG9b4hTdZAuOjalyNid10w4/MgmS7n
	lLVWsA0o/iB0xmhy6q2opIWpb1735bv1g5j4vA27U3xIlJ7sQ+K1GCfIGqDv1wxA4MnPAzoETw9
	XU9gfh3xMkeUgWsw70R0ULyUDKLkyg==
X-Received: by 2002:a05:7301:624c:b0:30b:e4a3:44d2 with SMTP id 5a478bee46e88-30c84b64c90mr12438653eec.8.1782663771970;
        Sun, 28 Jun 2026 09:22:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 127/128] apitrace: do not embed source dir into binary (buildpaths QA)
Date: Sun, 28 Jun 2026 09:22:21 -0700
Message-ID: <20260628162222.4081517-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127937

apitrace's CLI bakes APITRACE_PYTHON_EXECUTABLE, defined unconditionally
to ${Python3_EXECUTABLE} - the absolute path of the python CMake found at
configure time.

On the autobuilder that resolves to the launching
venv python /srv/pokybuild/buildbot-venv/bin/python3, which lives under the
worker HOME, so /usr/bin/apitrace trips:

  QA Issue: File /usr/bin/apitrace in package apitrace contains reference
  to the build host HOME directory [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
index 83e2971552..2c07364835 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
@@ -29,3 +29,14 @@ EXTRA_OECMAKE += "\
 LDFLAGS:append:riscv32 = " -latomic"
 
 SECURITY_CFLAGS:toolchain-clang = ""
+
+# Upstream bakes the absolute python CMake found at configure time
+# (Python3_EXECUTABLE) into the apitrace binary as APITRACE_PYTHON_EXECUTABLE.
+# That path points into the build host (e.g. the autobuilder's
+# /srv/pokybuild/buildbot-venv/bin/python3) which trips the buildpaths QA
+# check and does not exist on the target. The diff/leaks helper subcommands
+# exec it via os::execute(), which uses execvp(), so resolve "python3" through
+# PATH at runtime instead.
+do_configure:prepend() {
+    sed -i -E 's|(APITRACE_PYTHON_EXECUTABLE=)"[^"]*Python3_EXECUTABLE[^"]*"|\1"python3"|' ${S}/cli/CMakeLists.txt
+}

