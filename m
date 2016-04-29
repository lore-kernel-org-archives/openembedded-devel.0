Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 63C1E73219
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 20:05:57 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x7so50621045qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=id6Q+zm3f90iw89ysPW7eU6bhOrDV771j5YfjyL2XUo=;
	b=CmsOielyaEbESPdQWd9uWZY/dj+dEYDPln0aU7YjSTmAl8FJm/CPMo6yXWCzt4iO+A
	0mGL8wQ+QHhBZyGK7rYd1H4yexpJ3ORcvFETPm+zSABGqn96RNA+9d6nl/1IuPdVgdG4
	6nuYeRNq3EAkRndH8ufsHgk44hoIDIzuWC1VZFxAVg1THwcyx6Mvci0NR+0mdIuVvX1J
	wRpE3SYgqKer54x0ZAbHPqtf2R4HnOKXqEOaO/V4hYDWS+aKAUQOh1tfHkeKjcpEOode
	wV6eYRqxkMdABvUC28mGxXbMP/16cd+zhGzQBd6AMhnBTZi99f/W6Te6nIVSpCO4ehyk
	wHYQ==
X-Gm-Message-State: AOPr4FWtj0s9b4amUD5LbsdyA+uCBmbXfEXgCMZeVaVrq353/P2LwTxgvjvWwD8YtV9rpg==
X-Received: by 10.55.20.134 with SMTP id 6mr4208711qku.155.1461960358689;
	Fri, 29 Apr 2016 13:05:58 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 77sm4935895qgn.29.2016.04.29.13.05.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 13:05:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 16:05:43 -0400
Message-Id: <1461960343-28462-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461960343-28462-1-git-send-email-derek@asterius.io>
References: <1461960343-28462-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH 2/2] netdata: replace deprecated 'base_contains' with 'bb.utils.contains'
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
X-List-Received-Date: Fri, 29 Apr 2016 20:05:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-webadmin/netdata/netdata_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 88e3692..317ddcc 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -33,7 +33,7 @@ do_install_append() {
     #set S UID for plugins
     chmod 4755 ${D}${libexecdir}/netdata/plugins.d/apps.plugin
 
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         # Install systemd unit files
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/netdata.service ${D}${systemd_unitdir}/system
-- 
1.9.1


