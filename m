Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqru-0003ce-GH
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ea0-f177.google.com with SMTP id o10so578627eaj.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=BXFEYZZ6usngEcLfq93psyY7oVffVEC0Zb/87L3ePnI=;
	b=T6rPooVRyw9C8xSHa8bgVW91CmtKDGoX2MAlEb0Y7E4oRUD8NF9jvLCNFvsGtfASXi
	HeboHWSx6ngM/VlvxD5WhTeFeoE4Qo7QxzMIVFTquEte1tmRYiGRTz9bSIU0p0WbnwVu
	HJBydUDb8oYh7jazX4wTbnZ36BXiTxJPtX3hgmZaZsXaYkJvHIjAz1654IFQUM+de34E
	WnAU5aKDjJi0TXjSs2nDIH9yTWnu4zbkDl1knplrz9OqxJVrOyUEKJb/ZoEIki/JiGmx
	SVmuk7KvuvARHrvYr9dU/BtZc/gMapo7TurnGerm4iB/Y1pRVZe7ArH+3eZDLUopeAv9
	CsAQ==
X-Received: by 10.15.42.198 with SMTP id u46mr10147115eev.10.1367966541348;
	Tue, 07 May 2013 15:42:21 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:48 +0200
Message-Id: <1367966513-12566-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 10/15] epdfview: move to nonworking
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
X-List-Received-Date: Tue, 07 May 2013 23:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* images are not displayed anymore
* there will be no further development / upstream is gone [1]

[1] https://bugzilla.redhat.com/show_bug.cgi?id=906121

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../epdfview/epdfview/browser_command.patch        |    0
 .../epdfview/epdfview/fix-format.patch             |    0
 .../epdfview/epdfview/glib-single-include.patch    |    0
 .../epdfview/epdfview/swap-colors.patch            |    0
 .../{ => nonworking}/epdfview/epdfview_0.1.8.bb    |    0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/browser_command.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/fix-format.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/glib-single-include.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview/swap-colors.patch (100%)
 rename meta-gnome/recipes-apps/{ => nonworking}/epdfview/epdfview_0.1.8.bb (100%)

diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch
similarity index 100%
rename from meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
rename to meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch
similarity index 100%
rename from meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
rename to meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch
similarity index 100%
rename from meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
rename to meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch
similarity index 100%
rename from meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
rename to meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
similarity index 100%
rename from meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
rename to meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
-- 
1.7.4.4



