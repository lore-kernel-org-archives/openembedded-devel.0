Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274C2C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:22 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6387.1785223277586917444
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fWnTRmku;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad8076b01so44074425ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785223277; x=1785828077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+Hls9sESD1rd3ykIlL6tWZAdmEo/5PbktQJ2Nfh5Ps=;
        b=fWnTRmkucpYnUNBo9wWsBtD8bIOHa0kGBkfzx/AvYOM4Pmpu5sEAG9uoaBsby+WGHi
         O5vcmEhV0+B4NxFpYobd6jT3J1fKuey9pTMIUXmsTQmlrspGCaXGL6bZWa8PFBXnWpnb
         OYHDN0ibLUbz4urxi80csCz8dESNNABDr8rhixtw7CfI5wcnD+ngb7ZNq/jhW6+H7BUR
         3hexUCm4S6CAZxaUoYJx9ELLCEEamaBr+yYWF134oJvQJLpoHJUbKW/VGiQOV8q4iM+A
         PbSomCMt5+ZSmyCpHcwEGoOo3TPH5bE/uTUVijzKoC4yQVDniU3DnF16DX0HeIlhHDoq
         iJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223277; x=1785828077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+Hls9sESD1rd3ykIlL6tWZAdmEo/5PbktQJ2Nfh5Ps=;
        b=LW7NkhrcjKgbxUxAHRSJgzLYm41br0DDt8NLRniR1ErBDnmtrNs+uZKkHQOGumaPFH
         1Dm4yMvRqzW9xgIs6JeUXp5eMlyt46VVWMEALxV94FTQxrQWjh7EL10t+YMxSBlmAUd5
         ZpWLzZ42sZh1y0tr43prYJoHr9iSmIaOuGG2RBE6N0kpeVNMsmyXJHx7A8AFWj9fm2tZ
         z2wETRbglGBz3G/axt3VrTehtnp6GLvT6Nbz4S9zt0emXZiHHE/fJgWW05qyEVxvjStu
         2ZIG7TXZk26XFLRq9z0KsT8gVRbpUQI+F6tdcUttP1TaqFtb3kNnC/rC0jRw+OPHJDxx
         Lk+A==
X-Gm-Message-State: AOJu0YxjNORhIuERb6CYXxXIPxr25bgky6HeG/9wChTUP8/z+xBdGSZy
	5nkDu7uGK2qIAKu1gWc8gaZW+qWfr1oUHpZLXnuz+RfW7tqReyq/0A67RTbzprwi
X-Gm-Gg: AR+sD11i5uqetoF4F6SRUu6noJOb649LblW4WrI0N66CoJiWYiPOdEfrwSkT0karfKo
	uSVGUx0pwtgeTflcqpfCU2y72z+aAecEqU+17aEGN0dJywBTaMIXfnrYjARyJdOBt2JfQG0JSCI
	YPQm7n/b0Rxu7dLL3ahuNL8nQ3HCQvAzVVjrZjLhHkp80q4d4E+ern8/ZYGvv7rf3MzUubPRV/x
	1eU3pQNXGka4DPsOmQZ3ZmeEQ+w4aqfFkDg932F6u2I6/WdhDXApKd0euklR7HPRNcatc0Og4zh
	I6BIE8PfyD+8r8qwKdKRJ9O4oZjn8fIyHCmt1/8fMcdaLLQWOyTWDFLmHsjrWbF5IPv7LGsOBoj
	04bsicr6zeAXS197CxzpdIAz1yEaKYsGN6m49mHJ0dUZo+wH0v3Wgwid4wK0p6M0/ajnXepkpeW
	TUR83tPgZeuEafbzBMEIm44LOpsIAjCKm5ygJRQlx+X2FvhPOyYSTIOSdr01BsUa+2y58Xa//p/
	RZM53or64we4TlwXz/DPCsIQ5uBHxS9+KzDBD+cMLWzcelQPbIU/z6/s4aUTPPbdAZKvKmf7Ykr
	vIkZV+u5FlXw5nxDQOcXKgINdg24vA==
X-Received: by 2002:a05:6a21:3393:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c8aaf80599mr1936332637.4.1785223276737;
        Tue, 28 Jul 2026 00:21:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm37245911eec.28.2026.07.28.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:21:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/4] python3-defusedxml: Add nativesdk to BBCLASSEXTEND
Date: Tue, 28 Jul 2026 00:21:10 -0700
Message-ID: <20260728072111.3266991-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
References: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 07:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128505

python3-py-serializable is extended to nativesdk and RDEPENDS on
python3-defusedxml, but defusedxml itself was only extended to native, so
the nativesdk variant of the dependency did not exist:

  WARNING: Nothing RPROVIDES 'nativesdk-python3-defusedxml' (but virtual:nativesdk:...python3-py-serializable_2.1.0.bb RDEPENDS on or otherwise requires it)

This also made nativesdk-python3-cyclonedx-python-lib unbuildable, since it
RDEPENDS on python3-py-serializable.

nativesdk-python3-xml, the recipe's own runtime dependency, is provided by
nativesdk-python3, so the nativesdk variant resolves cleanly.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index 8ec6680d8f..614a606b20 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51

 inherit pypi setuptools3

-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

 RDEPENDS:${PN} += "python3-xml"

