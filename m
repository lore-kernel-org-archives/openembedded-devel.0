Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc4-0004XG-4U
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:40 +0100
Received: by fxm17 with SMTP id 17so12727979fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=VnSmnkiIK9d2l494GTllIEngLbcdXlKyurFLYQCnOmg=;
	b=tJvWaqKdSr1yTVxoK/7nw9xm0SbyqJXZ7F5X7HSrlBpvkpsxYzIHsvY9ZK44UyLhsL
	WoW5lDtgX7/gCtFuy13TsASueje9wxYKN9io7eeW3fPOVmBuOO6EkBgc2K9Y8lG7PXZl
	148s6C/otcFLNscJ9c6m+aJ35bjyJdQhfW/Rs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=TBqwAZeAi/xYVk76vum53FJ6Pa2iDECn7xJwZ2ZqhoGmf4IER59G5adZRnKtfJNd13
	ayhiDX6ETrVGVaR1uhiV4N5slBzIToa85+IJjXHU0yqkQZT87shQLG1k1O4OBKPeK6D9
	JDHCYRoHGtnvIffZHxwcmCGVPyJl8f6qqg37g=
Received: by 10.223.97.72 with SMTP id k8mr5678667fan.65.1294084938238;
	Mon, 03 Jan 2011 12:02:18 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id r24sm4883224fax.3.2011.01.03.12.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000ok-Kq; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:01:55 +0100
Message-Id: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 01/12] gstd: fix type in RRECOMENDS
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:40 -0000

/RRECOMENDS/s/COM/COMM/

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/gstd/gstd_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gstd/gstd_git.bb b/recipes/gstd/gstd_git.bb
index 5e73662..4617b85 100644
--- a/recipes/gstd/gstd_git.bb
+++ b/recipes/gstd/gstd_git.bb
@@ -25,7 +25,7 @@ do_configure() {
 }
 
 RDEPENDS_${PN} = "dbus dbus-glib gstreamer gst-plugins-base"
-RRECOMENDS_${PN} = "gstreamer-ti"
+RRECOMMENDS_${PN} = "gstreamer-ti"
 
 FILES_${PN} += "${datadir}/dbus-1/*/*.service"
 FILES_${PN}-dev += "${datadir}/dbus-1/interfaces/*.xml"
-- 
1.7.2.3



