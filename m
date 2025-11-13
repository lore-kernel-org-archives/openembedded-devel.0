Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7373CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17878.1763014798225568564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=moP+fEKA;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aad4823079so401246b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014797; x=1763619597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qcKX+VKpDZqDofz9Cbc8c+cuVbGl7hbzMDdKpIQk0Q=;
        b=moP+fEKADWv3dXLIFVbhysZD2s06ykn86MRSplBWs9QLC7nr1zBicIA2zB5nl2NsIu
         Pzfnq9Hjtm0q6ueayPxlKiEXibKvKTK1edyLWDaIDq75Kbaaf6XWPDTQP/4G+uJnh+Bf
         YiRtIAIW/mpXE2NTZ4pLipjmC0SehGyGaWWG8Of1BFOdAmEOms0vwpZ5ausugVBXGnUq
         cVR9PsysSMz7s5GVQvgFwAggLqVlr783I5tvJ+eFyjAUhI2Gy2+4GLuDIAJULGY9fz7Q
         tAFtohpI6C5HctMeIai06Hb0c4tOR0JYfNQXz+vtHSQ3vttu8a8MdSNf3dQ/pnO0/v9Y
         m9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014797; x=1763619597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4qcKX+VKpDZqDofz9Cbc8c+cuVbGl7hbzMDdKpIQk0Q=;
        b=bp5KR/3BHmZ7ARbQU/LihQeubDACthaGhCKRx7HDAXjzqTV6ARZa7/iO1wBvJcSwi/
         5Y/19dAIb7ppFejq0ePPQJv5eIUSC8xyKNya3rRqRQ75xM6i3hTLbUOoz/BDvwMhszff
         a5JPL/zKOeu8v80i47rfXPgN6ml8pSwU4rtCvx246hCz0n91POe8uLs93DSsZ+v+jB4G
         ZGGkBJuw2CVqf5vvKPYjZAWoZruBg9yMkZzXoMbNVcu9E3yHeOBHIV7hI1OOzFSmt0V/
         JfQEsdYUxw4u0LvL3osYufQMfrPjg/Ac4GnK479lTLccVfr2JTwGbd+FWNnQxwpJuCDL
         iENQ==
X-Gm-Message-State: AOJu0YxdT9vMBzWQTx60qul72MXviEFbp5isY3eXAwqV6sxT7L9V6vnp
	1oi/Cmz5ngt6fm6GWf3HmWJb2Ci371MOvcBfaLy2JlXOEZKb9AlAxrqYKCNpHQ==
X-Gm-Gg: ASbGnctaYxtstu3uBomDWXFzllZaoVsY4i+pWv+Qk0r6pOZybK4hygOkl7oPjpM+zDS
	IB105Vr2t+10yXsdjlFcjIYM3avdwZaXDivVxuL5660c/GjpdEEwN9/UDDM7SKDEDIQ4hKLWpKZ
	FIuVgD4pg+v6GfP+yMzwFaO3vXuY3XI5FcA/g2JB71dOgtdP4S0B50xBaINJmoSDJ2k3tHv3X0L
	Tq2v329Jp127fjQbstTJmJzEncxMb4ryZJVucXBhgXnIOFGJ9f9cZBDjoa3E8MyMgqmXC2uVVaa
	9lMj9nQXTHC9kMODTAo1LJTpxCdDdnObQa/odJO8lbT1MtyN2k7KhdY4EiyE9qZfXufwtvBgOSg
	SdCrULgPoC7uAhd/m8VN1P0LX2rS+qAraBkR/bn6PB/pOICGBG3co5VACeZV9NVVD8qkZmadT0U
	Z9Xiry3O/Za1jpYQ==
X-Google-Smtp-Source: AGHT+IEGh3LDk0j9JW443EHX+5t6aqNDZwMI8ha/0Vmk0THkVRnQ/bQaDHT7GZ8vWg0aBzbpUXdwfg==
X-Received: by 2002:aa7:8714:0:b0:7b8:1a40:c47 with SMTP id d2e1a72fcca58-7b81a4010bbmr4439174b3a.16.1763014797432;
        Wed, 12 Nov 2025 22:19:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 09/38] openldap: upgrade 2.6.7 -> 2.6.8
Date: Thu, 13 Nov 2025 19:18:44 +1300
Message-ID: <20251113061914.3756301-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121607

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed libldap exit handling with OpenSSL3 again (ITS#9952)
- Fixed libldap OpenSSL channel binding digest (ITS#10216)
- Fixed slapd handling of large uid/gids peercred auth (ITS#10211)
- Fixed slapd-asyncmeta/meta target structure allocations (ITS#10197)
- Fixed slapd-meta with dynlist (ITS#10164)
- Fixed slapd-meta binds when proxying internal op (ITS#10165)
- Added slapo-nestgroup overlay (ITS#10161)
- Added slapo-memberof 'addcheck' option (ITS#10167)
- Fixed slapo-accesslog startup initialization (ITS#10170)
- Fixed slapo-constraint double free on invalid attr (ITS#10204)
- Fixed slapo-dynlist with abandoned operations (ITS#10044)
- Fixed build with gcc14.x (ITS#10166)
- Fixed back-perl with clang15 (ITS#10177)
- Fixed to reduce systemd dependencies (ITS#10214)
- Added slapo-alias contrib module (ITS#10104, ITS#10182)
- Fixed slapo-autogroup to work with slapo-dynlist (ITS#10185)
- Fixed smbk5pwd implicit function declaration (ITS#10206)
- Fixed slapo-memberof exattr requirements (ITS#7400)
- Fixed slapo-memberof is no longer deprecated (ITS#7400)

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f4954ecd873fd542e5ff1e942b6d8b1b6345580e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openldap/{openldap_2.6.7.bb => openldap_2.6.8.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.7.bb => openldap_2.6.8.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.6.7.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.8.bb
index e807fdef16..8550c10b21 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.7.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "cd775f625c944ed78a3da18a03b03b08eea73c8aabc97b41bb336e9a10954930"
+SRC_URI[sha256sum] = "48969323e94e3be3b03c6a132942dcba7ef8d545f2ad35401709019f696c3c4e"
 
 DEPENDS = "util-linux groff-native"
 

