Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 113F96FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 10:03:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i130so6405215wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Oct 2016 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YAHJm2P+UBWc4XfM59XJzd8U9LA1peTBdMcYCnbHzTM=;
	b=lposy0YOeSkTdrcmR4TfCloS1JWcc/MhBtkBJZS19QbkbX6vdkzfSRy7kMRH+0IEjg
	TC7venmTGYejk35o9N5GjvF3orne2H7QnZJ5hMHVLvaum81/tB0rm0ETGV9AS5O9D/7G
	qaH6oufOOGRqP3oQ1TK6ADe4NsQe0tAKJbTQHAxvVrRe8lpT/nj30NduT+o6zvCo+gxh
	f3RmfE9eyzU7R+X8NWe4wom2kJIhhwJ4xwS5BSqcXExiOvQAUe2yWmp9dmbwI22xRr2B
	2Q+N13eXuYqA9k5+xt4iBifqn/IN+ndzhmhVhh5cQiLJ32p/y1pPDv+TIjWKz/n2OE0k
	QyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YAHJm2P+UBWc4XfM59XJzd8U9LA1peTBdMcYCnbHzTM=;
	b=e9OknHW0cWYHqdF0MJ/FJ5L0WIL9vvuBsARMfiJOExFH7+j/BHIM34o9GzkHCHxjGt
	GfN9d7u2QPWaNWu5NH4x9l9g15PzV28U5FQEJlDSs1lD5uXlh1PANXAzGVZAd0puk7I6
	mVIx7DtQOzNNTBbCSh1pIBrvwLSe1lqAcOsLk0bQF7VkFUsaMDcQw0Z1xzfnvXSuoWpR
	ylisA/X1ukL499gUPwxhU0mB5Z2SfOTGZdONw/D8iluawseItzBIcSwexoRhgHxrQFg3
	zYLHiV4yH/qgkxC3OujGfS3uT6T4kQ+Um1EHwRPDEsmyb0XXH7rR48QvZHUNoaW1huLg
	VhVw==
X-Gm-Message-State: AA6/9RkqiTdXpFFVgqWR7oF3M0Zr4189MJsI4ezx32M9YSo0fnX/u821z31MGS0rGo7fLw==
X-Received: by 10.194.112.131 with SMTP id iq3mr20217027wjb.123.1475921028444; 
	Sat, 08 Oct 2016 03:03:48 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EC6.dip0.t-ipconnect.de.
	[79.223.14.198]) by smtp.googlemail.com with ESMTPSA id
	n7sm7509219wmf.18.2016.10.08.03.03.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Oct 2016 03:03:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 12:03:31 +0200
Message-Id: <1475921015-7131-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH V2 0/4] jack and more
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
X-List-Received-Date: Sat, 08 Oct 2016 10:03:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2

* remove florence update
* disable jack's portaudio configuration explicitly

Andreas Müller (4):
  jack: swap to jack2
  jack: remove portaudio PACKAGECONFIG
  a2jmidid: initial add v8
  xdg-user-dirs: initial add 0.15

 ...-pthread-library-dependency-to-fix-linkin.patch | 43 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      | 22 ++++++++++
 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb | 49 ----------------------
 meta-oe/recipes-multimedia/jack/jack_git.bb        | 35 ++++++++++++++++
 .../xdg-user-dirs/files/xdg-user-dirs.desktop      |  9 ++++
 .../xdg-user-dirs/xdg-user-dirs_0.15.bb            | 22 ++++++++++
 6 files changed, 131 insertions(+), 49 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack_0.125.0rc1.bb
 create mode 100644 meta-oe/recipes-multimedia/jack/jack_git.bb
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb

-- 
2.5.5


