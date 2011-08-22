Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1QvbSP-0004n9-9d
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:50:53 +0200
Received: by mail-wy0-f175.google.com with SMTP id 19so4033077wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+lnDBGDQA2HANZx7SitNafTnuO6lsnKPsbq+ETIMKbA=;
	b=Q5WZNTo3csdDiEAB+sxjPIDyzjimScFqnpSSf3uz2hDL2GtrRFML3BkG8KNxsCJ/EX
	watFofPtNZHBi4flBFyLiTztdOFuGjl39oJpo7rJ08C0kcsRWSK6GzjclkQzOShXoYFP
	NOyAE7iE7Jui0f08ZVlMtpPUUkuPznYBrhbNo=
Received: by 10.216.4.132 with SMTP id 4mr2456399wej.49.1314045971177;
	Mon, 22 Aug 2011 13:46:11 -0700 (PDT)
Received: from localhost.localdomain (169.pool85-50-86.dynamic.orange.es
	[85.50.86.169])
	by mx.google.com with ESMTPS id j11sm4192267wed.18.2011.08.22.13.46.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:46:10 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:45:08 +0200
Message-Id: <1314045908-21970-4-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
References: <1314045908-21970-1-git-send-email-pespin.shar@gmail.com>
Subject: [meta-efl][PATCH 4/4] enjoy: Add gst-plugins-good-autodetect to RDEPENDS
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
X-List-Received-Date: Mon, 22 Aug 2011 20:50:53 -0000

* This plugin is needed in newer versions of enjoy. The app won't play any sound files without this plugin.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index d2f6b03..8c4d4c2 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -14,7 +14,7 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #4th needed for flac playback
 #5th needed binary to create db
 RDEPENDS += "\
-       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 \
+       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
        ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
        gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
        gst-plugins-good-flac \
-- 
1.7.6



