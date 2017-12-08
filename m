Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id CC4D477E76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:23 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id y6so6176089pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=39C3+ZnGojyD/+PLRDVYMaV9nfgnZ9SYjJbJXl08tm8=;
	b=Uaw3BiZV/SG1H7pr1J5mloBWBfVq4WM3wStrfzKkyZwjuSQGCKRgpFS0QHxeLFeK+0
	kzOUb3ruqnWuBnPwBnTC/pWXJai7QlqH1jKaq8fttLacFfhWJnF+mWZ0qSm6NvqQaC9p
	otOhkOyuZjNiusT7UMZYqEKsn32veEhu3uR0PcIgDpYEmjwrG3qBs79sd6FMMrDrVILN
	GUMS4Bw+yGG9Uushtoter110oGo2n8QHAXZWFkHA1QC0roihs3xvrKy+mbwiUqPO7Hnt
	XAfFG+TTiqIvwvhyTSICunRkCS8GyikRzNPm8GMVh0sg3AoDqv/lVwO4jxHn7jdkZX8U
	UmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=39C3+ZnGojyD/+PLRDVYMaV9nfgnZ9SYjJbJXl08tm8=;
	b=XxJN8iKnG8xhrQj4d6Ktnd+mPr71Ws7HEu07gRjOKvZCsrADBxTgts+iVcnwoEli72
	d5ffXE+EIqqJbJqevdsgQlr8twCtkPXjOAu3x7svuyBgZrX48IkDw/k5IOi3Q98znfYY
	Vl5HRAH4D7nPmrPp8fWSztTx3P1QZk9Aw+KBuj7aD2oqCpnZi6LwgcKTxEwAuHZmkMff
	zT/gSpY/1eDzPx2VgglXSb6zXxyz36jHBhKp8/+1aej6lkz4zXD9b7UwlybKJQgiXCZK
	uo8UloiJUHNswL4WG8Dg24NMnK+bECtBOPdhqqtuLPZlzd6tVinqrp52+lD0T+Bs7X9Y
	ipdw==
X-Gm-Message-State: AJaThX5RJzKd8OnaF05zs2tB+DQMTEDr77QaF7LWX86LhPwAzcG9Txou
	kzSn0qCwC0SBJYeqhFqt3XSqqQ==
X-Google-Smtp-Source: AGs4zMbBFjTRNvFCN4eq2tgwfEmGceVusluJ3fLoQPzjyg102gUIhU8oYce03YS2VOr5Da0peXo8mA==
X-Received: by 10.159.244.12 with SMTP id x12mr29478799plr.312.1512712164423; 
	Thu, 07 Dec 2017 21:49:24 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:23 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:48:58 -0800
Message-Id: <20171208054911.27014-1-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-python][V2 PATCH 00/13] New recipes for additional flask extensions
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:23 -0000

The basic flask recipes and recipes for a few flask extensions are currently
present in meta-python. This patch adds several more flask extensions and their
dependencies, useful for building full featured web sites. Both python and
python3 receipes are provided.

V2: fix patches in 03/13 (flask-migrate) and 13/13 (flask-xstatic). The rest
are unchanged.

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
 .../recipes-devtools/python/python-flask-xstatic.inc    | 16 ++++++++++++++++
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


