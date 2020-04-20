Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.4528.1587397050792578358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 08:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bh4R98tY;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id a23so4089033plm.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUP/JV4fQ705t9UZr1Rx1rx6b291SCqzjjgqnPHRWS4=;
        b=bh4R98tYzD/4FYvnjO4f5Iu5qYc6TKnA1Y2e+KtkzuPq9RUHsWrJyUBju7OkYyUeQs
         m/BXmXS/6ojmDaXVJQs9U6FTafWQ16nsgVBNKnH/ZEAXxf0oPYInZiY+Z3YcqGa9JRjQ
         ZnB3gBCQZIAnzlIJfwYxEiurFUJ89dolK5E5x4CmzKz+hUHt0JIkXSsCsfMhYbtqEzJi
         XxpgzQfddEsJ5sw6/pq2FEJ/KJKlOqeJ8Jh8HMBYS7qG+qkDsE9XT0w5roG8LlyYRbMu
         elj5fxkfOvfb+T0E2iOt3+WoDCkPJ9Np5DwM0+QlJuWFGUg/XsmWeL/mxP6ygxe0dVE7
         c1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUP/JV4fQ705t9UZr1Rx1rx6b291SCqzjjgqnPHRWS4=;
        b=sktHBT6+ARMdNyBJEpuATN9NLk9nLnC8x1juCSQZGgg6+6jnBN/HImo36gwP6nFM56
         6nsFkuFi6bPLeDUsc9HL+dJJ6tCyNvBM1kI/TISVoDldmK/eQXT6Rm/18EjWofDgiZZ6
         JNDnombRaueNg1cZxT3XV9E8p/mzaVSwovXChqRZzdGPXS2xtXFLwoo/BGzT7FXubTw1
         9hwN6pjzWw4nfQuYI1S96G3WLXf567EV+hQ6sgrSTUL8ztELaDz4n33GiWZ3yBcyYO8C
         +t5CA8DOTd0r53jkFkR3H7FB1IKSvIcy2JNx8+LG5H2tHMKIitGmgXX6siiyt2+JE8/Q
         U+Cg==
X-Gm-Message-State: AGi0Pua8p4LQZmz/Mi0Ho6Oy31nAC6ISFCFOonHoujEoDo+DpmLJTWOl
	/E3O395C6DsqfAOCZvfxNcNEzK38Esg=
X-Google-Smtp-Source: APiQypKRXAuha4C/tPp1WRSwhOrOkXN4+j4bNzm5ZfI0LQpGv+idYfG5sxHHfEeyzhS9vfWuLwqGHQ==
X-Received: by 2002:a17:90a:714b:: with SMTP id g11mr21554227pjs.17.1587397049749;
        Mon, 20 Apr 2020 08:37:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6cd1])
        by smtp.gmail.com with ESMTPSA id t188sm1443485pgb.80.2020.04.20.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:37:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] utouch-evemu: Correctly specify PV to match upstream
Date: Mon, 20 Apr 2020 08:37:26 -0700
Message-Id: <20200420153726.1741703-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index 41d1cbfd97..7c5a734394 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://bitmath.org/git/evemu.git;protocol=http \
            "
 SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 
-PV = "1.0.5+git${SRCPV}"
+PV = "1.0.6+git${SRCPV}"
 
 S = "${WORKDIR}/git/"
 
-- 
2.26.1

