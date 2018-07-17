Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3E6788E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:51:04 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id e11-v6so3115773plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7zBfkvtQfXzC5oxaPZLxcIgWJVT6cATXWdjCRqTS5qY=;
	b=aHwgVuskWD5hvhhbjSw2idQU/DZHIw0SJ8PXPC8gSUDT6jzjmqkZzJu/4IKmUGKRwE
	TM8mPv7QBbFLqP+3UUYxDV4CpvmMvXtB+JyV5Oc8AioKeqN756LebfDoZ/CWl3rPgn/D
	B5lBYrh2Q2h0tixI3M6gkjFoDctH6lEz4IZsy7sVjOyu3MZn+obHNJJJ/vtN/pYILXbq
	LSAZNwMYgqZgO+rOBBuFv1ppRQzxCl1QjQh47uK5/YAb3vpfpoCNvHnYMhhKPIGJ1RqU
	Gl56S2E4xHlk1oqj73lD/lBmjqHxM1HXAV8GkwllGnMBN2qGolXbLAGA5ZA1UU99Dfp/
	1yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7zBfkvtQfXzC5oxaPZLxcIgWJVT6cATXWdjCRqTS5qY=;
	b=rO42pAgx0WutSjXCwweuA0vCjSdSYoCAsQj6wmoTmk+cwl8W1Q62hHyf8E5i7miFJp
	70JbWqJdFA/dNZp5u2M4cLGLwV2pQqM6dpi0CashFY/QaoXnbE+xPsq11Ry8ydEttYjy
	VJADG93N68DTBuXUq1sDU5Ybb4H9K9uuk409eVqIFJ/fv7DfIUpS2h5ouQoj3uftaxXo
	7j4utv1QzLdl/vrF0M7HbehaQ6ngJkxvwqTI5DoaiPz57c9aSPyoOWZUggd5jrs5UXxi
	k0g1unJchInQS/ggOWjmAa1xG+F9+fBMENIbk7LT7StL/VTbHZmYxEvCE1HxFcJ3f2mO
	WLMA==
X-Gm-Message-State: AOUpUlGdhJif2Tu+6qNRzMBb2WmLX/njw3gfJbHDMMFNuQ3VzAnoxBtC
	TMC04IbX4PJdSlf7Uva8dIAh4w==
X-Google-Smtp-Source: AAOMgpcG4HqKvNYtuMZXN5eJpcvz6bxeNm5MBhHnjMLj6R8W4VEfeCFSzfGcJIWovcu+C1JPBgB7VQ==
X-Received: by 2002:a17:902:b7c6:: with SMTP id
	v6-v6mr10466684plz.49.1531792265978; 
	Mon, 16 Jul 2018 18:51:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm27878586pfd.71.2018.07.16.18.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 18:50:53 -0700
Message-Id: <20180717015053.8191-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180717015053.8191-1-raj.khem@gmail.com>
References: <20180717015053.8191-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] rsyslog: Disable valgrind support on risv64
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
X-List-Received-Date: Tue, 17 Jul 2018 01:51:05 -0000

valgrind is not yet working on risc-v arch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
index d65a2be889..386ad32101 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
@@ -149,5 +149,6 @@ VALGRIND_mips64 = ""
 VALGRIND_mips64n32 = ""
 VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
+VALGRIND_riscv64 = ""
 RDEPENDS_${PN}-ptest += "make diffutils gzip bash gawk coreutils procps"
 RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-- 
2.18.0


