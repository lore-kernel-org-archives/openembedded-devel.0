Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 687636057B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 12:02:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e3so14221920wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=m/+BcXfZzjEFUNc04DRmemvxMFg+N8U6LdWDZTwwUxI=;
	b=RDxIL8zRu6d0pEA/nJH4zQQ9rqCWSQWsRLnsMCKSigaXkr0lFrjJTgjQUNmlyMrLf0
	cdakgk0MX0vw9iwBZVlrik/CIJyFDy0gbU/7NWj8KqRxAZ23JlSq0tJkUvEL2r7M/FST
	YMuJ+IpCrp0Za+ReVyjwFNgOsRu2qNwNilkML7GoPxAHezOFw28SFeWoBE+RhOJfId/I
	uTBBnNfq+AFvnn2ITOiTWaWZOMSEw8EQICAJYIP+0iqsWUXCTm9Fgyg/DFBJAmMEduGd
	8XFsNdfCU3Dj+w17ntKL1JOxk4AjP2x25OtObzxtBoz7ZSgjIbD0lI/kqK6iLfdOlVxx
	yKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m/+BcXfZzjEFUNc04DRmemvxMFg+N8U6LdWDZTwwUxI=;
	b=YK/ryeWU3yadXzoimSwU9CtxEiGriZ1T8b3ulRQ/H9/lKAT+LJaDnh9gyNqWd/ApMH
	ITJXV95wv4FeDlVkS+Grvx9O70fncAAiP8v4R8/QgfQ8SZNh7vE5IQcUtDiCYKFVLfC4
	+g14EqBZ90NmNRq0F1Qu/EZFdwm7qwo0tg4F/kxPhvXIlvbb02T3h7bzu0GQ8PZ6ZgnU
	thEKpqEi/tX6TFqqLi8kWJteju88PVZJL21fJBvJARUO94V6C8c8uqfzY11zHCMOK5ij
	PLenlSEvCRrMPXWQhAMwTRUD3VZfAl7bQqMpdsbGsNbu/KHMKvKGICiAqMq7f9scOktV
	eaNA==
X-Gm-Message-State: ALyK8tI5LHAweG+T6zfzAzsm5j2V8FJhoYTr/KcbMCb/lB5xXG2A2H4LjKZs44wgYjexew==
X-Received: by 10.28.107.85 with SMTP id g82mr8327227wmc.65.1464350576178;
	Fri, 27 May 2016 05:02:56 -0700 (PDT)
Received: from shrikant-VirtualBox.inp.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	i3sm19079456wjx.30.2016.05.27.05.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 05:02:55 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2016 17:32:26 +0530
Message-Id: <1464350546-14600-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Shrikant Bobade <shrikant_bobade@mentor.com>
Subject: [meta-networking][PATCH] netcat-openbsd: fix qa warning
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
X-List-Received-Date: Fri, 27 May 2016 12:02:59 -0000

From: Shrikant Bobade <shrikant_bobade@mentor.com>

fix for QA Warning: No GNU_HASH in elf binary, it won't obey the default
LDFLAGS which results in QA Warning while building with external toolchain,
so adding the default LDFLAGS.

WARNING: netcat-openbsd-1.105-r0 do_package_qa:QA Issue: No GNU_HASH in the
elf binary:..nc.netcat-openbsd' [ldflags]

Signed-off-by: Shrikant Bobade <shrikant_bobade@mentor.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 89a646f..3311d24 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -16,6 +16,8 @@ SRC_URI[netcat-patch.sha256sum] = "eee759327ffea293e81d0dde67921b7fcfcad279ffd7a
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
+EXTRA_OEMAKE += "'LDFLAGS=${LDFLAGS}'"
+
 do_configure[noexec] = "1"
 
 netcat_do_patch() {
-- 
1.9.1


