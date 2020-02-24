Return-Path: <3Q11UXgMKAEg6kuqyyqvo.myw@flex--wak.bounces.google.com>
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
	[209.85.210.201])
	by mail.openembedded.org (Postfix) with ESMTP id 7223B61077
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 23:33:22 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id r127so7678148pfc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 15:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:in-reply-to:message-id:mime-version:references:subject:from:to
	:cc; bh=WH0aLjmFJu/IF+W/jqo6InYCE4EU326VUsrmS5sA3YE=;
	b=M3suFGP7qjx7K83YIgNg9AgQC7HQqv0RjIGTo8sFY9xSj+tv0RQb6xNUu7qStz92vj
	tH4hOVWI4OSC5talmsth6+EZANY9twTNTfeLAGNID41SgwsQ2A7pxfHYisFjETS1gxJH
	sW6/og58nhEBD8GZMuNlu2FZoDZiuXkuKXCLKic+0JH25gnKuUfOIPubENTQupF0IJLt
	pk9RRt9K18gpmLQ6jPotTD8uYsOoWEhej3bYjMRAfUUm6CyCQsmHL6JQGxSpFOXpDb4a
	1MlqFdxF2lIYz/fa6hvqmj33vjoXj/WzWwkcJulv/QjVboxkNEI+Q/KKfx2c5DvgR0Lm
	/7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=WH0aLjmFJu/IF+W/jqo6InYCE4EU326VUsrmS5sA3YE=;
	b=tNlvP/U3FAk9g0Qt3BKWKSb646Ifdaw0ggaf7KnvtimFj2JLsB4cklvg4KQ0nVXaf8
	3Fxdxc8qvPtM6i0V8stEQUxsAhCoZl4tvAn8A2vUMcsNd0DnAS1w9YxBKVGnFIg6TeQj
	1CHUuAbf22cVnChsJkMNuaAfVT8gn8MQMrobrJTBU9vIjMUKbygMgz+SMzaTSpL4OBOh
	hek3mLO+d/fX9XGcK+m3N3Lo+w1fItdLTzHEgHD+GgxYxtnqxp2sinSd+S7u0AxC7mLS
	1n4BWX5QakkJehketMOHf0sfzx+bm+v0jWfx/MPQT0wUM1HzJ+yONt4Fc5cMaTE1lN0a
	mkig==
X-Gm-Message-State: APjAAAVjjC2GKikie4lcTwj1bsAr0a0KGZTZ9JAEF/uIyuPSMl0jS3nY
	diXVwNUMxhk1G4q7WGB+u8O/e3pXra3IfV+g4WmWvMCiktck8mqG5xs0OuMbisWQsMisKAizcwY
	ee/+NFhq4oy7zVkj2LimEiBG+KeXFrtFNGFe5l62ikOnN17uZzgPx0BEriVJqJ1iyt18Mj7ZV9O
	rXoS8=
X-Google-Smtp-Source: APXvYqzVybb2KE5vvJeF4ou5J/2yhkdXo/i0d5xmHmxRnoElIQVp8hHGy0DdwdFuuEzTe+BGIsHa3JM=
X-Received: by 2002:a65:645a:: with SMTP id s26mr53437921pgv.135.1582587203249;
	Mon, 24 Feb 2020 15:33:23 -0800 (PST)
Date: Mon, 24 Feb 2020 15:33:12 -0800
In-Reply-To: <20191018234515.15676-1-wak@google.com>
Message-Id: <20200224233312.223960-1-wak@google.com>
Mime-Version: 1.0
References: <20191018234515.15676-1-wak@google.com>
X-Mailer: git-send-email 2.24.1
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] span-lite: Add git version
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
X-List-Received-Date: Mon, 24 Feb 2020 23:33:22 -0000
Content-Type: text/plain; charset="UTF-8"

We would generally prefer to use stable releases, but there are fixes in
master that have not yet been released for compiling the test cases
against libc++.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/span-lite/span-lite_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/span-lite/span-lite_git.bb

diff --git a/meta-oe/recipes-support/span-lite/span-lite_git.bb b/meta-oe/recipes-support/span-lite/span-lite_git.bb
new file mode 100644
index 000000000..96ec829b7
--- /dev/null
+++ b/meta-oe/recipes-support/span-lite/span-lite_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "single-file header-only version of a C++20-like span for C++98, C++11 and later"
+HOMEPAGE = "https://github.com/martinmoene/span-lite"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI += "git://github.com/martinmoene/span-lite"
+SRCREV = "e03d1166ccc8481d993dc02aae703966301a5e6e"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
-- 
2.24.1


