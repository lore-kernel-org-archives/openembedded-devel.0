Return-Path: <yannick.gicquel@iot.bzh>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A0AF365C90
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:01:09 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id c85so66153976wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=W7FgBaVjcp2YyzvzogV6YKlaTd6q/1k0MAKHuk2aM1A=;
	b=GXr4lcLaXHxjTZwSJUIfr2ZRTLqToKYfKV/lyrpVI9rSnqViv2AJE+dwbv59VJUd1I
	VA2fgbhQK6JcvXeNLYLOAMHQY+bqhKKrg85vrPi6s2vquofJmkZ0keoAm6JuUWX+eXOq
	xn+P17qgAkEdw69UWmfo5UbL1gVET4tHkZegXlubhkl9NG3AsmcMiSDzgS6Pxlzuom6d
	/gUXXdzVBeaH0t+B8vTR0Yfn6FpIUxg8r0iSAIuX2cC5DarZR2OtSh0uk2Oy9xnhFAOj
	cy/UcXOu/P5oAVqmir0sVx/9YPNSv3BnXTxTraQ6Ml4fetB70y8l9NogKvjjC3tf7fcW
	dj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W7FgBaVjcp2YyzvzogV6YKlaTd6q/1k0MAKHuk2aM1A=;
	b=pRABD8xAZjebkmBJIurSRr0QzYMG2R4sQHlK1J9RwQp/BXz/Ws3eQ2DoO7FuvyyQBe
	kH8YpFkrQKWGMvQTP5jiEaiQFinRMulbhpaeseFMhUjRkIORtaLKusz3VBl/gUgRgpyW
	BeLFFJKD6J0vdG7yHJya8XjLaws4tFp8T1WJ97uffwmeHd8Fac7Bdy0smIUr3qI9E2Ti
	RrbgTAnWvSu6WzyUbsFdQp5y58ANA/z0kPUTdLJeSCPeZD1OmD6cFu3UJ9UxJTj6UGVz
	IamU/7SzAU5/ZIv6yZC/bHbNT7+BZX3vq53XitbsliruNUjfxnijug6f5m+QPrvo84Fn
	lGrw==
X-Gm-Message-State: AIkVDXL04wAmvSpAdRRtsSDlb5y9HwuBIqqc0S+5IsnxqrIzB1QbXEVLYxbmGXWQsp4jRw==
X-Received: by 10.28.23.137 with SMTP id 131mr2363123wmx.121.1484316069264;
	Fri, 13 Jan 2017 06:01:09 -0800 (PST)
Received: from pollux.vannes.iot (lns-bzn-38-82-253-123-24.adsl.proxad.net.
	[82.253.123.24]) by smtp.gmail.com with ESMTPSA id
	d29sm4470296wmi.19.2017.01.13.06.01.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:01:08 -0800 (PST)
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:00:50 +0100
Message-Id: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Fri, 13 Jan 2017 14:01:10 -0000

ccache directories are limited to 1G by default.
This patch enables the configuration of their limits, and as default
location is TMPDIR, it proposes a size limit to "0" (unlimited).

The setup can be overloaded in local.conf by setting
CCACHE_MAX_SIZE to a custom value if needed.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/ccache.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 93fcaca..8a80040 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,6 +1,21 @@
 CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
+CCACHE_MAX_SIZE ?= "0"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
+
+def init_ccache():
+    # dummy python version
+    return
+
+init_ccache() {
+    if [ -n "${CCACHE}" ]; then
+        ${CCACHE} -M ${CCACHE_MAX_SIZE}
+    fi
+}
+
+do_compile_prepend() {
+    init_ccache
+}
-- 
1.9.1


