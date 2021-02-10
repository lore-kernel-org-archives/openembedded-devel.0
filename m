Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.12369.1612990555091679924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bkuu024Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id u14so3130272wmq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ur8IKy3LWUNp0JamhxKidQ+bT1y5TnuY8K8bhidC0+0=;
        b=Bkuu024ZzlH/B8zdxOV3LM7DF1RK8PhkUzEqC08gOiNehdkiG5Uj2VoWn6I5Z0qW9h
         wYwAHwWXbG1SmbQw6bYk5n2PVbQYIqL1hzL4sO4za7p0qLA+xa8SVcWPBy3bEuUsEGIm
         2icy4pWJihlU498Qa7+jUMCOuGxJGqf3k76NAZ0fqzCBNgPrlWzJhIHUvR9ahY7Mft4h
         qtQJEskse1NVPgkDaOs093z0Oo6n7ZUW6yTpEAX3OkZlFUMW9ZBSmCLddrjBp4CbEBQP
         espvknjinELBHtmX35MEVeNrQOCnkhRYP3j6nD5ZlGS76fT7AO+UjczZe8zJ5ytCavlW
         qpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ur8IKy3LWUNp0JamhxKidQ+bT1y5TnuY8K8bhidC0+0=;
        b=Pje+u4+vVppsWXGuyhisSCvDGOdtggApfhr6gki4utdJoHBYsfU23HBBdUTIvi4jKY
         uys9h4UYLWzAXIIv/b70SZ2KlymyOGmmuZICZH5UolRU96Q4dbAUyjaz/C9kciGZaE72
         yLtu5D8SNrBw5JgoIql1tDygF+Vbx6FfI7XqOHzuYMZECIYus3Oq/wzoLBrIx/r/68AT
         RTTjZi50TRSDAin+Q5nTFplwqbLf+dOS5W6XtbYZ/dcN622N2Sq9y/6TigRNdtPcZSrk
         xuDv2TLlZNMsnfEzH60jVXK7buNsMTafFIg3zRgtCBJ9IQlS80PeMBBEdv6M1+o2TeJ7
         Zdqg==
X-Gm-Message-State: AOAM531U7/ZkRdxw5Huvwzb+tU9JaIL7kCR7WovZOr0opS0UNjbz6LtG
	PLdf7v3MjW1z27lY71E6FhYeBLyPatM=
X-Google-Smtp-Source: ABdhPJw87dwjB9ZMxUeQbX+vm7y93joQdg4ZfEEAnn/qhzQH7+jTa8ZNbkjt58KzsLbYY/6Ts8wFWA==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr877676wmj.1.1612990553755;
        Wed, 10 Feb 2021 12:55:53 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:53 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/13] xfce4-cpugraph-plugin: upgrade 1.2.0 -> 1.2.1
Date: Wed, 10 Feb 2021 21:55:29 +0100
Message-Id: <20210210205538.690009-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.1
=======================
- Repaint CPU load history after the user changes the update interval
- Properly initialize current usage bars
- Scale CPU load history chart according to the current update interval
- Store history in a circular buffer
- Add timestamps to CPU load history
- Update copyright year
- Update configuration files
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-cpugraph-plugin_1.2.0.bb => xfce4-cpugraph-plugin_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.0.bb => xfce4-cpugraph-plugin_1.2.1.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb
index 55941d74b..ebcdc2166 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.1.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "7866dddbbe0557a9bfe603934e9ce82df968fe36e21533d05ee71704e6602da7"
+SRC_URI[sha256sum] = "615adf9abd91417a44319d8e4dadc6012fa22a3778f2f379717512dcb7ef924a"
-- 
2.26.2

