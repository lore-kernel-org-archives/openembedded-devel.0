Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 43EDE6FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:23 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u56so2028881wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SLItbZhvCPV3Cvsm0WMJvgDjXFgsKAnwnJa1+0nHlJI=;
	b=BvUZY+3Q/wNc0MvdC+KYlSaBma7mDMaPTvkBIYQvewpI80j2AxnZtgm+OBnri4gcC/
	7DY6A+ZjjyD4YfUa1P7mL3DbWD5Lw4BQagOs204eSGRNhBmu93DqSB5+cuFLhhQNM2g1
	WokBJuKTdtgsWwTPYa0LfH1A4eXrousctnIKj3uokWsyEvAfR1tdhCMmy6xikOB1Ftwc
	wWR7ZwK1GAyionqLEotDwUvivqjev71V5t2/sw4RC0IS5loIuZNQg81z8e0j7EkvP++V
	C2DL0zn6zDVFi0qQiyn7JsgTU3JORIOybPFOOvkbxqOtHBk+ENZmz+MBa63aypRE0xQp
	taGg==
X-Received: by 10.180.208.13 with SMTP id ma13mr4926369wic.45.1403172024684;
	Thu, 19 Jun 2014 03:00:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	18sm7684180wju.15.2014.06.19.03.00.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:53 +0200
Message-Id: <1403171993-26208-25-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 25/25] renderer-service-upnp: Blacklist because of broken with B!=S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 10:00:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index 478b1c7..64ec7b8 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -5,6 +5,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/renderer-service-upnp.c;beginline=1;endline=21;md5=c25c3082684eb4ca87474b7528c6dc15"
 
+PNBLACKLIST[renderer-service-upnp] = "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
+
 DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
 
 SRC_URI = "git://github.com/01org/${BPN}.git"
-- 
2.0.0


