Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.3511.1618693583544091537
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S++CVdXl;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id m18so13526456plc.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sVYy2vS8q7Fv4ONYnotQt9GBPHXQUhZT2/p1YaJTxAI=;
        b=S++CVdXlNFULrOBpY68H/tdr8343OTT2EJt2ZKgk962lcrPFQlus/4iieK4AC9BUQ2
         SECW1O2VagT3A3PrSKUamiiNcB4b1dAgyjdlAYwi8r2orLemL+qBjHoMmqt2M/dHeDbf
         s5IRUU++sEUw2ftvIra3S4Qa6oBuz3eZtMx0KSbqKhatmEE4esTllpKKnza7eepTfv6o
         SWgxIpyEMeIE8fL1RR5hUbtQnSWlYlPyriGzeEzoNWhbX1XMWtOBAzUGHIuYOyfhaHTL
         +9BjxafwBI2lEz9mPz0BuYTlzviY+5xFOQnkq6aU4wDQWcBQVpe8jM15uAIhmxCnCAtt
         tQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sVYy2vS8q7Fv4ONYnotQt9GBPHXQUhZT2/p1YaJTxAI=;
        b=F0PaApmm8lTC7HWCaPFDJcP4kel2rIxtIutjZWwGIfaecsUeMIYAWW5whDdC8/P7jw
         gjkWkkV8xaSo5OGt7HVuerYWppJStjUf5WD6hoyxOC0FxNTG3mdTxgsz0IF1R+8pS0uE
         hSHaKYWhmkcVQV6r0K3W7rvz6RV8icVRqAX1F4M3I3tpgCuWsXFxrTR/58uo85zRLX2O
         Ew0EFXWbO/Un+050PamRJwkogfUArxo/nDvnZezNc7qrYLHmC3Qv22E+mAt/TqXxXQUs
         aWhKUItHPONO+NkhcrRFRxYmSbnSgJret5g6S26BjVgA1U60zi4J+FR6E1Xz27XiVQGH
         Eo4w==
X-Gm-Message-State: AOAM530F/nAMJc46jB/TpKI3Vr+Sk+I6hYxpB6zKbh/pgEmagbFqSnwB
	nuK3H8H+1cXo+kT0jwpBnkBR49INlD4bCw==
X-Google-Smtp-Source: ABdhPJz1xZ503IrjSzzqj9Ljv1YJ3K9CRkk/Hsv9bK02nm6avtoN3BINI0ilGK7m+g3MJVu2WhKh/w==
X-Received: by 2002:a17:90a:8a0e:: with SMTP id w14mr16077037pjn.221.1618693582989;
        Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 19/50] python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
Date: Sat, 17 Apr 2021 14:05:28 -0700
Message-Id: <d06828fdd8607e4d18e55231e69f90c4585394b3.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.3:

- Fix compilation on python 3.10
- Add Python 3.10 classifier

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 8dce3fc5460a2dcddf7aa55911b045a4922b45db)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-typed-ast_1.4.2.bb => python3-typed-ast_1.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.2.bb => python3-typed-ast_1.4.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
index 09f387ca63e..c482251b8f1 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a"
+SRC_URI[sha256sum] = "fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

