Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E660D79BC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r64-v6so6355366pfb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hxHdviHPDAgXsBLi1mhSHjtotGLQIMA80D5Q2YqeK80=;
	b=SdMit7EK7LVH/hJCetbwnnm9rRdregtPv5oGRU5+6PVRWXM91xHj7pgvxcHtFzW/Bb
	+TXpoHfDLynSMVfJRnnf3zQTfZdCsJnmDVNMvG+4A1pjsg0GllEh7cm6VY+i5vQ3/CFR
	bOhrRsVVs/CfBWvTbf4/fFLfTWnXyyZmlVpeej3Nu8+qG19ye2I3y9wNKKsZUZjH14Gv
	j5TVPTfApleMyxZjbqxpSg2xgYP9vWJeMYPv+f9M1FHszTchNdwQ97WCcXBv8z0qo8HT
	bpB9O6zBN1Gl7DJwAXIFezZ3Qi9XCo6tOyuOl6uwQNeJo33XqWUodoF8VcMVHfzfbRkV
	DwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hxHdviHPDAgXsBLi1mhSHjtotGLQIMA80D5Q2YqeK80=;
	b=YYot7FV01UYvZ198aXWWEJnG0L1uBJcBBebmbOIGIYIW2Pec7QeahLLosIu1TFGYCk
	GmKajyeeEnvhc/jPP9HT8JH09D143x26MMnjryLf2l8y2VV5swPRSzD1/BE/+mWheJxy
	yMKzIGxdzMi09SDPtz5SK6TXB/RevBp27Iftmypf3vpS+fyuGnFgQUusuOEe1atVHmtE
	p7a4T94Y4N5GZpK815+e76XoHQ/769ZcO9v6ijW4xGKXe9WAPid93Hhwj7u4Poy10zuK
	2wPc5AV+1AqSs/REMsYQlZp3uSRiT4JlYWf4gIJVXJD9rRMohhigFoPXJQ/IUYTmAudW
	xSLQ==
X-Gm-Message-State: ABuFfohjAjeEyPUhIfofVnRggNEgG2ShzZO5FSmKJfoyGgYbXHHe7uUz
	Bom83TYf6AtFhzdHtLB6uH8bBsai
X-Google-Smtp-Source: ACcGV63ZUhZLnvYqZ2HXFNFikCpxkO4Gm3B6K840EeGzpPXnCpFuYG08gaqCHk9i47lwUbfLtoMhmw==
X-Received: by 2002:a63:2f81:: with SMTP id
	v123-v6mr5717734pgv.223.1539357989983; 
	Fri, 12 Oct 2018 08:26:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:21 -0700
Message-Id: <1539357981-3675-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 5/5] blueman: really belongs in meta-networking
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:29 -0000

it has a build dependancy on python-cython and python-pyparsing with are in
meta-python

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch    | 0
 {meta-oe => meta-networking}/recipes-connectivity/blueman/blueman_git.bb  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/blueman/blueman_git.bb (100%)

diff --git a/meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
rename to meta-networking/recipes-connectivity/blueman/blueman/0001-Search-for-cython3.patch
diff --git a/meta-oe/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/blueman/blueman_git.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_git.bb
-- 
2.7.4


