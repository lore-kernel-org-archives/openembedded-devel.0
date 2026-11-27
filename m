Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10348.1795753043463620518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F4EUa3vB;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so11214248c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753043; x=1796357843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mF7sLssoYVICN3LXOjr4bR9KrYpHv87+xZ4a8LMqPSU=;
        b=F4EUa3vB1z6hyhCdiUXb/VCPoQIw4yKEg4cVgjfdAsl/C0hQBwnRFqIokLZqjgQttZ
         aR2CFzkIObixleAGVdjC+u79dceQGu/CLlsg0eDXW234NhtWXZxHR5Xua/w6eZGmhWIj
         yDWr4uEAS/PPqQI89OBWRBh1zGWjhkpJGFb0RjqFblmRFI4ixbfRAtKKi2K0+JQiALlW
         KAviwDlXZJ7n4rsSX9oGW/Q21rv18gOnHbn/s25iv/37qLi0fnGA6IM+eqOdjiVMJ8EX
         GhPVEy36IxuE33gbW7Rc9LWUEUFWazHmI2EbgPAByUFPvwWrYY+U0cMiTUDR1H+HuNXu
         ZNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753043; x=1796357843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mF7sLssoYVICN3LXOjr4bR9KrYpHv87+xZ4a8LMqPSU=;
        b=Ep3QJAtiUPfqDpkmcfgYQffAq5QAVrRycZ7eRnzKJOnLyz5pGsKrSuGXE0oFWL1DaN
         VRIk0dGX4c6QiUvaq42zR/7UhjUisTX5UooiU65l8BvrfeM7wFHbBAqf7hqXaHAuRC6f
         FdNhTAfHQToRYyaycA3e9yG3yzwPhx4jMYPr0idLqYPgCciES6bD2jlO38yOIUzttFa7
         4hsXk8t21MWBaf+AkojN4LfywHw3FIGedw9ZjAXz7EDLP8NZ1PePJ0dHjIRjFCJMXQfA
         hIxOOW2V2ZdJf0Z13Aw7S+9isEbBwa2hFUZOZNmw7ziEN/atduiAr4JjIGzwXiLU4TmB
         LNRw==
X-Gm-Message-State: APuU4Z+EaR6GH4aRF5JMrk1/l7OqQvxsmF4yPyC9y2jjX4Iw7HDWuwQg
	UawWinil6W+yJetZzLNh3P+P/v1h+4pyX5KVuT7dWOk0e69jiUvqxc7D+Stu1fk2
X-Gm-Gg: AZFdTZe9qUsOO3jG87Ko82gqovOrh9hOWoqoNssSaQyekj+OsW6PJYjymhCWb4WkGRX
	gC/8U1I+UkDHAUNV4zg0/Zr1eVBw7SEhPih8hyPj37Pqss+ZT5fVeoOMhp6qktIAoISASNmEjW3
	6c8lJ/sGAYJmQyMKLE64Ueb3WK+ytZ5KdlUmrxxoDpmdVDGG538Zb0mtY+Ob9WUY2vvgsOZylDb
	iNjxSoMx8qYXs9qyx30dJlUR1VhIKcqRGa3vosRSpBt/SmfXGg1TBfqOFRyLNEDvKTov3Yuy/Jy
	B+HfZlruhPyldeTgYbW1IjjeQCd+jY04oWZq2SPSahgYmQRDH4uzJm318varC0lESHMtYieyioV
	fwvFo6OjNuoMjWSK/9zK5COxZZgTPETSf8cZ4QLNc+j3pwkNhYbqYrHiVUGLp3SSqYlueAJT9Mo
	CCeDPmCsfYXbyKuF1OXI96+MRaNFih9ODehNDWZNe9AXgqhzxO6AfCNTTZ637/X89wJML4dOdET
	sKC3NbmcnSqw1ps4+1hj288fZc6q54405LFkqRjEW7gI8iL0aT22oFNJA353Mrx3ZV9vJkhkUXz
	MNze8/qUcqWyzZ3lsbrgE1h21dtgIcA9N41a9/irHAmub8zhLx0XYP8t4JbDCks39/Af3P2RCCs
	FErvBOiomC56FAypApLujkV4+l3NGbh1zlY1RluhNO925R+U20GdTwH64Y05LXrqzCct0lOutUk
	Q9pGssnHJ5bH99wbjTixAvT0NtcUd9tCanZIIhhgXdMsESqq7MCCg1znF4um7NACkc+qo/5Yjnj
	Q9alOwmiLrEfkjqVk3sR/m6uw/O7C3PJwzcRlqSqS4qhpPnJbi0YUOTpRcgbYgLW4l1P+YCnot6
	w7Sk
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr25681940c88.40.1795753042721;
        Thu, 26 Nov 2026 20:17:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 04/35] mbedtls: Restrict upstream check to the 3.6 series
Date: Thu, 26 Nov 2026 20:16:44 -0800
Message-ID: <20261127041715.1776485-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133256
Content-Type: text/plain; charset="utf-8"

The check reported 4.3.0, a new major series with API changes, while the
recipe follows the mbedtls-3.6 LTS branch. Only match v3.6.x tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
index 058710cbda..e8edfa45e7 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
@@ -29,7 +29,8 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
 
 SRCREV = "068ff080b369adfac81509f9b57b2afabaf82dc5"
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+# Track the 3.6 LTS branch; 4.x is a new major series with API changes
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>3\.6(\.\d+)+)$"
 
 inherit cmake update-alternatives ptest
 
