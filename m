Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id E207965E03
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:57:11 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so1035211wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 02:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K8HRTRFKSgh3aVQ6W7qOGsjFjJKB6wo6rxf1kjScm18=;
	b=LsLW4Ku23gDhKhYi+wZcvKvbXn5nKPzJNnFLwhG9vINwLw9aJCDynSC6ZU3KTNGHiU
	NXgMrp13+I+3UqaMaxgeLAlAa2wLfSsnZlwD9KiriRwcX3LTwV7tzfZE1dHWyH8sY6VZ
	WGojQkk0x+FbXU4UOPes4jfG4NPaSbSg8H3zY2Bp83/MIfOzBjPM9es2nis0IC/N08gN
	vyj7mvnZwAurKgwiUc40aAiKO0rIyM+0/AbsFVmrHqrVDZ8d9eORYxraBYXzffLk4wmh
	e2Pe+p+qAtgrByMr9KpiD0n8CelgDd4rMcTlJHFGNT6IVWH970WWYhyRzSjSRy4+C7uZ
	99Tg==
X-Gm-Message-State: ALoCoQl8OPTttPLAlqJhMqN6XrwvLqj3oDXcOrxYXvNeg6ZJtxoYuviRXEmeBDUkSjsqU7k1+l5T
X-Received: by 10.180.221.133 with SMTP id qe5mr5072084wic.17.1406887029637;
	Fri, 01 Aug 2014 02:57:09 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	fb12sm19725551wjc.43.2014.08.01.02.57.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 02:57:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 11:57:02 +0200
Message-Id: <1406887022-18508-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH] libgnomekbd: fix S!=B
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
X-List-Received-Date: Fri, 01 Aug 2014 09:57:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index e9ca2a7..0381192 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -6,9 +6,7 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf gtk+ glib-2.0 libxklavier"
 
-PNBLACKLIST[libgnomekbd] = "BROKEN: wasn't updated to work with B!=S"
-
-inherit gnome
+inherit gnome autotools-brokensep
 
 SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
 SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
-- 
1.9.0


