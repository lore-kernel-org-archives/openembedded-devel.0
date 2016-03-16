Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5DE7016E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:44:08 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p65so78510005wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fmG9pJRAkcDyGFHoOhKC51GMkCcPGCweeZeYSc7B7No=;
	b=ORANmc1EXWNrxIqs91uTextyaAPLwvNO3ahQXoRjPolvW57xJO/qXMP45WsWQuWPhM
	FduLA7ilXPXvtcxo/PZQSjQOJQyGI7PY5JQLCsbI4ieacz160kS6kkIFhAVxhboYkUIS
	ofj7JZf4l+zFnHlPiRK2NJMvoLTNGNTtRMEKzSG/PBadX6KeRYx1Nhvn2VvEU+Q5aebq
	RGld64vgulfHZZlU6SQB8RuCJO1WRxS2hcSu306+gsaEmNLIMlVhc9HxxQU722nj7ih6
	+ml63+ANP+VNhU8AGSIstsCtrzakteKQUdPVTb+mFJWKRM9SmsmqtWuLCxd/q15pI/Y4
	aQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fmG9pJRAkcDyGFHoOhKC51GMkCcPGCweeZeYSc7B7No=;
	b=gLrbT8DtjOpzWVwmpZYPIFfBwSZe8aJIcsBjOdasZ8uTtRypOZ1fpMZWkN90h4mjrC
	uXWZHelJqdra6X1GVLLaJkBHoaaKUjnyreQRtNvad2dubZ/trQRtCotbPWUjEaiiuMGG
	CcJnVb5s38lt4fGp39BN+N2ceVR/qR/lZj+DMygHzq5jN6amsgBRr3NNjSbA1siUszBh
	vljges8qdTCnIeCHh1Y43MYZyKgEtiOvHiAysu1itAgWvxSMZJv3gs21pZaSc3RxQCsz
	rd9rnGFCoUCfUzBfnmIbvU+d3fjsv8Hg95y7uG7fpmYTYgqwnHrSLMhp6ewjKs+ymG1y
	UFIA==
X-Gm-Message-State: AD7BkJLtoATHYH3VOVIdtGHbTreF7vlKrVS3xivYm4TAZE1aBru0du6uuV6L3h8gFfasWw==
X-Received: by 10.194.184.171 with SMTP id ev11mr4461618wjc.44.1458143049461; 
	Wed, 16 Mar 2016 08:44:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w15sm25993998wmd.10.2016.03.16.08.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 08:44:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 16:47:42 +0100
Message-Id: <1458143262-22936-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458143262-22936-1-git-send-email-Martin.Jansa@gmail.com>
References: <1458143262-22936-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-browser 2/2] cef3: comment out gtests completely
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
X-List-Received-Date: Wed, 16 Mar 2016 15:44:12 -0000

* the old fix wasn't enough and it was still failing with warnings
  about unused variables in gtests

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-test.h-disable-warning-unused-definition.patch | 72 +++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch b/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
index 97a6116..a53dbc5 100644
--- a/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
+++ b/recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
@@ -38,6 +38,74 @@ index fe1e83b..5053bbe 100644
 +#pragma GCC diagnostic pop
 +
  #endif  // GTEST_INCLUDE_GTEST_GTEST_TYPED_TEST_H_
--- 
-1.8.4.5
 
+diff -uNr a/base/test/sequenced_task_runner_test_template.h b/base/test/sequenced_task_runner_test_template.h
+--- a/base/test/sequenced_task_runner_test_template.h	2014-10-28 02:07:09.000000000 -1000
++++ b/base/test/sequenced_task_runner_test_template.h	2016-03-10 09:38:16.987413000 -1000
+@@ -23,6 +23,9 @@
+ #include "base/time/time.h"
+ #include "testing/gtest/include/gtest/gtest.h"
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wunused"
++
+ namespace base {
+ 
+ namespace internal {
+@@ -326,6 +329,7 @@
+ // whether the implementation supports nested tasks.
+ //
+ 
++/*
+ REGISTER_TYPED_TEST_CASE_P(SequencedTaskRunnerTest,
+                            SequentialNonNestable,
+                            SequentialNestable,
+@@ -335,6 +339,8 @@
+                            DelayedTasksSameDelay,
+                            DelayedTaskAfterLongTask,
+                            DelayedTaskAfterManyLongTasks);
++*/
++#pragma GCC diagnostic pop
+ 
+ }  // namespace base
+ 
+diff -uNr a/base/test/task_runner_test_template.h b/base/test/task_runner_test_template.h
+--- a/base/test/task_runner_test_template.h	2014-10-28 02:07:09.000000000 -1000
++++ b/base/test/task_runner_test_template.h	2016-03-10 09:39:02.051413000 -1000
+@@ -207,8 +207,10 @@
+             this->task_tracker_->GetTaskRunCounts());
+ }
+ 
++/*
+ REGISTER_TYPED_TEST_CASE_P(
+     TaskRunnerTest, Basic, Delayed, RunsTasksOnCurrentThread);
++*/
+ 
+ }  // namespace base
+ 
+diff -uNr a/testing/gtest/include/gtest/gtest-typed-test.h b/testing/gtest/include/gtest/gtest-typed-test.h
+--- a/testing/gtest/include/gtest/gtest-typed-test.h	2016-03-10 10:25:47.371413000 -1000
++++ b/testing/gtest/include/gtest/gtest-typed-test.h	2016-03-10 09:35:25.811413000 -1000
+@@ -34,6 +34,7 @@
+ 
+ #pragma GCC diagnostic push
+ #pragma GCC diagnostic warning "-Wunused"
++#pragma GCC diagnostic warning "-Wunused-variable"
+ 
+ // This header implements typed tests and type-parameterized tests.
+ 
+diff -uNr a/testing/gtest/include/gtest/gtest.h b/testing/gtest/include/gtest/gtest.h
+--- a/testing/gtest/include/gtest/gtest.h	2014-10-27 23:19:20.000000000 -1000
++++ b/testing/gtest/include/gtest/gtest.h	2016-03-10 09:36:13.607413000 -1000
+@@ -63,7 +63,11 @@
+ #include "gtest/gtest-printers.h"
+ #include "gtest/gtest_prod.h"
+ #include "gtest/gtest-test-part.h"
++#pragma GCC diagnostic push
++#pragma GCC diagnostic warning "-Wunused"
++#pragma GCC diagnostic warning "-Wunused-variable"
+ #include "gtest/gtest-typed-test.h"
++#pragma GCC diagnostic pop
+ 
+ // Depending on the platform, different string classes are available.
+ // On Linux, in addition to ::std::string, Google also makes use of
-- 
2.7.3


