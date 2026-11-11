Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3348.1794428733364677570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hbjhloMC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261111202530b4531b8aef00020760-8krahs@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261111202530b4531b8aef00020760
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 11 Nov 2026 21:25:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JF3IEXCxMG376BvVuqHy1NPgTugxB68VGpw7jibVi9Q=;
 b=hbjhloMCqjFjPI/fGHcF7wJAL+B5cS7VvNle1xCxxVI+/Yi9djk5cJnlxT2ApDj1FRYwik
 Jvyye0bjAya8gAP6Nj7VOJXsbISHDt99aoa6VqBOJgOs/e4xgxtZSMY3psaMxc7GV4fzEMWo
 LxkR0r5zaqcwPw8+id4WZRceJLqnr3y7zmJpgp9oJAovXUBOeKGjIlT9b4ylOKyQJbH5iILM
 OnaJBSP86+qlTzMQ4uYBdZMZ69s8Rj2zp8CSBNEA3sEkWHYMLs7SfnHA078E4tTelQvz3Rmr
 MiYZQQKVZj++F4qWOOKqURH383rCcEzwCkUTeOPUg35/btrP2g8y+NQA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] libcoap: correct license
Date: Wed, 11 Nov 2026 21:25:20 +0100
Message-ID: <20261111202520.2476684-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132136
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Commit fd97bae3126e12bd70fffe9b477a84f0f545c813 wrongly replaced
BSD-1-Clause by BSD-3-Clause instead of just adding BSD-3-Clause.
It's commit message says "add", not "replace".

[1] shows it's still needed.

Correct this by re-adding BSD-1-Clause.

[1] https://github.com/obgm/libcoap/blob/v4.3.5b/LICENSE#L53

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index 07b3670317..5a07da4848 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -4,7 +4,7 @@ devices that are constrained their resources such as computing power, \
 RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE = "https://libcoap.net/"
 
-LICENSE = "BSD-2-Clause AND BSD-3-Clause"
+LICENSE = "BSD-2-Clause AND BSD-1-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
