Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5936576DE1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so517928wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jZj6tThB1FGHGG4sYC4xwLi200VJUuNj5UOPYrUnhR0=;
	b=O6FeV7FW8kySJUNtBqQOenoUoXyYUPD4Up2ys08qVeYolBBtgfRkSNc1Ww33WBkK3Y
	zopcIQfe6xaQWl+eDrhWAnZdLJdlaHt/rBUnrJY+NwcPq+7pmXFy53epUO+6+xXMMQRJ
	GRz6i/G69cCmBG38TdxpSQU5IjV1FDV6/VVKGrwWcacgnK/Xpi0U+OPvvQPEXWWGSjcE
	d8S7Mans81QjmiAMUqe/0NHlPApMyu8ucVXupcuGiEazfGAJ0TQhSnIl9fGuHnl9qnQN
	f/eaBC1KhqG6fPXoYIrmijtxltXn6de0iJYZtMBio7KG0jGOA4gNU987yLZXppK7PVde
	Wong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jZj6tThB1FGHGG4sYC4xwLi200VJUuNj5UOPYrUnhR0=;
	b=c+/wvFZRpnQS8inFj3Svl064qi9tPaGFqK4YI35n26DEDRIel8t7BgPl7iONE+vwGH
	xMsxiCxUqo2jMVmSuiPINZRWGFKnCg2MiVHSUIUAgSwM+YFl3DrZPPdgU2w9bA9t/qkm
	/Nf4Znk9e5V03N5DKDy2xHSQZa9Ybnz0wz4RJn9KopDnnbIracEYp/t3WWbAFLBYIQUk
	m0xg6punZPOdT+Z199CSf4t4vCrKquy8InDtfPYWnromES2PjpkOTM6CHWfNfNy/nmld
	0m1URJiU0vuaIs3xf4IyFGIlmTWags9z34mj8q1Q17h7kbYpWSF57dMnVBZijiEnNpBq
	AUTA==
X-Gm-Message-State: AG10YORrWU1/dnLwB2vOx30SMT+ij1RlCPuCnwCP02Td6qXf9xiQUFASmQO9rcKqnY0gLg==
X-Received: by 10.28.136.148 with SMTP id k142mr6282942wmd.41.1453505444233;
	Fri, 22 Jan 2016 15:30:44 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:43 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:02 +0100
Message-Id: <cover.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 00/21] Add recipes for different python and python3 packages
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:47 -0000

I'm planning to include the python3-based project cve-search into an OE layer.
Therefore I need its dependencies in OE. This patchset shall add many recipes
for python as well as python3. But I'm not yet sure if all recipes have all
required RDEPENDS. It would be great if you could tell me how I can quickly find
out the right RDEPENDS for each package.

The following changes since commit b866e0ac90075f9b12f2c9486bd7baed5f1376d9:

  dhcpcd: add recipe for dhcpcd (2016-01-20 19:13:43 +0100)

are available in the git repository at:

  git://github.com/esven/meta-openembedded python-additions
  https://github.com/esven/meta-openembedded/tree/python-additions

Sven Ebenfeld (21):
  python(3)-lxml: 3.4.4 -> 3.5.0
  python(3)-feedformatter: add recipes
  add pypi3 bbclass to make python3 recipe creation easier as well
  python-six: 1.9.0 -> 1.10.0 and add python3-recipe
  python-dateutil: 1.5 -> 2.4.2 and add python3 recipe
  python(3)-itsdangerous: add recipes
  python(3)-markupsafe: add recipes
  python(3)-passlib: add recipes
  python-requests: 2.7.0 -> 2.9.1 and add python3 recipe
  python(3)-redis: add recipes
  python(3)-werkzeug: add recipe
  python(3)-pymisp: add recipes
  python-jinja2: 2.7.3 -> 2.8 and add python3 recipe
  python(3)-pymongo: add recipes
  python-certifi: 14.05.14 -> 2015.11.20.1 and add python3 recipe
  python3-tornado: add recipe
  python(3)-xlrd: add recipes
  python(3)-whoosh: add recipes
  python(3)-flask: add recipes
  python(3)-flask-login: add recipes
  python(3)-flask-pymongo: add recipes

 meta-python/classes/pypi-common.bbclass            | 21 ++++++++++++
 meta-python/classes/pypi.bbclass                   | 22 +------------
 meta-python/classes/pypi3.bbclass                  |  1 +
 ...thon-certifi_14.05.14.bb => python-certifi.inc} | 15 ++-------
 .../python/python-certifi_2015.11.20.1.bb          |  2 ++
 .../recipes-devtools/python/python-dateutil.inc    | 23 ++++++++++++++
 .../recipes-devtools/python/python-dateutil_1.5.bb | 22 -------------
 .../python/python-dateutil_2.4.2.bb                |  2 ++
 .../python/python-feedformatter.inc                | 11 +++++++
 .../python/python-feedformatter_0.4.bb             |  2 ++
 .../recipes-devtools/python/python-flask-login.inc | 14 ++++++++
 .../python/python-flask-login_0.2.11.bb            |  2 ++
 .../python/python-flask-pymongo.inc                | 13 ++++++++
 .../python/python-flask-pymongo_0.4.0.bb           |  2 ++
 .../recipes-devtools/python/python-flask.inc       | 14 ++++++++
 .../recipes-devtools/python/python-flask_0.10.1.bb |  2 ++
 .../python/python-itsdangerous.inc                 |  9 ++++++
 .../python/python-itsdangerous_0.24.bb             |  2 ++
 .../recipes-devtools/python/python-jinja2.inc      | 16 ++++++++++
 .../recipes-devtools/python/python-jinja2_2.7.3.bb | 21 ------------
 .../recipes-devtools/python/python-jinja2_2.8.bb   |  2 ++
 .../recipes-devtools/python/python-lxml.inc        | 25 +++++++++++----
 .../{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} |  0
 .../recipes-devtools/python/python-markupsafe.inc  | 17 ++++++++++
 .../python/python-markupsafe_0.23.bb               | 19 +----------
 .../recipes-devtools/python/python-passlib.inc     | 14 ++++++++
 .../python/python-passlib_1.6.5.bb                 |  2 ++
 .../recipes-devtools/python/python-pymisp.inc      | 14 ++++++++
 .../recipes-devtools/python/python-pymisp_2.2.bb   |  2 ++
 .../recipes-devtools/python/python-pymongo.inc     | 12 +++++++
 .../recipes-devtools/python/python-pymongo_3.2.bb  |  2 ++
 .../recipes-devtools/python/python-redis.inc       |  9 ++++++
 .../recipes-devtools/python/python-redis_2.10.5.bb |  2 ++
 .../recipes-devtools/python/python-requests.inc    |  9 ++++++
 .../python/python-requests_2.7.0.bb                | 18 -----------
 .../python/python-requests_2.9.1.bb                |  4 +++
 .../python/{python-six_1.9.0.bb => python-six.inc} |  6 ++--
 .../recipes-devtools/python/python-six_1.10.0.bb   |  2 ++
 .../recipes-devtools/python/python-tornado.inc     | 24 ++++++++++++++
 .../recipes-devtools/python/python-tornado_4.3.bb  | 37 ++--------------------
 .../recipes-devtools/python/python-werkzeug.inc    | 16 ++++++++++
 .../python/python-werkzeug_0.11.3.bb               |  2 ++
 .../recipes-devtools/python/python-whoosh.inc      | 13 ++++++++
 .../recipes-devtools/python/python-whoosh_2.7.0.bb |  2 ++
 .../recipes-devtools/python/python-xlrd.inc        | 10 ++++++
 .../recipes-devtools/python/python-xlrd_0.9.4.bb   |  2 ++
 .../python/python3-certifi_2015.11.20.1.bb         |  2 ++
 .../python/python3-dateutil_2.4.2.bb               |  2 ++
 .../python/python3-feedformatter_0.4.bb            |  2 ++
 .../python/python3-flask-login_0.2.11.bb           |  2 ++
 .../python/python3-flask-pymongo_0.4.0.bb          |  2 ++
 .../python/python3-flask_0.10.1.bb                 |  2 ++
 .../python/python3-itsdangerous_0.24.bb            |  2 ++
 .../recipes-devtools/python/python3-jinja2_2.8.bb  |  2 ++
 ...python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} |  0
 .../python/python3-markupsafe_0.23.bb              |  2 ++
 .../python/python3-passlib_1.6.5.bb                |  2 ++
 .../recipes-devtools/python/python3-pymisp_2.2.bb  |  2 ++
 .../recipes-devtools/python/python3-pymongo_3.2.bb |  2 ++
 .../python/python3-redis_2.10.5.bb                 |  2 ++
 .../python/python3-requests_2.9.1.bb               |  2 ++
 .../recipes-devtools/python/python3-six_1.10.0.bb  |  2 ++
 .../recipes-devtools/python/python3-tornado_4.3.bb |  2 ++
 .../python/python3-werkzeug_0.11.3.bb              |  2 ++
 .../python/python3-whoosh_2.7.0.bb                 |  2 ++
 .../recipes-devtools/python/python3-xlrd_0.9.4.bb  |  2 ++
 66 files changed, 362 insertions(+), 157 deletions(-)
 create mode 100644 meta-python/classes/pypi-common.bbclass
 create mode 100644 meta-python/classes/pypi3.bbclass
 rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb => python-certifi.inc} (53%)
 create mode 100644 meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-dateutil.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-dateutil_1.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-dateutil_2.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-feedformatter.inc
 create mode 100644 meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-login.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-flask.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask_0.10.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-itsdangerous.inc
 create mode 100644 meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
 create mode 100644 meta-python/recipes-devtools/python/python-jinja2.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-jinja2_2.8.bb
 rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} (100%)
 create mode 100644 meta-python/recipes-devtools/python/python-markupsafe.inc
 create mode 100644 meta-python/recipes-devtools/python/python-passlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pymisp.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymisp_2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pymongo.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymongo_3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-redis.inc
 create mode 100644 meta-python/recipes-devtools/python/python-redis_2.10.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-requests.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-requests_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-requests_2.9.1.bb
 rename meta-python/recipes-devtools/python/{python-six_1.9.0.bb => python-six.inc} (69%)
 create mode 100644 meta-python/recipes-devtools/python/python-six_1.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-tornado.inc
 create mode 100644 meta-python/recipes-devtools/python/python-werkzeug.inc
 create mode 100644 meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-whoosh.inc
 create mode 100644 meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-xlrd.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dateutil_2.4.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
 rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-markupsafe_0.23.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymisp_2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-six_1.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado_4.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb

-- 
1.9.1


