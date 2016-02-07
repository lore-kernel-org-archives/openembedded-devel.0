Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1799F760B0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:06 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 71so2795838pfv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Wi9ZjsVPmywJchG+WOVzThZz9ESo5UOnpTWjDUY0fnQ=;
	b=iedAh41ZCeIE06F+4UxIrfjPz/oZ7lDSWtefG0DBuWZEQez5DLNV5dk2tc//vexMq+
	QzEHQJ8BW7FE1d3bTl3+0XtjzP98saMYOvZLJ/esw95UmAVHyac7hiyQuPvQxL+bMGpq
	5UkA+HmOhwJOvRY3QM+OGoPSIMqlpcKYi9KdRHh02dTZYqBqgG1N+Cr4QXTrqFqYPxHQ
	oR6XBTh/Vwy2F87+AjL3XQ+0C4n7KMZck4clM4TiZEb9C7OLElxXTb8GnJ1iy52hM8Gd
	okxGPSPdymRqa4h5G/OvO2dBW5mYPZKjTd7ChpaYNbS8INNogMEqOktKUwD0Kq6Wcc8I
	tHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Wi9ZjsVPmywJchG+WOVzThZz9ESo5UOnpTWjDUY0fnQ=;
	b=ZV/fpZw5auo5a0dxOtFuEtxbhV+HwdGOHHOTDpnbMjXjD6HE9GFAtA4ly6GdYYzuGt
	Bczq8Aiqc1GA/PHfiE3EIkbyxllyyOTrSUXoCrIJiH+NLOQyPfI/MPURGgj0eSdpKv27
	+CRA26k40+0B30KWCsPTqOrK+CnM8/7JCupToScyQWaCcq8hnLU3sCqk0yUgGQi1hnk/
	y8SYFCW7z6ANj2B9nKbEmgNNoS/9xsyIzAVyYSfZ2w3qqo2o0LBdAGhy/S1wAM4Ps/cv
	G6W4PEPLl3+M7T4t0OlYLAIdoY7VB5+irHUXY+wySDIYFlQmB3vAP5lRuOfPrEhwguxA
	ZAZQ==
X-Gm-Message-State: AG10YOTHeheh9P91s9f+eA1yekYtNxgcWZMq4luAZgXizCgZyMElidbvlSlYwKfwoKgE+A==
X-Received: by 10.98.10.139 with SMTP id 11mr11344251pfk.87.1454879527545;
	Sun, 07 Feb 2016 13:12:07 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:52 -0800
Message-Id: <cover.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/7][fido] Pull request
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:09 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider these few Security and build fixes for fido-next

The following changes since commit 220b31d536cf15e68c11980e0c721a7050313db1:

  ntp: upgrade 4.2.8p2 -> 4.2.8p3 (2015-10-26 21:43:09 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/fido-next
  https://github.com//tree/akuster/fido-next

Armin Kuster (5):
  squid: serveral missing security fixes
  php: Security fix CVE-2015-7803
  php: Security fix CVE-2015-7804
  php: Security fix CVE-2016-1903
  krb5: Fix warning.

Qi.Chen@windriver.com (1):
  ntp: fix rpath QA issue

Wenzong Fan (1):
  ntp: upgrade 4.2.8p3 -> 4.2.8p4

 .../squid/files/CVE-2014-6270.patch                |  61 +++++
 .../squid/files/CVE-2014-7141_CVE-2014-7142.patch  | 282 ++++++++++++++++++++
 .../squid/files/CVE-2015-3455.patch                |  53 ++++
 .../squid/files/CVE-2015-5400.patch                | 292 +++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.4.7.bb           |   4 +
 .../ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb}         |   5 +-
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb   |   2 +-
 .../recipes-devtools/php/php/CVE-2015-7803.patch   |  82 ++++++
 .../recipes-devtools/php/php/CVE-2015-7804.patch   |  62 +++++
 .../recipes-devtools/php/php/CVE-2016-1903.patch   |  28 ++
 meta-oe/recipes-devtools/php/php_5.5.21.bb         |   3 +
 11 files changed, 871 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2014-6270.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2014-7141_CVE-2014-7142.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2015-3455.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2015-5400.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb} (97%)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2015-7803.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2015-7804.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2016-1903.patch

-- 
2.3.5


