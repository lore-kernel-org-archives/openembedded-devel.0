Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspk-0002gO-9U
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id l10so390368eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9swMZTlFceE3OAHe3JEGn22yXKSUqFeA1TZ9/6O+xHo=;
	b=CLj1sq/af3IWxOq+KwXayWU2jOiyLZ8DAV6MdPT6V0vkj37dVxfb5grm5UhV3FkZc1
	0amVIzByE1Ubpa4GtkNOfyPK4cPS5aGjF+ISraVOGN89oddCGb3Cg/yjPPzfVAm3rrKD
	PpLLISD9ZvaUQb562Sx+mHkMTvTZs+YxkM5gp77iCar3h0FxnoycBnmyQDtuWj3XYQ6X
	dVHC17/gUsTCUx1OiRce6bXSw9jAof2zFbcjOHi/yBEUt6kbVd8oSmM+MqllQPqEXUth
	tvpR3FjxYcNSIYkAXl/vuiTRGeQJZoyuEZrhyZM4n5bi/EDgHejolq4ZNIiNofGtgDfw
	Pc9Q==
Received: by 10.14.223.199 with SMTP id v47mr62409940eep.45.1352721351830;
	Mon, 12 Nov 2012 03:55:51 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:23 +0100
Message-Id: <1352721267-367-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 2/6] gvfs: fix build
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was for build from scratch and latest heads:

| ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
| Rerun configure task after fixing this. The path was '/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gvfs-1.8.2-r7.0/gvfs-1.8.2'
| ERROR: Function failed: do_qa_configure

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index 903a8ba..e86c93f 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit gnome
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
@@ -14,6 +14,7 @@ EXTRA_OECONF = "--disable-samba \
                 --with-samba-includes=${STAGING_INCDIR} \
                 --with-samba-libs=${STAGING_LIBDIR} \
                 --with-archive-includes=${STAGING_INCDIR} \
+                --with-archive-libs=${STAGING_LIBDIR} \
                "
 
 FILES_${PN} += "${datadir}/dbus-1/services/*"
-- 
1.7.6.5



