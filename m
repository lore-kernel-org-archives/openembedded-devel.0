Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA9860290
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 00:36:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p10so2238859pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nQwFzTOH5lLVwT7g7WnLgEFAHYm6wB2h4R6Lmje/QxA=;
	b=YC0e2xtic80GbR+7Ta1oZt3Eh77q0t+Pcu/v+ejxPNqxVwlg6PaJsl7PZueIt0Az2z
	jQkOEPRt+WnrCH009aw1DdWlIwD3VEqI5Hmpkjq0S44ANa2RYlqly1suNosgTNIzSegv
	heClTtKOMXKS+DMyHFJD42AHLaTrBlhLhzfnj1QTRz1/a5XprBP7Q60aUwFUfpvU5HWe
	Ya7rzi9/wbpZCpBx0F0uHlnmkIB1baZxE3EQxJhsWtBbWc+MfHQNlXXZhCEePXAKJH1x
	/5GLNHUZYem/4ZMzhAqzxEtCQIA5jwYsNRD4YqgBpC+HYDVIez5Z7gBZzV1hwnDuu/lz
	r80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nQwFzTOH5lLVwT7g7WnLgEFAHYm6wB2h4R6Lmje/QxA=;
	b=MsmGlI6QsEFqjuDiVRe2FeFazv2UXGvJbWGE9yjcR8tUgs8ddxbVJEu18DRxlbbHGe
	3HP3qTW/rlyMq3/AvI3YMcVRWtFSzFIvkMCRhfuJr964M2c9oxPzxkkbBV0jufkLciQf
	0NOrl3W5x9yV/x1zpphVK//dc1ZXRjdqHWsXwG2C3A2+SpYaqXTdmqomqZFJByLiRarL
	2BIPCOA1gGYUJyZeGKDTesVpjlZCKC+LmVVSf0+4j6CO6Vm4WSDaYnMwx++Q45L+Tq6i
	x/vKmuObHJ9h41j9961sv4D209MR72CbvrbPu+A+54/hPzg65F3LsvZSlNW36CkCk7bg
	H1+A==
X-Gm-Message-State: ALQs6tB1dljN95SR3CcNLxWL3N2ADkGpy/Nds74BcJPefuDUgTBwmZyJ
	G+vkNHq/7ikEA/HpDGytlxeRfg==
X-Google-Smtp-Source: AIpwx48X4KqVybtr1JxPebfqQQWb1TbHPU3iWB/KT4aAs90qr1eW2ANvV+hew0YXo25sSc8dSV1g7w==
X-Received: by 10.101.68.205 with SMTP id g13mr8231155pgs.387.1523752571011;
	Sat, 14 Apr 2018 17:36:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19e4:d7e5:ee20:78ac])
	by smtp.gmail.com with ESMTPSA id
	x25sm3944785pfn.124.2018.04.14.17.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Apr 2018 17:36:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 14 Apr 2018 17:36:08 -0700
Message-Id: <1523752568-32122-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][v2][PATCH] drbd: BLACKLIST recipe
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
X-List-Received-Date: Sun, 15 Apr 2018 00:36:10 -0000

[v2]
Wrong version sent to list. forgot to refresh

fails do to new kernel headers.

| ../drbd/9.0.8-1-r0/drbd-9.0.8-1/drbd/drbd_receiver.c:1479:7: error: 'struct bio' has no member named 'bi_bdev'; did you mean 'bi_iter'?
|   bio->bi_bdev = device->ldev->backing_bdev;
|        ^~~~~~~
|        bi_iter
| .../drbd/9.0.8-1-r0/drbd-9.0.8-1/drbd/drbd_receiver.c:1484:17: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
|   bio->bi_end_io = drbd_peer_request_endio;

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
index e943f24..fa4d10b 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb
@@ -20,3 +20,5 @@ EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
+
+PNBLACKLIST[drbd] = "implicit declaration of function 'setup_timer'; 4.15 head file issue?" 
-- 
2.7.4


