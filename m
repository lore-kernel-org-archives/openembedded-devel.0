Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E44CCA476
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.18608.1759326767685562310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gw+dRqmv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so10793422a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326766; x=1759931566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykR2nVIIE5hTHkKtL7weAC8CDww3+4AjaNSy9SWho6U=;
        b=gw+dRqmvoFyp+cUwYX7EWCIhLtard+q341Rc61DsDr0Lp/Y8sSHjvOtRNP1PrQ+3T0
         3w6B9nPMU7YCEydOAYvSVEo//Va3zza+h+yb4JzhFg6YOAKMHv+MjkOySZqubP5rU4fA
         WrEULkgRv6QJe3hXbmTXD3Jl8sW1FsdN/AirngNUyYrxUhaL6dkcf8aJ6tAaw4dN60QC
         qCdY+wm6BrxMbVVcuc70dh5wCGuoWUjBHL4AP4e0mhV6AADttu4BMvtNivZ9x0jUF2tS
         7u74fSfWfd4gdkkix7HoNe7wFeFB6pAzynMYpi58PDFV57sdLzoQKZtph2+fIlzn9nYc
         AN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326766; x=1759931566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykR2nVIIE5hTHkKtL7weAC8CDww3+4AjaNSy9SWho6U=;
        b=uYq2CDHMcVd7kQozf+usij21JdRy6ShscyGDd7qTuCyJBW4ASJ1r47IcYWtC3q75Th
         Qv7V+wOZn97zUYAgZoQ9R5NMuHIj59VmlDCc77uqcRgM1PSkJgUB5ZOimZYPSSK6swqj
         ezNqLg+6PjbMpMdlzmVID6R3x0jA/SuD5NbqUT1Yn8NqNaGP7rQB8GlCvC5ESnkuXN2l
         kJof2H6betGQa6P6W7LX0vyGe66Pc8Q66ihWTT6nGbfGpvlNAgQVlLqPaoa27TVelqcL
         d3djI5p+PXf696nNKjMIHOGdcSsvRR/4uCo+tooa9BOLJaNvB3CdMDETuH5Y4GyMDddC
         quDw==
X-Gm-Message-State: AOJu0Yz16X+zuhp+N17q3NPpIh4qPAmh+klOMdNlVvSmk4OXPT+PcQWc
	5C1zmwOe/uO+5ZxkkwtWzKpluyefd8CdHBx26HursbG7L3Lyb7hy8cJjwjB/WA==
X-Gm-Gg: ASbGncs7WB/kqdaFGAHg+JZmEnP4O624ZVgwD/HAFW5VgGu0KktDi4or1ERQASefkSC
	It0zTfSJrW4NFhthkuHCrA8bTggL6JAxfdfFU6SdT59c6udgUGjrd54XfRybkTwEd4bhMo7uzF6
	lX2napUWZJV+hh2SwVPz5A554uSHlnxhjH0+eQQOokp14VTbNAAqNip4m3eTrKL08uKYuq9Qfbh
	SdNtK/PJrCDwvipmiCdSGAzk4ZoN5OReiyZoloU6HjrXks3Id+RWSUvjyvOlsro0TqqGkMvmsT8
	OZUPMQNwdhk8xJlw8H22y8JRdrAs/4vUXN7PCLPMx5z+kvh1XmPak671anJYOIyhWBLuNKoy/gc
	7xoKb022v7VAP/DKd2vJqgSJ3rOJiO1KEJFzwPT+WJNv7rYIYtoh6+SU=
X-Google-Smtp-Source: AGHT+IFkwd4VNzztBZLFAZKvr9mVfKpUdAzAfA4SmUtkpoS6ChIHRlu8r9UO9aPzsof/qX3znFz1Gg==
X-Received: by 2002:a05:6402:5109:b0:632:d131:7df9 with SMTP id 4fb4d7f45d1cf-63678c4d083mr3729767a12.21.1759326765950;
        Wed, 01 Oct 2025 06:52:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/25] fsverity-utils: fix SRC_URI
Date: Wed,  1 Oct 2025 15:52:20 +0200
Message-ID: <20251001135243.1490753-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120117

From: Etienne Cordonnier <ecordonnier@snap.com>

This URL does not exist any more, and do_fetch works only because a mirrored
file is available at
http://downloads.yoctoproject.org/mirror/sources/git2_git.kernel.org.pub.scm.linux.kernel.git.ebiggers.fsverity-utils.git.tar.gz

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d54e2671e62b87532e2dd8f80b73d545fc54aeb4)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index 1c2c6e21e0..49f83a67c3 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
 SRCREV = "20e87c13075a8e5660a8d69fd6c93d4f7c5f01a5"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
 

