Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E931C5320B
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2062.1674324091113259352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l0hKpKXT;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7761212pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f4GbVRNchgj3Ls0t5zNcofOZbUwcNgJUZOFusCrFzc=;
        b=l0hKpKXTSJD0I/1T4iw0w3hkMNOuXq8DpvzTlfZFMsG4TquAKMye6Omgzfw1vS53sL
         I7kLC5alOYxTWxmyjPEeFuaEwMsoC6pJ1pTiRLQKP2fFYdanY6sd4OrhWevCavwoHYCl
         roVXbLmLDkd334NHPFUpSh91QgUmmYtvvp+fEqdmwYBmWNRMG5f0dsWVrmOkyDpCOfn6
         sX5oZskLjE4pimEr3N8PLAvaczdL6PQkfGrPOD/rj7Sf47qYVpCznT7KAaEzMdA9fOBR
         7N39OJ/PJTWSa//QDYmrTilE72Ap2J37BYpVtfdJeJ2hISw1v7D2YZz15EUeK0MYfPkB
         W5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f4GbVRNchgj3Ls0t5zNcofOZbUwcNgJUZOFusCrFzc=;
        b=m57RswmVuEP5/m9p87hzkNXYeZOjnjPjN4xokuqyEyLmI3kNhUYSk18S17wiBnPO4E
         oOtUkTE9/NoAYthEBjBTzBt+1XnziExcvH7zvZDy1ny/qbrRKz3YqjIFKI97UzYlAZSw
         FXHPqdsrpGHmm8c8psM506jZdJsEktf2CEECxEnB1U49Vdnp++/rugISzCQinsZt5GPd
         Tz8yk+n3uztfadu9fNxcPOQPkAnB47+awVqDUo49ZGw1qUQg2zuj+fzogzVRWb4cJKs4
         I58InICv5tGsZP0l8Z7kD6xrXkruN4yCcPvZVRB60JBWO623C/M2ZYoWtWa1S0L3n6nX
         /sbA==
X-Gm-Message-State: AFqh2kpJ2k0wsOOnJgEOJ8gCxOXlVwYE6DJCqo1e2VcE0RVI7yAmzLgG
	q2Wq85T6N6rJpgONAAyUcZuDCHQ3V6vTHA==
X-Google-Smtp-Source: AMrXdXv3eYQOCwMqcJCgLkVyzryBKXlVw000OMCR72A8hgD6L9BgIH0V0hgDWYzK2QlmVppfICzIUw==
X-Received: by 2002:a17:90a:f198:b0:229:98a2:1b9c with SMTP id bv24-20020a17090af19800b0022998a21b9cmr18790868pjb.39.1674324105712;
        Sat, 21 Jan 2023 10:01:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 27/30] rtorrent: Add missing dependency on autoconf-archive
Date: Sat, 21 Jan 2023 10:01:18 -0800
Message-Id: <20230121180121.1229895-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100694

Fixes configure errors e.g.
| configure:8269: error: possibly undefined macro: PKG_CHECK_EXISTS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
index b4fe10cb1c..d5411b19b2 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libtorrent.rakshasa.no/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
+DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
 SRCREV = "d067bd802e44f0e6a747aabcc311ada2175fd550"
-- 
2.39.1


