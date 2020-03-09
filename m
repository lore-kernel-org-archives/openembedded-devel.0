Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1E8260AE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:37:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id f16so2260540plj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D6hr/RWgE8rkLeRY5bij3YDOo2ROWNAgBgnk1kjIIiU=;
	b=R1xQeD22y8NeBoQMErASo1mE12UbkRPqzqDWp/Ccaf6U0tdETbiet+Xfaeh67L5V/7
	2wPLrYeL9BXIQgZz3OUkziiWKGUNLEUnH3ttgIpJj+PU46STnaYL5P/IOxee/rDLIB8A
	1Yf8X/U11ENExbW0HJQL47ez/7+MMHbuWz3K6hOFHgK/Jhgk3ftAdJus8Gc8AL9APsvm
	qFbJaI5cURJ22rRC6Ufhv7sSVBuOItqzg9tCM8p0dHw0D08dcG+GDx4iSxWtqCalfbjx
	UgfFLWoN1K1EzjZjh+HAZjG9nw0RDX5O6LZtQf4J6bWWTLZ2FrKuLdnqesSrej/HFkoN
	qSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D6hr/RWgE8rkLeRY5bij3YDOo2ROWNAgBgnk1kjIIiU=;
	b=Xw6vjcVMMIdBXk95OcPtGf5qW1H3JLK2Q6Qe0SSHyWcp+7bScyDGgTZ3HGqOSYVdBJ
	zm5kh5E/+q8vC7c2OJJnvs9byTDYepFZLcgENQo4ZUkNfPWcfkhDdE/rtVQ/T8AjKAO4
	MGUHiWDQmp+QKSajeWugAr7gRQwZzOJe6bL+VcgqFAfjt4uyoz8mqJNyWS/Ehi9kwxsB
	ah5Wb8oUtsF6Wg3AePb/Be5TAoJv25y4ezKt1o1FnbaAqZBMbNiRnVRERHtkeVCePq1V
	1jQXDMZssW5QkaMecTLrjLW3PPx2Jagmblr9UWPwc2WkbHgZtxfniIgWqg9reqnR/L8O
	xkcQ==
X-Gm-Message-State: ANhLgQ0EUPOotS//ymTyiQON3G7pS7AMRNts9zchhO0zJXCqOrdR4VZ3
	Rqyt8R7ar22Maj3EiilA8raJof94z64=
X-Google-Smtp-Source: ADFU+vtu9jeOjXUx18Ib7lEcskJWgHrQXcJ3l6DYgrW71HN6wP5wUxPoOxNRNm79OsG5qi0lyEMwLQ==
X-Received: by 2002:a17:902:ac83:: with SMTP id
	h3mr17253176plr.86.1583782622382; 
	Mon, 09 Mar 2020 12:37:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	s11sm16221436pfh.7.2020.03.09.12.37.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 12:37:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2020 12:37:10 -0700
Message-Id: <20200309193712.1028142-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309193712.1028142-1-raj.khem@gmail.com>
References: <20200309193712.1028142-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] abseil-cpp: Depend on libexecinfo on musl
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
X-List-Received-Date: Mon, 09 Mar 2020 19:37:01 -0000
Content-Transfer-Encoding: 8bit

Needed for execinfo to work
Fixes
absl/debugging/internal/stacktrace_generic-inl.inc:14:10: fatal error: 'execinfo.h' file not found
         ^~~~~~~~~~~~
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 115ffc69f9..b6ea5fdecc 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -19,6 +19,8 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}                \
 
 S = "${WORKDIR}/git"
 
+DEPENDS_append_libc-musl = " libexecinfo "
+
 ASNEEDED_class-native = ""
 ASNEEDED_class-nativesdk = ""
 
-- 
2.25.1


