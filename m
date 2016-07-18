Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A648860589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:02:54 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l89so10787786lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IWY/7FdqjiG39FcOpOPSa/JihTT/HzhERh1H8QQ3YAQ=;
	b=Abp5iPE+TNl17fJuszcpxjHGEQoBEzJUheOFmITq+YOiFCRWb2drKUEr3hWZAdTxHy
	BKCRiQVYqqIqEXMdwxys27nbg6hNBKEFXYI8hn+czaai7zEaL3gGQnHpYqQKw9J0bSgj
	Qn8/I29iG3DB4wWUYmm+ZDIjVUs8yb/wOKlFYy8U+s4nyEjgEQ/sA8PlSmX4N7asiHnB
	G08x1MLY/xPsucR4KVAbJpDu9Kbn0VXHNRX4fuQLw9qDcEwsqq6XSUPv204XciAF0Akw
	eqo7xMrVawLQA6cgOjhZeY2uaxiETfZ13HQaxwQDzzb9diOrriNgA2uciYpp0PmSVaJ/
	03QA==
X-Gm-Message-State: ALyK8tIkd3A/yP5reIWVvROk4Hhitmi5QJuG3bY9U2UfnhXnwZYEmm32g9TvFbxtbB+i1Q==
X-Received: by 10.25.23.99 with SMTP id n96mr16070975lfi.64.1468828974725;
	Mon, 18 Jul 2016 01:02:54 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id 29sm4170845lfu.43.2016.07.18.01.02.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 01:02:53 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2016 09:02:48 +0100
Message-Id: <1468828968-19388-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468828968-19388-1-git-send-email-git@andred.net>
References: <1468828968-19388-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Mon, 18 Jul 2016 08:02:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

c-ares doesn't build if the distro has enabled usage of the
security_flags.inc file as it is picky about what is placed
into CPPFLAGS and CFLAGS. It complains and errors out if any
preprocessor options appear in CFLAGS.

Fix this by providing an additional include file that is
require'd from conf/layer.conf which for c-ares moves the
defines added by security_flags.inc from CFLAGS to CPPFLAGS.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 .../conf/distro/include/meta_networking_security_flags.inc          | 6 ++++++
 meta-networking/conf/layer.conf                                     | 3 +++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-networking/conf/distro/include/meta_networking_security_flags.inc

diff --git a/meta-networking/conf/distro/include/meta_networking_security_flags.inc b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
new file mode 100644
index 0000000..06802d6
--- /dev/null
+++ b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
@@ -0,0 +1,6 @@
+# configure righteously complains:
+# | configure:3479: using CFLAGS:  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2
+# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURCE=2
+# | configure:3516: error: Can not continue. Fix errors mentioned immediately above this line.
+TARGET_CFLAGS_remove_pn-c-ares = "${lcl_maybe_fortify}"
+TARGET_CPPFLAGS_append_pn-c-ares = "${lcl_maybe_fortify}"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 5fd636a..c09ba4a 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -21,3 +21,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 # used by waf-samba.bbclass
 WAF_CROSS_ANSWERS_PATH = "${LAYERDIR}/files/waf-cross-answers"
+
+# Override security flags
+require conf/distro/include/meta_networking_security_flags.inc
-- 
2.8.1


