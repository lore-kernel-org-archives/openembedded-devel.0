Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A4B2C731CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:19 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k127so50631544iok.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5snmeI+xG7aVaRr7Exn8cRuPHgYWdkwcG/DynvYT70Q=;
	b=LsBVC6pFDXuCU60s543gMvDusfF9s0zpFKHQ1UAoC8tvd/Xu7rgKLf0HcZDbKw04/B
	aAZwJmMZrvRzFVwJOICKuT4byqbWx8zsIIcvbobYwUI43Y8vVPjZAGKEdjicBFdbN20Q
	kgBSp8Gem74lAv2gXepzRfYPZC4BVDYfBgtgqagBXnFUgxA9KLHgKPprJFcz0dK0Kft9
	jBFNiF2hHDVrgbiK+VvjBlwqFyh3c1FNZUX3qLvzD8ZYuLTbmXy2a47DQQ127f+i7AWd
	HPebqLdc1ew+8Q/jj5z9HdBLkibAIPJeHlmX6ZAHbLMgEMA49/l50/fLfusibOlKX/nz
	1MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5snmeI+xG7aVaRr7Exn8cRuPHgYWdkwcG/DynvYT70Q=;
	b=e4/6W0du1msOw1YU/I69SWAgc/yndlGW3Te2ZRDwFSes1aG2FcLGaByTT6VpqXvOu5
	YWAVeqjULCAtn9I58PBjdBzlXM3uAYkTZIou3auKJ8TSPfPUzxgHdLAidSZIDq3q3aDx
	abuDOr3BkVh1zeK3q6T0iNaU7eS6XhnK5oSuQ4fKJZL7RPWs1978HRUxLiq4jdTtSDES
	FiBtJIM1DuPRraGax2RF+CrHCpd6KKxy1apZWj2HsogpuKbDaDiYYItlSq8meQt0ovfh
	8ZZL/gUBtudwRzmRKTMEceUcQHqVFme+5NlFoDM+8vyKMe+tLf+KUk9IjkjFRqIRde6X
	O2DA==
X-Gm-Message-State: ALoCoQlZsGTu0qp4FLCY5oist5Sd7o6B66sAxdKygb4mlHrycWI2i3rcmqYDMzotIuUAQXZ3X8YZDTB6diMNaymW456DL068+A==
X-Received: by 10.107.30.15 with SMTP id e15mr6705527ioe.166.1452805460223;
	Thu, 14 Jan 2016 13:04:20 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 81sm3210754iod.31.2016.01.14.13.04.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 13:04:19 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:03:35 -0600
Message-Id: <1452805416-22520-4-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
References: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 3/4] lldpd: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:19 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
index 1bdc8af..cc626af 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "4e924420e00ccd5dc289506f43221820"
 SRC_URI[sha256sum] = "aac11cb1fdc037709517372c70c9bf89c752ab8e5eaab9ce140b84ed5a0507c8"
 
-inherit autotools update-rc.d useradd systemd pkgconfig
+inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system -g lldpd --shell /bin/false lldpd"
@@ -55,16 +55,11 @@ do_install_append() {
     touch ${D}${sysconfdir}/lldpd.conf
 }
 
-PACKAGES =+ "${PN}-bash-completion ${PN}-zsh-completion"
+PACKAGES =+ "${PN}-zsh-completion"
 
 FILES_${PN} += "${libdir}/sysusers.d"
 RDEPENDS_${PN} += "os-release"
 
-FILES_${PN}-bash-completion += "${sysconfdir}/bash_completion.d/ \
-                                ${datadir}/bash-completion/ \
-                                "
-RDEPENDS_${PN}-bash-completion += "bash"
-
 FILES_${PN}-zsh-completion += "${datadir}/zsh/"
 # FIXME: zsh is broken in meta-oe so this cannot be enabled for now
 #RDEPENDS_${PN}-zsh-completion += "zsh"
-- 
2.4.5


