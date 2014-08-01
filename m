Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0C56670960
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:08 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so1394866wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pxZBeK+PJMHM5cbFjjR1tC5zfcdNcLZsA0+OhwwVdF4=;
	b=PE7ONu4U7gHOC6EfUArFB3vlJwWj3cQWvSeu7jUBfe2GqFN2NlIH3PoF5AktxTkpLp
	hVmhFJma46mF8UX4GwzFyN16HJNhVJQayKkNUwYUNtNMtfVIFOrZO9C/qs974WNgys4E
	qR2/OxGfAEWsewGseK2zpcm8GXGUxImX8xtjDgIAA3srwc2Snrqg5SB9lGazXqV83eVA
	4bYMacWXIYLZIu+eWCLcqkLlRkv+bEBEhRzePKVDx/yplXlArNch69Bdt5REIrAt/gKj
	GpSB9A5QVQYOEpDhqaCFaQup4WwEZnyMFcuCU0re91RCyDIOVCROIN2tWB/2Oyp462f6
	FZRA==
X-Gm-Message-State: ALoCoQmblzQ5mQQWJDFV1MXBgUCBfvbuiUlccNS2EKo4c1hOyB/mQBcv8Fc9vhj23codA2+TIn0y
X-Received: by 10.180.7.230 with SMTP id m6mr6863907wia.3.1406900108378;
	Fri, 01 Aug 2014 06:35:08 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id fu7sm8850508wib.2.2014.08.01.06.35.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:49 +0200
Message-Id: <1406900096-31368-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 03/10] gnome-control-center: remove blacklist, libgnomekbd has been fixed
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index ad0318e..5cc7ad1 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -2,8 +2,6 @@ SUMMARY = "GNOME control center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PNBLACKLIST[gnome-control-center] = "BROKEN: depends on broken libgnomekbd"
-
 DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop libxscrnsaver"
 
 PR = "r1"
-- 
1.9.0


