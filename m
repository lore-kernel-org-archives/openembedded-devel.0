Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD3CC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 06:57:06 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1527.1787209020320587263
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 23:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=je3Vqd3Z;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1634; q=dns/txt;
  s=iport01; t=1787209020; x=1788418620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j/S1IuJ2qoeNaRSR18+cFt1o4Tj8NoMTH4qUj4L8DuA=;
  b=je3Vqd3Z9iVCIGL/XeeYrggE6In1KhZHlBeg+aD6cPwCY03iNA+Y0rSg
   gDWPhoi5V0k06GatUrixkgrS0u0ptgE0RWq357+bC5KU1ZKxyCEWM9YvH
   kPpKcYzUMVmSs3Kn5YSdf7LZTWi0YRYfLseToeqHZBE1gZqYt8MelE0xf
   h+zOe7PWxY9DhRBzoBrGj5i21d3cwJHln8YP+Ll0QpVGf6LlXE7hyf9iG
   cfsc3qUwyl5L+DkkGerOPgbxXGAYL1Z+z6EUqgfWAa7yu4G5CgLxuV+ZF
   yXkM13RQNU47H4B6R5B/2QiyPtOxz+XGDWnTHmcw90xZMJzBgkpdr0ddv
   A==;
X-CSE-ConnectionGUID: RCzKz03KS5S651jnBN4/tg==
X-CSE-MsgGUID: Llg5WIg1SPOIhNfDB72+CQ==
X-IPAS-Result: =?us-ascii?q?A0DEAgD9pIZq/5IQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXSsLARgBLTBcRIMCAYJ0A8JYgXkzgQGDKAGBVNswAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ1AYR8JxsbgXKEfoUQhXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCB?=
 =?us-ascii?q?gIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkuBDiyBDIEgEZNpkXyhDwoog3aMI?=
 =?us-ascii?q?ZU6GjOFW6URmQiLN5kjhGmBagE5gVlwFYMiCUoZD44uFYNghRPHJicyAjsCB?=
 =?us-ascii?q?wIHDgMLk2YBAQ?=
IronPort-Data: A9a23:AJUylKzSkgRIIu6XmBB6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 GscXmiAPvrfazfxe4olPtuyox4Cu8PSztEyQFE/q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHybuiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHsdL64Kor1UOjx1q
 6FBKjYnSEzEm+3jldpXSsE07igiBMDvOIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUieC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOK8bIaKIYLSLSlTtmKcq
 T/53mugOSk9Fdy5xxavrSjvrdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:mslNaqmpOG8zJzo9SWA2paoKSSHpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:/xSrGmzyhy8qy4TZVFH+BgUuMdIGYCWG70yNGBHlUGRvYpvJDkOfrfY=
X-Talos-MUID: 9a23:O1WS+gSG7GJCGaNTRXTIgD4/C+Znup+WL2ENt5sqkZbedgdJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="829447360"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 06:56:39 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 0990D18000171;
	Thu, 20 Aug 2026 06:56:39 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9E543CCA79B; Wed, 19 Aug 2026 23:56:38 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH] libssh: upgrade 0.11.4 -> 0.11.5
Date: Wed, 19 Aug 2026 23:56:16 -0700
Message-Id: <20260820065616.1427811-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129380

From: Hetvi Thakar <hthakar@cisco.com>

Upgrade to the 0.11.5 security release to fix CVE-2026-15370 and CVE-2026-59843 through CVE-2026-59850.

Switch to the official GitLab mirror because the git.libssh.org endpoint no longer provides a usable Git repository for the new release.

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libssh/{libssh_0.11.4.bb => libssh_0.11.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.4.bb => libssh_0.11.5.bb} (90%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
similarity index 90%
rename from meta-oe/recipes-support/libssh/libssh_0.11.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 292b8f797e..c28a417244 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
+SRC_URI = "git://gitlab.com/libssh/libssh-mirror.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
+SRCREV = "a09fdd00416e53b6ed436df6ff14339a4f884601"
 
 
 inherit cmake ptest
-- 
2.35.6


