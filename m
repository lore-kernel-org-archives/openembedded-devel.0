Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D9AC83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 18:11:00 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1938.1752171049719616296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 11:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TLFyNOqY;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so1020179e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752171047; x=1752775847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LoHSjFZPnaD32nb2Ajs7CWYeJQscUWJlGe2TYGc3hBE=;
        b=TLFyNOqYXv4a2jGuWB/qYzAWmZ17VJg20C+sgIjFm/dLlDB3uzlqu4cciExSY7ZVXC
         Mhm2gIoM2/G+eFzwp8gwhi3f6rxH/OvBF0s3t4vOPZ42WoUGahgVvjVw40nubzKF+JqD
         IQComUlwazFiujaWR2nK+4zNKZShbVgknn1v6jk/KJsQFFXyPMSH20Xolc/SFAw0A7UP
         aecLxOwpSNuLz+4ROjBcXLL5FvaGQMWKr904kHf8QmMLm8gCi50MN/x5rujboSZLgo5V
         GDhsqZKwzQ9TreWSUggLD2yBYflqT8iSommYBKuZhXBWsmWGiNrcHHBMoR4j1dxLPlPL
         7PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752171047; x=1752775847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoHSjFZPnaD32nb2Ajs7CWYeJQscUWJlGe2TYGc3hBE=;
        b=LuxMJKh5Sp+n4K/Ks7cx0wRYx6yZhcm5SI7DFK2vIgkG0wT9HzhPOpllnRBtMaPLAh
         ljTAqTSJHSRd8Md3JXAXD8C92jOfIWKoNZLmMyE04WbBmgeDLDCRdzeox2dpaK56Huat
         2/j1HKT1UggOuhFzCjjHHorDE3ej6eYytj6xLLtSAgoN3J9q/KupbwbK/ej/nlTNAL5a
         QapQ9foPl7DWWqhA7hxcFLeagY64JUcL0aTAA8N9/o2tmJMHonaGwurW6pdpV//67PW8
         c829wmB8V48IsHUx9SWMANxS9HiYNckqsAeRrkQRU+SdHfc7lfhZOzG/enYPBzRlI7mb
         0o7g==
X-Gm-Message-State: AOJu0Yy/chJZNzQREDnKYvbTnYtF/QHCAkJXcGmj9Lj+1OLiZ4VIMiwr
	RNDgG/aV5rv/eP8exG0AO+DQ2DWtOmehGnBnylyMvOHcjhd01+vItybU76VG7g==
X-Gm-Gg: ASbGncvVwni+uSZbyzyn6ThmfOAzeyXXuEfGUD/CyX4d9Boad14iWtOXtj4EjGU/3Q8
	9N7ik1BSTy9G7HW2Vty4rw+sihdb7EjNtMW+0blc0k5K5zGRjL9JsvjkP+Y2202i4GP5+XwuH9T
	J35PjgJBXST4IASKlfkTjPQ2qt27EJmUZ5K/IbgzM83NFlnCsEIjwYXJMXiG02qaEJbrNFNgA1Z
	IVK7AzSHOxXnE9tFE6VlQ4i878P7zvrlqHz7m4sTlaMumHXcAZuPNrVC2dW6IaKA6x0NXkeAfYD
	tyjc5bvITaBZTHR+WSlEiZ6wyPyihjs0a57nY+A47vrKEMolfKGQ2UvaiP3vymu8uayf/q1DTMl
	4Qm0=
X-Google-Smtp-Source: AGHT+IED89OWuv1jzgs3j275FJCE6NMs/3ktku84Nuk+HzgwMd59a2WH8W7Mxuu/HkZT1bdRHYe8cw==
X-Received: by 2002:a05:6512:12c4:b0:553:cfa8:dd38 with SMTP id 2adb3069b0e04-558fa8f916amr2954592e87.36.1752171047214;
        Thu, 10 Jul 2025 11:10:47 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8bd4a8sm3239181fa.65.2025.07.10.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 11:10:46 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] ade: Upgrade 0.1.2 -> 0.1.2e to allow CMake 4+ compatibility
Date: Thu, 10 Jul 2025 21:10:41 +0300
Message-ID: <20250710181041.49619-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 18:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118421

Fix:

| CMake Error at CMakeLists.txt:7 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-support/opencv/{ade_0.1.2.bb => ade_0.1.2e.bb}    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/opencv/{ade_0.1.2.bb => ade_0.1.2e.bb} (91%)

diff --git a/meta-oe/recipes-support/opencv/ade_0.1.2.bb b/meta-oe/recipes-support/opencv/ade_0.1.2e.bb
similarity index 91%
rename from meta-oe/recipes-support/opencv/ade_0.1.2.bb
rename to meta-oe/recipes-support/opencv/ade_0.1.2e.bb
index b54c28d624..a7af2f2da9 100644
--- a/meta-oe/recipes-support/opencv/ade_0.1.2.bb
+++ b/meta-oe/recipes-support/opencv/ade_0.1.2e.bb
@@ -5,15 +5,13 @@ organizing data flow processing and execution."
 HOMEPAGE = "https://github.com/opencv/ade"
 
 SRC_URI = "git://github.com/opencv/ade.git;branch=master;protocol=https"
-
-SRCREV = "1e02d7486bdb9c87993d91b9910e7cc6c4ddbf66"
+SRCREV = "ffc83ad372d72b16732f201d8a9d1d80dd16515b"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit cmake
 
-
 EXTRA_OECMAKE += " -DCMAKE_BUILD_TYPE=Release"
 
 FILES:${PN}-dev += "${datadir}/${BPN}/*.cmake"
-- 
2.43.0


