Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1743.1793305996291422797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 13:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IZUtex5G;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026102920331324252dc44d00020774-y8grqr@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026102920331324252dc44d00020774
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 29 Oct 2026 21:33:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b4SFnwTRw6uA7FQmbP6lwA1aHLn0+xVB2zPdrrrMWHw=;
 b=IZUtex5GlBp4XibQyJkpbIoXEHTeUsiwmp7X4FQArt9eLzo1K6fBPs7dcvShZEaSqaYbSb
 G8gifQWTb3v46AwvamlcfJcLlVIavYNV047h5l7eZCM+/zGrOwAo+MXTdB9o6wO7W9cNa84u
 ENPD39oAGdjnO59DdSTtUcJUlPfomnwrPlOG8tfqCPm317tRGJL2axjCARGtKXOewJp1ZG1M
 sWtmRk7vSOuLCI+U2FiGt0+OyesydspfKJytQSaQlJ/1XV+xGvAxDuEWiUUwIY2f8ZXVajSR
 qv5SGiXUlqnMM5ncgsJJiCyFgKNDzEqCQHZWgabVBHTF+9I7DJsyS9Ag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 2/2] zchunk: upgrade 1.5.4 -> 1.5.5
Date: Thu, 29 Oct 2026 21:30:42 +0100
Message-ID: <20261029203042.3210492-2-peter.marko@siemens.com>
In-Reply-To: <20261029203042.3210492-1-peter.marko@siemens.com>
References: <20261029203042.3210492-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 20:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131668
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix out-of-bounds read
- Harden multipart download parsing against malicious servers
- Harden chunk decompression and header parsing

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Handle CVE-2026-117556.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} (81%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
similarity index 81%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
index 9d587debfd..f84cd8d6fe 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
+SRCREV = "ae8e9f5b1e820a906c39f7eaf231e71bef72a3a6"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
