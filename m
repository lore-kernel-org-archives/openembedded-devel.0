Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3E3CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:47:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.52742.1760381263113101149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtyZgYpe;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2673483f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760381261; x=1760986061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiHiIWFDjXakdMCtVhPLkBSZrbznsS4DKnMakK2Fmqk=;
        b=RtyZgYpec7lAZ8ImH/2l3s4Kk2Qyz5RNo8JIqzW05WENOvRpLY4q2V41obHxE0o1PP
         qOu6zI5ELNewXvj5UQcAnUtGzp+6kc2qUbsaCBEzq2WqaJEgNSsDNZPVSf+hVOqhAFgD
         UaiT1A3WLH501VftXVA31nE3srNUc37W3aKgkSn1Ppgbyb3qWkFcoLXluS9kNr4Kp9X4
         hGDP6PNJBIWM1TfSw0MeLnBM0GRDqVo3fqISWgIOz6o5BeNnPO/ZNwHZI2Kk4SXW3mWX
         iQwi/lerhORR2unKIhm5IWqEsX0z7Dmn0An0L4wPrz7eYQhQu5HznHtGkJwrhL+b+t77
         TRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760381261; x=1760986061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiHiIWFDjXakdMCtVhPLkBSZrbznsS4DKnMakK2Fmqk=;
        b=YY0g84s2okwlbr1YqZsSvAiLBpYgMDPvbI95g+VZ2DqVyA6/V/3HBz+XeYH8nAS9Ya
         YgEjwSbRbS/49fUUw36bRnQrD2EueXiLV7CvHXjhejXNDM8NuVcKrQyphy5O6vcvTUE1
         JCIQrAGVbGgqzZjfze+rf3RyrvBjKeqbVkHvpjmoiC469ExFCOHbiR4TZdUET6Veh2Na
         g1zY9PCxG+jJHG+S1R5bQyWLhzXzyDRQz5QoxaV5JJDofvt8OGOTYwheXwwe+OM2BVdr
         0ivwHvd30wqMqMrhKCul7iAyltbcLRd7EiQgvGUI+tQuGfAUzvjB0F35XCBP+3bMIocK
         plBg==
X-Gm-Message-State: AOJu0YzAEVbnUZ9EXoRXhL0fXVDtkrw/km4cz9jRkc+VZPVcYw/+q14d
	lPgv+2JMm31zhQWmdDtKip3ImlMMj69Hxkmx0Fcg+yMROgGygnRj/h6Hl3pfDg==
X-Gm-Gg: ASbGncsgYu1go5JXbqQW1/wxo50rg8aFuz5UoaYKyLQYCufDBcqOnYviVrPxfWf9nyd
	VlJVzItagXKB2IPgW0P/a823uAB4sdm7N5jp/h3zclZiG7d9PwTw8WAmc874UuJTgihX9OFGg7b
	UNvvc9KeYpZAYHkY6CQ64RuGjZOa6Ek5a3JkANxBNgIg7uA/GcOD+z+2OzZ5W2a9azOoWGpWC6y
	qDJndcT0UZ8m9pOZt8/L5rglERVahgI09ALM2k//IDk0xq8ZiRs6KI8LHjR2e0o8QYWHBd3q97j
	hPIEBkYGWnkPQP02JlZNKCGoU0+l1s++7xw2CwxJ+Af+R5FRnaTxLrZKx+7vqkQ9/CVMZMUNWel
	D+e1Wi/V7QOF3eZwomkUvkHoXNyHycMMN/BjC/2ecUylrD8Yp4ZYzLyn+TLrP
X-Google-Smtp-Source: AGHT+IFvCvP+2aVRZL2PucIAazSDMQhWTloSJLSgx2/3mElLNWhxBNcQeendC0kjBCMeUDIGqFnqhA==
X-Received: by 2002:a05:6000:25eb:b0:426:dbee:3d06 with SMTP id ffacd0b85a97d-426dbee3d1bmr4445482f8f.22.1760381261253;
        Mon, 13 Oct 2025 11:47:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5825aasm19204461f8f.14.2025.10.13.11.47.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:47:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dovecot: ignore CVE-2016-4983 (again)
Date: Mon, 13 Oct 2025 20:47:40 +0200
Message-ID: <20251013184740.481753-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 18:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120545

I removed the CVE_STATUS setting for CVE-2016-4983 when this recipe was
updated to 2.4.1-4 - but that was a mistake, the CVE database considers
(incorrectly) even the latest version as vulnerable.

Revert that mistake by adding back the correct CVE_STATUS to the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index a06fd45199..5894c76bac 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -75,3 +75,5 @@ FILES:${PN} += "${libdir}/dovecot/*plugin.so \
 FILES:${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
+
+CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: Affects only postinstall script on specific distribution."

