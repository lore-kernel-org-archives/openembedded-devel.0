Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C36174D49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:49:47 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id t17-v6so250462ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wDLkiJR8tbWDaP7uMPwe/G8Z3GMgXsyr0ogy2E367G8=;
	b=VOZO46AbYhyyZi4uMbMlE58EFFhcJ5T4jxStdIq7MMxYGyh0F9lHF9XoZC+a9zeByx
	dKKTea6Ww0lWAb2nT6W9HcEHscNKXG9G4Wuvnm6Uy2/TKO4zhWtxOqlAU/Nf3isq+1Be
	WxXcaGoyQdM95L5gr0ElpQfdb/SOVhonDkjWfJ320y1bHakcKb/Em5J3ZMnxgcwuD1jj
	9y1U7ng78Ne77bBk9z6Zn6fwikK2CTLdU4pkdplDX//wYmzwADoWGqQB9JbMZszJLtq8
	Gz1CuTRFM+kQjfxyNVkuw732eBJ2lLTfhzogyklyBTlg/uRfE5gnqgWWZPMpo422uknN
	sCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wDLkiJR8tbWDaP7uMPwe/G8Z3GMgXsyr0ogy2E367G8=;
	b=UZhKcoE44ZEJyBa2pGSjq0E3L1CdkxxMvEGR6mgaW54D01EmfA92GCACgVShI7h7nT
	XlGjJPjjP+puWDCER1OcJYJibqM7/+y4wdr+5aYmUuq6VUMMWOXGf+C/4BWsgXhY2NeI
	fjbgQ2gLQmOB0GbqaIDBzDmR3zW0ppS5EmcOXOf3btpz7/+Rx2sOWMhhLZJUu/m44VZ1
	df289+nyGwQaheJxBQ2bR0avHtKPvVjUsj46cryRzm3ItptUnnA79ky5jm59wU0ax4yC
	R4HOHptMyRJOzz4ng9u7TQyBU3+9oRY8jqKRy+vzWZ0M0WK4PU52clPhUbcHCy5sTl9k
	ys1Q==
X-Gm-Message-State: AOUpUlGssVeOI3+oEcCpz2p4F/bnRa3bgXZTqtPe9zeyvq8QBtw6Vxny
	GTXvKvQS/D9tKj7S5XDdhkDakVLfpLbR
X-Google-Smtp-Source: AAOMgpeogoJwpAuJACmphMVIeQyeP84WjqwQeZoKJ2x1dVYFsFNArsaeL1KR6KvJ2tSYLJaSg2zzdw==
X-Received: by 2002:a17:902:1ab:: with SMTP id
	b40-v6mr12683087plb.55.1532353788464; 
	Mon, 23 Jul 2018 06:49:48 -0700 (PDT)
Received: from localhost.localdomain ([116.7.218.38])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm4182356pfm.80.2018.07.23.06.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:49:47 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 21:29:46 +0800
Message-Id: <20180723132950.4543-3-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723132950.4543-1-freebendy@gmail.com>
References: <20180723132950.4543-1-freebendy@gmail.com>
Subject: [meta-oe] [PATCH 3/7] python-pyperclip: add native and nativesdk
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
X-List-Received-Date: Mon, 23 Jul 2018 13:49:47 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyperclip.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
index 205038be8..4ee47eef5 100644
--- a/meta-python/recipes-devtools/python/python-pyperclip.inc
+++ b/meta-python/recipes-devtools/python/python-pyperclip.inc
@@ -10,3 +10,5 @@ inherit pypi
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-ctypes \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


