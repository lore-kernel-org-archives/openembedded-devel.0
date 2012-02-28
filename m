Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nxt-0001cG-6b
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:23:41 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.99.195 as permitted sender) client-ip=10.14.99.195; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.99.195 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.99.195])
	by 10.14.99.195 with SMTP id x43mr11530693eef.46.1330438516153
	(num_hops = 1); Tue, 28 Feb 2012 06:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Iko+ipRt8fketFot7IL2STca9dUsD93ZsmKW77opmo4=;
	b=MXEbnI6THp3Pg5EPbFdkE97FKDYLxCzwuccQW4HyFPuY7hbcCRfEJWSoBhAQku3z/y
	Qh3V0hfflqfnHxcyJitieXUjAKuyRIiWtFZIaOvqF30cPnwxSfGYgurBT7viw2Nabc61
	Og+tbGiNcx5wnB+MmbwQe3qVn+PzUawL0GgTo=
Received: by 10.14.99.195 with SMTP id x43mr8557636eef.46.1330438516073;
	Tue, 28 Feb 2012 06:15:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm70818409eem.0.2012.02.28.06.15.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:15:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:35 +0100
Message-Id: <b9c83f9795be67bea8d833163acf2df952eb1166.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 04/14] ethumb: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:23:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ethumb_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index e309de0..ddf0e61 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
 DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-- 
1.7.8.5



