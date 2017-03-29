Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0050877BD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:59:01 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u18so1426361wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8AwZZXn5YCUi3y40L74DRg8vwKtHsKjXxYjymIZvKMw=;
	b=W92y8/MF6T8+c55tnpZKqBAoDwgPD8k4N7H5m8Tw+X91CGSDLN/wbN5UaC14e3mtgL
	AYN4Pu38TFblnaZqq4znBn9J/+XQ6eR34wHqy1wZbGlfpQ0sCZd/ZfPny+WBfHcZF8yE
	hoT0zv1xgafCxbpw0HXk0sziOkCzzvkJFLHTgiTKfpMlqFnzrcnDswg1eplz6lmydhpq
	TQZ9QZ9zkZ4tO1ImjfE3GtaIZQBrykgY+ftkGkqnfk06mZrsk5zgiSwjAMEw1cRW7voZ
	j90WBVxUMY/mK9HwLGCBt6/2LDB9itIL4jlDmZHFiDx2BLA22QbeLnpj9Ws2sBMjhpcW
	KK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8AwZZXn5YCUi3y40L74DRg8vwKtHsKjXxYjymIZvKMw=;
	b=q5Y5EcRCHhrPypiF9iV0sZrszvus7l9z27hzD9+k+s65iOdwGLLqoxT3i36JjNJfxi
	vcI6l7XnW0HkA2earwm68apuPCrgl7Aub34clEDUoz3IrDi5li9N27pv29OjYiDeQjvB
	LqpNaFNX9vS1TchbujfbprONAiXQiUXtOUO8mYZ8ndR6fIOQvGA62xRHYrjTszKpVS+s
	h12tTImPlrgXOGrU1xWoZhf6MEZlVrx9wUq/5UV8lPGc7J0PD7tARfbQWIXLoBXqkt7Y
	S+UAuatUkndQW8ePMKZOW80lI1lsPLoObPfCkSaVQHb9DEo0CG2INFyuQwiqxmU3zcNu
	aeyg==
X-Gm-Message-State: AFeK/H339V7NeWPRqV6yQFDseIg7xTzS0nPFoQQgt3T0IfBH6eg1Fpho3eNmmKWIc3Xnsw==
X-Received: by 10.223.164.2 with SMTP id d2mr7044397wra.47.1490781542623;
	Wed, 29 Mar 2017 02:59:02 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k139sm7474049wmg.11.2017.03.29.02.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:59:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:58:55 +0200
Message-Id: <20170329095855.9504-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH][meta-efl] meta-efl: blacklist efl-native and dependent recipes
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
X-List-Received-Date: Wed, 29 Mar 2017 09:59:02 -0000

* I no longer use efl and don't plan to upgrade it to newer version
* someone else should step-up and start maintaining meta-efl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb   |  6 ++++++
 meta-efl/recipes-efl/efl/edbus_1.7.9.bb              |  8 ++++++++
 meta-efl/recipes-efl/efl/efl.inc                     |  3 +++
 .../recipes-efl/efl/elementary-theme-efenniht_svn.bb |  6 ++++++
 .../efl/emotion-generic-players_1.15.0.bb            |  6 ++++++
 meta-efl/recipes-efl/efl/epdf_svn.bb                 |  8 ++++++++
 .../recipes-efl/efl/evas-generic-loaders_1.15.0.bb   |  6 ++++++
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb           | 20 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/expedite_git.bb             | 20 ++++++++++++++++++++
 9 files changed, 83 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index aad064647..f9eb4ad68 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -33,3 +33,9 @@ do_install() {
 
 CONFFILES_${PN} = "${sysconfdir}/exquisite/config-illume"
 FILES_${PN} = "${sysconfdir}/exquisite ${datadir}/exquisite/data/themes"
+
+PNBLACKLIST[exquisite-theme-illume] ?= "Depends on blacklisted edje-native"
+
+PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume"
+
+PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume-dev"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
index 64e77e61a..1fb716449 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
@@ -6,3 +6,11 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "8f72da14e5664aad8c45eeeca0e3ff5f"
 SRC_URI[sha256sum] = "c328c4cf1424629cb67c83689ccc1f95967abcb4c03dffd437e93b799ff151c1"
+
+PNBLACKLIST[edbus] ?= "Depends on blacklisted ecore"
+
+PNBLACKLIST[edbus] ?= "Depends on blacklisted eina"
+
+PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus"
+
+PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus-dev"
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 59ae8d75a..48fd45888 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -285,3 +285,6 @@ FILES_${PN}-dev += " \
     ${datadir}/eo/gdb \
     ${bindir}/eldbus-codegen \
 "
+
+PNBLACKLIST[efl] ?= "Depends on broken efl-native"
+PNBLACKLIST[efl-native] ?= "Broken: fails to build with http://errors.yoctoproject.org/Errors/Details/138240/"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 494e743f5..36ba9b43b 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -36,3 +36,9 @@ do_install() {
 }
 
 FILES_${PN} = "${datadir}/elementary/themes/"
+
+PNBLACKLIST[elementary-theme-efenniht] ?= "Depends on blacklisted edje-native"
+
+PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht"
+
+PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht-dev"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
index 1a184bd04..10faf0789 100644
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
@@ -6,3 +6,9 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "68627c1aabf5b7fe084299adcc0b73c1"
 SRC_URI[sha256sum] = "10bad633480a691585b0ba470c573b14da0a010008d9d59d0792cea8c621d423"
+
+PNBLACKLIST[emotion-generic-players] ?= "Depends on blacklisted emotion"
+
+PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players"
+
+PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players-dev"
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index e32a5fdb0..b91bd5b3b 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -25,3 +25,11 @@ EXTRA_OECONF = "\
 
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
+
+PNBLACKLIST[epdf] ?= "Depends on blacklisted ecore"
+
+PNBLACKLIST[epdf] ?= "Depends on blacklisted evas"
+
+PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf-dev"
+
+PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
index 911ce8ca4..1e2ec7fdb 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
@@ -6,3 +6,9 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "3ca8443b8cbf177845595c5e02fbc49c"
 SRC_URI[sha256sum] = "caa22c9ba1ae9629c16a3fe809ea927f60b8f0d80cdb7f145159b997b9ae2bcd"
+
+PNBLACKLIST[evas-generic-loaders] ?= "Depends on blacklisted eina"
+
+PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders"
+
+PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders-dev"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
index cee2d607b..d5594f27c 100644
--- a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
@@ -6,3 +6,23 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "954fe8e40fec6a561190ff0fb75b6bdd"
 SRC_URI[sha256sum] = "a05be096c911e0d66d4bdc497ebb935a04ad23696de9084aed9959b5172a593e"
+
+PNBLACKLIST[expedite] ?= "Depends on blacklisted eet"
+
+PNBLACKLIST[expedite] ?= "Depends on blacklisted evas"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb"
diff --git a/meta-efl/recipes-efl/efl/expedite_git.bb b/meta-efl/recipes-efl/efl/expedite_git.bb
index 5b44cf039..b8b3b4b16 100644
--- a/meta-efl/recipes-efl/efl/expedite_git.bb
+++ b/meta-efl/recipes-efl/efl/expedite_git.bb
@@ -9,3 +9,23 @@ SRC_URI = "\
     git://git.enlightenment.org/tools/${BPN}.git \
 "
 S = "${WORKDIR}/${SRCNAME}"
+
+PNBLACKLIST[expedite] ?= "Depends on blacklisted eet"
+
+PNBLACKLIST[expedite] ?= "Depends on blacklisted evas"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev"
+
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes"
-- 
2.12.2


