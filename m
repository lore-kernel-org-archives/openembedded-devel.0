Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TOpwT-0000xq-3w
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 15:15:17 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so9500031vcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=J6iav7iQl7ILh6bVmQk3RhABqUS+XTFiZk6wqaDwS64=;
	b=xJvrjcCatF+wCYRF18IIXWotL98eiLqu36DDexG4Qx+V2kb2ygS81VoaSy83LgZ+st
	w8jU8NrGp/0eB5TYniewY0Zbxx2QHVB4CAzauX+1pzuuaHaRFxn1t9C18hoyY7NpSy7X
	/zKCvkZev8R2qODj4M0kuyWo1Xespopkecw6N0eBb+NtBPCCHgxyrhQ0ux1tmPCudF4o
	Oh2N2V1KYAKl1UR0IMuZTNAV7oacpW2dwCqflsRL9RN/Mjsb6FdWXnrOK10AVTYCT0X/
	q+PWjPSB6vSlRp9BaJXTs3NJfrJaKFksS8QuiMOGQznon0QOObDB2Hxr/FIRp5Pwe+Zg
	jRmw==
Received: by 10.220.205.198 with SMTP id fr6mr5166154vcb.63.1350565317324;
	Thu, 18 Oct 2012 06:01:57 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id w10sm3537529vef.5.2012.10.18.06.01.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 06:01:55 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 18 Oct 2012 09:01:58 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 09:01:57 -0400
Message-Id: <1350565318-13026-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] lmsensors: Initial commit (cover letter).
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
X-List-Received-Date: Thu, 18 Oct 2012 13:15:17 -0000

Here's a second version of my patch for adding lmsensors.

As suggested by Paul and Martin I've rebased my patch against meta-oe
and dropped the rrdtool part.

Regards,

Marc

Marc Ferland (1):
  lmsensors: Initial commit.

 .../recipes-support/lm_sensors/files/fancontrol    |    2 +
 .../recipes-support/lm_sensors/files/fancontrol.sh |   48 ++++++
 .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
 .../recipes-support/lm_sensors/files/sensord.conf  |   16 ++
 .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
 .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
 .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  150 ++++++++++++++++++++
 7 files changed, 277 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
 create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb

-- 
1.7.5.4



