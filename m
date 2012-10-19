Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TPEVH-0007JB-Li
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 17:28:51 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so557015vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=e9Bo4TGEtL5ULPJEvsSVavJ1uFywOVA7P3IeNUJ11+s=;
	b=BhSbkxjJ5uGqf7bcuQ5NqJBFw7poHlqKV/iJrOi8LVePLABAt4SN7Wu2ekCJhuTkOc
	/ZpicAhy6ce2BmsCwCWJGzAnG50pJvxhen09t1ukBJ1MFmBBR4BMoSkB1xbhCTWQ3CjA
	4o6ZzmSMjEKWoMjfIT4f7HbstfE1ITwS9itMWKIk4OPrkvOfBtrbsKAJ4RHH/ikdNWMj
	LKvQ6Bcin3gIAWLuEblHUSRi7Gh8iw53cCrWCpQTeF0sDe1LNlf+1BV3LZiImIm+Jtu9
	AFsVsEEi4IPHwgYDtTdiT/X3oJfn75HgeMBgRRgQT0XdHWuUJ/3Q1a/rJYSCUyWwnG3O
	D1Dw==
Received: by 10.52.92.97 with SMTP id cl1mr1595945vdb.65.1350659730169;
	Fri, 19 Oct 2012 08:15:30 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id g5sm1657371vez.6.2012.10.19.08.15.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 08:15:29 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Fri, 19 Oct 2012 11:15:34 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Oct 2012 11:15:33 -0400
Message-Id: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] lmsensors: Initial commit (cover letter)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 15:28:51 -0000

Third version of the patch for lmsensors based on comments from Koen.

Marc Ferland (1):
  lmsensors: Initial commit.

 .../recipes-support/lm_sensors/files/fancontrol    |    2 +
 .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++
 .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
 .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++
 .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
 .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
 .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140 ++++++++++++++++++++
 7 files changed, 267 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb

-- 
1.7.5.4



