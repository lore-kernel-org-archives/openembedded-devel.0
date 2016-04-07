Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id A33CA771B7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Apr 2016 20:17:14 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id i125so7976202ywe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2016 13:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SkhnzDxhgew3riMF08M7qcxz5YeC+4JVBIR1lnB0Dvg=;
	b=g0keZi07iN9FqLYD8RzrWvrZEIkTlBD7hiAfNTYgpNhzEkwFSy3SBR5KgeTG22pgtv
	68U3zuaEF1AhytY2cy4A3i3UMD59FJFQPeemSsk/9GVNRYZyC6/9F0NbomFe0tUKLtOS
	QUga4EG/5iF6+qkZiS75n+fOR4s+8E2tnFlp0ghLFx8nYlYDh2AydDuLnzkgzCXGXOEm
	g0ni6yLvxFAgxzE7iDoKpDW13uUt2QYFpnNiq9TqquGlERsstoNgI6gfpchlEWVvHgUM
	UXYykxTqL5GJBpanyHZJ34psAclJL6+O4NyHRPOvU27GoPkzpVWBbbFjCsx5dhGIwU8h
	bO8Q==
X-Gm-Message-State: AD7BkJKFZVdAVPlThmMmJd2jqrciwIVtk1oEnCa+X5Z6mw06DEpRF8Nla+SZq51vKTvpBw==
X-Received: by 10.37.34.69 with SMTP id i66mr302796ybi.167.1459997333816;
	Wed, 06 Apr 2016 19:48:53 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:16 -0400
Message-Id: <1459997302-25271-5-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 05/11] libcurses-perl: update to 1.34
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
X-List-Received-Date: Sat, 09 Apr 2016 20:17:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libcurses/{libcurses-perl_1.32.bb => libcurses-perl_1.34.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.32.bb => libcurses-perl_1.34.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb
index d78ca47..e7e9d91 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.34.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a
 
 DEPENDS += "perl ncurses "
 
-SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tgz"
+SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e4d9066bfc5a69cb2cee3e1dfc3209b3"
-SRC_URI[sha256sum] = "5dba44fd7964806d9765e6692bc7eb8eb30aeced2740f28b9a4070a5d14ba650"
+SRC_URI[md5sum] = "874c2103cc53552a0faa371c4d9119f6"
+SRC_URI[sha256sum] = "808e44d5946be265af5ff0b90f3d0802108e7d1b39b0fe68a4a446fe284d322b"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
1.9.1


