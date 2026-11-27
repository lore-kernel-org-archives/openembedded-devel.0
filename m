Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10301.1795753116006229673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sbjmVHTs;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c336eab8so4115193eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753115; x=1796357915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20tVbYTf/YTJbWUuMDloDs5aK5vuErarwdu3JRhKkEU=;
        b=sbjmVHTstuJZCNz1EYLUAabyOjoqTSBtOIFFA2xtxzG4NQJS8b+crQLmpJ6pe4omMd
         PuuU5OkM6YTxVs2pn/E/92LByRri3dc2ukNMmZ9bi+cVJbKELpPGDrlTE/O28g61Hunq
         kOofbQeTJrAH6wSml3yht1XgoeDS88eB4ftx4z8HbpNzWRFkiSEYz8V5bXE+Bf5la5GN
         K+zbmpyf25vdvGOZUXczlF8jVHb7lRTqOt0ZgGtq0JBfAiqUhp4U42D4CYVIo2GEp8yW
         zkAAB5DwZZQiyVMyAPw2LOKTaDuq6YxOcDejDMDNA0LClO0/zuKzxnl0a6F3AHRPpK7s
         C/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753115; x=1796357915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=20tVbYTf/YTJbWUuMDloDs5aK5vuErarwdu3JRhKkEU=;
        b=A2qqE3W7XIVPQbzLOHnumgWeBV6d82eZlteuPVlr+ChAglIMQt+AHny1CRUaomyUKK
         YOUqRwi6x9Ghz+Vx96a/gkaHVJJ+5/u23kVWvisVYMdjc2wwNu5uOQWahUaNOlRMZQD9
         BOdxS3XW1wBE6PSQ9QTmBOicLGEzZTv+3pHNhGkdGPiRhOdKq1jnJhb8E6uPKVr872aH
         vhQb0+1DcW3++gsppc17dzq5wNEqQ737K0+8ecgAB/aoYT4iiubbcHdGpF4KEISWkYxi
         97HWDoZ0cdoXIKP+Ae/j2Ykl1r843UOybKvBOtD5p0Q9oBocRyjvyshvVMrbSfjUkZ8l
         XHYw==
X-Gm-Message-State: APuU4Z8s1F43gExpBXslt3tQZKejL2qQJjv9FbYarY5PfWuipuirAld9
	aawr+vBcYrpuuwnVPBaCFjP5OGnlfB+5+A65QRsplOcZfN83x8BzALnzUVJ35yCT
X-Gm-Gg: AZFdTZdCUsZhaPK3KYzWIJ/pFO9sJ1mvEFjR5y3JjIrRsdO24OjIjbthXMYk2jxUq6H
	Su0lI+AgBu3DVbyr34HvbSvStlmjmMSPqOZynUqQPfNnL5yKfL6nRUaaf85Nl1bDR9heWMEQGuY
	o6SZdNczwBkmaA0OOQnJD0vPozJqvgJu8r4ZBKVdMEB14kKWwAHb2xobBlqtdZljQf6S3BlJsZT
	bRSbEnp0OQ1+aY5I7EPPNVMDenx7MfFkfKGoCBDeoqyxhHaIqCB/pYv1v7MtD6WvhmV7wVxnepd
	JOu3NnbBrBI5e4GPcpZq+kMV+kSiIlsrnQaByQCReexa60v+mN+m5S/5M74rPNZJ+oAf3gb/8vE
	GYogMq06mOIiNwwTb0n5J3PoHTsO6BHTK7KT8mJNSOjrab/gPb9gYW9ukmH1FlP1ZdykjVXNyWn
	ULMe8jDLYtnyXI6RUc5RsQvXW5yL3YiMZyq5QJ9VTEDJy3F55tOOMOnNqwccBJGsHdDOXp5qdS5
	QV/nwbfNvzz6nIFrWFrARYKDccZ4U0Puncge6+gAZbu6W48azY5kc4jT1uTB6naP0101UOvZvY1
	AlkFoYmFP8RFbJu0AU+qONm/cTLC6MSD2/sWhe4ZqchYskZl8DeQ6xL0lRNORSHcCOCAGFWJR5z
	QvVTk5mfc+cKXNuTYUaP4daqrlHbKibIqTFYGe5960eX4IwdG1coQG/YIFVGpl0Cm+CnYqC1AqF
	zACD+Zbjq4TMClXw2zcHUNnBUcIIl3C4ypgpk38+LctOu5d4uSXrUJbL+efiSQ8n9MwME+STzz7
	zhZEYMqDz5pVFqqTPy+AdVGNYACeAG7d+L3rixbfbKR/AeRR1CgiM01jCh5MYXwGt5iMJa+m2MR
	YpQ/
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr34174833eec.5.1795753115278;
        Thu, 26 Nov 2026 20:18:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 05/15] cannelloni: upgrade 2.0.0 -> 2.1.3
Date: Thu, 26 Nov 2026 20:18:17 -0800
Message-ID: <20261127041827.1778052-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133293
Content-Type: text/plain; charset="utf-8"

- 2.1.2/2.1.3: reject oversized frame lengths in the network parser
  and the TCP decoder to prevent out-of-bounds writes (CVE-2026-37539)
- 2.1.0: CAN frames undeliverable on a stuck bus are dropped after a
  staleness timeout, configurable with the new -x option
- 2.1.0: the default remote address when -R is omitted is now
  127.0.0.1 / ::1 as documented

Drop the clang -Wno-error=vla-cxx-extension workaround, upstream no
longer uses variable length arrays in sctpthread.cpp. Fetch by tag now.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cannelloni/cannelloni_2.0.0.bb            | 23 -------------------
 .../cannelloni/cannelloni_2.1.3.bb            | 15 ++++++++++++
 2 files changed, 15 insertions(+), 23 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
 create mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_2.1.3.bb

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
deleted file mode 100644
index f1eaaf80db..0000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "a SocketCAN over Ethernet tunnel"
-HOMEPAGE = "https://github.com/mguentner/cannelloni"
-LICENSE = "GPL-2.0-only"
-
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
-SRCREV = "9f649ef21710999c6f674bc3d914ab2e88363bac"
-
-UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
-
-LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-inherit cmake
-
-PACKAGECONFIG ??= "lksctp-tools"
-PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
-
-# Workaround for Clang error:
-# sctpthread.cpp:95:18: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
-#   95 |   uint8_t buffer[m_linkMtuSize];
-#      |                  ^~~~~~~~~~~~~
-# Upstream fix proposed: https://github.com/mguentner/cannelloni/pull/82
-# When upgrading the recipe, remove this flag once the upstream patch is merged and included to new version.
-CXXFLAGS:append:toolchain-clang = " -Wno-error=vla-cxx-extension"
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.1.3.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.1.3.bb
new file mode 100644
index 0000000000..0771d4ac85
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.1.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "a SocketCAN over Ethernet tunnel"
+HOMEPAGE = "https://github.com/mguentner/cannelloni"
+LICENSE = "GPL-2.0-only"
+
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "873b99f3cdfc7d998d333c50e9cab7e12f58a40d"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake
+
+PACKAGECONFIG ??= "lksctp-tools"
+PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
