Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTWNA-0002hd-4u
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 12:22:12 +0100
Received: by mail-gh0-f175.google.com with SMTP id z2so235145ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NhCTNDr9zEC2Y3CYrS0eb1GA00B/B/2tznLWNVUoq+A=;
	b=ogxO4IDYWLge3flZJ+hV9fgM9ebxpyDKSeY2GGWlRx4WBapckUlv8HD9JEdBI7p7hD
	lpTBwp2hZCOQw4dor0eLsalS9FFAxEjj/XVmD8GxvGPCRAHB5Q37WUTJykAaczY1jlkg
	tfvQgXa+QS/A6Eh0yMwBo3PLOzvCpyANQJgowvlZGHtIVhCNLOn3rhUZ7N9zImOf+HrY
	FVDrmajPERpqReHzLASrlSKFsSyUaDxJIK1qmvyIQJxVfPVeBZQ35xtGK1qzJ77jbEn3
	NrAfPu8/5Zic5YF1Jy29gWfI/eBTq6kKHxzPzQPdjfsTBd0BxoOCKc0TKx++c3dgKQEK
	p+vA==
Received: by 10.236.146.239 with SMTP id r75mr36426864yhj.100.1351681715234;
	Wed, 31 Oct 2012 04:08:35 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u49sm3307372yhd.18.2012.10.31.04.08.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 04:08:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2012 09:08:24 -0200
Message-Id: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 11:22:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/ntp/ntp/ntpd.service           |    0
 .../recipes-support/ntp/ntp/ntpdate.service        |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp_4.2.6p3.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
-- 
1.7.2.5



