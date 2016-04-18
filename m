Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 82F6B6E667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:59:58 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id z133so24770994iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=S2Q7uMOrcHLxrbph28EZ9a5v1zQ7Bhs+koAiqQjLkS0=;
	b=CvXAe0CkGIC5lISfs3y7nl78iXMZvqJxIeXGMyPh9+XywKhy723Ov9OSFUcRM0Vsft
	2ngu4k8R1QAeMyWuF6T/gC1rEVgKrhrzABKw98Hyol5AFjmFMcPHs3qLbSfnBs07XgEn
	WScW0Nm+PXqckiV+VbiK0T/E9iHJ+aODd7/zSi95FdHzNNBNlCat/R75DiZ3KIiO2Y2O
	PCYZVdkyxk8aDJfn5zDNLQ6SPY/myMgUHO3oWXq+XPUHyAy4tQMAyBbtZhCau1WdnGA5
	q2lUwZ2ZJe0aO6nzmPftrup3fD904whUekOERJhd76H0kGQ/B80fjmGKpkr2D3wD7MGu
	Grdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=S2Q7uMOrcHLxrbph28EZ9a5v1zQ7Bhs+koAiqQjLkS0=;
	b=ayc7SUDYlvnYYXZiZeVOc1K+EHibkAEDQ/rE/ZCCSIaLjH+NP9Hq4k3NKleklfBEou
	HyiHh2omxYokylIUtjzVOlC9ij8Z4mqCrj21oamdyDP7ywuA7qsTQegWI36Svjofc09d
	BGRbmssCkuCptvghb09OwF9635aH9NmXPwt0QAsPeXhnnpenx8WQyYc5jbXOjsSv0fd1
	RWHt+w6nfdDvD8cO5MvSHfCGrAYCq+vy1WdALdyY83Nb75w3id83s013TMJKxdtdG0+O
	Xxnt+2tT/QVmjgXFUhsyUJKESnIdY/X0/nb7uRZUy+w3s+fEkuCMWWw4/gvWYrSED+6a
	gi5Q==
X-Gm-Message-State: AOPr4FVF3Ho1blEvA0zsFA4B7kzH7KIipPV2BXGMBobUOyS8MTBFK3SNeVy/v/oFqWJixg==
X-Received: by 10.107.29.132 with SMTP id d126mr39070841iod.14.1461013198853; 
	Mon, 18 Apr 2016 13:59:58 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	207sm22442437iou.33.2016.04.18.13.59.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 13:59:57 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 17:00:51 -0400
Message-Id: <1461013253-2350-4-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 3/5] libtevent: Update to latest stable
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
X-List-Received-Date: Mon, 18 Apr 2016 20:59:58 -0000

The update of Samba requires a newer version of libtevent, so update it.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../libtevent/{libtevent_0.9.25.bb => libtevent_0.9.28.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.25.bb => libtevent_0.9.28.bb} (88%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
similarity index 88%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
index aa61ea6..d0ad748 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.25.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.28.bb
@@ -9,8 +9,8 @@ RDEPENDS_python-tevent = "python"
 SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"
 
-SRC_URI[md5sum] = "8d01a2076cb8cd30cab40393d27043df"
-SRC_URI[sha256sum] = "fedeb0d55a11b3593b562ec09b32e44bd67619ed10e5fa10d1868adb1649c669"
+SRC_URI[md5sum] = "945845817918f5cfbe0202d80a7db118"
+SRC_URI[sha256sum] = "04d953379025b1560af5c4ffcce58a3ee84db7aaa09c9f1e3eff5b2945a13529"
 
 inherit waf-samba
 
-- 
1.9.1


