Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 595076FF84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2016 22:47:24 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g17so81562713wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2016 15:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IFfMuZtOL0e2NnuU0sbvU4f+jb/W8Ojj2GWdtUlOpWI=;
	b=t/sYkBvKg2KV/lPHAZwPzUtDdRs6UKD7uyj5bLHFUDlg0QU5BGIYf/WTF2kcdFeZFs
	qbV5brUCUOL9IcVSTukn3OEeTUn5OlNqlgJ4T7D1ws9K70vLEfZXOemziXvTsKc0eqPg
	Cqk7v8fLCc4FjBdSyv7FaV55HX+fwD1g/EZ+NHX7RNjWl8v3P+dtCkU/FgwDVCiG6Mn4
	LEZ9YAkl7XOLWvj3XGjySZXCmTO40l18HlmecFdIczqrqmPIWbVejtInZmBZYW4bAfm/
	ECeYkpwOCKD3z/m72vTCH8ehErXfa9PLyEwzqocPQAeg4PUahP0Vj6JetN3M81f8HQcX
	Pqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IFfMuZtOL0e2NnuU0sbvU4f+jb/W8Ojj2GWdtUlOpWI=;
	b=jBUNuINyIo9SL3tf+ePvdhaIwvtIL8XW0cxLS/4N7n7wdtgQk4rReAuxIMIPrvfjEX
	ZLBu2qGz7wU0cxpK+4xkZ0r1oeSqrFVA39Jd/If4CUHC2JqgYrYaHren/HbpHR4B1T5o
	mIXueVivE5adAez340q1zt4m6ylrDRWXlS2oUBvzAjRpj63mI+eJJJllD/7l3B4FvRcd
	crOGnas00CWd8q+hV7MAMCGDbK5bsTnAycIIkejmmLJo29wMJSv1EekjxCaGJ6eawCuv
	T/gBnwNHWHRNymTu+zfs21YTkiHsstILlpXHzB6k+LYcRHgEoDoKNM69ly3PC2xiPYxa
	vnnA==
X-Gm-Message-State: AOPr4FUp5MqJWYbsL/Hr1Az38bGkIclWTHF/ugRcHBttGgQD7IICyege7L6+OdCmirt3/A==
X-Received: by 10.28.135.135 with SMTP id j129mr10739846wmd.101.1463266044520; 
	Sat, 14 May 2016 15:47:24 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host175-222-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.222.175]) by smtp.gmail.com with ESMTPSA id
	q125sm10385018wmd.19.2016.05.14.15.47.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2016 15:47:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2016 00:47:21 +0200
Message-Id: <1463266041-7959-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-opie] Pull Request 2016-05-15
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
X-List-Received-Date: Sat, 14 May 2016 22:47:24 -0000

The following changes since commit 4240c659257f62f8128c89cfe62285ffc130f7c5:

  opie-taskbar: drop unnecessary FILES line (2015-10-31 22:14:18 +0000)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-opie master

for you to fetch changes up to da4be4094c374da4f4a9eb2bbccdf59761b779c3:

  opie-pickboard: do not install a second copy of libqpickboard.so (2016-05-14 18:54:34 +0200)

----------------------------------------------------------------
Andrea Adami (5):
      meta-opie.bb: replace base_contains with bb.utils.contains
      opie-image.bb: replace base_contains with bb.utils.contains
      obexpush: fix build after EXTRA_OEMAKE changes in oe-core.
      opie-multikey: fix linking against qpickboard
      opie-pickboard: do not install a second copy of libqpickboard.so

 recipes-opie/images/opie-image.bb                   |  4 ++--
 recipes-opie/meta/meta-opie.bb                      |  4 ++--
 .../opie-multikey/files/add-palmtopdir-suffix.patch | 21 +++++++++++++++++++++
 recipes-opie/opie-multikey/opie-multikey_1.2.5.bb   |  5 ++++-
 recipes-opie/opie-multikey/opie-multikey_git.bb     |  4 +++-
 recipes-opie/opie-pickboard/opie-pickboard.inc      |  2 --
 recipes-support/obexpush/obexpush_1.0.0.bb          |  2 ++
 7 files changed, 34 insertions(+), 8 deletions(-)
 create mode 100644 recipes-opie/opie-multikey/files/add-palmtopdir-suffix.patch

-- 
1.9.1


