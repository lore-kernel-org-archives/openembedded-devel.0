Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tr6V5-0008RP-Jb
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 13:36:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so7840408eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2013 04:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=VsHUMew6fZ7/+DlNh/a48maorGhLHAJNr3C/tG2tBPk=;
	b=iHLP6C9V8sfkS78GFuKEf0meL7Ksb9iE7HeFoefmrd7y559ZJJaKJkF9EevF3qXX2X
	WB8xiM3GznLokd2125Q6SmaMjRmEOqS7G9AL2RNQkMxF0l0atkW44Cyq/d3vSGPFCAC9
	USry+9vGjKMlEDBYaaMUa4Wv6mEkRAgvZ3gS735bUKzacbe7RAfEWJuMxFLise2iHBhs
	9LQEwuPs2AguGVTXj/rlsKwBj1gg+Qfi3Ftpocc7WqNzin/Lg1jdPAs4uirdV51RsxfN
	YWYOA0BSullUxytk6W1sDnSOpHy3lgHDszpEqBYpvjgR09lLQgbLzWpwulkl0umpsZfM
	ZUvQ==
X-Received: by 10.14.203.8 with SMTP id e8mr143338289eeo.2.1357302046823;
	Fri, 04 Jan 2013 04:20:46 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm110283598eek.0.2013.01.04.04.20.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 04:20:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2013 13:20:32 +0100
Message-Id: <0983959a8badc765cb3c0ab0f74dfd306b09134b.1357301108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357301108.git.Martin.Jansa@gmail.com>
References: <cover.1357301108.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH 2/6] fbreader: move to meta-gpe due to libgpewidget dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 12:36:14 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/fbreader/fbreader-0.12.10/Makefile.patch              | 0
 .../recipes-support/fbreader/fbreader-0.12.10/gcc45.patch                 | 0
 {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_0.12.10.bb        | 0
 {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_git.bb            | 0
 .../files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_0.12.10.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/fbreader_git.bb (100%)
 rename {meta-oe => meta-gpe}/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch (100%)

diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
rename to meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
diff --git a/meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
rename to meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
diff --git a/meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader_0.12.10.bb
rename to meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
diff --git a/meta-oe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
similarity index 100%
rename from meta-oe/recipes-support/fbreader/fbreader_git.bb
rename to meta-gpe/recipes-support/fbreader/fbreader_git.bb
diff --git a/meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch b/meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
similarity index 100%
rename from meta-oe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
rename to meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
-- 
1.8.0.2



