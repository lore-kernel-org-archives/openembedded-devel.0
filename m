Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9820F513ED
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 14:24:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9813.1772893443271743129
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 06:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZzEjIIY;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8df7620so1150641f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 06:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772893441; x=1773498241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/7PFax8cWkAUpkqXMEAgJ1sDEIxeS/4YKeljbHlcYY=;
        b=SZzEjIIY2R5prcA02LvIC/swJ4UJyZoeDvDU20vWdRjHg+/Fz2ns63jHWAuz1VYmnm
         LLheBrGuBYZiieN0E+FEbiYM+vX0ik8+GOleZojUjeIOkBHgNlSdA2jlp5mHRywTQS2b
         4AtZdyqXbeQIKyPt0N7ApDGlRILWkIjQIn19RRLWBxS8zprK/n3mn0x8d2zmDmOReeYN
         M6ZFtZpipe1FiMsJlJxion0EBY0643IseecZ7x3IA/hmJUWA9d2X2N05EtFhn19zjj4u
         sCAOR+tavuQyg0RBTR8i7fv9zFG/g35L5gDQlvb6uFkdY2q0zZGGbmSHyVsMGdqO+SUt
         3Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893441; x=1773498241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/7PFax8cWkAUpkqXMEAgJ1sDEIxeS/4YKeljbHlcYY=;
        b=mRvgQfEzNmuJARWtoFvyOuft0l/VQccE/GftFn6QIgMCP+996n5n394i90Z/VYCYmU
         u5WHn+/iGn1W0Ennv7kcxCz7XFlgC6vjat0eJz3TbcniFYGoZTls5PQC72rb/jJ6Rmau
         tm7VJ7+0iJDrtVFjg4ZVX+7MpzaLQwcAk1LIPIgOX+YI1Ml5W0duL75fPQBujD7hn7ST
         KQKwGJ3F4C+xXCtmQ3AVqXn7aQjOus0Ts0Rf95ehy3tM+x+OGXCUlxMUkS7cyPpm28zT
         WC2YYTyhgokJM60vafN4qtBfwjoRiT1ifZzlEdwHiUQzVDmP///9sHqQxwNLFMGO0Ui9
         iR2Q==
X-Gm-Message-State: AOJu0Yy5VxaMiXEHRhg7x8kL80Msc0RXROwYW2F7jt5itXjh9Bk5d5Qt
	xg7qLI3EC90hT7az8F15oDhNR9grJmYvypKM3yr+xHQ5fnQiFetbLhXXi+g6fA==
X-Gm-Gg: ATEYQzw1xdTSDsNArcVsNO4QlJJApP2X1+QCkQhACq8Dv8+c7LlI7U5OkRLnSX7fyyw
	x2zlh22AXEoFyWFMZaLF9Bm3+hve4AX4+tMkMV7A9JVKQtEIP6TAI/7ryPcHtYg6Hvf03UOL6Wj
	0VqZ+w01HkaOjbaRKbk3xq0PIZsNmei8DuTza6qywFDXGgIWaXl1fEPuiXH2S/mglOdu1lP42mI
	6icFc7BEB0bDBhcV6kkU+sgp4OFiNhBHmOQn4XjQCjUBJteEJBs/dzp85qxZMn5kCIsnTcoHS92
	JNoxbRVoVeqd28GMsyaaB4/AQPFpJQpwNhCSk8g4t+2x7p/dKe2DGrbGNEa3ejll088nVZXbDj2
	yE7ddygpZvz879M42LXbGjifYB045WJl8NROeA/Pgq9d7EZ13LaAVQcgYE5akSWVj2hknPhTCXL
	dAcEEWr1AieVdoJoj/cjCQ
X-Received: by 2002:a05:600c:45c6:b0:483:7ae2:1737 with SMTP id 5b1f17b1804b1-48526957d45mr90473985e9.17.1772893441105;
        Sat, 07 Mar 2026 06:24:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686bcesm185863145e9.7.2026.03.07.06.24.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:24:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dropwatch: upgrade 1.5.4 -> 1.5.5
Date: Sat,  7 Mar 2026 15:24:00 +0100
Message-ID: <20260307142400.4082791-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 14:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124932

Changes:
- Added abilty to build and run in a docker container
- kas is the default symbol lookup method now
- Fix building without libtool installed
- Misc fixes for kas lookup logic

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dropwatch/{dropwatch_1.5.4.bb => dropwatch_1.5.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dropwatch/{dropwatch_1.5.4.bb => dropwatch_1.5.5.bb} (89%)

diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.5.bb
similarity index 89%
rename from meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
rename to meta-networking/recipes-support/dropwatch/dropwatch_1.5.5.bb
index badeed8e82..03eaef24fd 100644
--- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
+++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.5.bb
@@ -8,10 +8,10 @@ SECTION = "net/misc"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1 \
+SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;branch=master;tag=v${PV} \
 		  file://0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch \
 "
-SRCREV = "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
+SRCREV = "10ec0adb9758b86a647b2972932aaa98a7d002a5"
 
 
 DEPENDS = "binutils libnl libpcap readline"

