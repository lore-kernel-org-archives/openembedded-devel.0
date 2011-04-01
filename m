Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5XMi-0006nQ-9Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:57:48 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3489065iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 22:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ahuof86lOrrCoyvHWL6nJThB7qYPLD+JyKHfCkkqlSg=;
	b=e1iyExOwB7ZkiqMKEwrgEwys4mButHS/WY32ykSda7qYec2u+D8KPRq9kPz9hsTMxr
	rIsUV3jIqPdeoW6ljLfGsXkXeOIAMNVpxC3KPdN/akxH6FJ2GaU3ZADoqh89fH7+MqWV
	9MoTLdKJOLkT0j5wDFC6heFP4JpZBYeylUT8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EqmJp8RAr4zvzb0vmqNPq6alokXS+ULmL0OFxzwM/9OXfhYIbMppRYQtgXOBlElqrY
	+XaqUns2KqQeOcAiIeA4uJ4i2Vq6vq1tiGNTx5V+5Hx3PyyPo946H77kHC7qEJu2Ih1l
	WTfdur7tVl0rJABS/e4vEbdEOoKbcVyzuh9Dk=
Received: by 10.42.145.199 with SMTP id g7mr4390338icv.451.1301637349505;
	Thu, 31 Mar 2011 22:55:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id xi12sm1086554icb.6.2011.03.31.22.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 22:55:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:55:25 -0700
Message-Id: <1301637327-26825-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/7] dbus.inc: Add missing dependency on libxdmcp
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
X-List-Received-Date: Fri, 01 Apr 2011 05:57:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus.inc b/meta-oe/recipes-core/dbus/dbus.inc
index 40a670a..2ae5b1d 100644
--- a/meta-oe/recipes-core/dbus/dbus.inc
+++ b/meta-oe/recipes-core/dbus/dbus.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "AFL2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-DEPENDS = "expat virtual/libintl libsm libice virtual/libx11"
+DEPENDS = "expat virtual/libintl libsm libice virtual/libx11 libxdmcp"
 
 INC_PR = "r20"
 
-- 
1.7.4.1



