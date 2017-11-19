Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 98A7578766
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 18:41:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u3so5615496pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=294WSFK5MTTrSmIDdYVHlaZdnkO+VNqcXzwHrLn5IwY=;
	b=E25u1bhP4R/X5lJh9TfJwMI5haMW+HRnESxC37tzm5czMvGny35oGk+pmqaDB1JBWX
	yPqAo+k37gVnLAWfNU/o2RaX4Ns4S+nQv0Jt2+9IRTCkZ5209eCOA8Nf2XegwBi+x48w
	voq8HUePM+MEvlWEVeLyA0zyyEzSjX0t/NzEZE9alXQ7irJIXRVPGmrQ+ItDkhVQB088
	aZthZSQbBhTYrs5o+pO5+F0GjBg+cJRU8Mtb3ftZ/3eyHrDrpimbiOyhol8ayp6g1b5H
	ZQ/A8mLWEfHthmM60Yt1Pfv7h/PKH024Sv//kkhetwCeQ0LC0r8DLhdSonLePW3DtS7l
	3InA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=294WSFK5MTTrSmIDdYVHlaZdnkO+VNqcXzwHrLn5IwY=;
	b=JIMLnKH4TTVzyoTo0wS2PFOyqaLzDLkBGtx2Bj0c6JDz8/Rnr/Zz3fWIvCGKT0v3RX
	jnb/Wof5Vc7Tqa9YOjov3jP5uRS4pU4gsnvrJNSXg7N9/d+ml891sKrZ0KqOkwspcKlQ
	jZRUXTksKAnXBhvr91By5FtHQmYtYcsYRC/TmLFzOgDPjSsMoDZr8aS99oe8tngFQqrc
	rrCGZnuNlp5z+MzhZaoU57+dm2Hv5ah8gO4Qq62qqZbIF6MjS1r8ENEsv5Sw9nrswgpD
	rJSkfPATNdMY5Quh0z82lLdqiV3DeuqbPpd3AFIYYeGnyWaYgTZd6caJvjM4Vlq3hRVI
	OL1g==
X-Gm-Message-State: AJaThX4lGnTZBtrBtyUyVcES1u0a3h8cDqHtb0qN8y9jM2EvGW1z41j6
	Wgqyv0Bvtvo0LtH8mLlxEINesQ==
X-Google-Smtp-Source: AGs4zMabGB3BvnqvV0LolwRZB1XwVEvP1BGhpD9GO/Jutp/qdQA9mN5pt51rbQeMbluPwKoZQ8djpg==
X-Received: by 10.84.233.207 with SMTP id m15mr11342502pln.424.1511116901774; 
	Sun, 19 Nov 2017 10:41:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ed06:7472:604f:b02a])
	by smtp.gmail.com with ESMTPSA id
	s68sm1164971pfj.81.2017.11.19.10.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Nov 2017 10:41:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 19 Nov 2017 10:41:39 -0800
Message-Id: <1511116899-6122-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511116899-6122-1-git-send-email-akuster808@gmail.com>
References: <1511116899-6122-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] debootstrap: change license to MIT
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
X-List-Received-Date: Sun, 19 Nov 2017 18:41:40 -0000

The closest thing to a license is found in the http://metadata.ftp-master.debian.org/changelogs/main/d/debootstrap/debootstrap_1.0.92_copyright

The verbage looks very close to MIT so seems reasonable make to change the license to MIT instead of
creating a custom entry for debootstrap-custom-license. This follows what Redhat, Mandriva and Suse have for this package. (see rpmfind)

will fix: WARNING: debootstrap-1.0.67-r0 do_populate_lic: debootstrap: No generic license file exists for: debootstrap-custom-license in any provider

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
index 62b2796..8472aca 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Install a Debian system into a subdirectory"
 HOMEPAGE = "https://wiki.debian.org/Debootstrap"
 SECTION = "devel"
-LICENSE = "debootstrap-custom-license"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
 
 inherit pkgconfig
-- 
2.7.4


