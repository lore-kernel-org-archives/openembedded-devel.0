Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.5585.1621325521677205471
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HlPiNEPu;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v12so9132903wrq.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZqIEvDXBKyiv0I4VXgTCSFjjZVIEWnjyREa0V3/z0yE=;
        b=HlPiNEPu8rk75HSdheo5IPr9Ae6Cna2lGmtk00tu4DOn+A7S4dDGroBTOk/4T31x7H
         wR9LibNUTOaxE1Us52hOf7T8z4pkZ3oyLPHzXwIL0jAonTm7B8FqQIlX7bKtVPTVW9oh
         ECEmionznXC+LxcuSK1nElVyn+Wft6lb2ZVTZGvlBoTEaknR6k5mRG1Jn3B8m4VouFDO
         uY7zAfelNxe/rcKLHTDhCP4GIC/QLFnCEB6JFgwIQ4cWJMqDU4w2O/9IWJQqcFI6Px/u
         /rScNuVlokRdOXFjFcJWY17UHnyHm1hJs8myGPJaZxDdfzoiktygBXiHolRsHhE2Xjcj
         zKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqIEvDXBKyiv0I4VXgTCSFjjZVIEWnjyREa0V3/z0yE=;
        b=nV0SUQQAszyenfM1n2admLd5TBaxnlE5UCKfSh5D1/PKfYPBIO6yz7rrF4IJTo5Hah
         VhiA1vz8Aeyquh7cLbRAzB47D+5vvPcm9omZ9+hiiNdPWl4OZ3kOHthJbUiRAfxBZhki
         zwW2vpZtlGN5ycFdaOQLSdMIS7xkLBnFcMzgpzifrEJDCh3RCVrfn6YvwYYo/ArxwgbE
         YrRqmRmI51xa7EenlXQhuKsQzmHAcGGxVTlW23uTQVWGrCjDiewbO/aae0PeGNzYtZCA
         mHJbbl8bWldkkUyaabXxh9Vlb1MifZ76/HGCKJ3J6kqmUZT+c60/30s3370hWsT97vrv
         y9Xw==
X-Gm-Message-State: AOAM532A4JbaIxHugxgaVCrLhmJ32djXMkbAn/WMpDPMOcG8uOumyks4
	lr+suCF3o529thA4d+o42NoUHpdtpz8=
X-Google-Smtp-Source: ABdhPJxMVKN9l9UWuwM/ABvgry4A7yemYAYaBla6neyIAKVYM7Pb5m4+XLoa7tbojeEFWBG6yO2ihg==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr5278187wrq.92.1621325520301;
        Tue, 18 May 2021 01:12:00 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0ec830b81d2d73abc7bc58.dip0.t-ipconnect.de. [2003:f0:7f0e:c830:b81d:2d73:abc7:bc58])
        by smtp.gmail.com with ESMTPSA id v18sm24505319wro.18.2021.05.18.01.11.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:11:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] nano: upgrade 5.6 -> 5.7
Date: Tue, 18 May 2021 10:11:47 +0200
Message-Id: <20210518081147.1291254-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518081147.1291254-1-schnitzeltony@gmail.com>
References: <20210518081147.1291254-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Full changelog is found at [1]

[1] https://www.nano-editor.org/dist/latest/ChangeLog

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/nano/{nano_5.6.bb => nano_5.7.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.6.bb => nano_5.7.bb} (81%)

diff --git a/meta-oe/recipes-support/nano/nano_5.6.bb b/meta-oe/recipes-support/nano/nano_5.7.bb
similarity index 81%
rename from meta-oe/recipes-support/nano/nano_5.6.bb
rename to meta-oe/recipes-support/nano/nano_5.7.bb
index 1ce08dd50..6a293c763 100644
--- a/meta-oe/recipes-support/nano/nano_5.6.bb
+++ b/meta-oe/recipes-support/nano/nano_5.7.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Small and friendly console text editor"
 DESCRIPTION = "GNU nano (Nano's ANOther editor, or \
 Not ANOther editor) is an enhanced clone of the \
 Pico text editor."
@@ -12,7 +13,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fce183e4a7034d07d219c79aa2f579005d1fd49f156db6e50f53543a87637a32"
+SRC_URI[sha256sum] = "d4b181cc2ec11def3711b4649e34f2be7a668e70ab506860514031d069cccafa"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.31.1

