Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyle-0001n9-G2
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:14 +0200
Received: by bkcik5 with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3QvgyVUmFW0jB5PaXzHbWjxAe6YoUyeW+7qy2NExNRk=;
	b=jnynw70uzCJ61tudG9SGbixoVPxJzaY9dNeOKNJ2q+DSGekQtBcsAOkQXhI0ImjiH7
	WP/llRUgZNgH6/U0Ha7RgLX8AGl8tGzIE1OjRV0s074O6vG9bibFOcUET52GKJOpr2Ie
	ZpS/mhKKsibcfF2tVIZRPg+p/3D2DmSPYaku6IquJPRtjtgcUoOvZVWR0JYTzvy7zVFK
	ILaBGQbeHtZt25eEZmky/ocCiqwqzyPBxR1j3UaUlpwtKG0gvTw93iQGBbzjpSlM4Kyr
	c983jex1sC4onOU6CjcLZMWyjqjV+IFdkgng2FRXWGZxEk6djSoluaco5+8iLoQMN3hZ
	7Ovw==
Received: by 10.204.128.214 with SMTP id l22mr152817bks.86.1347977674682;
	Tue, 18 Sep 2012 07:14:34 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:55 +0200
Message-Id: <1347977601-28665-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 14/40] packagegroup-xfce-base: no need to RDEPEND xfwm4-theme-default - xfwm4 does already
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-base.bb        |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index d091e92..e42ea3c 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -12,7 +12,6 @@ RCONFLICTS_${PN} += "task-xfce-base"
 
 RDEPENDS_${PN} = " \
     xfwm4 \
-    xfwm4-theme-default \
     xfce4-session \     
     xfconf \
     xfdesktop \
-- 
1.7.6.5



