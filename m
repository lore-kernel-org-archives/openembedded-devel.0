Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1AA78695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:35:03 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id 16so17969014wry.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=G/SJZnptx2Bw0mr6odm5GRJ2HiFh8ZDJO7KNaH/udwk=;
	b=odoQF5+H1UWEZ18A16nI3mTm9Y0U7gQkIktjksc5jRgjyfeu20rwFQUglhcbjKYuGc
	keVXLDmWAhb348DjR3CLL432/9EzUbDzzdp9WOKRYpqkYUbMBlNWDox2cz0HcAwSo6BY
	gODBU8TwQj0ezKGR0JjF6oDA1qvch6Q859IehfoUBSSGztcpY+Kc0tkEVuDzGHMzUH/G
	lT74W+iVAAZ3xy/rgPybb7mK/YJm06cC3KfdJl8B4X9Te5HKE7k8+rXs6fehOz6FaKXv
	99kw1AkoLgaqZ/mb7lySo4GA2jlAxZLKVNW4ghbYPZm5+r1aUpb96JSyXxX6yXlPf2Fc
	bDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G/SJZnptx2Bw0mr6odm5GRJ2HiFh8ZDJO7KNaH/udwk=;
	b=pUVrk6opL7ZNZjPgvEa2mS1iMmTODcHtdLiHWP/c4T6t6Cc+E2cooqjS/bCnbQxDpu
	pblmY+bEN0O/1MsdlVqVWdRl/Ef19RlFOdQKHw0KY3cZYhES5S3bNmfNtwM+fT0PIQMz
	gN6P3ptHDFanaYA17uAeetQmGdNoJfzCjNlC/hKXYMIkBB/dTO9+/1jyem6tIV2GzOvL
	rgUg/cpYhJd78RCwnXWCW/ktBdZIllWya37SzkPRvJ63N16CZkGQ7PLHzOszLj3EluE0
	hhxWMjb64swwON7486QrjdD4mACi9tWaDioWmo9Z0DGg8jxBES7iQjhQjkD1N/rZCFZm
	Ewxg==
X-Gm-Message-State: AKwxytfPhed6kBy1S4XLAAUdSi5ao7BZ+yCvflyWu/LsqcHvZFuBOUEf
	nGhzVDTv/nyhE+JR26PdM4j+3A==
X-Google-Smtp-Source: ACJfBoti7yHsVXSI0JP8a5eyv5oD+Ln5okB5g8Ao/XKlfFc1OdTIspSZ7p5aCk1TTqXQIKmRg4OQDg==
X-Received: by 10.223.136.110 with SMTP id e43mr1706198wre.98.1516178104516;
	Wed, 17 Jan 2018 00:35:04 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.35.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:35:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:21 +0100
Message-Id: <20180117083421.30233-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/14] xfce-polkit: fix Name/Comment fields in desktop file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 08:35:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without this xfce-polkit is displayed ad 'null' in autosatart dialog of
xfce4-settings.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../files/0001-fix-Name-Comment-fields.patch       | 34 ++++++++++++++++++++++
 .../recipes-apps/xfce-polkit/xfce-polkit_0.2.bb    |  5 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch

diff --git a/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch b/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
new file mode 100644
index 000000000..e872249d5
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce-polkit/files/0001-fix-Name-Comment-fields.patch
@@ -0,0 +1,34 @@
+From fb1f83c04dd5262897b09e60fa8b39090d0d4619 Mon Sep 17 00:00:00 2001
+From: Rex Dieter <rdieter@math.unl.edu>
+Date: Thu, 12 Nov 2015 13:53:03 -0600
+Subject: [PATCH] fix Name/Comment fields
+
+Validate as a valid .desktop file per
+http://standards.freedesktop.org/desktop-entry-spec/latest/
+
+See also issue #2
+
+Upstream-Status: Applied [1]
+
+[1] https://github.com/ncopa/xfce-polkit/commit/fb1f83c04dd5262897b09e60fa8b39090d0d4619
+---
+ xfce-polkit.desktop.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xfce-polkit.desktop.in b/xfce-polkit.desktop.in
+index 8575896..dd9f09c 100644
+--- a/xfce-polkit.desktop.in
++++ b/xfce-polkit.desktop.in
+@@ -1,7 +1,7 @@
+ [Desktop Entry]
+ Type=Application
+-_Name=XFCE PolKit
+-_Comment=Policykit Authentication Agent
++Name=XFCE PolKit
++Comment=Policykit Authentication Agent
+ Exec=@xfce_polkit_libexecdir@/xfce-polkit
+ Icon=gtk-dialog-authentication
+ NotShowIn=GNOME;KDE;
+-- 
+2.14.3
+
diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
index 1fb4a5be2..54bf7c752 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -6,6 +6,9 @@ DEPENDS = "libxfce4ui polkit"
 
 inherit xfce-app
 
-SRC_URI = "git://github.com/ncopa/${BPN}.git"
+SRC_URI = " \
+    git://github.com/ncopa/${BPN}.git \
+    file://0001-fix-Name-Comment-fields.patch \
+"
 SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
 S = "${WORKDIR}/git"
-- 
2.14.3


