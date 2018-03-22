Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8C778934
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 21:37:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s18so10164155wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=COW/6791UIq6eM5JvioO8vGdH7DNV8l3Vud8uPlbZVI=;
	b=AHX8FZXy8uepyhlvENtY+JT1MUQxVAJfmhzhka+bFXQwp3tlSy4qTl0K8khn7DVB36
	lsUzY69Rgr2t70HRTaM59Ky9DmbJnDmh9YqKL2o5JTlZbWpJ00aYMCRlX9YvABWOkagW
	udme2hWEr2MdF0cnO1dJzFUiHpgBN7R5NwW+UU5D94YMmZsAGA3GlWhQK4WOI7ZNIehn
	f64nc2JuhrKF3LuxWYArT35voEReUOArZ4wsMuajVuEmI1zPj7ir5tSVerUNYZB9Qpia
	CiSySW6Z53v9y20ab0Lp7q54WH3QMgOFEMn9AS+BHnRp6YZBE/0Xd4Tg7NwMDHAGqdIG
	Dv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=COW/6791UIq6eM5JvioO8vGdH7DNV8l3Vud8uPlbZVI=;
	b=TfwtCove8IrqzvgVRlFpB9fmDLhJLaG9Z6UnuVX0ULmG1cEmBHJhM+101aAD7cSk3d
	ehnaWrvLsGamp/sIxKfZdRooOdC+lKtu7Kg9HzlqL5ybOnTBRV4Zk+uV1S6H3H7D6VqJ
	wylU/u3o3h1acbn0o1U5wM7oHCUs0q1rZDW5frOmFhN1S6WFkCcpZJYpKE4EyDzuEwg+
	FAZzFxFNtU2rK28DlNi9w9m40uql4a3DaBqVXuPhqeQk2ZCoEREDq+MlNc7rUmd/8DlJ
	Yt7Qnr3qTdqmPcvNVQ+22eLQEymVLX0tqqwKwDwr5uRmZM7cRz409IkyghYwmt+q9k/C
	xa9Q==
X-Gm-Message-State: AElRT7GAsqWdDMRHlxmWR1jOSMvOpeWzwJXmTCTyR8iNvOuTavJdI4l0
	enmPE262snhpgo/oqxZ5Wns5hg==
X-Google-Smtp-Source: AG47ELsS22R2/OKzcDeziycdfwJXWdAQB1b64mn3pofEbr763z6q1aSz3fNOKl137kYuWutJ0AJ0hg==
X-Received: by 10.223.225.210 with SMTP id l18mr3006497wri.251.1521754679808; 
	Thu, 22 Mar 2018 14:37:59 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111611E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1161:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id m7sm7558897wrb.86.2018.03.22.14.37.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Mar 2018 14:37:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2018 22:37:41 +0100
Message-Id: <20180322213741.29876-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180322213741.29876-1-schnitzeltony@gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libunique: move to meta-xfce
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
X-List-Received-Date: Thu, 22 Mar 2018 21:37:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are the only recipes using it still and I take the maintenace burden

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch       | 0
 .../libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch    | 0
 .../recipes-extended}/libunique/libunique/build.patch                     | 0
 .../libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch              | 0
 .../recipes-extended}/libunique/libunique/noconst.patch                   | 0
 .../recipes-extended}/libunique/libunique_1.1.6.bb                        | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/build.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/noconst.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique_1.1.6.bb (100%)

diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch b/meta-xfce/recipes-extended/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
rename to meta-xfce/recipes-extended/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch b/meta-xfce/recipes-extended/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
rename to meta-xfce/recipes-extended/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/build.patch b/meta-xfce/recipes-extended/libunique/libunique/build.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/build.patch
rename to meta-xfce/recipes-extended/libunique/libunique/build.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch b/meta-xfce/recipes-extended/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
rename to meta-xfce/recipes-extended/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/noconst.patch b/meta-xfce/recipes-extended/libunique/libunique/noconst.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/noconst.patch
rename to meta-xfce/recipes-extended/libunique/libunique/noconst.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
rename to meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
-- 
2.14.3


