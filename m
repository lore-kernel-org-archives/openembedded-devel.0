Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TvOfk-00068u-0m
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 09:49:20 +0100
Received: by mail-ee0-f49.google.com with SMTP id d4so480880eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 00:33:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=7AW7iZyOOrNtjbn6ctAFzTbqEkqxifLYNgU9DRBUsYY=;
	b=hjUBZc7Vc0F47f9We1aM4KfupINF+PnMgGdtKnQrc6w1tU5n8uZoRJVANbmQ3u3yPA
	00fojNCVOLJ/yvs2wCU1g7JzvLdl3MZmCcWQE25rZqiuecnnYlWenwGfU87jfFVQzL5y
	s/wOYOON79P6IWkRkJa07AuqEtGk3OuHdecWWq5JYlBYRKV7zuO1YxCJdcuh3Nui9H0J
	+RMgL3uaukNQbrgN8AQFPsauvExUjLHl4TGmB4uJL6oQvSa0gy63whZvKRpm9/3qaDb1
	71u6QWITp0GivtGvgDg6CM5lu6WBwkCsRviWAtH7kD1QLAdnvtreZTQ+enHrN1v3s657
	TDuQ==
X-Received: by 10.14.206.197 with SMTP id l45mr940958eeo.17.1358325194798;
	Wed, 16 Jan 2013 00:33:14 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w3sm28613338eel.17.2013.01.16.00.33.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 00:33:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jan 2013 09:32:47 +0100
Message-Id: <1358325167-18862-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358325167-18862-1-git-send-email-koen@dominion.thruhere.net>
References: <1358325167-18862-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlxG9wyJJXGWOFZIq3CzxxdFvfr7ZZWZQxHBzMsIWDRQyhzGnxRxx/SNK8n4PSUZ5R1o8ri
Subject: [meta-oe][meta-gnome][danny][PATCH 3/3] cheese: disable help build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 08:49:24 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index f447817..1e8a98b 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -15,3 +15,7 @@ FILES_${PN} += "${datadir}/dbus-1"
 RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
 
 EXTRA_OECONF += "--disable-scrollkeeper"
+
+do_configure_prepend() {
+	sed -i -e "s: help : :g" ${S}/Makefile.am
+}
-- 
1.8.1



