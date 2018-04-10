Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEC274A1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:22:42 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 59-v6so6215715plc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/k8w+92MwnUR3bhD9AlprasljyH1NoRRZIrNgvfCyWo=;
	b=J/lxc0QTp20ISiNGBD+VIKtrzy085/fgwbqkSBv0mW30Y6k9nuilveYdJy7vcjYrk3
	1TCTsv0OvLlYlz2S8ITI43Ws6vPzDa29+28q2NVjRbEXtjlaPkj9tYQTQ/P7mbzURIYJ
	fhcThKAHZxTmg67cyg2gYPs9hcHKaf+s1TrMIBOqkLnY/P3xsTsfYK+V0CWkFm3Kqq5I
	B05GQpwRjyOxXDI20qovtV99fqH2hWLM+3QNb1uUGR4MenGPdT5qRJ2VBYhbapjlSSwf
	33ql1eQVkH5NYYSTmKANDPhAl8KLgLNT6M0Y9XrNgSs5OL8dKoDE9mw+QzHO81udZ6t2
	XYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/k8w+92MwnUR3bhD9AlprasljyH1NoRRZIrNgvfCyWo=;
	b=MajFVxxmaDlrUCZMwfPAaAppyMbM9BaiCSa+pPtfm42it7ph7uZPkvDh3DjITGiqJp
	CMXqtAfFevWgRNDgJ16sVRUZRQ2zbxMfi0cW3sJTBCe2ftChnwvBez7XCqB0Fmgow7/t
	5i1KecXQXsWZhovGrKOfkPNzIctprveW3pOfxKYzBUkfhfZaepRDI5Kfbs0GvFpZe2vk
	75TxUIAtNcVfh6eD/d6+zs+tMVsSF0rkgPpdHRKt/YTjByZkgqzBSwLp8C/VYf5Dh3cS
	j4wnrabzllhxfOSx0qr6rMiI8W56NdBkPqgePjrhrrg80fCTKbO0qZ1Un1Hrs+cTs0zU
	PqMQ==
X-Gm-Message-State: ALQs6tBjIqO26BfDo9MgsLICmE34BDM878D5wXTPLUqFec7sOzjcsFIB
	FhQoXnkEmfcyQu+gaGKYbUnHpg==
X-Google-Smtp-Source: AIpwx48NtKGxvXstPF+YQLQM29oZARY0vAqPs40XPvKR6RGtTFCQu30sABYHyf4KxF00Qmb/6arU2Q==
X-Received: by 2002:a17:902:bc4b:: with SMTP id
	t11-v6mr11057757plz.343.1523319763337; 
	Mon, 09 Apr 2018 17:22:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a5sm2562046pfl.159.2018.04.09.17.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:22:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:22:31 -0700
Message-Id: <1523319756-8431-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
References: <1523319756-8431-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 05/10] xarchiver: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Apr 2018 00:22:42 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index e275af0..a27c8f5 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -12,7 +12,9 @@ SRCREV = "5a26dd8ceab0af71b30c83286d7c7398a858c814"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
 
-inherit xfce-git gettext pkgconfig autotools gtk-icon-cache
+inherit xfce-git gettext pkgconfig autotools gtk-icon-cache distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # install tap files for thunar-archive-plugin in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF += "--libexecdir=${libdir}"
-- 
2.7.4


