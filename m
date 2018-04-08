Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3942B7553B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:00 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id e22-v6so1442858plj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1zDOjvi72tvltCtFVrMbsR5TZnjdXt/Awen+qKRvlQQ=;
	b=FTojInvQcfVTgMYiJ2pXap5+3bubI13HtGJyqiL6biswgahNgGoSg+5vAXr5rE8Fea
	1ES+TPj24SH/WwPT4GhpQCkXpDwaLwTzBBlTy15hFx/4ogT0t+iyAHw2OHQlAoDbI+wd
	rAo/mN63S4sXiuh1uBtSML/fVCKH84EA/dCDPfKDTjHL77OV7g4zG9Yke4NGfcFltLZq
	j+4RF2SPj3RRWonKEYl1wl8ahs1ny3CdGAq05b6Jt5dP6xithti/mq6+vpcZlret8Rdc
	WBjdcIwn2XbkG4Cdw3frxSK3DnNn8B3rzek8ltKLQkV9R0Y1U7/FdNICz+Totwp+GRy8
	yCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1zDOjvi72tvltCtFVrMbsR5TZnjdXt/Awen+qKRvlQQ=;
	b=CfVhc5Sp5WGN7n5qZ10MWlnxiGL8cEoBesJF8yjAAXh4iSmkrbTqvMRXKhmSW9Dscw
	b6uDAHf4RAVKVPlZw6/x+daJthb/cI1iVQgYJa4moleZFXhsaGzuMebBgzcIHKDt1Iz4
	TgWVBwha6avfpmYDp6WNOeFPxwqkwRUXIshAFV3dAJCHgZDpOND9/2vPcIp3n0dhiNqy
	tU9H9T61u6ntrmOQghQ3+xSW7oW00sifWMWmWEvzVkWAXdz3lA/1ZAU6yZrcixPMl+sj
	kcZ2/jXB/OQRLykMCNNaeW/WLuQlrSYpipLeSR15gjrwOgtmYfb6l+MJ/FzsfZZfCVDO
	Me1w==
X-Gm-Message-State: AElRT7GBdJZCdLlAmxD0INfsq3ZPuKkOWo/XxcSwFvWshkb2voR1naWH
	iUsSjRvPC62li3qYayVkCbzpvw==
X-Google-Smtp-Source: AIpwx48jIzHH4zQYpyN5dGhkOnarM8YE6DVVONjfhkyfdGnm6VL3uUaKOVa2ANwB+hc7TdKmgwp2Zw==
X-Received: by 2002:a17:902:5a0b:: with SMTP id
	q11-v6mr34890804pli.199.1523170741309; 
	Sat, 07 Apr 2018 23:59:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:21 -0700
Message-Id: <1523170729-26321-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 09/37] pyton-dbusmuck: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:00 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file dbusmock/__init__.py
Hunk #1 succeeded at 14 with fuzz 1.
checking file dbusmock/mockobject.py
Hunk #1 succeeded at 688 (offset 6 lines).

and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...onality-to-add-own-objects-to-internal-obj.patch | 21 ++++++++++-----------
 ...sibility-to-import-templates-from-packages.patch | 18 ++++++++----------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch b/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
index fdd00b6..c4d8178 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
+++ b/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
@@ -1,7 +1,8 @@
-From eebe0f66435c4d821b0f5f93f69efe17b4a384c2 Mon Sep 17 00:00:00 2001
+From c4436fd42f2936e5fb0f95434d06e45aa9959ca0 Mon Sep 17 00:00:00 2001
 From: Simon Busch <simon.busch@lge.com>
 Date: Wed, 9 Apr 2014 13:18:33 +0200
-Subject: [PATCH 1/2] Add functionality to add own objects to internal object
+Subject: [PATCH] Add functionality to add own objects to internal object
+
  list
 
 In some case the tests might want to create dynamically dbus objects which extended
@@ -9,17 +10,18 @@ functionality from own class definitions within templates. In such cases we need
 register those objects with the internal object manager of dbusmock.
 
 Signed-off-by: Simon Busch <simon.busch@lge.com>
+
 ---
- dbusmock/__init__.py   |    4 ++--
- dbusmock/mockobject.py |    8 ++++++++
+ dbusmock/__init__.py   | 4 ++--
+ dbusmock/mockobject.py | 8 ++++++++
  2 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/dbusmock/__init__.py b/dbusmock/__init__.py
-index f799cc7..6718c06 100644
+index 8a482ab..3d5d71a 100644
 --- a/dbusmock/__init__.py
 +++ b/dbusmock/__init__.py
 @@ -14,8 +14,8 @@ __license__ = 'LGPL 3+'
- __version__ = '0.10.1'
+ __version__ = '0.16.7'
  
  from dbusmock.mockobject import (DBusMockObject, MOCK_IFACE,
 -                                 OBJECT_MANAGER_IFACE, get_object, get_objects)
@@ -30,10 +32,10 @@ index f799cc7..6718c06 100644
 -           'DBusTestCase', 'get_object', 'get_objects']
 +           'DBusTestCase', 'get_object', 'get_objects', 'add_object']
 diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
-index 97b79ce..a98e03d 100644
+index 586dbad..e4f130f 100644
 --- a/dbusmock/mockobject.py
 +++ b/dbusmock/mockobject.py
-@@ -682,6 +682,14 @@ dbus.service._method_lookup = _dbusmock_method_lookup
+@@ -688,6 +688,14 @@ dbus.service._method_lookup = _dbusmock_method_lookup
  # Helper API for templates
  #
  
@@ -48,6 +50,3 @@ index 97b79ce..a98e03d 100644
  
  def get_objects():
      '''Return all existing object paths'''
--- 
-1.7.9.5
-
diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch b/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
index 981694f..06ab1f0 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
+++ b/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
@@ -1,22 +1,23 @@
-From ff1dffd5673bcd2cbd9554ad62476d108dbc18af Mon Sep 17 00:00:00 2001
+From 03bd5cb77c54033857810bb17562859eefa41221 Mon Sep 17 00:00:00 2001
 From: Simon Busch <simon.busch@lge.com>
 Date: Wed, 9 Apr 2014 13:20:33 +0200
-Subject: [PATCH 2/2] Add possibility to import templates from packages
+Subject: [PATCH] Add possibility to import templates from packages
 
 Does not have any unit tests yet.
 
 Signed-off-by: Simon Busch <simon.busch@lge.com>
+
 ---
- dbusmock/mockobject.py |    3 +++
+ dbusmock/mockobject.py | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/dbusmock/mockobject.py b/dbusmock/mockobject.py
-index a98e03d..9530c2a 100644
+index e4f130f..389df70 100644
 --- a/dbusmock/mockobject.py
 +++ b/dbusmock/mockobject.py
-@@ -49,6 +49,9 @@ def load_module(name):
- 
-         return module
+@@ -46,6 +46,9 @@ def load_module(name):
+             exec(f.read(), mod.__dict__, mod.__dict__)
+         return mod
  
 +    if '.' in name:
 +        return importlib.import_module(name)
@@ -24,6 +25,3 @@ index a98e03d..9530c2a 100644
      return importlib.import_module('dbusmock.templates.' + name)
  
  
--- 
-1.7.9.5
-
-- 
2.7.4


