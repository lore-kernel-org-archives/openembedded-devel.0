Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8701B9156E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 03:21:09 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id i6so847060pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FPD1svtOZmA0FgKuB7vfn73xqfY4CNZUSCSxSB3eMmU=;
	b=DtgDIIsaF9Yv6heSIisAvJITeHHq5tzv9ar9OLXKiP96duqd1JET6oPxkgMmygMuHB
	m7pAfJPHxWRZP0ISFulVB5zgdRzkE0gCkHDSOPzG8CvP7Fyb5IMKi4PJ2LRsFkrA6Lt4
	ioTMQu5t3hBYxBWNnGO4p7d/hKOh54KKvYAdi5kIMB4fM8q/gq5U9skoOKK9wutYw9cA
	atyvfEeAs6EdmWj/RAELifX3DC2Ih5MnPtlQAOCtpzYiIRG2nc+c1VC1UrZ5imTBmEY4
	Z9NrcpM/5yJ0jWF1ab1nDLirAlXXPfwD+czyyGA7Y5BswOyDjsMl7Pc+BLT/nrI73tTt
	+ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FPD1svtOZmA0FgKuB7vfn73xqfY4CNZUSCSxSB3eMmU=;
	b=qT5+MkEeSyzqrbwC1h75NxRyOlPT9AVCo7xhtBhZMIhIuP8KJNNUC9BJgVJSzhaph4
	Bkst8SFz9DSp9u1FVHd6tIubZxGxeWLoojvaxyYNfYY6sft/gAMgN+FXVs5T1wewvZDA
	cxEl4lEyqNtb7jJGgthFBQKMm9krWEWWvhMUzAOyTPJ/ihzjiwblO1rlBcGOgegckoHv
	ghp8cq7urTRDv3MbsYim0Amn3TJxCrt+6pZuXKsl6MufF6iPL2FBxj2JcB0vaLVaN2Ij
	3Vrnyo967XyN5gQWLaExdWOV/5Ddm2MLLtMWn3M03Bfr2tmSTEXKB6DLX3pLxR3Q5wX1
	W+kw==
X-Gm-Message-State: APjAAAU/lvSL6wQ0KCFh7ndL6teEqWTQVp/mNDwYcQFt8aXQNzOF4+qI
	GaduPxXZJ/eN2VX0kUK/vmzFPDVIMY4=
X-Google-Smtp-Source: APXvYqwSTUqFVavo6A97TDjckK/BLBlLpBYun8Sih//Saw9Tc7jsA+/JjIXoOj+aiU348Wv741Qumw==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr1612961pgp.172.1579749670322; 
	Wed, 22 Jan 2020 19:21:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id s21sm350059pfe.20.2020.01.22.19.21.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 19:21:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 19:21:09 -0800
Message-Id: <20200123032110.2360603-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/2] cherokee: Replace using BBPATH with BBFILE_COLLECTIONS for meta-python2 check
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
X-List-Received-Date: Thu, 23 Jan 2020 03:21:10 -0000
Content-Transfer-Encoding: 8bit

BBPATH check actually does not work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb  | 2 +-
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index 089c325252..f5d5debe11 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -21,7 +21,7 @@ RDEPENDS_packagegroup-meta-webserver = "\
 RDEPENDS_packagegroup-meta-webserver-http = "\
     nginx monkey hiawatha nostromo apache-websocket \
     apache2 sthttpd \
-    ${@bb.utils.contains("BBPATH", "meta-python2", "cherokee", "", d)} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "cherokee", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-webserver-php = "\
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index b31f4c430b..7424467946 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/cherokee/webserver \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd ${@bb.utils.contains("BBPATH", "meta-python2", "pythonnative", "", d)}
+inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)}
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
-- 
2.25.0


