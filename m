Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQytF-0004e0-SO
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 13:45:23 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so1602162eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 04:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CzOyqC7he3yu8sx9hY3RWxh1P5MO/BGhW7o/jNfjsjk=;
	b=RZQEJ4bmSvQvYMEQyly8zHAaOJLm0y6eUKlk4lGLkG10STj+ETQMNPZzhSN0NZ3qw8
	Oq/5GooUMLayx50UUYTJgUStSfIatFHomzazRlm0GGVvUfbagrDGcfoLhkIkKi/+53ks
	0Hc/OIPmG/LubInXE3wkO5qhDL+G0DKZLPCeLlcmWMGrNJ9OeWKKFYyZqrp3LTXa1kmG
	Q3xBQABvnkG2yiglibkCF/usPiU6uJErflmfN1WO9YnRvJLxMCJ+qnQYZfnSzedsK+9R
	y3WWC/VbylGJFcgytTVfR/j3ri29qX0bNnGvR98U9OdVAsysmtotys1wnaMwAd4H8HHc
	AngQ==
X-Received: by 10.15.43.73 with SMTP id w49mr38758295eev.12.1365852460269;
	Sat, 13 Apr 2013 04:27:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j44sm6412131eeu.10.2013.04.13.04.27.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 04:27:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 13:27:37 +0200
Message-Id: <1365852460-3361-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/5] keymaps: move bbappend to oe-core subdirectory
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
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000

---
 .../{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps/keymaps.service      | 0
 .../{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps_1.0.bbappend         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps/keymaps.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-bsp/keymaps/keymaps_1.0.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps/keymaps.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
rename to meta-systemd/oe-core/recipes-bsp/keymaps/keymaps/keymaps.service
diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
rename to meta-systemd/oe-core/recipes-bsp/keymaps/keymaps_1.0.bbappend
-- 
1.8.1.5



