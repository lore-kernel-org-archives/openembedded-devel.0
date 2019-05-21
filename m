Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id EA73A7E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:52 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id a3so7846324pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pnNgV+nfQjeNyANiuNirOAUJI3gR5qeDC/EhfLxWHZo=;
	b=VRmk4LTbw6mS9Gmxc1yxxkL+CBNhBP5D13O4Mel4cZ3cqyta8ffNxjv2ius4nzHeZq
	0StvsmgGs7Oyygxm/6tn0/kH+po+9dNlwFHnqWQBUxdjIqVh+DzLP5nGCJVMReJPRDzC
	AlPxE2XVjZUyvDEbgz/YUZoYVn8AcfpnyeXeZqSo3kZZpAUei0uLcgRyu+8aHzgitl/B
	UgOIkNOKAq7S5BjOKWmNXVaTin9oSaQdrupFn0hGzKyMgO47WAa6hgatV1khIZg2pQIV
	CiEEv9YJ3n67wsKCnXHNyU6SljN8UQhs+QLuhsqKMQ3mYPCK558iiZ05FyOLc5CYD3/+
	j4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pnNgV+nfQjeNyANiuNirOAUJI3gR5qeDC/EhfLxWHZo=;
	b=Rtb1ZoeGoQM8z1Rh+7KwmPh4mFTriK9H+ZcQmuvzt6wL3nDFoz102s/sZ3BTfAGFMJ
	Df1JzvzFS6RPHRkYgklZWBIfKeFiWEyayJocCZqw+19Er9mPhUsMKY3FCxobkkgyrL+o
	mbGJNHQ5JNk6do5Z0mx22mQ5fg3K7XZwuzxu3w4aLD6xYRTSkRKqqIoQZjsQxzA8jA/R
	XpPepEw6XnN2n2XreqDFkBwjLwcDz1DZfNBnx9KJzh1Xn5Uj6U1BrAW1ZkIRj5VEG6g6
	BvwCbivtSUdOBzgtPjVM8XIHlZ26j/gHkABqMMBSPUkeNSKNLK6WAHNuY5gJ8+5aAzEd
	p5mw==
X-Gm-Message-State: APjAAAW2YvxkVhhn9ITiSLRKdeJErYt0rd+jtKiISC0yrR5dnc2wDBSW
	iNh+GGHoP6IA4s1jOBYBueBEbN8y
X-Google-Smtp-Source: APXvYqz7gYnqdTrWZRiCKWIpwSY9D9yoR5+t14K9dnqFvW0TLpbdDzk3VJmsFVeRCxPN6ezS4ONLww==
X-Received: by 2002:a63:c106:: with SMTP id w6mr76092188pgf.422.1558411014071; 
	Mon, 20 May 2019 20:56:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:19 -0700
Message-Id: <94fc8dac7817a44eade72d639691bb86f5d526ad.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 19/34] pmtools: use update-alternatives for acpidump
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
X-List-Received-Date: Tue, 21 May 2019 03:56:53 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

acpidump is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:
...
|Error: Transaction check error:
|  file /usr/bin/acpidump conflicts between attempted installs of
pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/pmtools/pmtools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
index 8491fc9..9afcbbb 100644
--- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
+++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_${PN} = "acpixtract"
+ALTERNATIVE_${PN} = "acpixtract acpidump"
 
 do_configure[noexec] = "1"
 do_compile() {
-- 
2.7.4


