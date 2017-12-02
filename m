Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id AF0C777811
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:06 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id x22so7414307pln.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=16r9/OIbVGXUL2Mi6xIxUKi4RXpNJzbjGu40uUu9Hac=;
	b=I/Pz0ZDgi9lNmzdG6KCLNAv/hhzetdaeDHibD6R32xPqRUpQmTkRxvHhTxheowatC0
	ASf2fW+xcXTTQFagr9wfoG1uTxZTpzxXuGK2wlB5sqPyP+1IXhSkBi5qI8Tpgr+tvW2M
	aGQ6mn9HtSsmAX/VliZm8ANEe+mVXbcz+1gJePbrmz8jijbXZBH14rXv+CTzL+FuTttX
	tLRodffXv/hbv0UV37AtXyxpdknS3XAFxVVUJNb1m7NjlBKPkSG1uDGWySDJQXXtCrQG
	bN9iASq/Xb+zWJ8yh+yZB2Zda0Q06NxjfIfSOFx7sD8qOyVNI5aUr3bzT4plgYFQZe/5
	YQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=16r9/OIbVGXUL2Mi6xIxUKi4RXpNJzbjGu40uUu9Hac=;
	b=ZPfDrLNglOODBDYQ86Y8UiKk7vht/u3FWcqN0+Hwpn6V3NpJXn+hVEWAKmK/wsCnOf
	wsUFF9kOMoxYkdMKRwTSBLwOydWm/EQaQYi/mLGIIyuzN59hOtlW99JYG+XTXUxFNDlV
	SYCKGYfHfS7U6AR9Ut3Wy4oOhrlkfkX50e/Gn3IcP9FF5OoEvn71xmqQ03Zccsd3J07B
	nWAIDDDoxBFqONoGpG3aN7epzj9k+Zj2FbUeDaWDtcr1jgbh/Z3K3bZ216UANZZMCAcA
	flJU7rR8IUbDTWVaif0HVaLoCWFUNquamWxaxqUvV8tn3ay+EhVE6RCAXAEMJ7UV5vKz
	I+Yw==
X-Gm-Message-State: AJaThX7uBsgl8gHneD8bjyd2sOYIx5urHjCKuF+LKLhgxEGxjHCaNg+o
	p+cMKYAnEPZziZSnOHOT0ts8Jw==
X-Google-Smtp-Source: AGs4zMYXEgr+yHnT14b1N1WWlNqoT5u7SLKZBQq53SS0YED/u6N6GrzcB8AE5tVNZf7Kftop4DXtUQ==
X-Received: by 10.159.246.20 with SMTP id b20mr8137046pls.95.1512191587614;
	Fri, 01 Dec 2017 21:13:07 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:07 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:43 -0800
Message-Id: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 00/13] New recipes for additional flask extensions
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:06 -0000

The basic flask recipes and recipes for a few flask extensions are currently
present in meta-python. This patch adds several more flask extensions and their
dependencies, useful for building full featured web sites. Both python and
python3 receipes are provided.

Bill Randle (13):
  python[3]-editor: new recipes
  python[3]-alembic: new recipes
  python[3]-fask-migrate: new recipes
  python[3]-flask-nav: new recipes
  python[3]-flask-uploads: new recipes
  python[3]-flask-script: new recipes
  python[3]-flask-mail: new recipes
  python[3]-flask-user: new recipes
  python[3]-speaklater: new recipes
  python[3]-flask-babel: new recipes
  python[3]-xstatic: new recipes
  python[3]-xstatic-font-awesome: new recipes
  python[3]-flask-xstatic: new recipes

 meta-python/recipes-devtools/python/python-alembic.inc  | 13 +++++++++++++
 .../recipes-devtools/python/python-alembic_0.9.6.bb     |  2 ++
 meta-python/recipes-devtools/python/python-editor.inc   |  9 +++++++++
 .../recipes-devtools/python/python-editor_1.0.3.bb      |  2 ++
 .../recipes-devtools/python/python-flask-babel.inc      | 16 ++++++++++++++++
 .../python/python-flask-babel_0.11.2.bb                 |  2 ++
 .../recipes-devtools/python/python-flask-mail.inc       | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-mail_0.9.1.bb  |  2 ++
 .../recipes-devtools/python/python-flask-migrate.inc    | 14 ++++++++++++++
 .../python/python-flask-migrate_2.1.1.bb                |  2 ++
 .../recipes-devtools/python/python-flask-nav.inc        | 13 +++++++++++++
 .../recipes-devtools/python/python-flask-nav_0.6.bb     |  2 ++
 .../recipes-devtools/python/python-flask-script.inc     | 12 ++++++++++++
 .../python/python-flask-script_2.0.6.bb                 |  2 ++
 .../recipes-devtools/python/python-flask-uploads.inc    | 12 ++++++++++++
 .../python/python-flask-uploads_0.2.1.bb                |  2 ++
 .../recipes-devtools/python/python-flask-user.inc       | 17 +++++++++++++++++
 .../recipes-devtools/python/python-flask-user_0.6.19.bb |  2 ++
 .../recipes-devtools/python/python-flask-xstatic.inc    | 15 +++++++++++++++
 .../python-flask-xstatic/remove-pip-requires.patch      |  7 +++++++
 .../python/python-flask-xstatic_0.0.1.bb                |  2 ++
 .../recipes-devtools/python/python-speaklater.inc       |  9 +++++++++
 .../recipes-devtools/python/python-speaklater_1.3.bb    |  2 ++
 .../python/python-xstatic-font-awesome.inc              | 17 +++++++++++++++++
 .../python/python-xstatic-font-awesome_4.7.0.0.bb       |  2 ++
 meta-python/recipes-devtools/python/python-xstatic.inc  | 14 ++++++++++++++
 .../recipes-devtools/python/python-xstatic_1.0.1.bb     |  2 ++
 .../recipes-devtools/python/python3-alembic_0.9.6.bb    |  2 ++
 .../recipes-devtools/python/python3-editor_1.0.3.bb     |  2 ++
 .../python/python3-flask-babel_0.11.2.bb                |  2 ++
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb |  2 ++
 .../python/python3-flask-migrate_2.1.1.bb               |  2 ++
 .../recipes-devtools/python/python3-flask-nav_0.6.bb    |  2 ++
 .../python/python3-flask-script_2.0.6.bb                |  2 ++
 .../python/python3-flask-uploads_0.2.1.bb               |  2 ++
 .../python/python3-flask-user_0.6.19.bb                 |  2 ++
 .../python/python3-flask-xstatic_0.0.1.bb               |  2 ++
 .../recipes-devtools/python/python3-speaklater_1.3.bb   |  2 ++
 .../python/python3-xstatic-font-awesome_4.7.0.0.bb      |  2 ++
 .../recipes-devtools/python/python3-xstatic_1.0.1.bb    |  2 ++
 40 files changed, 232 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-alembic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-alembic_0.9.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python-editor.inc
 create mode 100644 meta-python/recipes-devtools/python/python-editor_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-babel.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-uploads.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-user.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
 create mode 100644 meta-python/recipes-devtools/python/python-flask-xstatic_0.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater.inc
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-editor_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb

-- 
2.7.4


