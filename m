Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.15921.1621809245284279216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQzt/eSv;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id i7so20926308ejc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FK9MWZYCQCxEJqisnN9lAwyPd7hwlFDN6hX8ygmFZwM=;
        b=HQzt/eSvNDvzhdWN0LsXMleXgtyGYJ/IKCKcp8san/RdJ8p3g/6YkUeAy7aUMUqGs9
         YN/Dgfa53Ve4td0CiHqxUkPOntd4obB+ZqcyDH2YO3Z/KCbjd1rpiOq67TFe6vNdG+BC
         +IVYi4ju/8ZqSXnI1ZnN2Fq2gtZ6Z5GY3oYmOKRph3+SNCjhsuMkJa0Ah3H4dDQ92k2I
         Fe0+uMZk722O0IL6oQOcU3/ODu+5GyN9MLi3Pv7iuHBLI/15X7BejadbZGmRQMiakilX
         hP3gifENUdodfBeeoXvR8RG1wGcpNl7eAud46KJt956dDmO/iCHpVydHeq5VnugM17+l
         qoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FK9MWZYCQCxEJqisnN9lAwyPd7hwlFDN6hX8ygmFZwM=;
        b=I5W6xdjwxF1EJC72XGkht1TB5OGP9iOTYrmx3OgXXErrn/AU8+5Y/fKgViVB1olHiX
         N0Aj2Dkrp4dXTt9K1ZmtFk5J+pg4Erk9hh5D9cwySk+jxj4A474VTqdYo8WK/sdCj0tU
         NXpc3eHw5sXs2SXSBerXnjPJ97i4sURLBZ7dng6QK8UFxE6VqsAPrOGA1m+CQntLNdvG
         PhYp6RdaV/4wn1+URjxCs3QOBK02cBmiJLurwiQDoKZ8MppmNI0j4vNh1UJka4u3pS5t
         bBvSl09p2SdR9CwxZoVH+jzHyVGKo0sSgfJ3WuUmwl4vb53CUO16sYSOfafM0aFfo1NX
         ha4A==
X-Gm-Message-State: AOAM533hzMtBmuhI7ZZ2IdsbzGv6vUgL9GSOSrEiG2MDUkiK4IpZR3fW
	XuZ1/FUfpZMmiGZ4HdWgczbrKjjP7GE=
X-Google-Smtp-Source: ABdhPJx2MOBOa+bzeNgrg18zKeND9E4XUXOxXgQkjuQI2qEXA6VuN1fEEieqCZK55XIhWyVJddb6rg==
X-Received: by 2002:a17:906:4e09:: with SMTP id z9mr20943668eju.156.1621809243935;
        Sun, 23 May 2021 15:34:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:03 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/7] dialog: upgrade 1.3-20210319 -> 1.3-20210509
Date: Mon, 24 May 2021 00:33:49 +0200
Message-Id: <20210523223353.2576671-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{dialog_1.3-20210319.bb => dialog_1.3-20210509.bb}      | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20210319.bb => dialog_1.3-20210509.bb} (82%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
similarity index 82%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
index 5f165617c..2bfa575d7 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210319.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
@@ -8,10 +8,8 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
-          "
-SRC_URI[md5sum] = "45a28836769d52c00c800fa3226c530d"
-SRC_URI[sha256sum] = "42c6c2b35dd6d1c6cf231238e3bd6d3b7af53fc279a1af547ab9890044d46652"
+SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz"
+SRC_URI[sha256sum] = "ae478fe7d5fca82bcf4b51684641e07d2ee68489d319710fe1e81f41a197bd66"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.31.1

