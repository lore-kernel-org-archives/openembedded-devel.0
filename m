Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C80CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.9930.1758189221462560411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKXdUAtP;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso888867a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189220; x=1758794020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPETI0OYEoYCojowK5e9pf9p2cUwWlm6BdsWkeXHErQ=;
        b=CKXdUAtPtbWt8Sqe+ySffOjBJOSKZWOyUoksmgFtD3gEBAzH8MG716YDPnI75aiRo5
         xMIZi1W8oRB+2UeQ0JZmCJstEIYgVeFRQ1G/2TKJm/2BaJNzZtQULiz8KWZIihmJnDAl
         I4cFqEtXydHfgo30ijCE2k9qR3sO89u9tYqkyTuEQV2h0ZqqeOZznphfNQvnA2zTAE5m
         TmAyZMN1+4mwQwVSMGdXJuo3jXcS13Zv2IYXbH260EO0+8gPtNtQBMRqD5QdE4ZkZvpI
         7GYjCcXxUX0cMYcxKm7eVzPxuENMvqhHoE9ZXF7Sf8MOCIkAy/3pZLtdhBZqfxNnYoye
         7fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189220; x=1758794020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPETI0OYEoYCojowK5e9pf9p2cUwWlm6BdsWkeXHErQ=;
        b=a5XpPHRMTMlM6pJOfkbKfgmZApkd+aZlG+/VEK1Zb2w56WNyu7u25YrJJmXfVUDtOK
         GZTJyTowhB/BCOk0AIw2mrmHCrnY86dmVRvthtF0yUv5cBaGh6RM7+/gWe1nVTsQwUzd
         uGGEOqwbWYEVHJYAayQxzC90ko1W1cibQSvaIbdVmCIzh8jAL6G0vS/olOhqmuoWakvj
         YDUVBhad7965jGXc7hwZwYSThXRlP3nEdDLYPR7phbq5lMywqfUOiE3deHtMbshX7Gks
         pJZ/duIDZkmL8cFjj/AI2Bj0XwC+WYQQhLwreq92RcBJU4q6BTR6qqeD7ljttCkFq/MZ
         lSbA==
X-Gm-Message-State: AOJu0YyhxHzaRXvMLnD6b7K/T9LRAT8ZkoluTW0+RHXn+EPT740TH90s
	aOAovWZxJ4Ibp/DyAELAtvmAkgXHR1xK6AVY4b9t7jKfS6qjGExq4MsO+7MFAQ==
X-Gm-Gg: ASbGncv0KPZA2Fu1Wj45Fyuy4hGwC/sd6Y+EjYpykfEty9jAxIXn+iiODKv53tfYE+h
	ElRMDOHGDxCkGGvT8AdSfLFfHleJKOJMxrARwCljMiva+wnzLxI628HrQymYUgS+V9Eg/moW0Za
	5cOPu7ERWl+qE17qYStmtBAyf0j4GBBhxCRdB5zQ+zqn22FCKo6pwI5Vl+DBGuJc5zmTXKffSSK
	m59fqljFTGtKXcGNJtcXl7ZtEiwQaaX1Lzu2GUWejbDZv/pR7NhJp8NY8C/G0Q9FnFnWXF70BbR
	apgaN4hUALoVSwUgSNHLjAaET/0uA/J3iyewEql0GN7S3UYGzaLg75uHke0wSqNfYpPxLSdH4ZU
	LY0C+bdCWXVxM7dYF7sMwSLcc+CfpcF/fdSaL9iRBWxaQAIzkow==
X-Google-Smtp-Source: AGHT+IHWLqxfgOkP8Jab9/2xqcJkW52w8KDQUJjIXknHvQGhDFoZa9XA+K7A7css7iKnEmwBD79j3g==
X-Received: by 2002:a05:6402:350b:b0:62f:32c7:6c23 with SMTP id 4fb4d7f45d1cf-62f83c32e00mr5115337a12.7.1758189219691;
        Thu, 18 Sep 2025 02:53:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/10] readme: update maintainer
Date: Thu, 18 Sep 2025 11:53:32 +0200
Message-ID: <20250918095332.3369767-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119551

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 README                  | 1 +
 meta-filesystems/README | 1 +
 meta-gnome/README       | 1 +
 meta-initramfs/README   | 2 +-
 meta-multimedia/README  | 1 +
 meta-networking/README  | 2 +-
 meta-oe/README          | 3 ++-
 meta-perl/README        | 2 +-
 meta-python/README      | 1 +
 meta-webserver/README   | 2 +-
 meta-xfce/README        | 1 +
 11 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/README b/README
index 3dbc476218..b0bd68d85a 100644
--- a/README
+++ b/README
@@ -1,6 +1,7 @@
 Collection of layers for the OE-core universe
 
 Main layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 This repository is a collection of layers to supplement OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index 61b8a24bd4..3078cecd98 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -25,6 +25,7 @@ OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org
 with '[meta-filesystems][kirkstone]' in the subject.
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-gnome/README b/meta-gnome/README
index 112c1a6887..337eeb6b5f 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -14,3 +14,4 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][kirkstone][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 63c0ef1dcd..55da4313f0 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -25,7 +25,7 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][kirkstone][PATCH'
 
 Interm layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
-
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 5a5d2fb8b3..376f48df8e 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -15,3 +15,4 @@ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-pr
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index 7230a002d4..7b5b6d067f 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -33,7 +33,7 @@ branch: kirkstone
 Maintenance
 -----------
 Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
-
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 Please see the MAINTAINERS file for information on contacting the
 maintainers of this layer, as well as instructions for submitting patches. 
diff --git a/meta-oe/README b/meta-oe/README
index c8741b71b8..5d8753bd1e 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -28,4 +28,5 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 89400933ac..93f371413e 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -79,7 +79,7 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][kirkstone][PATCH'
 
 Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
-    
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index d1b52201a7..fc1549856f 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -42,3 +42,4 @@ Maintenance
 -------------------------
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index e1fe827be9..c7836db11f 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -56,7 +56,7 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][kirkstone][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
-
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-xfce/README b/meta-xfce/README
index d0434af53b..b712912330 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -19,3 +19,4 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][kirkstone][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>

