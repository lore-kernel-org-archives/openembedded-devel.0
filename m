Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 19F0A78A21
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:37 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so624266plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=huSdSLskQWvzZpEyymFt5/t8fxwjr5oanHfw8ABvRp0=;
	b=c3W5JrUr82aQmiOEAbp1L10f2Urf2Hoez1FyU+ZBMo3LMfCoEowfJAfRxO1imEFbFm
	3Yf0Ylkk590uly3MfY3Hib0v/gqcWwF4xEtZl83DRUACmQiIagcC+QvCVzSJrKeIuzvT
	WfgFu5hHyuX+XkX7l+VyOyj2q6vY3mWNhetNyxEuiw58VcZv0qG1dofH8j1dOnChDl7q
	Mds/fqpdXia37G0PKKPLIaomVy2haerLwU10fImmyyTEZJCFgHMN6mJRipqWn/3Ev5e2
	JrjLmWJAKiAqZoAC5PiAdQQjQZ7rtTp7yBVWUIWa3ygAhNu40kyG8mjksBlzJab7FoN3
	kAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=huSdSLskQWvzZpEyymFt5/t8fxwjr5oanHfw8ABvRp0=;
	b=HJrHe58OY9KUFqG6KXQIPVHe8jFnEEcO9pfXA1iiREoPQ9qOGUb+My+r6smgIbP56N
	UUZjpZjvZVEGQqm1ftUUT3n93l8SnzkM0OLMSgEvwACvRBrO8tj7vm3WV64o8Sc+oH4f
	vMGlNo4sJHJj18yQO6gZ7AjdiVVCEy3WjttJL/XoC5JzAZfh9S0/BiWrl2cK62wMfloK
	jakQd1mBD3TTMAcHwqGr1rWoBEhWj3dcU7OkukcQZNdkUQOwEYtkctV9FFCjrPIPt0Wx
	VoaA6QpIB146ftAOrem4FOyruT/9LlAqNn53rYT9ZuZuebZ0NaQ0HuUTCIfjqGX8AsnB
	vXJw==
X-Gm-Message-State: APf1xPAlSjFG1fyO4kZbMcsmL5VNcylml8JTM9IvKildb7qAc0L+nDxm
	PnHi+1xHuRvH3SbRKmOOEd9bDw==
X-Google-Smtp-Source: AG47ELutPrDj19p7OYjcfRg9VIqnmG7/SgVvk6rbHrUokNWD/FZf8DeN7kOlwM1AKIQCs9qpRhK9VA==
X-Received: by 2002:a17:902:5596:: with SMTP id
	g22-v6mr18438343pli.4.1520395418805; 
	Tue, 06 Mar 2018 20:03:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:13 -0800
Message-Id: <1520395408-19266-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 10/25] toscoterm: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:37 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index aa031fe..879b67b 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -11,7 +11,9 @@ SRC_URI = "git://github.com/OSSystems/toscoterm.git"
 
 S = "${WORKDIR}/git"
 
-inherit gitpkgv pkgconfig
+inherit distro_features_check gitpkgv pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_compile() {
     oe_runmake \
-- 
2.7.4


