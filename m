Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.7669.1595674651640887329
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=JyBfaO7/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id b11so6523189lfe.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kz6+b6cLs/Y4NJJYq22W9bP/86SqjFi9/XGNJq8LgBc=;
        b=JyBfaO7/XH6BCOwUSb4gi88KXYOeVaszt+gvDcxaOZaUNWzimr6Cb8e2tqcRxvpXvw
         KbrsM+9Dhg5xu/Shd41tKMIt1C93Ik7PZTxxFjvgF0XGo7A0db0eiLWV35xl88cypifu
         LmLNQlBSJrj9aNNWfcvcFo7uFuY6D+p+tkav8bYRunxKZIrWUvq7aPDeWR3wKnydgvUX
         llBY92lgEzB1UDbqBw0mN6ZyBrAWCP1zj7BttjYV4dXpiKv2umoEnP57qR8M4K5AQMHp
         cjyLLcZhYzw7of/Ru+B0yWEVhpVdFx3Y3xCFejLz29ZRd2Hg0hg/nxo4ZhQF3Ezloy0F
         /WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kz6+b6cLs/Y4NJJYq22W9bP/86SqjFi9/XGNJq8LgBc=;
        b=rmATwm2K5Sjr80ax2qBkVwao5lDj/kuVDUfktnpKWUEVw8mys6yDQ1AYcrWNf8gW1y
         m/aIbAndxw3yZvXQqvIUXpnRpdDMsiY5ni3EgR7FuXM0v901DU8hj86uoLZt+kygCgCJ
         +WkZ51x/yKOCvp+I/qWWwjkyEk8NvSpra/CQw/xxk/s4A3CsxfEcJN7FUmP2mqVZtQh4
         4qmnaRTx5ueuCn8Q60K0yJ/7YHVT/IJS/GxfTR8AKDe5pGLFX0ROW6zld9kSMnreXVSS
         Yg/jZ7DeRsVqNE2vQBbqVPC+ic2HwZRjCgSgo2GkLfKYIR7SvjKh43gtqfgpJvrIwEyp
         6Pig==
X-Gm-Message-State: AOAM53232gCoLNoOyjR9JK26u4WqX0IusAUdDGUJEoqP7appNILTNb83
	KNxph1C+8Q5uSzJdkKiVIdE4IYp2AUs=
X-Google-Smtp-Source: ABdhPJy3IFk3yXuObSdu0cRMpDYJjOc2RP4n2wHLi5BU0IhnY/wbL/T/ynyroqwvCfMp4OALgQpX4g==
X-Received: by 2002:ac2:494c:: with SMTP id o12mr6378512lfi.181.1595674649380;
        Sat, 25 Jul 2020 03:57:29 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 186sm1191146lfn.66.2020.07.25.03.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:57:28 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][meta-oe 1/4] python3-mock: Upgrade 4.0.1 -> 4.0.2
Date: Sat, 25 Jul 2020 12:57:23 +0200
Message-Id: <20200725105726.2142880-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade 4.0.2:

- Issue #39915: Ensure unittest.mock.AsyncMock.await_args_list has
  call objects in the order of awaited arguments instead of using
  unittest.mock.Mock.call_args which has the last value of the
  call. Patch by Karthikeyan Singaravelan.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.1.bb => python3-mock_4.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
index eebfcdade2..39ab6d01f5 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
@@ -13,5 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
-SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
+SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
+SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
-- 
2.25.1

