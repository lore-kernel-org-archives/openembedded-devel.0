Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 956A07808D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:47:52 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id o2so2577714pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6ZgOk1hsYNs+An7EwuiEUy6mv39GJAxfLZf4KW+xGr4=;
	b=cqrOmaQlvn8jJT7bm18x2LlpQVgQVnrllSRigAqYasAxilIG7aNiaVI6rbWbcVhriM
	tPNCpqYl3xngZ33bk7fqgHU+09gPraS8wH7B0W+79JpMo58yOmrivSiHRlGWg+K34Hd1
	nX4KFb4aqwNe7eDwLY+oHeajZh4rT5stprRIx4+D/Aikfh8DyMLaOU+vdqJ9EGNTOw1E
	DJfu+UkL1BpEwg6hMkX3lLFIhA5C+ZjBC1rk1rdKyaqjPWWjyMjacdifIvs8jt9VuAGp
	KlyZmR8lqAHGZUQ+KHu/Cu0MFBlatmBtGu5p2uc4QFOJnK5Q8mAtOy5Sv/o06UHF7O/4
	2HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6ZgOk1hsYNs+An7EwuiEUy6mv39GJAxfLZf4KW+xGr4=;
	b=VLbfjFtZxvi9xV2FR3ikEUj4N3HRCAIT9sEmNNHZjY89/9YqL89J9RuDoHy+HMTKoP
	v3W3vxMu+LfvCSrYIJ+AjQTnch+Ulzae9PxhemzIbUxJNaoiRRSWYCqtyF7pYOO+6xva
	0sgDv4HyqTzuoN3IFUqTVOfi9QE0pB65ORbRTzqh0Xpx8c1HPEAAaRi/Gnt4cJlrA48H
	/FPewMufAKss304/2xud1MTbXX6GhqEOZxNT/7kt9BvaiWxTlaeAIjrG+QL9Q3n9NDBS
	BZd1JqxD0UlVP0GVDB8fU/MlI0vSN51EQDXHRrUUPtVDT1HXlos1qTHKZYEH3EvzZIFn
	YpOg==
X-Gm-Message-State: AJaThX4Zznti/MNu2MiTKDsK1/R62gl5LgxtZarW0juO1VQB3C+rQExJ
	2LOe1Re6U8j1gtngm+n/Ef4gLw==
X-Google-Smtp-Source: AGs4zMb/UsOg7az1bdNvGPjcofPFzpBJT44otcdOUx9cQh2Hq3zcq+it7bCbVddGUemrflMqcairjw==
X-Received: by 10.98.34.85 with SMTP id i82mr5489267pfi.57.1512020873385;
	Wed, 29 Nov 2017 21:47:53 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:47:52 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:46:59 -0800
Message-Id: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 00/12] Create Python3 recipies for several existing Python2 recipes
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
X-List-Received-Date: Thu, 30 Nov 2017 05:47:52 -0000

This set of patches creates the Python3 variant of several existing Python2 packages.
It first moves the core of the existing recipe(s) into a .inc file, then creates
python-*-.bb and python3-*.bb files that reference the new .inc file.

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
 .../recipes-devtools/python/python-flask-wtf.inc       | 15 +++++++++++++++
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


