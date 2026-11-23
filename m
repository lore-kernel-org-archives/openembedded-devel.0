Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48514.1795411834187154466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pKXkbXF5;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so7012053eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411834; x=1796016634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRzFRhSK4RxaU6sy/fwteFUrAlSnp7QWxX0BB5QShCg=;
        b=pKXkbXF58e/psL9NYA0BHc8GpSdR3s2BDTVW4tq0//ZQSjwfy62PD+bPinx2Gyj+5W
         1Nyz1LjQ/ZUEb0bDH7XnJZ/2OEjatHKonDm6LD5vuYlt6qaLGpip2PVjJkj/o5OlIT6j
         nk0JJFZOreZs5n3sVMV+hyoVD7zVzJDzGFd56xjrK8e9B6XHSPXybBda0fZ80ibK7wIf
         zDyCQA9dtwcP7ZJFKGEY5OTStTr1x0r0bOOiauOkrJU3/7Ks8uu13WJB86Bj7zj8QGjX
         +DcVOt+o1U29GpPVIjYZ2odz3krBKGx0N1lYXjQGYAp4nms/H26IFBG/a7yJ3eTOOas1
         9ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411834; x=1796016634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRzFRhSK4RxaU6sy/fwteFUrAlSnp7QWxX0BB5QShCg=;
        b=JIECWePTCUhrTovh0GLqqVFl+Zd81sjY/Dm08WfIvwLqBR6wsa8Ud49gQGGzDp/rOY
         uHCkTvYL2OTp6bCHlkK9XgpfO5VROo2NS0FXcNVs5Bu1iAhrq8iTesoVf//T1XgwLvuf
         gCsikw1h7EhtacTNM+DLA9X+Rc2g64vOIjFAzWkVQ1ENsgmSjEuhdHijxl9pAnNZglfU
         pUSkLZtsqcnaS1EHABT7omQFLorGRcjD4Zq8SyHRTORChrCenAQlbcaD88yGso17jVKD
         tXpDzvgsCdNRVpa7WE98W/YN8m99EA9BIBfkMN3HoVycCUt7Gz0azQBtybeCHmmV+BSK
         5c5g==
X-Gm-Message-State: APuU4Z9N1TXRr+1zVavRd5Ukd3RIWSbJD08cZYf54jWUjIVl+kfF5q7B
	6zvgAebFwJuqQZIc90Z2ILiIzoZBntBoXeBPDZ9Bg8mMdaAt0mQBUUX+YT/BJxNbCOI=
X-Gm-Gg: AZFdTZc5h5HE1MIxWFgdS0/KJLoRW+TKeVP/fPcNB1U7i2rdjP9PYjh9FuEKeVJTZ9X
	5KBLWPvScyF1MOOgAj3iiqMcnTUWmxB7mGLvyri5NJqqZpgOb/qTuPVTuZcej/ROvCT51SkRt8+
	SanoMkRAcNgt2gRnBRUNtSbE2FNQ9xq9IHYHxnMndi0Y01jtMNZ5lyYKaf1otGf5tGRmFWB9VbN
	6L4JN11NDW8nBL05Z5sVdmI/uPGZQagHEr1Nw8/fT9CXkVbTYDURw88dYRC/uJ1a1HsrxV9lxmT
	kg1ZqgION+0TPAIq6GiJB+jEEJhrJY5XGVxgAHb49iuf6kWLYrV7Rmw5Z1khflouWw9GwEL6vIN
	SnsOlU1NeYRIhrHBIibvNpignxQ0BRCXntQm7o13W2qDJ2UVbZ/flgWI6PFl45eYavQ8DZyZgh+
	yiTAb7H3W1v+DOrZVb60fMHsXZSosx97chMWi5naL0L+8txmcid+M7pQXDhAUQiVeP06UEmy/m3
	8VnX6exccOFuYvan0TilcwYDtIUC5Bbk++YCXWQIG2UZeFgTJP3qkkU234f4p5ck7eR9sVmbThL
	Ecj9kLl6USVIehF57W1ZOS+ZQOL0mESgYldIs4ZBBWnGVIeGz2Fos2yGna3nJQglAFxKqY8vXGw
	PTm2GlNfqzUhpu8wbwxuBlnzGiDv3QhPSLMUuKGQOCzVTNJN4+KO+Dizx/dozi3As0skwBTfKwp
	/dQemGFwv27X51ZGPKTIk+KP5PHs2JV4QRRtygs1VHGXaLlj/kT3066S3FqYSvIvFhXsKwgSjsS
	agrvqWcmYUIrdrzgzqdADv8uSu08nOyD92yc0pElJxIk8FZMXzdG/eheQcgue/TAGs06m+8+pPC
	8fcn
X-Received: by 2002:a05:7300:c00f:10b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3856c9a6858mr12567251eec.1.1795411833475;
        Sun, 22 Nov 2026 21:30:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/42] ace: upgrade 8.0.6 -> 8.0.8
Date: Sun, 22 Nov 2026 21:28:46 -0800
Message-ID: <20261123052953.3658549-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132817
Content-Type: text/plain; charset="utf-8"

ACE 8.0.7 fixes ACE SSL build errors with the Embarcadero bcc64x
compiler, has minor ACE SSL fixes and drops support for OpenSSL 1.0.x.
ACE 8.0.8 lists no user-visible changes.

Derive the release tag in SRC_URI from PV; it still pointed at the
8.0.6 tag.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/ace/{ace_8.0.6.bb => ace_8.0.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_8.0.6.bb => ace_8.0.8.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
rename to meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
index 8250363efc..6808dcfe43 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.8.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_6/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${@d.getVar("PV").replace(".", "_")}/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-SRC_URI[sha256sum] = "4c5cb09ba91cf91ee86d1ed83cde9a1d3e4aca1da44dd372495137e2c955eff0"
+SRC_URI[sha256sum] = "d56f06d99508139e7a537122fdf52fb0c4d17805510094527643e1007857c421"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
