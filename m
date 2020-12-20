Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.25758.1608483244862048269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fAluP6c0;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id p18so4865738pgm.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2+/0vOQTmC8wrEEmK3ADNR4jxW3jRxqo6kC3n7foFk=;
        b=fAluP6c0NP3akgP04+vLSdzsCFP6e/nyQ9gusBCxou8HJwpq+F17nziHPbkvZirg17
         D2x5LVeq3uJ3gJRuHaqSaUqmbK2IGWr4XAOxg5x6xu2tS44gfncs27r71YF+nnBauZ7c
         4kumYhVLuNi04yVHtylcxhjV+6H/olAaFoXED2URXxKFF6tHHpMgFRBBtra0ivBW7A/E
         kT6XQ+JUwFfH3gWkDu8B91lpMmaGxH45MJTnATQJ/ZQvrGQB4zLPM8afdOIgJSvjTUlv
         pXKQfDye+qv8BHbJN2sE+PFJLlTycgBm5N1NvS7PTGEVx23sGBPB/+wDYhpSFYHmsAD3
         +LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l2+/0vOQTmC8wrEEmK3ADNR4jxW3jRxqo6kC3n7foFk=;
        b=FuPFSSXCmWDZKvs3k0rtqbjgDaD+aYYZmPMEyEfUpIqk094E+nXMc7MzzpcUtNAKPL
         ADNdu1wdVnyzBB95b/HWQbnrsGJUPaNuG0XRDUdom66E8ojX9aNajaAGLIUe+GBQ/cjw
         Qr2ujvwhSCZpxFTDRptFp4cxkmhwT6cxHzl+nbAwMrpTEExM20AhFEHEAwDf7sMC8Hjn
         hmARe/5XWiejFSxk8NGFI0hozqWGmwuSkPb1fZdFQmcN7k5Jjpzt4wFPiBaLPOJielTK
         6ugnBzAUzDtMafaOKL+s4hG8JT9IG2tv4tXcBYiCWXTPERBc8K2cXnJrsPJ1jnpRP17x
         S7Nw==
X-Gm-Message-State: AOAM533C2pEtUs0LGtqHcirk5vGCs5QWdYBvxhC31/KUi2TgSS1nfQzP
	J8pUD05/0opeZvYZjKke2ICwQaFgk2G5Dg==
X-Google-Smtp-Source: ABdhPJwOGnwrxJwNCEFD0lybTasmAZKiEJSZuP3+4QbiQ+zwZD+C3jiy5UkX6hNGQofPCTu6berkaQ==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr11925319pgb.226.1608483244071;
        Sun, 20 Dec 2020 08:54:04 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:03 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 0/6] Patch review Dec 20
Date: Sun, 20 Dec 2020 08:53:54 -0800
Message-Id: <cover.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Tuesday

The following changes since commit b9dcf17700014dec679307dc1247882dccd439ca:

  Revert "numactl: Remove the recipe" (2020-11-05 09:00:37 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Gianfranco (1):
  dlt-daemon: add upstream patch to fix CVE-2020-29394

Hongxu Jia (1):
  lvm2.inc: switch branch master to main

Max Kellermann (1):
  php: remove the failing ${D}/${TMPDIR} code

Roland Hieber (1):
  pcsc-lite: provide pcsc-lite-lib-native explicitly for native build

Yi Zhao (1):
  minifi-cpp: depend on nettle and lz4

viatsk (1):
  tcpdump: Patch for CVE-2020-8037

 ...ping-don-t-allocate-a-too-large-buff.patch | 70 +++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |  1 +
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |  9 ---
 .../dlt-daemon/dlt-daemon/275.patch           | 38 ++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 .../pcsc-lite/pcsc-lite_1.9.0.bb              |  1 +
 8 files changed, 113 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch

-- 
2.17.1

