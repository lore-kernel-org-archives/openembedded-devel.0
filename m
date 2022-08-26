Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023FCECAAD6
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.34198.1661494313928152884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cl82Fy+O;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a65so674054pfa.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=opOkk4WziBbOE4OVsgtXCoeLrCwjpl9/ru+psISlE5Y=;
        b=cl82Fy+OmOuOcpk1R+tWu3YeOzc9eh+tQ+CCPG3sNixw368WC+BTmbTPkJLmvocjh8
         UB2zDHOJ/+kIhBb81y7+nf2xklbdzyxoOHPPY8f25Q2ebd90KM5zNpd/5kOtE6eqVYGm
         fE6l8MroXQTrg6fc2jF5ZHw/KvAvpjzxeVy5N2XGmbEKK039/e3nG1xfi7aPdAP08PJg
         RJnKZYNoJ3V3U4Znl5B4IyLrY+D5QiBCr1ZNAHaS4qyV37OIiLjcu7aVHLQU4KwZiQ6+
         az0mFzsh4atqLlfoxfqsfX1GyRuzw9E03Vg9CyhuMUXwHqh1ubZBgqYr7S6JAmgo1Ukn
         wa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=opOkk4WziBbOE4OVsgtXCoeLrCwjpl9/ru+psISlE5Y=;
        b=wJBOB2Bx5/+EKkc/2WoRQWrCyxebim6kCyfIikuvQVm5sRsYvY63no05lV1NLdq+UJ
         8YP9h0yc8T+J9DnahRiw8VUZGqpz/2KUzhflrsWj9b6qMkFtW7dHCbtNZQyc7zqS2tHr
         1ynpCSczdSzNr/ZBeozhFUVI3Fs84GRmTPHBvaPCg81LWyPh7WDDwQgm3IMvYEFNDt2K
         uSlAKHtcOQE2KZS+aNFRKyeFG/koy/X5MOmAIhlMilpAAjNWM+yJKn9flgeS22opotcm
         H+3ChaUpcMCLzpwAtobt2EnyFGVKS3lhd+z5DuP4DyIBH+ulLbCwBVpd5uvjMY/QCY8N
         CPMw==
X-Gm-Message-State: ACgBeo14XhlsQFZZZiDIjz1ZFN0oUtjc4poYT5VBzMsnkqN6u08AHR2l
	nwPMRPAqVKG1LDfrNXy12oJH6GNEJxINNQ==
X-Google-Smtp-Source: 
 AA6agR5by8iuwz/DXGQ+9VIfMmXvuG5lwPghP1zF9AG6e/ml53KIFoY6wirld0ClM3KSg5GYFnjQBQ==
X-Received: by 2002:a62:6347:0:b0:531:c5a7:b209 with SMTP id
 x68-20020a626347000000b00531c5a7b209mr2508666pfb.60.1661494313097;
        Thu, 25 Aug 2022 23:11:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/9] fio: Fix additional warnings seen with musl
Date: Thu, 25 Aug 2022 23:11:42 -0700
Message-Id: <20220826061150.3030485-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98464

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ring-Replace-pthread_self-with-s-tid.patch | 45 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.31.bb     |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch

diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch b/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch
new file mode 100644
index 0000000000..766b1fe274
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/fio/0001-io_uring-Replace-pthread_self-with-s-tid.patch
@@ -0,0 +1,45 @@
+From 269164337e0168b93661bb95c6a4e462ae6d8b61 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 18:08:53 -0700
+Subject: [PATCH] io_uring: Replace pthread_self with s->tid
+
+__init_rand64 takes 64bit value and srand48 takes unsigned 32bit value,
+pthread_t is opaque type and some libcs ( e.g. musl ) do not define them
+in plain old data types and ends up with errors
+
+| t/io_uring.c:809:32: error: incompatible pointer to integer conversion passing 'pthread_t' (aka 'struct __pthread *') to parameter of type 'uint64_t' (aka 'unsigned long') [-Wint-conver
+sion]
+|         __init_rand64(&s->rand_state, pthread_self());
+|                                       ^~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/axboe/fio/pull/1455]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ t/io_uring.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/t/io_uring.c b/t/io_uring.c
+index 35bf1956..f34a3554 100644
+--- a/t/io_uring.c
++++ b/t/io_uring.c
+@@ -799,15 +799,14 @@ static int submitter_init(struct submitter *s)
+ 	int i, nr_batch, err;
+ 	static int init_printed;
+ 	char buf[80];
+-
+ 	s->tid = gettid();
+ 	printf("submitter=%d, tid=%d, file=%s, node=%d\n", s->index, s->tid,
+ 							s->filename, s->numa_node);
+ 
+ 	set_affinity(s);
+ 
+-	__init_rand64(&s->rand_state, pthread_self());
+-	srand48(pthread_self());
++	__init_rand64(&s->rand_state, s->tid);
++	srand48(s->tid);
+ 
+ 	for (i = 0; i < MAX_FDS; i++)
+ 		s->files[i].fileno = i;
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.31.bb b/meta-oe/recipes-benchmark/fio/fio_3.31.bb
index d655d6c98f..f8d63014ae 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.31.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.31.bb
@@ -24,7 +24,8 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 SRCREV = "6cafe8445fd1e04e5f7d67bbc73029a538d1b253"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
-"
+           file://0001-io_uring-Replace-pthread_self-with-s-tid.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.37.2


