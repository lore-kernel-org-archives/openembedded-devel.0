Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96796CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 14:40:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.10633.1757860852502587186
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 07:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENqduiOn;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so489502766b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757860851; x=1758465651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZjAVj4N7Cdha/cvXGTt5EFs0kOHItcf8emuO0oQnTs=;
        b=ENqduiOnd33XHb6v94ivz1jMLtCJ+4HEfFaXo+QXd5gO0Vi6ltdO1c7Poz5MhS6mZW
         sUsGWYCPH48rncpV03F/jV3XPUhJCtbmyslFTaO2PC9blJ0OW9PPsBG/ZO/fSXBNHH+Y
         XjSKhecAUrOT3aQ3Iigry4XsD0TDAeNTX2+/lCBnejUKg0u/QrBbEUSVzqg8V5QtHVu8
         3ZM3lcOW9yVk9k/uL3vXQSmzUSN2lc6XrjMOayLzKdj6jisWpuUPfOYrTxDLsbHbc81X
         9LsI0cJqhtbjYtUkoAhD/4PgxTv2fIKgEkPUnVg6X01XHwKXcF0IM8mR0IeSUJnJ3W83
         ov2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757860851; x=1758465651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZjAVj4N7Cdha/cvXGTt5EFs0kOHItcf8emuO0oQnTs=;
        b=q068ayis67mwQOe8SdCMPH6BYy6vgAU2iUaCPixz63C1BqqeoQg466jAD/FcczIQM3
         HeuJjfvzqHvUtnUZcF29DFTEewjwKrG6hfsUL6d3GPDoIxDaavyFFmLTgCETw/DjA7yM
         1CU/mhdP2V20wm5+GrH2ukK6ufbWJ8LwUnWeJyOWWFi+w3IdAdJNMuAOyao4K2nJnvHO
         Xz4+PHKxhnIdQpL/m8Uimw9Nq+vxTZJANbpT8dlV0ymAO6RQfqh8ha/J8jP/YL0veJDL
         pau7WtMa3JnMOL27KDuWK3iS3fRXEAb8fm48r1f2La92MWFTEDUtT9RA0BsrgHWILa0b
         6y2w==
X-Gm-Message-State: AOJu0YyTjfVFwhYvzolEC1eR8KsRUJMEH51UcN1hJtQFn12eDtGdqB1K
	CCMDYw6CYWqumf5m774dsbyZTRFjTqFM+K4sEkUWcm40JcqeYOw4Knrb/6qFuQ==
X-Gm-Gg: ASbGncti4D1iNYLCiLy3mbQI3+VynWHKZe4KMLEeT0+/W1sLIjrhNOIIGqgd/8PkRXA
	rj+kLV0wCkw9XZlSNjMYkoS+/NmALrGQGxnHcoFgjWQmpS7eNXyo7xWEvHIkXWyp6r+ZseL+t9x
	LjDSxW3BC0/jPhLu2HpJFNpmlf1EyxcgSkuQXPEnkoRO1rOxGU3t8gVeoAizss9QbnaYyh0OCGU
	oxQhEfLja5DsTj7Uo8WaeaK7L6guY5ezAdw8f7esWkcESJjHQmcSpe4TWiEwrK5zoXcUZte0EDs
	K65aRZedRVFTAG4JrZ254ROrBLgzLnDTGdl5mhKeebqHUConUWdRNJPW+P4ofoIdO/mWF2xvNW5
	4phZlrW39gLo5HhvfsDH0yADNHLy4c+4=
X-Google-Smtp-Source: AGHT+IHE6F/wcLtbubhOV3VK7Dfa2Z4VfUc4W0bdJ22ug+yzIhE7HdvI9Y9LZYZT1gY+vBlbKUQG6Q==
X-Received: by 2002:a17:907:3f1f:b0:b0d:d831:6fb8 with SMTP id a640c23a62f3a-b0dd83178famr249393066b.62.1757860847032;
        Sun, 14 Sep 2025 07:40:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07baf35488sm669575066b.38.2025.09.14.07.40.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:40:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] pgpool2: update patch statuses
Date: Sun, 14 Sep 2025 16:40:45 +0200
Message-ID: <20250914144045.2836209-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 14:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119393

The patches were submitted to upstream, they are not pending anymore.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch  | 2 +-
 ...1-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
index cb6da7b08e..13db1856a6 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
@@ -16,7 +16,7 @@ as long - however on 32 bit systems this fails due to different time_t size:
 To account for this, introduce a new helper function to get a json value as
 a time_t type.
 
-Upstream-Status: Pending [project ML registration is down]
+Upstream-Status: Submitted [https://github.com/pgpool/pgpool2/pull/128]
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
index 335761c9bf..1fdf91227b 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
@@ -19,7 +19,7 @@ When building for 32-bit arm arch, compilation fails with the following error:
 
 To avoid the error, add math.h to snprintf.c.
 
-Upstream-Status: Pending [project ML registration is down]
+Upstream-Status: Submitted [https://github.com/pgpool/pgpool2/pull/128]
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---

