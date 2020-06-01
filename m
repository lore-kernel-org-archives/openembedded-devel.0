Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.48697.1591047957096171425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gm/vNU0I;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id p5so1294784wrw.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qUe2qGjZGup07sLxIaONMdk0yzLF9aSUIx/H2+TDMGg=;
        b=gm/vNU0I/KJ63IQnkXm3xazsgNaMKOf6x2DpsqQl6GesDlsMs5hgJXei63ZPfvc3cN
         9kRy0Gz1dW8UxhDpdbsBhZl6MIjRk3QMJegyDmRJpKvqIZ9jB4YPZ6NQlnCcwcwxv07z
         o0FaOwC+ArFf2QVdbg7OILm5DlvJgC3HCUieKsdWFlILtpO6w9TbLfUrex36QjeVn0z3
         KapsfqIdNUF5gTx5pFxqTbFUB+0OGL5kXyI0E5uOalsA+Wd0YnzMo8PJ3zRYVBs/dSmm
         s6KF7JISPT7saXDIyyvAmceDGKj9tufN4DzBik8q+fQlkPUhsjdDDDKO+zevvHBOVD4L
         qT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qUe2qGjZGup07sLxIaONMdk0yzLF9aSUIx/H2+TDMGg=;
        b=RVothSb3QfrHowlejGn3zNUfvnaBAAzspgQHTz7EN2txMdjEQC4L3TZbgPu/FphwKY
         B5deJgzAgsyL5oDGl0oh67tRs8YzYHXfFJmVETszWQMWJc8rarNX//7oGsoI8njdbhYo
         3lta7scwXAE45rQXmn9JKP7j0RVuGbDHCpw+9FpKS7KtQFaERjaaSo15GjMDG3VFt0ee
         5FZLmZePU2Jsn+QKvD4Qjrp8acp4cMpBQ8uj4wa+83cvHWjS+ENuB3aqo6Zu5tb7Scpg
         x1Pxp2/2qiLGoW9FzNKFm+h/MGmxgqlYBeeSkTK17WV3Kppt8w1fYkRgnFUXA8X9ivMo
         Hvug==
X-Gm-Message-State: AOAM5333bpILS/NfuDng393I59NldTmL8UNOH4+HADgA23XQEDzys7Eu
	C6L/O19k/JhHhH9448UPVIx5D2hptso=
X-Google-Smtp-Source: ABdhPJz119Z01ib7F3PaJB5h0Ncyd5HDI4jBcHMzUrrEQNFpPvY54/DEr8Gl7DK2CLooFyO/vrIWgA==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr22323805wrj.333.1591047955502;
        Mon, 01 Jun 2020 14:45:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 28/38] gnome-terminal: upgrade 3.34.2 -> 3.36.2
Date: Mon,  1 Jun 2020 23:45:06 +0200
Message-Id: <20200601214516.26624-29-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no news-files for this project and changes would be to verbose here
=> no revision history for gnome-terminal

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-terminal_3.34.2.bb => gnome-terminal_3.36.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.34.2.bb => gnome-terminal_3.36.2.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb
index ba9a79d89..ce54faab2 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.36.2.bb
@@ -19,8 +19,8 @@ DEPENDS = " \
     libpcre2 \
 "
 
-SRC_URI[archive.md5sum] = "13fa9f5f459481c7f05b6964c470ef16"
-SRC_URI[archive.sha256sum] = "3bd723f4058ec014da4715db4181b7d73eccc797b85ad5e6236996951c01803d"
+SRC_URI[archive.md5sum] = "08150cbf2e23dd4f60f959a6eca8ef0c"
+SRC_URI[archive.sha256sum] = "41d1b6a3dc97c066e294acdb7f36931e81668638dcc92ffa25bca3ddebacdf46"
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 
 EXTRA_OECONF += " \
-- 
2.21.3

