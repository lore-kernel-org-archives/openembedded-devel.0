Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1722.1793305976197419351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 13:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=O2kpPre2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261029203254d381c3ff3b000207e9-nwd4gy@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261029203254d381c3ff3b000207e9
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 29 Oct 2026 21:32:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=to4kKSnfjecc4/E4gS9nL28EOUVD118tevqEoGJOl60=;
 b=O2kpPre22umrutgsZdTMfWvVkOl+xYB0KiKFTBATHLDC0iQLpn9AQT2sf6h0TBu2HIJyAA
 5nOSULeNVL3xcpX+7d9pFh+5G9XyOuWNIPmpDWfSDWo1boH2fkXguinZyye0e72LasgJXT64
 T8RbGzTTAZQS8bxf4VY8H+dCQOHRHIhHTF0/0slWt+zIv67r3D0Rakt6gC0c4gJlbwiINUes
 xIw4DdaWZXEMdZ4lOwZhW8+3xBLmOxEVdyh7r/gV7qrpqCyjqZ60XixKY+r1XK5LW0iuyvZB
 rCyYOfDSK54r8vsQeot5AhmD/4D9U6TWZQmFqNeI0Zw0Ykp7NiIkNsDg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 1/2] zchunk: upgrade 1.5.3 -> 1.5.4
Date: Thu, 29 Oct 2026 21:30:41 +0100
Message-ID: <20261029203042.3210492-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 20:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131667
Content-Type: text/plain; charset="utf-8"

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/zchunk/{zchunk_1.5.3.bb => zchunk_1.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.3.bb => zchunk_1.5.4.bb} (92%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
similarity index 92%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
index fc5a55d192..9d587debfd 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
 
-SRCREV = "366cf22e725fc273abe0e082c707753cce76c453"
+SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
