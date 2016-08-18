Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 887F273216
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:09:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o80so262726wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O8R/g/0UGO7jqrHBZwY8Dr4lEbUS5iGn6lnA907yYXo=;
	b=qo0ulc1MwZfDa7nyxZIQzqafLRpaIlec5X+aQ2uidbB5/A0qpb4dCb6hxRRgxPGwJ2
	I6oPvzzALgV0h3vVzDJRccyBkR9tN040IjfZCYGAqNuprDoujIUW/Ufw7yaCml/g7+WQ
	uE9fsmMBZDNMWEkF+bUXh94OeiuHszv63bk8PubNPmEVa3Z/P+IZy2AZf/Y+erZ+CY7u
	4VqL8+CTThVwOggbSV1XBA9XRAXJ6jceAnrfSnTXlH8YiAfWwUiq2aieXi4xxEFI4SdT
	//BXGEXwDUxmquJ1vYN7FIwa5xk7OFiLIiFkzvBLEeblqls2ke9wUO1oUKWteVx2oGVU
	p3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O8R/g/0UGO7jqrHBZwY8Dr4lEbUS5iGn6lnA907yYXo=;
	b=mHorNB+jF38zlH8OVvaFXaCxRXWsj7lPvBiqEP7AogrVSWrUHdLTdwsz9CsIQJWVJw
	HUulzFGzPtGrR2ISB7s4uxXEJfCUo6PgtttYcNFBJUSf7j+1EE3SWh5E4Gp/ETqC6nIb
	NoHYM9cX72aCmXRCTEpmrT4ILhogqKUss91HUnFJ0DesRDpn7hjNr1bSmbexxmJsgEFC
	/2gIU3KkiVs3ez4hahXB5n2x2rAtr/XXo4UhTGQrcAiadmg641SxNH7dpt2VxKRPniL1
	LW89pyWrpUagnPsnrhBrI+o+K9mcRO79MCe4l3BWjiOjoN9mPtOHk5Y+CjJsTdy2bG63
	aysA==
X-Gm-Message-State: AEkoouut0XHFP86ft891s243EF2CuppZy1MuvB3SxFtDBpeLxAPsZXulLadlD6Ems79bLQ==
X-Received: by 10.194.222.168 with SMTP id qn8mr2653269wjc.172.1471536585399; 
	Thu, 18 Aug 2016 09:09:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id d64sm223388wmc.22.2016.08.18.09.09.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:09:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 18:09:38 +0200
Message-Id: <20160818160939.4390-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160818160002.ydacjrbdyknjmcwa@jama>
References: <20160818160002.ydacjrbdyknjmcwa@jama>
MIME-Version: 1.0
Subject: [meta-webserver][PATCHv2 1/2] nginx: optimize systemd unit file
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
X-List-Received-Date: Thu, 18 Aug 2016 16:09:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Szombathelyi György <gyurco@freemail.hu>

- Call the nginx binary directly, no need to wrap the SysV init file.
- Create /var/log/nginx with tmpfiles, like volatiles without systemd.
- Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 9 ++++-----
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 5 +++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index 9926a4b..ce99061 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -3,10 +3,9 @@ Description=Nginx Server
 After=network.target
 [Service]
 Type=forking
-PIDFile=@SYSCONFDIR@/nginx/run/nginx.pid
-ExecStartPre=@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
-ExecStart=@SYSCONFDIR@/init.d/nginx start
-ExecStop=@SYSCONFDIR@/init.d/nginx stop
+PIDFile=/run/nginx/nginx.pid
+ExecStart=@SBINDIR@/nginx
+ExecStop=@SBINDIR@/nginx -s stop
+ExecReload=@SBINDIR@/nginx -s reload
 [Install]
 WantedBy=multi-user.target
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index fe51ca0..334a6d8 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -73,8 +73,8 @@ do_install () {
 	rm -fr ${D}${localstatedir}/run ${D}/run
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
-		echo "d /run/${BPN} - - - -" \
-		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+		echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
+			>> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
 	fi
 	install -d ${D}${sysconfdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
@@ -90,6 +90,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/nginx
 	install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
 	sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
+	sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
 	install -d ${D}${sysconfdir}/nginx/sites-enabled
 
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
2.9.2


