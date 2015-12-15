Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B24C66FF97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:37:56 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n186so110670641wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Qc4EYIvoprrTLD/NnG5G7329WbrCTCb919j8YTtK16U=;
	b=XW9eoTnvr7jko0eqMkDaDy7h3wIKJBU54FPJEORc7z++VHXpc1vtWv16aPJwyjU+mt
	NvVn2lIVvmKnWT75f9/3AOojndAVtOYY2hSnLuIx9RlvxQCWrp/AmWAri/Kzxwp8i2S1
	HrRbXDsry2FV0k9qW0BL6xJ1vCy3V5HQ8ieA6rIb6DI+enxT/aEFIRul6BcOo4yUZ+uS
	Wh48eKb+IsqXXjl3xo5XYIM6DaZyceWY5RzT+g35nCEApf6OyVp5VwdMzVoQnPAsUXO0
	EDB/AE9JVyyNKm4UFZB7dOgA7COdsmbx6aLT7N6QhbmC8ren/OZfO3KytNGs1exK+7bw
	jdPQ==
X-Received: by 10.28.11.134 with SMTP id 128mr6584576wml.72.1450208276727;
	Tue, 15 Dec 2015 11:37:56 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	a186sm4172944wmh.4.2015.12.15.11.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 11:37:53 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 12:37:44 -0700
Message-Id: <cover.1450208019.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 0/3] Add bits to save/restore URI headrevs
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
X-List-Received-Date: Tue, 15 Dec 2015 19:37:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is useful to support BB_NO_NETWORK with AUTOREV, by letting someone ship
dumped headrevs to the user, who then inherit this class, which ensures that
the cached headrevs are used, and upstream is not contacted at parse time.
BB_SRCREV_POLICY will be set to "cache" as well, if it's not already set, as
otherwise bitbake will contact upstream to update the cached values.

This is helpful when shipping downloads to someone when there's a desire to
support both BB_NO_NETWORK and AUTOREV.

The restore_headrevs.bbclass will restore dumped headrevs at config parse time
(add to INHERIT), and the oe.headrevs python module provides a function one
can call to dump the headrevs.

The following changes since commit 62bfd1f93f8873611e818c7cc8c13a761d629502:

  wireshark: update to version 2.0.0 (2015-11-30 14:39:59 -0500)

are available in the git repository at:

  git://github.com/kergoth/meta-openembedded.git headrevs
  https://github.com/kergoth/meta-openembedded/tree/headrevs

Christopher Larson (3):
  oe: add python namespace package
  oe.headrevs: save and restore the bitbake URI headrevs
  restore_headrevs.bbclass: add

 meta-oe/classes/restore_headrevs.bbclass | 32 +++++++++++++++++++++++++++
 meta-oe/lib/oe/__init__.py               |  2 ++
 meta-oe/lib/oe/headrevs.py               | 38 ++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 meta-oe/classes/restore_headrevs.bbclass
 create mode 100644 meta-oe/lib/oe/__init__.py
 create mode 100644 meta-oe/lib/oe/headrevs.py

-- 
2.2.1


