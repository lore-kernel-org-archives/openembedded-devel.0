Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B11F433F3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7038.1776318667295493118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=suG88b5q;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c1a170a50so8089301c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318666; x=1776923466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgDY2Efdtz0QNAkYhsWvP6O5TDXQyc6makIWTynMkQ8=;
        b=suG88b5qPKL2TZDUzx6/3tRvYzjUmDFTF4AT2ZzZOMNR7NOtJiPZ+qvQcPWI/0TwJT
         YV+UflR+OrPb6FhYPPVq9MrznFerGh6SAirxCqNH6ool3EWGNujcZU8UpjX/Bdj8tEbI
         t5tdSpSP+Ozu9QKHh0vF9+bgGhagW48AV1VWqiiUOK3f4mS/MkIOdqPxzg8iRtkvIr/S
         XvFXNxxB6yLRdQRHszNtQyNfBxF7PEKlcEcd3FzLwLs6AMAENbR27cEIXJc/KRqUOTCK
         JjzmeP+W1cRNuaQf1p+xluj3hwy4ZVfX+DBnPhMKk9ISJOSzTivJYXCh4+8S5XpxkNZ1
         n4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318666; x=1776923466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pgDY2Efdtz0QNAkYhsWvP6O5TDXQyc6makIWTynMkQ8=;
        b=p66idwXUMqjmW7vF5cV0/yWk4lgI3rw+uQepV3rx5cPXhqbUKZGtzS2KRMp9YDECjb
         TPmoHxsaQG8j8MgU+dXz6rvWpzZ5l7xlsWntz+xOqjHmcQRRmRaCA+cEEOQcwTUrX6VX
         WYrYu8G4aEG98HDJ2WJEgCElVJdRTNHQX+eGcM9OIdPv02rB4HJzxs5c955CiKW4cYlL
         Ddixjhhe0xdCZ44xcGYnYEfNHJIVmL0Rd21R7YaV95z2fM97g5oyHSAYwIEdYVR2Skjl
         tbLxhZLRNmDldKPCcNLL5XDUS2pOeM/717qInjCu1GC5uClaE+JnhqDAdIwYJZWAlmOm
         esRw==
X-Gm-Message-State: AOJu0Yx612AUbltU9i5zJfFWZFUmcoIaxlamrhsJB1a90fqiHKvvJWtB
	qyZ/XQkbyI6H/lxeyANFA5Bzi18XHd7bfweY2ynUUfQs2Qdum6CltNYwEGta7pU6
X-Gm-Gg: AeBDietigNuP1Duzgk+eBni2zClpVMwPwjFLhyqp+83gcBuVFhe1LKHyGUk6GGiXiWi
	TaQnYa2usHLChVm0VQNKN4DgsLuN/FcLmwXi+2mIkAFghrC5K/bNGq0TbjWDWgSEeT0JKU3MyFo
	bH6W0jrlsf3b3icjUpWuFSozzF7WUHKij7xP7l1W/6J2mKcbBl8oUph0BfObU4D23fGB/9akzN+
	+vSQUySkamV1+fMQyA+6pHzK8rxAshH7OpA9/aJRbuwJLqTmLQNz3oy88CfY5dkfs5YDHQlI9ab
	eurJ9OizfPNWA1StC2s2swPOkZMwxIaDQ580EJOiZLDAMw7XI1NX9mWRDavCgwlQUOA+2jaJzZe
	hjdFcVrtFjlS8Fjw3OjuWdrNHsDBi0BHWxXYHYL3HyefTbNaG4ndd479UgshsJWycjXammzG18d
	Z3/gZyFhRH85ehRWA6IDzXlpAoOnm0RN2+9YEjsVTLkeHC1GxpeYa08zKBKq+0aptB86zsa5nRA
	Jwvg29xX/Bssr8VO458mG7/3NXIP/X6m3yRnCaTvib3sjcwuqgwNRaC2CiICm0VI3RGFmMDKovD
	HfgfFFirQVNLkOqePDM8RmON3dLm05lFmisrce34y5zmplK2N2c=
X-Received: by 2002:a05:7022:f92:b0:123:2ee9:d1b3 with SMTP id a92af1059eb24-12c34e68e44mr13047473c88.2.1776318666384;
        Wed, 15 Apr 2026 22:51:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/18] magic-enum: Upgrade to latest
Date: Wed, 15 Apr 2026 22:50:45 -0700
Message-ID: <20260416055058.792189-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126384

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
index 6d5399c8d0..15dd2846f4 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.7.bb
@@ -16,7 +16,8 @@ SRC_URI = " \
     file://run-ptest \
 "

-SRCREV = "e046b69a3736d314fad813e159b1c192eaef92cd"
+SRCREV = "715b442682f3cac6e04636d8beaf4104c20bac23"
+PV .= "+git"

 inherit cmake ptest


