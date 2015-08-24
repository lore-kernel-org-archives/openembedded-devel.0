Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0576AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:17 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MbOoG-1ZDTHQ3OSq-00IoTg;
	Mon, 24 Aug 2015 17:28:16 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:49 +0200
Message-Id: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
X-Provags-ID: V03:K0:KqoctrQhA7xeIYAilz7tt40sgta209qRmQkX9ZgyInO9grykRKX
	kNbrd1eR7muY5eVuOjW5ICwpKI5SDcok6Dk77W5NxiL7aKh5deZFxQQfgAUxQVpDkYXMkm7
	la3VDhH4c8Q6IbM03Xcn8TN1AAW1OAbGa13+EYsPry4I6Yl26qt43GbBDiogVq98fzdfova
	JEllNFgsAWmLyK/Ehmqag==
X-UI-Out-Filterresults: notjunk:1;V01:K0:g00jTQM1i/U=:g7iSRTSLwFXcDmCz6ProUo
	Bqpafxyc4P/8Khs3b5tPfhVxNPMDhesfd7O0tODc7oiT7aLxY9dd7cqiGkqMkhIY++GbPBrt1
	JMqOSjlHCjJgUwsU63XeNkNVUZp7yyKjQCzfuN6izfdhcd+zfGwYEPUGH3VBVM7CjEll+6GvW
	tSY1K6W3kex/8fb+8BFgRZAcSOOM6GDlvplnJc22Lp+5SgGsQtKMqBpW82JNrYK0HTavTt6d2
	9WQkjqmGUcL9gyi3g9G0Y7CZ1pnfXt78CuNwhPbKTc0xAtxv6vmlZ7Gp5B9ip/UIYMx7IxeXF
	6JreuszZAAkvhIBy4n4+rffNnqgN4ZG1sIUeFqOOIJesqGO0BGzXXt0vtd8QxBHc6pzUu8+wW
	+38QC5UEB9OTaJu//7fdJfdCFsez3SYkNrdkpKXzMZ12buB1jsAb1AU5Ov4qXLWxheObkUZwg
	ADf7BsbrArmQ582rns4ugMo/9RMZY/Jl/VWypyw+qWZ6DZLjuQgxv36Cx90owHmS2pUPFwU5Y
	dqZ3f/5PseJJEQ7jBuMo6YU6gsBiOm/4NoPKln/Fot6u9b1UPavLk1nLG0BQ3e66ha+gSRTE2
	iXcvxtrZocT0YoXt7LdqOvr4iB/N+Uuwoi1rvDPIE1ZOC0l1tw0izbCziqfolTWucgvw4dmyZ
	XMI230hjyI3qr8+JlZEbDyuSEJmly1AcGXHZZAF015n3c8XOg0D/aAXHWRRRYIx5XqesAJ3Z6
	rg+9tEcnxff6z8bnRAla8YUT31rcPkWYAd5dyw==
Subject: [meta-python][PATCH 0/8] Add Python 3 module recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 15:28:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches add Python 3 versions of some of the module recipes in
meta-python.
The Python 3 recipes are largely identical to their Python 2 counterparts,
so most of the original recipes' content is moved to .inc files that are
shared between both variants.

The affected packages are updated to their latest versions.

Dominic Sacré (8):
  python-cython: Upgrade 0.20.2 -> 0.23.1
  python-decorator: Upgrade 3.4.2 -> 4.0.2
  python-pyserial: Upgrade 2.4 -> 2.7
  python3-lxml: Add new recipe
  python3-cython: Add new recipe
  python3-decorator: Add new recipe
  python3-pyserial: Add new recipe
  python3-pyinotify: Add new recipe

 .../{python-cython_0.20.2.bb => python-cython.inc} | 13 ++++-----
 .../python/python-cython_0.23.1.bb                 |  6 ++++
 ...hon-decorator_3.4.2.bb => python-decorator.inc} |  8 ++---
 .../python/python-decorator_4.0.2.bb               |  2 ++
 .../recipes-devtools/python/python-lxml.inc        | 31 ++++++++++++++++++++
 .../recipes-devtools/python/python-lxml_3.4.4.bb   | 34 +---------------------
 .../recipes-devtools/python/python-pyinotify.inc   | 15 ++++++++++
 .../python/python-pyinotify_0.9.6.bb               | 17 +----------
 ...{python-pyserial_2.4.bb => python-pyserial.inc} | 15 ++++------
 .../recipes-devtools/python/python-pyserial_2.7.bb |  2 ++
 .../python/python3-cython_0.23.1.bb                | 18 ++++++++++++
 .../python/python3-decorator_4.0.2.bb              |  2 ++
 .../recipes-devtools/python/python3-lxml_3.4.4.bb  |  2 ++
 .../python/python3-pyinotify_0.9.6.bb              |  2 ++
 .../python/python3-pyserial_2.7.bb                 |  7 +++++
 15 files changed, 103 insertions(+), 71 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.20.2.bb => python-cython.inc} (68%)
 create mode 100644 meta-python/recipes-devtools/python/python-cython_0.23.1.bb
 rename meta-python/recipes-devtools/python/{python-decorator_3.4.2.bb => python-decorator.inc} (72%)
 create mode 100644 meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lxml.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyinotify.inc
 rename meta-python/recipes-devtools/python/{python-pyserial_2.4.bb => python-pyserial.inc} (49%)
 create mode 100644 meta-python/recipes-devtools/python/python-pyserial_2.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cython_0.23.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyserial_2.7.bb

-- 
2.5.0


