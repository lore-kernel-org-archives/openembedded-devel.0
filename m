Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.7977.1588332951642890981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MdRJPUJ6;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id x4so5682527wmj.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rYtyb8A+oSHTSMEPKCjtawiGAjrUe05QoKo2+o9HnrE=;
        b=MdRJPUJ6YUbWCeTf5d5uW4NWKzd9eQLs+/5uQggKAua3OicHonzywOJqbrVSJyaaPr
         MchwsO9EKgxHwMV0pptCyv0MgT0vefZKUknO8Z8p06gDD1HWY2UyKC73WxvQnagtvTn9
         EF5PnGqtq8AJZFVYuWlq370BUZFX0YiBQ9090yItac0k36ogzdWLMNn1CMgyd9p+zUT1
         saDENYkbKoewKlTh3809s//Oj184GPfMP5sShzzKOzRGTB8P2d0gkWncqQFWDRC6mMEI
         ARJPqGomh5p062VkXD4BB213ogJVdEGWvnREnHZsYq8bYRJEiOjbSFLLwf3VIYL2KPg5
         r9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rYtyb8A+oSHTSMEPKCjtawiGAjrUe05QoKo2+o9HnrE=;
        b=BRHzZXMqlMN+HCasrl5HKFNuF3ej0i+fqN5c+hvxq8zwztt6TQhFrUaWi8OOD8+Mlz
         X/lomiRd9aonYSVo7XkbKM6PiQlUS306i9ZxI3fod6O044+GtVtAfHQvcY7GHyV8hs/8
         dUOf5JEPvy7oH9O1jVd7qrX2zL//5AlwDAoXQ9giCAFI5FWMArfbgV+o9aF/GQwv7NBF
         W+JjAZyuRxRPIn311QW0lADs1vERNX8xuNnr+73MKS9H1Q1LcfxcnhY33hlRwmvymy55
         85gPm0wmFPKjsQzp2LQVdUhBOMfOHuEjyyLzBXzz1jjlI/nncixW5O6k//UzNWIHzvm3
         fiaQ==
X-Gm-Message-State: AGi0PuYlAyUnkgyjKODSXco85CKxJvzc80RJh4CtUB5quNEgM97IQRVV
	1dDK+BZC0lHWsqzBpfUWg7I4ou89
X-Google-Smtp-Source: APiQypJTc1dGWHb5hFoOkpnkVSqt99pIUu7i4iessvCI5aIVrVGXTZ3L8zqbfOjpPuLRvymzgRqBDw==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr3828329wmi.155.1588332949679;
        Fri, 01 May 2020 04:35:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:49 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/10] file-roller: upgrade 3.32.4 -> 3.32.5
Date: Fri,  1 May 2020 13:35:25 +0200
Message-Id: <20200501113534.16030-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 3.32.5
--------------

 Bugs fixed:

  * libarchive: do not follow external links when extracting files.
  * libarchive: overwrite symbolic links as well if requested by the user.

 New or updated application translations:

  * Kurdish (Sorani) (Jwtiyar Nariman)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../file-roller/{file-roller_3.32.4.bb => file-roller_3.32.5.bb}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.4.bb => file-roller_3.32.5.bb} (100%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
-- 
2.21.1

