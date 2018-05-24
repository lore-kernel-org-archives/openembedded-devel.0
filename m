Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id C5A5C74C0D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:25 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 70-v6so3656380ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5euffXzgCamUFUOmosY1jIR4Mc0cm9bC9aI0HBE+UyE=;
	b=BCN3ZaF7LxqRqZw4o/bIUYpYYlBS6D50xAZpPq0B3dX/AVm6+eKKWpcllPuFOJk/JJ
	CznnNmwc+DMMZMu7gc61YLEmMCJQOhi3YgbsDKQ2GMWhW7EFvUX2iKK3iYgYZrAgWouR
	WHntVZh9ddV8ua9GDeffLP7aDhxz2GR1cmOCLKq9Tju8UCVoI7gpt+Vtoq8GSTZY5SlX
	jIdFmX4tmdB80SI3/3MNoDEXRgX2pEjxf08B3lIzDeyVuQHGHW22/ZvRak1DTetWcBDY
	HY5ujaKyvY4yvteRZG9E6vsVBG3G2ES4PR1Z6m0dvM6W67axYxAPe5WYjkiEenTinRYc
	+Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5euffXzgCamUFUOmosY1jIR4Mc0cm9bC9aI0HBE+UyE=;
	b=CzZxs2+ZfdtjsqyS4AHDSCnoPQJHnETCD23AxJvfGmQ0dE7ARK7kksW2dk/RRp3bWx
	c4lqs1gXxQGh7xw5kkVrYJV34Oh0tNAreHipiaB9/4qa2SqWRxvMu5a7C4OqnUUHJL8S
	3X49i3oPv3gvZ5Zgq5MGrR+jswHZn3fbWdBzmwaU7WkAaj/SVLsqMOstUyLtUonAiss1
	fCDr6m+crC1QYKXmlxO+wpoyZMvPQPFYHCcO8h/xqKx5xPCG8Gr1rqWzys3+ejvtdznt
	v96SjQQZZ53efonG+d7roL3H01XKPwhKcvf3BpXVnViyCceYOmzuANARb5k5cYnWLU+9
	l1FA==
X-Gm-Message-State: ALKqPwfFhUnh9snL1kCi5GHvmB80Orerrg5ZjG0R7+DbSuoZYRt1sWuD
	0mvbqukaiLbazUGwPaUMFu5+rqnK
X-Google-Smtp-Source: AB8JxZr2c2AaDgBP3z4z94kC5XWBtURS4XO4af8TCYm8L9Zn6QiQi0Sj+kQwtv8NxcfiukW4jkgGSw==
X-Received: by 2002:a24:4d93:: with SMTP id
	l141-v6mr10257968itb.111.1527186446317; 
	Thu, 24 May 2018 11:27:26 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:25 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:57 -0400
Message-Id: <20180524182659.19986-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 09/11] json-spirit: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:26 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index 3c1d8a9959..d6e42c81d5 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -9,6 +9,8 @@ PRIORITY = "optional"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=278ef6183dec4aae1524fccc4b0113c9"
 
+DEPENDS = "boost"
+
 SRC_URI = "file://json_spirit_v${PV}.zip \
            file://0001-Adjust-the-cmake-files.patch \
            file://0001-Link-to-libatomic.patch \
@@ -16,8 +18,6 @@ SRC_URI = "file://json_spirit_v${PV}.zip \
 
 S = "${WORKDIR}/json_spirit_v${PV}"
 
-DEPENDS = "boost"
-
 inherit cmake
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.0.582.gccdcbd54c


