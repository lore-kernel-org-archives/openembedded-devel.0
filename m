Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 133267723C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:57:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g62so3628522wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IxftphqkIZyD1kGCfbn8y6AOqoI9WwIg+htylstnWFw=;
	b=W/AQHJxaB5TRR5gC8lfT4iZxq/Q6bRXMgxhrGXWAekSRYfigCUen8VU2uPex7THKDM
	f6kpsGjnZvMAN/AiNBUi9hhgVTatme6gvCBHU1ju5VDgeolhBX7nURz9n0anrIr+bUJl
	8alU7+lg5jYzfU5Mmsi2tL+T7otnaIa836RoWSnWCjasOrZv53MYF+gb3rRdvVP2F4L1
	VwPnlDfD0rg3evYST1HLZX8kw1esVecTBPPrifZEZp9x/W6EPLRgmH4iKaSTwtNun8X6
	1VVxjOHrLCc5pGMSW0tfT4qXe/XWzI/IZ6BJdaXpBX2AqUI6pgfcqp3hTTVwFgHc8NYF
	nNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IxftphqkIZyD1kGCfbn8y6AOqoI9WwIg+htylstnWFw=;
	b=HPkQbI91jyV0f5lTY+7yjFasLDPI4yxEWBn5a38GatUO6BXaRgeqGQU9dWbXW9AXkl
	EnVDKl5l8W1cclDeItvOlImBVYOugnhMROzJHJ8aQ3yzSsz5wHXN7jeWSAC5H6GfRJLF
	7vyfMnm+VKSs6O0PEd6FFKHBGaeoRpYOqgC10fo9vvBmAjweGvNzm/hcOIRJYkf6iexR
	Dlxg6KzGtP43L2NJGW5Pr0uh5jTtjgj9JfdOdisMPPhlHEVqSo2E8YSR+GueMzn5Ly2u
	yenmBqHJNgAtb0J+te1I2SqbdyekzzOWOyw4TbZn57UIjxDJJrHhUqP7AIu8ylExVp6T
	74PA==
X-Gm-Message-State: AG10YOT9aV+vB5CHnJ4sBXL8CoUoc+SDcsGAl6ZpH0ecsHJXtqPS+gcewI9wKBeB2aubRw==
X-Received: by 10.194.75.164 with SMTP id d4mr38542161wjw.15.1456318668934;
	Wed, 24 Feb 2016 04:57:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n10sm1873968wjf.28.2016.02.24.04.57.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 04:57:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 13:58:53 +0100
Message-Id: <1456318733-11446-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] libnice, farsight2, pidgin: Blacklist because libnice's nice.pc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 12:57:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 1 +
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb   | 1 +
 meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb      | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index beb6108..ffb222b 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -29,3 +29,4 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
 SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
 SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
 
+PNBLACKLIST[farsight2] ?= "Depends on broken libnice"
diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 711b6bd..a9081dc 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -39,3 +39,4 @@ do_compile_append() {
 SRC_URI[md5sum] = "e5b9f799a57cb939ea2658ec35253ab9"
 SRC_URI[sha256sum] = "d8dd260c486a470a6052a5323920878a084e44a19df09b15728b85c9e3d6edf0"
 
+PNBLACKLIST[libnice] ?= "BROKEN: QA Issue: nice.pc failed sanity test (tmpdir)"
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
index 1088f0a..8352110 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
@@ -7,7 +7,7 @@ DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl
 inherit autotools gettext pkgconfig gconf perlnative
 
 # http://errors.yoctoproject.org/Errors/Details/25824/
-PNBLACKLIST[pidgin] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
+PNBLACKLIST[pidgin] ?= "Not compatible with gnutls version 3.4 currently in oe-core and also depends on broken libnice through farsight2"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
-- 
2.7.1


