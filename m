Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5E874C06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:17 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 200-v6so2416344ioz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=opIB+8aZcSL5braGOuZdh8Hk+Xxyrs87HjXDFrd9aZ8=;
	b=rYQrERXZ5ckx2W9O5bPnrqwxQYt/O9VFI58VF9NXXYeuJ9pwDGK813vkHCQMxLcFFD
	hT8ByCg+/9QP6vvSWKhFlRyT/H6Z1EnJrpPCkMMOcV4VgupfVJz1xGpoxuIoxKPu3E/1
	6ZWYAfEXi7j+Qoef90CnvDZAi6vgDZF/lx1P0+zl74isIXbE01Vk6WQicc8XaDuMQa7C
	JmbYTAS/O6QpaNzlLnyaoS+uDbCYUhSgjXEObFRHxwFtJyTxdI6vVQZa8uxScTby1uae
	HVVoYg1kbl6hR8AnAZjaovtlGZLqVGQ7XW9P5ggAofR/QE1OEUvTFMKA7be8cydqCe1N
	qMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=opIB+8aZcSL5braGOuZdh8Hk+Xxyrs87HjXDFrd9aZ8=;
	b=YoyaeI8j8Eachyzqhhjha2qQ/x9dpJTysbro1IJmsrS5t1kCE40J9JlxiwIfbeCfPD
	F58iJVFeJnpT7lligBhYZMC0ET2oaPBy4ituYuPgU3g17TjPuw750bGbXes6/18I4p8I
	sP/Bdlf122lzeIQyloXKSv4PdXZ1btNICmj8dvMH/+2LLR7AY3OkNcHW7Boj4adwIfPM
	BJ+wgPEMqEci7c9RxQn4UfpA7AQgE8weyr5KbTmlVATRpEWs26AeYxfO/SdXk6sg87uP
	Dg73ix/oflo7Dy5HOLqvj1VW5myu2bXD3YIYfte84XsUZzGiH9wY5xN3jl+YYZtvW9kc
	SblA==
X-Gm-Message-State: ALKqPwffi4l7tZloEv9vhY88OlyPt8olvY01ZZ4qTBxZIiivAp3xTTk7
	L0nwoubzIXIRqzmyhdcHM0FrK0bO
X-Google-Smtp-Source: ADUXVKIExXAyvtDi4uSHO7LNJb7IpQuzomXvRnc7lmeL5PmNvgsbeiNg7VEwbgYY6AORTs61HnYNMQ==
X-Received: by 2002:a6b:c410:: with SMTP id
	y16-v6mr6590190ioa.213.1527186438574; 
	Thu, 24 May 2018 11:27:18 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:52 -0400
Message-Id: <20180524182659.19986-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524182659.19986-1-twoerner@gmail.com>
References: <20180524182659.19986-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH 04/11] gflags: variable cleanup
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
X-List-Received-Date: Thu, 24 May 2018 18:27:18 -0000

Reorder recipe variables according to:

	https://www.openembedded.org/wiki/Styleguide

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index b186326e9b..1571333323 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
-
 HOMEPAGE = "https://github.com/gflags/gflags"
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
@@ -16,6 +14,7 @@ EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF -DLIB_INSTAL
 
 PACKAGES =+ "${PN}-bash-completion"
 FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
+
 RDEPENDS_${PN}-bash-completion = "bash bash-completion"
 
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


