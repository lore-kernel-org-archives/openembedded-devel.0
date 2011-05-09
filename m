Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJVzy-0002sT-QK
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:06 +0200
Received: by ywg8 with SMTP id 8so2079853ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=c1HT42IZzbwQvWuV/3+S9gsTrG2fgEdDWNDeTO7/MIc=;
	b=ntbUgL+AzmKqgsyNLv0wKKrOVdHCYxzTPjKxhtHvSyloET6WAbfwZlJufhFqpK4sth
	P8JGQZAtW12c+8scptLYVxnlvaMfRJhXyT3vDSCyvJOuCThU2zDMXLFpeFGiZ7r42X3Q
	7eSQuFvX1DMSx4RaWGYm9KVeJGj1ASi2mVQ/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=TEoNnesU/W2VQ3Bm22DzEWUvP17BtdJ3T4TG8JYg/TqLTvXmUORtDyHUJfgRNRPCZ+
	8FEfss44fmv7EEbe7HytdMUQLCpKhZzCzgVlepI/saS+1W2udMjNP70K6Kbzya1n9R8/
	QxCChHbaf6l6xRL0vTMxXfn4JXryLhrdgwexg=
Received: by 10.151.43.8 with SMTP id v8mr5856350ybj.296.1304968638359;
	Mon, 09 May 2011 12:17:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:48 +0000
Message-Id: <1304968617-4949-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 03/12] setxkbmap: add version 1.2.0
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
X-List-Received-Date: Mon, 09 May 2011 19:20:07 -0000

This is in sync with OE at 6e7e35679200cd55264fae308cd5dec7ef2d1d29.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
new file mode 100644
index 0000000..2d153e4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+DEPENDS += " libxkbfile"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
+SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
-- 
1.7.2.5



