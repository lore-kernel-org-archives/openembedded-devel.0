Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmH-0000Dz-Ht
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:10 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so1641847gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=qc3XzUau0m52Ztcstk5lNxlZOrseU+sMt2ut7fZeMEM=;
	b=B22Yr3/vpAIufFLeL1rncKpeWQ66cKQltiYLj30ye+6z1RYvLIlloj9JB/sRDHR249
	HEauPZv6rB7TPlJfJpnSl0pDiSDfnsjGwqniTb3U6E+hIhaB444mDkIfWcc/Guewbn/N
	F1IQwu1Gv6l4hrW0jBDQjZBCc43OFyDB9R42E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=OLW57PPgb74DCPnm57Lfvj+5ygJIYzIxrNO68gUVeh7CL76BrUYjnngE133fxK3ZCY
	DHfs6LdyU3Q0qkBqPbpbRI0a8uypRWvrWiFDBQtg6bBQzFgdu3vx3lgLmPX5+eHWR2hq
	cy161F1xv8yI0RqdKyIkTG71UBS3G95zJXQmE=
Received: by 10.236.130.207 with SMTP id k55mr6141055yhi.354.1304806347715;
	Sat, 07 May 2011 15:12:27 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:53 +0000
Message-Id: <1304806316-9716-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 5/8] pixman.inc: use Xorg mirror
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
X-List-Received-Date: Sat, 07 May 2011 22:15:10 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-lib/pixman.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman.inc b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
index 539a33a..5661fae 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
@@ -7,7 +7,7 @@ DEPENDS = "perl-native"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://cairographics.org/releases/${BPN}-${PV}.tar.gz;name=archive "
+SRC_URI = "${XORG_MIRROR}/individual/lib/${BPN}-${PV}.tar.gz;name=archive "
 
 INC_PR = "r5"
 
-- 
1.7.2.5



