Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E22A677184
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:16 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id c200so170339762wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QGScdfw1I3qAq29auIZqYoO7QfFJH/1Ek5wvAfuJ7Gs=;
	b=TVvvJlpZ+HqgpJ2dnWpMV7ndmVYvLW89In5ptjkTtTINF+TULWGyqtP1o9A1H/U/Af
	i8qGZMZATnTYxgwA5u2gv1kEcV2A+Ch6FMyiJrqFTSIENX9wzy6W6BNybgo8Eou1qlZr
	XaKMVA+TLkelQnTmBm3r8E7tnG4sv3ihsySIkOkmZtG16pqdJUztQr0JeKwBW48WAPkn
	U7Wsjzl4IVNq3/wIoBEZosZOdqU6V15fRfgzaNv3l2S31FD4IaGXXH1UjjjOCIXFxv8/
	PaPqdFIOYbYhVM6aayc04SUDhfKecSM96TrnRzW3Zbz+sfMT1XtQtqoHBIRIr4PvlZv6
	IfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QGScdfw1I3qAq29auIZqYoO7QfFJH/1Ek5wvAfuJ7Gs=;
	b=f3cl534QBVuG3IbzZBWZFY4N044QwV3RZj/oz/BGkyLfzy+SqIiAnihTph5e7M19uF
	Qo41SUBQVc7Py0N6LgEuHfrvJG2ACPktt6KeXjIeD10BtQDhIL78oDn4x/JMcohWwLmx
	msh0xwWT8aV0Ubwu2/f/OKNLV1CorvpRCmiq8UEazy4T8qqXgqQMnhgKDAwnREX8EFey
	fZ/wneGIDnDJ2ZFElac7w9AnRAvaJGY4JXPD8oQVLl1UknTjUzVG0U0uDIlm/ArHoWEU
	08OA3PL4mNjKNOa04c/TStyRGHrVIKiidYV6AZCI+vxrE6vVLDBcHk+uJSHcbfZFM7zX
	LCaA==
X-Gm-Message-State: AG10YOTmL9WCibx6+S4eaZRB/hMqKNJrrUxS9ltkPZ5DV0HDwjJ+AVnyIvp5oheJM0+mhw==
X-Received: by 10.194.61.240 with SMTP id t16mr27674362wjr.27.1456146557119;
	Mon, 22 Feb 2016 05:09:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ks5sm24638661wjb.13.2016.02.22.05.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:55 +0100
Message-Id: <1456146596-6976-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 09/10] libtinyxml2: drop trailing continuation character in do_compile
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:17 -0000

* with newer bitbake it parses it differently and task fails:
  http://errors.yoctoproject.org/Errors/Details/35147/
  DEBUG: Executing shell function do_compile
  /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libtinyxml2/2.2.0+gitAUTOINC+d211bb1351-r0/temp/run.do_compile.21186: 118: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libtinyxml2/2.2.0+gitAUTOINC+d211bb1351-r0/temp/run.do_compile.21186: Syntax error: end of file unexpected (expecting "}")
  WARNING: exit code 2 from a shell command.
  ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libtinyxml2/2.2.0+gitAUTOINC+d211bb1351-r0/temp/log.do_compile.21186)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
index 1d3cffd..6ca6f7c 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
@@ -21,8 +21,7 @@ do_compile() {
             -Wl,-soname,libtinyxml2.so.${PV} \
             -o libtinyxml2.so.${PV} \
             ${LDFLAGS} \
-            tinyxml2.o \
-
+            tinyxml2.o
 }
 
 do_install() {
-- 
2.7.1


