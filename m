Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0134978F2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:48:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id l9-v6so8076398pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q6OTW/ER3ViPpfSCcy79FEvjiqAFeoqIj6yQF4f8zA8=;
	b=MNr8QxeY0rouQd43fAvnxnJs43oOLqsm9edOSgw3kQSMULRfeUmjOUL8zJ/760J7H8
	7oRgPTQd9WF9K4kI5/w4F+EadHEUvrwbkq+VEy8cBuxUoIWQ2adL5hQXjxdHY1xam66M
	psazow3XUT+tmLpw4iF2uHdyr4nnd2niqrFUBTP6+XYZpAx/9HIHuUAiKxRA4GRbbspb
	g0IAWoppliSP42OZf50T2VC7Y38GzwKjam/XeuLU5vYzWixvZ/5La3eIhv1ni1mNN+e2
	Xs4TqzlI39rztAGaHoM+jkWlVUTgIz+clJtyN5L0LVDXPdFlojyBkWlKvc1J9zHXPRWb
	nttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q6OTW/ER3ViPpfSCcy79FEvjiqAFeoqIj6yQF4f8zA8=;
	b=MEM6kVIWWUtjEAqjw9DJ3DWQy7wNo4VoiDG5LSON6I5ARk+O44wNBaQk45TSV+uOVe
	6DB7dvc3jnOa0T4RwKP/V3ublVo4bWa9YuxvhcoriXqLJCQ6LZ2Pwyk4q5xF+gMHN8pY
	CTK8Ijuk4bFSFI5S1pI4nI8v2ROu0Q6DK17tmE/48ymEETU1DSf8EZ+HdgOPlerkgQ7+
	ZOtTri624sRGU84QF9Z3p4n+9t+bZdXI2/sn7ps0wcO6KDLe639o9BMT3wKoLNXWhf5T
	rzsica6ceBLa6eSCTEL9x9zp4qotLR57MDnXHheHr8SqVHXZfmz9+Q8B1UQEzOmZzitA
	qQuQ==
X-Gm-Message-State: APzg51AJ/S46HbNOEtkV1AGrS1Mz5lDEBxkwAEXnu3xUA1yor125cz6Y
	o9kH22uUGcuQEH3qXN7aJc13b5+g
X-Google-Smtp-Source: ANB0VdZQrhUEYldFmBITrgCp7f8MUC1nIJBrioK8n9CAYD4S+zmtnpH0tKmX1r1HETrL8Yc73LXP7Q==
X-Received: by 2002:a63:e712:: with SMTP id
	b18-v6mr13245505pgi.68.1535392089636; 
	Mon, 27 Aug 2018 10:48:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	u43-v6sm24454446pgn.81.2018.08.27.10.48.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 10:48:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 10:47:56 -0700
Message-Id: <20180827174757.7027-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827174757.7027-1-raj.khem@gmail.com>
References: <20180827174757.7027-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] mongodb: Exclude on mips arch
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
X-List-Received-Date: Mon, 27 Aug 2018 17:48:09 -0000

Support does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index dd22388b57..bcb15e6c5b 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -43,8 +43,9 @@ COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE_armv7a = "(!.*armv7a).*"
 COMPATIBLE_MACHINE_armv7ve = "(!.*armv7ve).*"
-COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
+# https://jira.mongodb.org/browse/SERVER-16898
+COMPATIBLE_HOST_mipsarch = "null"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[wiredtiger] = "--wiredtiger=on,--wiredtiger=off,,"
-- 
2.18.0


