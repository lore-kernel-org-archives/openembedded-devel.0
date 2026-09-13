Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C79FC88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:25:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.998.1789313142810571879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HDE9rdbr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026091315254016370101aa00020739-ty5b1d@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026091315254016370101aa00020739
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:25:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kQfShKlzrDBtQQrBsnDupRe6vGpDxPURFcSmzunPVUM=;
 b=HDE9rdbr9WANZ7rKZQEjhVBv2vjiLY1VWiHhyBjFM9CnJ4RjW5ABfENhX2BrYO+0V0KysM
 Dv9IP6ztKkQ3PF+lXHlupgYhzYFP94vZDsK5ChudtbgY77bbJ/Y/PJwAPfiXZq5Eyrdx84Xf
 F5+1ew8F339e6arIC8pQnMoWoLz2T9a8/+tok0ZLcsn1Ph7eDojJwkuxK9Isovn2s80dV+za
 KfHy1iBO/myKictTAo1McBARw8JN/KKvRO9T5aL0TGN2ijop+oCbwkg2FsRJNNWILdUp/DK0
 bxpmUA5IhCSR5JfEfQZCPvLvE3x+aTpRRtsn67toDF6JAc0B77wlpliQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/4] msgpack-cpp: upgrade 8.0.0 -> 9.0.0
Date: Sun, 13 Sep 2026 17:22:53 +0200
Message-ID: <20260913152253.3201491-4-peter.marko@siemens.com>
In-Reply-To: <20260913152253.3201491-1-peter.marko@siemens.com>
References: <20260913152253.3201491-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129999

From: Peter Marko <peter.marko@siemens.com>

Release notes:
* https://github.com/msgpack/msgpack-c/releases/tag/cpp-9.0.0

2026-08-25 version 9.0.0

    Add regression tests for the fixes below. (#1183)
    Fix ext_ref comparison operators ignoring the last payload byte. (#1183)
    Fix out-of-bounds write on self-move-assignment of the create object visitor. (#1183)
    Fix broken array_ref<T[N]> comparison operators. (#1183)
    Fix heap buffer overflow in vrefbuffer::migrate() caused by a wrong growth check. (#1183)
    Fix v1 unpacker not applying str/bin/ext size limits on the reference path. (#1183)
    Fix x3 parser treating uint8 values as negative integers. (#1183)
    Fix double free / use-after-free in zone::swap() (C++03 only). (#1183)
    Fix use-after-free from wrong member destruction order in zone move-assignment. (#1183)
    Fix use-after-free after moving an unpacker (dangling referenced buffer hook). (#1183)
    Fix out-of-bounds read converting a short STR into std::array<char, N> / <unsigned char, N>. (#1183)
    Fix out-of-bounds read and null dereference converting an array whose size differs from the tuple arity. (#1183)
    Fix null pointer dereference converting an empty array into a C array T[N]. (#1183)
    Fix integer overflow in the unpacker buffer expansion size arithmetic. (#1183)

<< breaking changes >>

    Fix ext32 max size truncation on 64bit by widening visit_ext size to size_t. (#1183)
    * If you have a custom visitor that implements visit_ext(), widen its size parameter from uint32_t to std::size_t:
        Before: bool visit_ext(const char* v, uint32_t size)
        After : bool visit_ext(const char* v, std::size_t size)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../msgpack/{msgpack-cpp_8.0.0.bb => msgpack-cpp_9.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/msgpack/{msgpack-cpp_8.0.0.bb => msgpack-cpp_9.0.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_9.0.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
rename to meta-oe/recipes-devtools/msgpack/msgpack-cpp_9.0.0.bb
index 0d741c5212..95e8bfe71e 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_8.0.0.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_9.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=7a858c074723608e08614061dc044352 \
                    "
 
 SRC_URI = "https://github.com/msgpack/msgpack-c/releases/download/cpp-${PV}/msgpack-cxx-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4a3c0c0ac55ef4456c2d0b93c21b5d105aa3a8f21ef8fa9758550feaf989b92f"
+SRC_URI[sha256sum] = "303d3a7321aee65eb9450db8a6c973954e00af34b88ba0c0aca236bc50bfb8a9"
 
 UPSTREAM_CHECK_URI = "https://github.com/msgpack/msgpack-c/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+) C++"

