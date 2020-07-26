Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.24763.1595746853828785663
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 00:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Kg09gkm6;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3jcodxwmkaosjnxtbbtyr.pbz@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id e196so12303569ybh.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7WNTnVAn44a+cGxtJXcDeeMhJYy/oxkMw+LiQluWLak=;
        b=Kg09gkm6hHTQPOdLaXuWpe1Sd/xfOoatknEwMqmqXQrY4qS0SsHuLCnlU9Iru66b81
         Xrnv8JY8PynN79pKbF2kpbMBf381ZdReoJXEU8z7Odo3EITSZP+Ya6JrbIJP1ioe5coa
         JasvNaAOQrndo4i9jZ35AtZKaPoDemg33pGFAD/xoI1h0FxpEkpm+/5e+3B6sQj1urDH
         uSnMIJ/xfhObfuPT246meNV0phBua/FZMNjR9m+u0e61BGkSVTL/6ZLNQCjvaKTni0EQ
         mw8+RNGXVdj1yNdb2g1LGSY8mjpW8bR6Cj1J4iNJl/DK8Ibaz8hWO5/yRa784m95PvD3
         s65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7WNTnVAn44a+cGxtJXcDeeMhJYy/oxkMw+LiQluWLak=;
        b=f4Q60XxIHv7F7SVBGZaRqJqvudrbfyIQYJ7fV5ao5PG/8xPLW4binGm4fH3wnJkppt
         nfB10mkzM7T9TT3+jkONCcgvgBY9yJm1BcJG9r2rngqAG2yadcKRa/ogJke+/Rp27HXV
         wlcWQm2BTtJpgsGE+WZpmo4/ipFiUmDLfTi87GQsV/INhBHNRV4jwBHyim804KJSt9hA
         JivLkVyqbS/1b34TF66XDm2xwnknkvJkfQMabBEjPAgBAR9+DVlsbGP4ZpdALe/qmWLP
         vLTEA2z5+iDlrKoG2cTDdYcc3U5T/TxljQ9tgHP3n5Tj62bvmogYhVaa3XBxd1aH+div
         9T+w==
X-Gm-Message-State: AOAM532q5DYlHJkk9kkw66RO6SkF35nrujb6T9ohcxKcIC90QbES4fg4
	iXx+vPXpXfHkdGyJWvoehYPJzSRqVu3TFcj7Jjpb+VRFV389/e1dr+0kKhVTEoZUnCtZ/RIkS1q
	IMAFcLR1yyougQvcHYP0r/w2OkKAgiKLAdEeaBlhpfzPQ9uo0aIAWzgppLUmcrj9kRK8W+kTSJi
	4HUsg=
X-Google-Smtp-Source: ABdhPJw9p330ivig/K71Vf7uSgMdnniAfB4aFE9FQyQrVaP9ssRitK1kfU5wSxw0yETuT5GeiWEJleI=
X-Received: by 2002:a25:1905:: with SMTP id 5mr7624064ybz.229.1595746852887;
 Sun, 26 Jul 2020 00:00:52 -0700 (PDT)
Date: Sun, 26 Jul 2020 00:00:46 -0700
Message-Id: <20200726070046.590216-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [meta-oe][PATCH] cli11: 1.9.0 -> 1.9.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

---
 .../recipes-support/cli11/{cli11_1.9.0.bb => cli11_1.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.9.0.bb => cli11_1.9.1.bb} (91%)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.0.bb b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
similarity index 91%
rename from meta-oe/recipes-support/cli11/cli11_1.9.0.bb
rename to meta-oe/recipes-support/cli11/cli11_1.9.1.bb
index 151653b22..c7071e161 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich f
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
-SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
+SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
-- 
2.28.0.rc0.142.g3c755180ce-goog

