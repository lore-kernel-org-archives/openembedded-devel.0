Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nZ-0007U3-4x
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1545463ead.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=9lwtli+IEFlYjKeQfhzNkspT9JaTKxTOaeetBMEuhyo=;
	b=kBTP6xyVE1Bel0K/YzS0qZJGqNvTQTixuGtKRwwdHXvAZ2cOh+OhNbKA/EMuvr6SmZ
	9McJ6gHDx5gs8kiBJ8CHxYl+GaUR3RsRAmZM1Zc4motuabVEYZwAGjh0NdxEoTdQ5WwQ
	cykRwQkdhxJoNW5sEENn7cK6c93XBgn21kZkdRyoWkKSy4iImTF2hZ/7LJppbhrV8c/A
	1bFmv4cpshD9qr58kWs7K8F+495hqa4RumSbnXVbj2OemQac00W8YjPbCa392MEiagwh
	2xLVQjAXWSQDvElRQ71oEwf3Y9WRaKoQvfNGl2XrIk8bxgv3UOu0W2cOYbUTbqnXVtIA
	fM2g==
X-Received: by 10.15.98.141 with SMTP id bj13mr39386908eeb.29.1365859795528;
	Sat, 13 Apr 2013 06:29:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm16494150eeb.3.2013.04.13.06.29.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:22 +0200
Message-Id: <1365859790-20947-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 05/33] at: move bbappend to oe-core subdirectory
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/{meta-oe => oe-core}/recipes-extended/at/at/atd.service     | 0
 meta-systemd/{meta-oe => oe-core}/recipes-extended/at/at_3.1.13.bbappend | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/at/at/atd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-extended/at/at_3.1.13.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/at/at/atd.service b/meta-systemd/oe-core/recipes-extended/at/at/atd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/at/at/atd.service
rename to meta-systemd/oe-core/recipes-extended/at/at/atd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend b/meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
rename to meta-systemd/oe-core/recipes-extended/at/at_3.1.13.bbappend
-- 
1.8.1.5



