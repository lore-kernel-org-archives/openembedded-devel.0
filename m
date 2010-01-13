Received: from mxa.rambler.ru ([81.19.66.231])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alexondi@rambler.ru>) id 1NV5Kh-0008QU-P9
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:40:34 +0100
Received: from mcgi62.rambler.ru (mcgi62.rambler.ru [81.19.67.192])
	by mxa.rambler.ru (Postfix) with ESMTP id 47CBE86716
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 18:38:23 +0300 (MSK)
Received: from mcgi62.rambler.ru (localhost [127.0.0.1])
	by mcgi62.rambler.ru (Postfix) with ESMTP id B35C711412
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 18:38:20 +0300 (MSK)
Received: from [77.52.208.230] by mcgi62.rambler.ru with HTTP (mailimap);
	Wed, 13 Jan 2010 18:38:17 +0300
From: Perepelica Alexander <alexondi@rambler.ru>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 18:38:17 +0300
MIME-Version: 1.0
Message-Id: <968959991.1263397097.41458488.98027@mcgi62.rambler.ru>
X-Mailer: Ramail 3u, (untone), http://mail.rambler.ru
X-SA-Exim-Connect-IP: 81.19.66.231
X-SA-Exim-Mail-From: alexondi@rambler.ru
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Adding a new Machine question
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
X-List-Received-Date: Wed, 13 Jan 2010 15:40:34 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Hello Martin!
I set DEFAULT_PREFERENCE = "1" but this don't helped
here is my changes

diff --git a/recipes/linux/linux_2.6.32+2.6.33-rc3.bb 
b/recipes/linux/linux_2.6.32+2.6.33-rc3.bb
index c459312..eb688a5 100644
--- a/recipes/linux/linux_2.6.32+2.6.33-rc3.bb
+++ b/recipes/linux/linux_2.6.32+2.6.33-rc3.bb
@@ -8,7 +8,7 @@ PR = "r1"
 S = "${WORKDIR}/linux-${OLD_KERNEL_RELEASE}"

 # Mark archs/machines that this kernel supports
-DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE = "1"
 DEFAULT_PREFERENCE_simone = "-1"
 DEFAULT_PREFERENCE_akita = "-1"
 DEFAULT_PREFERENCE_c7x0 = "-1"
diff --git a/recipes/linux/linux_2.6.32.bb 
b/recipes/linux/linux_2.6.32.bb
index 6a97f1b..46388bc 100644
--- a/recipes/linux/linux_2.6.32.bb
+++ b/recipes/linux/linux_2.6.32.bb
@@ -5,7 +5,7 @@ PR = "r3"
 S = "${WORKDIR}/linux-${PV}"

 # Mark archs/machines that this kernel supports
-DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE = "1"
 DEFAULT_PREFERENCE_ion = "1"
 DEFAULT_PREFERENCE_simone = "1"




