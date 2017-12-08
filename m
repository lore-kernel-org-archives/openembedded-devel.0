Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5AE7865F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:26 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d23so6515061pfe.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oE0cooxPmMK5tDtvimU9x3FmYaIA3jZIVzAIQ+ROu5E=;
	b=IxsMaEctOjTKRCcKibh67369u53Ya4qPjZHmGBL8HIBBHPRppfTboXk40/Vbfg3H4z
	kOP5Q3ReBIJJdmxitQ8MzUqmKex1iWy8XFlqesO6/hcezjOu4dRxzzfGv8GSdnhVfPys
	XwqN/nckq4Ubyy72v1JEu37OJtj9VYqpSXwwAIpWGUKPxD1e4G+DWHKgrJDeoqFa6SSa
	ae5asznzP+F0vO7fwdMRAHlY6QAs0/YV9MfMlhJxRpfwuYhPm3vmGaTS+y1EdZZl3Wa3
	mja22T3zMxHIVeQOnbJgmkb6L3+WTeMBc7rsmHXSEDDQ156Qblub1znM6/LDlk9RL9Sm
	jzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oE0cooxPmMK5tDtvimU9x3FmYaIA3jZIVzAIQ+ROu5E=;
	b=i1atjiVAFsEPO3tdRTalSZKR08+CoIvV0HbrI209kZBgkVu6FDp6UcYfko2JdCxwc8
	B7LtvQ+l21JjfjJ/SQxEI/RBfY/7dUdlCnEy6J3wZ7VHRlcPXG/TmK2gCtjet/PshTVp
	siunhkPYQZlrmpxs+bF7RgnAhx2hcwRt4Jp6xic3gTmj3LW8yM3FtH7TQlh5z1ED+nDW
	DahPenDZflH97FCqG83v0HLMekzVoRZ5dPMOlc2p2jtGwe+gl0ZUyESHMc2b04RLRDlQ
	99iI3OSmS4GSppFXhPlbiT4q9B7VYpIt4r7AwicbQs/pHBFDDQIwRh7MM5SOZdsiL7Y9
	CwSA==
X-Gm-Message-State: AJaThX4yobLzFC7Isk1xcxx/pYf3Bwljfa1rHryEbWRz0CcgA21pi/A0
	6Csdj9qi5W7qa1IC8wxKJA9VZw==
X-Google-Smtp-Source: AGs4zMblGv0EVXfiPL85DzvWMCDPhhwyfMetcyXme3hR1FMFNIsbpjLu4jJwdZztmscEvtxIhzayeg==
X-Received: by 10.84.208.227 with SMTP id c32mr28621800plj.290.1512711987449; 
	Thu, 07 Dec 2017 21:46:27 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:26 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:38 -0800
Message-Id: <20171208054548.26218-3-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 02/12] python3-dominate: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:26 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
new file mode 100644
index 0000000..5304ccc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-dominate.inc
-- 
2.7.4


