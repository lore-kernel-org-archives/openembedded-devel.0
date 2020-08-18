Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.60342.1597727050710043408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 22:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y+CGjuPF;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 128so9194728pgd.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 22:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpwkbpK8agDjsF5/8h9udduV98kcJ4Cf7sJgmwCaS+4=;
        b=Y+CGjuPFBYnEu6M6e8VQkmvFeWQ/2V9JcHI1VA6HoUWaNdX1JJikCW5N2PR+kMvelQ
         4cmoS/4E1VqJdHnjrQmfNVwFvQcKJpoPmqVhr0sDBJ6a27hEY0iZbqnBDxNZ7tsEyEXa
         D6+CpJyNaWaZMERvjhG4ZVVvZO1XU8omMWmzXpqz+3nkmxif/QWh3YQ8iRNfk0XbLwrO
         rOy4w1nNDMzJqBFpdqLurxCTRKWo1o+A91Q5sFjhqwb6mu/TaKFVCA8w49bPlxC3LeJg
         jE49zED1f7SJnPzeloHpQVVM1GQqFo2Gn+Uqi1vx9JmPREECz5TUwfMFGU9aCpaJHrVf
         bHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpwkbpK8agDjsF5/8h9udduV98kcJ4Cf7sJgmwCaS+4=;
        b=cPGZtaIIjEymUtfzkAiX3dvN6PAFjSTQf85VTW7JscntAfv+TNMbL/TGl/x+wVWc4b
         65O8OA0BbqVkprvRSbqLXUJ5FJPJ9rflqPVAJTywvoxxqZDmVK4WF5mwB8F/6gdkgXZ/
         0lLOJUs2Ctc3WodPwcXG2I8vM6tVLE5VXPiIF0Y9k+4HlKAUB1ApA874Rw6FmMypJbFz
         yileAjol6pchrywcYtijl5jfZ4iliB4NMb2y/kPNvcb9JxKf2s+7RY7jaHok/0liw2jw
         eP+yC0KPh6QBgTHcsNMAL4CgfNx/KlYzL4Qi8OsxynVgTuF+/lV1KPOr4pJWOUxWcBrj
         sxrA==
X-Gm-Message-State: AOAM530MjVTwRoYUbRAbEK5lxD4UzScUb2sdkT45RCEptivup7SBlNDw
	jd48jmH1r4ZE9UGQFYogw3oVmAZjKiajkA==
X-Google-Smtp-Source: ABdhPJypziogVlZ0fKPjI6vAi3KWczd+gi2kq+rAHtWqhA0lSa8NFnf6fjrTwNCW/447E2he6QaaGw==
X-Received: by 2002:a63:754:: with SMTP id 81mr2667095pgh.435.1597727049861;
        Mon, 17 Aug 2020 22:04:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id v11sm19116254pgs.22.2020.08.17.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 22:04:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gerbera: Disable PIE on rv64
Date: Mon, 17 Aug 2020 22:04:06 -0700
Message-Id: <20200818050406.1037311-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It ends up with textrels otherwise
QA Issue: gerbera: ELF binary /usr/bin/gerbera has relocations in .text
[textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
index ff82658173..7f26741832 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
@@ -26,3 +26,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "/root/.config/"
+
+SECURITY_CFLAGS_riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-- 
2.28.0

