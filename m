Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkpa-0001Vd-Lj
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:39:03 +0100
Received: by mail-ee0-f50.google.com with SMTP id b45so3227875eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ha+7zHwRQ/sGAhr8wWiDOCTKSuamIuFoboXkmB9Gi50=;
	b=DV+m8Ho8DbbkFgFDzL6lUZjNfvFNgg7gMSCCkkt6gcmOaj/Enl5R3JZqOJjIDxsgOw
	aL+kdEvMDHOKB18VydKikwsmlp3xbrhOlj7o4k4x6xBz/FaKaKER3lLmSGv3lt3048nO
	woLdFd38trxXkHRboYLJo4xeBYw634Xti0wIuiuZoBJnAd1n0Rv4RbI94MLxJiLvS217
	XWjZmvQou5S+CFvw+deqiWnqSqv1nNAyx+hf0S7lgierxNW2+mPw173bKBMOOLd2rVMH
	w+mdqyUm+WtKXFH5LLAYt0Tpj4a3xDT4YBVQd3+fbYMfUJp68sGHoTJtLv3qNa2/v/8G
	X8Kg==
X-Received: by 10.14.215.6 with SMTP id d6mr47783172eep.40.1356265452056;
	Sun, 23 Dec 2012 04:24:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm34574400eep.15.2012.12.23.04.24.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:24:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:40 +0100
Message-Id: <ca769afc7918981ac6a66d1b92ea937ddb62b239.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/30] hddtemp: rename files to hddtemp for faster lookup
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
X-List-Received-Date: Sun, 23 Dec 2012 12:39:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../hddtemp/{files => hddtemp}/hddtemp-0.3-beta15-autodetect-717479.patch | 0
 meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-db.patch       | 0
 .../hddtemp/{files => hddtemp}/hddtemp-no-nls-support.patch               | 0
 meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp.db             | 0
 .../recipes-support/hddtemp/{files => hddtemp}/hddtemp_0.3-beta15-52.diff | 0
 meta-oe/recipes-support/hddtemp/{files => hddtemp}/init                   | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-0.3-beta15-autodetect-717479.patch (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-db.patch (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp-no-nls-support.patch (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp.db (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/hddtemp_0.3-beta15-52.diff (100%)
 rename meta-oe/recipes-support/hddtemp/{files => hddtemp}/init (100%)

diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/hddtemp-0.3-beta15-autodetect-717479.patch
rename to meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/hddtemp-db.patch
rename to meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-db.patch
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/hddtemp-no-nls-support.patch
rename to meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp.db b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/hddtemp.db
rename to meta-oe/recipes-support/hddtemp/hddtemp/hddtemp.db
diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
rename to meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
diff --git a/meta-oe/recipes-support/hddtemp/files/init b/meta-oe/recipes-support/hddtemp/hddtemp/init
similarity index 100%
rename from meta-oe/recipes-support/hddtemp/files/init
rename to meta-oe/recipes-support/hddtemp/hddtemp/init
-- 
1.8.0.2



