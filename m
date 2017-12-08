Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B943977E76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:24 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id j28so6508524pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nfNnW8ibEop/cjSjGVBYna2V3JQlQ3EtqT8DNisLxRc=;
	b=gZMoE6AUyofBE50tAnjojFcYaBHYjMjyS9UG4tIRNShEU8xqLRmJffM86ifE5nON6m
	rYokPero0Wmnm9pfE/WaVACaHx/7/T/3x1ClFmFMI0gRnj/yuwttHRIuCIBUO3dE3Zwl
	zQHPdrbKLn7G0RPCgG2/Gr0JUoTroJElMzj2iW76BHRxLmaTmxBVJ2a6Y+J8u6B6Puv7
	pp8JWfssGoeJbuK8bMB58d8WtsixOuBkxWO+AYCfxG/i8fNLdwKqiZenaNQDLm/nRaYK
	DhrF4bcag7orG/LIfTevyuBwGVavDvVzUiVsyNwhVrveLqSLph7r8IBe9ycRT8Va+Jjb
	QveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nfNnW8ibEop/cjSjGVBYna2V3JQlQ3EtqT8DNisLxRc=;
	b=jbmijz8llrUl8GegixNeC1xjeUrfV3P4fz0hQE4TSSKC9fn0rXAsKKPKUWLS21yFY9
	UWOyu8KwGymw4iJgVIDcnkIfsxlcy2/RGF/iQXRCaoVMB9zj48KjzY7XJpNze+JxAvZ5
	WaWSGqPFPLMsS+GBSaPx4dxtDUqQmuMt6yoxLJutaXkeT4kbJVgLYNcCfiGMUd0RLbYG
	aOYwPtcyvNAjzTe8tiPip8NDIJX99xp3fgXvSoB49AcIn9EJV4f6gmjvA7+n4Z+UIYmS
	Uibw5WKCpht11eIUuDs6StQOGvKIXFdia4JL5juzjivUaI4JAdQgwKWRvgNZoIX3qtlM
	OT/w==
X-Gm-Message-State: AJaThX5UpWQbvFdkC1IBH9FxOHWKVSm3YmjtW2i1DIhHLCECBTzhpVXh
	dimVwIQnQm3flG7MX+ip4EQcjw==
X-Google-Smtp-Source: AGs4zMamKzRTD1HLz1Q+XSUMYOyGX1pkKtUa80Z7WRPSVBegSkmCuUDMPNZobc/srglAJEpE4b+UGg==
X-Received: by 10.99.160.96 with SMTP id u32mr28448554pgn.25.1512711985599;
	Thu, 07 Dec 2017 21:46:25 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:24 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:36 -0800
Message-Id: <20171208054548.26218-1-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-python][V2 PATCH 00/12] Create Python3 recipies for several existing Python2 recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:24 -0000

This set of patches creates the Python3 variant of several existing Python2 packages.
It first moves the core of the existing recipe(s) into a .inc file, then creates
python-*-.bb and python3-*.bb files that reference the new .inc file.

V2: the only change is to patch 07 of the series.

Bill Randle (12):
  python-dominate: move core of recipe to a .inc file
  python3-dominate: new recipe
  python-flask-bootstrap: move core of recipe to a .inc file
  python3-flask-bootstrap: new recipe
  python-flask-sqlalchemy: move core of recipe to a .inc file
  python3-flask-sqlalchemy: new recipe
  python-flask-wtf: move core of recipe to a .inc file
  python3-flask-wtf: new recipe
  python-visitor: move core of recipe to a .inc file
  python3-visitor: new recipe
  python-wtforms: move core of recipe to a .inc file
  python3-wtforms: new recipe

 .../recipes-devtools/python/python-dominate.inc        | 11 +++++++++++
 .../recipes-devtools/python/python-dominate_2.3.1.bb   | 13 +------------
 .../recipes-devtools/python/python-flask-bootstrap.inc | 14 ++++++++++++++
 .../python/python-flask-bootstrap_3.3.7.1.bb           | 16 +---------------
 .../python/python-flask-sqlalchemy.inc                 | 10 ++++++++++
 .../python/python-flask-sqlalchemy_2.3.2.bb            | 12 +-----------
 .../recipes-devtools/python/python-flask-wtf.inc       | 16 ++++++++++++++++
 .../recipes-devtools/python/python-flask-wtf_0.12.bb   | 17 +----------------
 meta-python/recipes-devtools/python/python-visitor.inc |  6 ++++++
 .../recipes-devtools/python/python-visitor_0.1.3.bb    |  8 +-------
 meta-python/recipes-devtools/python/python-wtforms.inc | 16 ++++++++++++++++
 .../recipes-devtools/python/python-wtforms_2.1.bb      | 18 +-----------------
 .../recipes-devtools/python/python3-dominate_2.3.1.bb  |  2 ++
 .../python/python3-flask-bootstrap_3.3.7.1.bb          |  2 ++
 .../python/python3-flask-sqlalchemy_2.3.2.bb           |  2 ++
 .../recipes-devtools/python/python3-flask-wtf_0.12.bb  |  2 ++
 .../recipes-devtools/python/python3-visitor_0.1.3.bb   |  2 ++
 .../recipes-devtools/python/python3-wtforms_2.1.bb     |  2 ++
 18 files changed, 90 insertions(+), 78 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-dominate.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc
 create mode 100644 meta-python/recipes-devtools/python/python-visitor.inc
 create mode 100644 meta-python/recipes-devtools/python/python-wtforms.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-wtf_0.12.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-visitor_0.1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wtforms_2.1.bb

-- 
2.7.4


