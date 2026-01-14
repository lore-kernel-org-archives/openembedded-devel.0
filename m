Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1C0D31A1E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5446.1768376085697964122
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlKhTZe6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc544b09so6611374f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768376084; x=1768980884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyzDmwvOVn/fGHblWMbDJERbE7y/n4Vj+nM+UU3E02w=;
        b=KlKhTZe6gG3O8ruyf75WuTKJbhU2sB/r2AcKNRadxpgyj9Qt5vCHRqzbB564YlDFuM
         YRSulG+l1EcvRfLbsHn+lkU3ohmQhec5DQJSOM9yGM9uK9pVwr01Or3xia+FnJ5ooBoV
         6Jz1Zr9QeiymxGP6RsjYZFbZrUzdh7Y/1hmFlvNIhYIXSgx0M4l6yn9KY93y4roQAePr
         YmcaE+g5GopvxOySr5UhDydd0r4sgx1D6brrtrtQcBNKVhgPXdYW0ApvO/XS9IPod7AN
         dtBZLWRdHfwsWR2Sst4uw5B2NMFRtsajHKUcGq8HEXpgKY1YGToVzyOiai0XE15/e1h9
         s/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376084; x=1768980884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyzDmwvOVn/fGHblWMbDJERbE7y/n4Vj+nM+UU3E02w=;
        b=dcISGOux/b1GWR4+E89tXNRtk3lcuyIN091fyki91YomprHRQUSXpTiXf2pqRymrJH
         J13YzqXXFK7lF4KYjseq6c5Nb5kOEtu5oVjzrtvMirBErs02qw5nvqZi1HczNQSgooDu
         xq6B7b8zbFC89yoYuH6+MIUcOV0as6LYhcwSAIIURsl36mXynXfnKENQg1AZ80bKFaN0
         nqIanFcH44mEyNYakwv/ymlyzLruT65w/4bTTNgR7ncd7gRvRv8iHfQ6+Z8hYi/YCI72
         FHs+gRy/r2uLgPXsdaj4aYm+auCuMaJTqxMBPHyTkZJfPYqpDznnorrSrJV+WUTQgKtz
         h1Qw==
X-Gm-Message-State: AOJu0Yx/buqEpaMpzsSvozzxZslS0z/UU2YGV/a1+Mj990KIYGvPU2DI
	8XmmCsVD/Tf2lrD8EFGgqQZjc9DJ3nuJKwYC2sCpfcWlBp23lor5QXVLwto/DQ==
X-Gm-Gg: AY/fxX5d7nTGo02dZNbcNCGIdVB07TVrwojHD1Z2xh9O9LOMAp3YHWXvFV/nCScD/cv
	gYPOLzROPyDFr2n8yVgcyP2o4dqnH6TzdBRD/rr6eT+DKIx0bsXFxixnpDeI6nZTKM47VNYtvx3
	PFYFxGAdp6f4YWT9fqGslUqg585EKy0WSfDE2OmD+Wtqq3HI5HaJBenz322Rw6AM8lqNx2uoass
	FezeoATWTFp07euVc/RwVz7SP3qkK0ZPJXiBtzau3F9q+Jxn2HJBnwzbtSe6GkU8vSpM8o6fuPq
	tQfB/OWcIZtacCPOCEC/pC6QyYiN7M4vBlhdLh1NMxw0Q9zAnLSDjXUcJ1FVJ88zUPzlG0Dkln7
	uVmlyh0WdZIGcbPELXegcj0KVOAQu4djhooHW6NuL6Jf0juKnblv0aSi9JP3nw0VZx+9JPIxC14
	/eWu/1XArf
X-Received: by 2002:a5d:584e:0:b0:430:f6bc:2f8a with SMTP id ffacd0b85a97d-4342c553620mr1749223f8f.47.1768376084001;
        Tue, 13 Jan 2026 23:34:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm47598289f8f.28.2026.01.13.23.34.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:34:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-django: fix CVE-2023-36053 patch
Date: Wed, 14 Jan 2026 08:34:37 +0100
Message-ID: <20260114073440.210915-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114073440.210915-1-skandigraun@gmail.com>
References: <20260114073440.210915-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123448

This change is for python3-django_2.2.28.

The patch was accidentally backported incorrectly. The patch in general
introduces a field-length restrictrion on the email input fields, however
the patch was backported in a way that the restriction was applied on
file input fields instead of email fields.

This change amends the patch in a way to restrict the email field.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-django/CVE-2023-36053.patch       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
index 2ad38d8e95..c4a6bb0ef2 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-36053.patch
@@ -61,16 +61,16 @@ diff --git a/django/forms/fields.py b/django/forms/fields.py
 index a977256..f939338 100644
 --- a/django/forms/fields.py
 +++ b/django/forms/fields.py
-@@ -542,6 +542,9 @@ class FileField(Field):
-     def __init__(self, *, max_length=None, allow_empty_file=False, **kwargs):
-         self.max_length = max_length
-         self.allow_empty_file = allow_empty_file
+@@ -523,6 +523,9 @@ class EmailField(CharField):
+     default_validators = [validators.validate_email]
+
+     def __init__(self, **kwargs):
 +        # The default maximum length of an email is 320 characters per RFC 3696
 +        # section 3.
 +        kwargs.setdefault("max_length", 320)
-         super().__init__(**kwargs)
+         super().__init__(strip=True, **kwargs)
+
 
-     def to_python(self, data):
 diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
 index 6f76d0d..3a888ef 100644
 --- a/docs/ref/forms/fields.txt

