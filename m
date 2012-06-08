Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrR-0004PX-46
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:05 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=DVPLsC8ddrPfWvFlTt7RDaanjTQnnEAhF/PvR3o7WG0=;
	b=mGEqtKHyqJ5kF9WBhEiuxQ3UuFQsug1NZnesoaoO+ytW9rqWt2jeDqiiQWD7H8zGtB
	jjfa924EVSmZFSV3TMg9gGjw7WzLUqouiCT27eqO2f7ggsSuFU9C4Xcl34uNUswN63l8
	efj+5xiUqmz5G6ThVsj7QPWqYHWA9a8SQ4Ofc9eIY5hc0wXnYe7AdDriJeFunl0YZCoc
	Qx+vhXT6mTgxpLHw3ouJMYsSnEEOQHBvKJG736QLfCI+SEnc+LMqAwK9XzMPQCN181Sx
	IbnKDvRwODcor38gOz5JQPtDhdsUPfWFT8D1uErXVZRJgrY+yfd6Ts7dWrKaENwrCu+3
	ZE0w==
Received: by 10.14.119.6 with SMTP id m6mr3747829eeh.165.1339148497643;
	Fri, 08 Jun 2012 02:41:37 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c51sm20201220eei.12.2012.06.08.02.41.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:40 +0200
Message-Id: <1339148443-9467-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmXdm22dnSoyg8uPiBsCH6MNzlMfTO/bZsBmXWbLl5XnPqWeDxfKcqD5l3vlyeVkgQ8l/KQ
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 11/14] owfs: enable/disable modules to make build predicable
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:05 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

We enforce the avaiability of w1 kernel support and owfs filesystem
but disable Perl, Python and PHP buildings for now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
index 451aaae..d7c5040 100644
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "fuse virtual/libusb0"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
            file://owhttpd \
            file://owserver "
@@ -19,11 +21,16 @@ inherit autotools update-rc.d
 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
                  --with-fuselib=${STAGING_LIBDIR} \
+                 --enable-owfs \
                  --enable-owhttpd \
                  --enable-cache \
                  --enable-mt \
+                 --enable-w1 \
                  --disable-swig \
                  --disable-owtcl \
+                 --disable-owphp \
+                 --disable-owpython \
+                 --disable-owperl \
                  "
 
 do_install_prepend() {
-- 
1.7.10



