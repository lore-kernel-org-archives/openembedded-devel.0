Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D601CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:06:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.4449.1758650806308146850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+jQH/6w;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so864457466b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758650805; x=1759255605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPDosY/SctMG1RNB8n9JrumrZnlJvs2vF5li9r5JfUc=;
        b=f+jQH/6wnWIm8366u7wS7YXOT2CzWKd1ycNOQ/J/QPMRa8tC7K2s73LxqZaiJrEglO
         LnXSPYJRDFg5hHWaKfjJ23SuOuLdZPZ/cln8jQzAYfmS/QNfGMhihSSRI4uIQMKYnxAi
         jSm6EMAXoAA9f8bOe37t/elk4zdjtY69Xv1nI66ja3qJbuwz1cuYCvsfWOlLXm8R+k6l
         7cVYKizEfUQryi94BVVVPz6UAjtqyt0Zixu38bYlhS2/rOEgbC7fas2KKJIdC9rlCagM
         ZEvNs4/WfUxXq5cZtX9WkncszGLOYbuu/9Ipq2QXP+Jr3ukKKnwh8z9AJoA8MYgZFmKB
         VLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758650805; x=1759255605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPDosY/SctMG1RNB8n9JrumrZnlJvs2vF5li9r5JfUc=;
        b=SrgsfovDy0HxFaPiKcrCqjpiRITgCKZK9+7Y3FtYGADQjOXDNL1ywpm++anxYbxufU
         uh7/qL3Z2BPPmLQ4YS4eVc7gflVO43326tT0Mq+xITJUtInAOxZ9tgQKiwJHhzlz8K0d
         Igk4349cQcM6Viq9qzEOzYt6GdYq5lzUwsu1jfP45omQInoyFSi91Wtn5pUCq829Rkvr
         SGWMrpyuefkRhaFcJXuigyrlyYsU724aD9VkZytlrufGI9EqR3tWymy5QEveut2E9xUi
         1UYKPaFKn5koQ3FgXVF0PkLriAxx/Wn/RSnJuu5v7y8jM7F9fA4B3FF36olKMwlo2yn8
         nI1w==
X-Gm-Message-State: AOJu0YzUjj1AaMYwwCpcVdC+/Aviw5YLWBcTjH9FvR31//ArLnsrLpAj
	N6HHR3cqOnqC4CTSC1GkqUXm0IwtpL4JFnq08EwXpt8W1VeqRkx1Bk52N1EDaPZS
X-Gm-Gg: ASbGnctHqS/Ljq2T+Q8fzq5Bg2SUvUAhQZ5CIvmonQoZnehN6qdZJmId33S0LBAKAm2
	7JB235in3zsZWHQql40H3ae4irBkUDfl+njgyPKmyROrX0LZHfVnOvx6/9HsmMsVSi1aQAf9o+u
	OeN41etjBbo8bUso4foyJJpYdrSikZjhkh+VW4ao3u0hIA2KQ0xAnjGooFYjeEd7fRUeymsaSEJ
	CwUU1kh6eIO3zMdIyFEfn5cN1chtyhuTxtU/y/O7d+EJomDvAtSmPzWZ/oHSrDhdHwfnzkGfNMx
	fmw57fDTGkyhUPeDSG/seJzcumD2nS7yrLJm/4r/JC9b32pr1/E1wd4qGDiP/MKW1t97etLm3kD
	Uycw5Unjr0nDgl1VWssfN
X-Google-Smtp-Source: AGHT+IGCMDgKmlk2WyhX/MFctw9YUqnCQ+5VDLdWULXu8rmIDuACb8elTUYg6+WhfosUSiw4UulLSQ==
X-Received: by 2002:a17:907:7216:b0:af9:414d:9c2 with SMTP id a640c23a62f3a-b3026c84fbfmr387160666b.3.1758650804574;
        Tue, 23 Sep 2025 11:06:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28be3fa38bsm826714866b.46.2025.09.23.11.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:06:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/3] readme: update maintainer
Date: Tue, 23 Sep 2025 20:06:41 +0200
Message-ID: <20250923180641.2307188-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923180641.2307188-1-skandigraun@gmail.com>
References: <20250923180641.2307188-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 18:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119731

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 README.md                  | 1 +
 meta-filesystems/README.md | 1 +
 meta-gnome/README.md       | 1 +
 meta-initramfs/README.md   | 1 +
 meta-multimedia/README.md  | 1 +
 meta-networking/README.md  | 2 +-
 meta-perl/README.md        | 3 ++-
 meta-python/README.md      | 1 +
 meta-webserver/README.md   | 1 +
 meta-xfce/README.md        | 1 +
 10 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 24021b2664..dd2a826292 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,7 @@
 Collection of layers for the OE-core universe
 
 Main layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index 57437280e3..0f3760850f 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -25,6 +25,7 @@ OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org
 with '[meta-filesystems][walnascar]' in the subject.
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index b97be0ed55..ddaafff2a3 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -14,3 +14,4 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][walnascar][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index 5f70177e95..221b355db6 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -25,6 +25,7 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][walnascar][PATCH'
 
 Stable layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index aba8a31979..05baeb7b82 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -15,3 +15,4 @@ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-pr
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README.md b/meta-networking/README.md
index 893d50f714..7ea19499d6 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -33,7 +33,7 @@ branch: walnascar
 Maintenance
 -----------
 Stable Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
-
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 Please see the MAINTAINERS file for information on contacting the
 maintainers of this layer, as well as instructions for submitting patches. 
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 709a4201de..b85988fea5 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -79,7 +79,8 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][walnascar][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
-    
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>    
+
 
 License
 -------
diff --git a/meta-python/README.md b/meta-python/README.md
index 3ec72b6ea7..2ae4d8b344 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -37,3 +37,4 @@ Maintenance
 -------------------------
 
 Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 39192181f2..ea085b0cde 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -56,6 +56,7 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][walnascar][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 4c532c46a5..45f4062194 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -19,3 +19,4 @@ When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][walnascar][PATCH'
 
 Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
+Layer maintainer emeritus: Armin Kuster <akuster808@gmail.com>

