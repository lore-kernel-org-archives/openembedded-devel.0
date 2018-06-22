Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFCF75219
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:32:54 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o2-v6so4183101qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=6hPy9qtkFDj1nbZWVkmYi2QrJ8Xyswop/6j7+epZoPI=;
	b=YxbcbZstDamDOHYZ7XXKyPdPl+zGjULeeCRHlC4k5loTnlfRU7wJ+nuxudw8GESQKW
	GzfI0P03XAbCDCNc6WWeMcFeGkwdgTUgOurtbK93vrCBRmI5HkYo74h8cIthuCxQiGMm
	HxrbqR9SOTnSvfc0VRoo5ZGwzFD4NHKjg0Q0BAbZ24Ekq6NO1+Qnst2BtY3yns/VcX70
	p+WDkMLcR3PmlkkoGDLqrTL+FMwZyrjcX2V3GYkgCdBI3NYiD3f8fXnfGmUPIiYUS0jf
	VRsyFL95r5jG4F67slPjRHXh/ZkxKHvMOsmzQJgR9AKNgPKZzhd5+LYJFVrqs6vgF3jT
	vJrg==
X-Gm-Message-State: APt69E1nWgahNjf2ofuLVzzUxDkDmJkec0WVkSHrGtRA33PawqBozApP
	Nb0gUBEzlBQtLEHMgvpC0aJ4QQ==
X-Google-Smtp-Source: ADUXVKLcftorYQH7l8bKJbwpIrj0alh8kvGe7nUG5SS7Ch5M9LwqnjzgRpOsuQdektFQLjoEsYZFJA==
X-Received: by 2002:a37:3147:: with SMTP id
	x68-v6mr2344814qkx.358.1529692374894; 
	Fri, 22 Jun 2018 11:32:54 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	b3-v6sm4838985qtj.85.2018.06.22.11.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Jun 2018 11:32:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 22 Jun 2018 15:32:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jun 2018 15:32:46 -0300
Message-Id: <20180622183246.6608-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Organization: O.S. Systems Software LTDA.
Subject: [meta-qt5 PATCH] README: Rework to start using GitHub for development
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
X-List-Received-Date: Fri, 22 Jun 2018 18:32:54 -0000

This changes the content so we start sending people to GitHub and
deprecate the OpenEmbedded-Devel mailing list as the place for patch
submission.

The content has been reworked so it renders better inside GitHub and
provide a more structured content.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 README    | 33 ---------------------------------
 README.md | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 33 deletions(-)
 delete mode 100644 README
 create mode 100644 README.md

diff --git a/README b/README
deleted file mode 100644
index 9817851..0000000
--- a/README
+++ /dev/null
@@ -1,33 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-When building stuff like qtdeclarative, qtquick, qtwebkit, make sure that
-you have required PACKAGECONFIG options enabled in qtbase build, see qtbase.inc
-for detail.
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-qt5]' in the subject'
-
-When sending single patches, please using something like:
-
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-qt5][PATCH'
-
-Change option '-1' to '-n' for n number of patches in series
-
-You are encouraged to fork the mirror on github[1] to share your
-patches. This is preferred for patch sets consisting of more than one
-patch. Other services like gitlab, repo.or.cz or self hosted setups
-are of course accepted as well, 'git fetch <remote>' works the same on
-all of them. We recommend github because it is free, easy to use, has
-been proven to be reliable and has a really good web GUI.
-
-1. https://github.com/meta-qt5/meta-qt5/
-
-meta-qt5 has Yocto Project Compatible status since 2013:
-https://www.yoctoproject.org/product/meta-qt5
-
-Main layer maintainers:
-  Martin 'JaMa' Jansa <martin.jansa@gmail.com>
-  Otavio Salvador <otavio@ossystems.com.br>
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..fe94321
--- /dev/null
+++ b/README.md
@@ -0,0 +1,32 @@
+Qt5 OpenEmbedded/Yocto Project layer
+====================================
+
+This layer depends on:
+
+URI: https://github.com/openembedded/openembedded-core
+branch: master
+revision: HEAD
+
+When building stuff like `qtdeclarative`, `qtquick`, `qtwebkit`, make
+sure that you have required `PACKAGECONFIG` options enabled in qtbase
+build, see `qtbase` recipe for detail.
+
+
+Contributing
+------------
+
+Please submit any patches against the `meta-qt5` layer by using the
+GitHub pull-request feature.  Fork the repo, make a branch, do the
+work, rebase from upstream, create the pull request, yada-yada.
+
+Maintainers
+-----------
+
+- Martin 'JaMa' Jansa <martin.jansa@gmail.com>
+- Otavio Salvador <otavio@ossystems.com.br>
+
+Yocto Project Compatible
+------------------------
+
+meta-qt5 has Yocto Project Compatible status since 2013:
+https://www.yoctoproject.org/product/meta-qt5
-- 
2.17.1


