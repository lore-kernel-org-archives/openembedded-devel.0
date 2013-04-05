Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExT-0000F9-Pf
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:09 +0200
Received: by mail-ee0-f54.google.com with SMTP id e51so1585332eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=X7w9JYkxg3Az380IjppiuHuO8hWAylYrw81rozFjg3c=;
	b=atTHCjEhdwcajxLpjmSctEuYFvvW8zUAvVWeV+ueddUcrrWyKwpUjukgEtE6Wc4DBe
	QEqXJJx2HpWtcvqyg/gJR0Lai03kyFEASTeYxIsz+6o8KoOvkmmBzWDm/igeqQVKYbMy
	R6IpgrHEM+aqxC/gypfQipt2uh/aOIi+0n49iKW1t2BXUNbMT1liAeWBmitw3xhfOTWv
	q+mSRbwzBw0Bv/PgVNiKtpemBs2njqUTA/+3VuIMlQPoSsZVx+N6pUttr5YTmFJyLI0I
	vPu8eximaa2ykKQKfeUI/lhUpEpovQYRDLjQz5AXYsJ+cH/uXvSk4YSp7/BGPAd2t7+m
	Nv0w==
X-Received: by 10.15.99.201 with SMTP id bl49mr9985120eeb.43.1365199253146;
	Fri, 05 Apr 2013 15:00:53 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.00.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:00:52 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:30 +0200
Message-Id: <cover.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH 0/6] minor fixes for Zaurus
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:10 -0000

Spring-cleanings of obsolete variables and removal of machines
which can be built as spitz or c7x0

Andrea Adami (6):
  linux-yocto-3.8: remove cruft (to-do about regulators)
  zaurus: remove u-boot remnants from akita/spitz/c7x0 configs
  zaurus: remove obsolete ROOT_FLASH_SIZE
  zaurus: add note about mtdparts of tosa
  zaurus: remove configurations of models aliased by c7x0 and spitz
  zaurus: add README.zaurus, about flashing kernel, JFFS2 and UBIFS
    images

 README.zaurus              | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 conf/machine/akita.conf    |  5 ---
 conf/machine/borzoi.conf   |  2 --
 conf/machine/boxer.conf    |  2 --
 conf/machine/c7x0.conf     |  8 -----
 conf/machine/collie.conf   |  2 --
 conf/machine/corgi.conf    |  3 --
 conf/machine/husky.conf    |  2 --
 conf/machine/poodle.conf   |  2 --
 conf/machine/shepherd.conf |  3 --
 conf/machine/spitz.conf    |  9 -----
 conf/machine/terrier.conf  |  2 --
 conf/machine/tosa.conf     |  3 +-
 13 files changed, 90 insertions(+), 41 deletions(-)
 create mode 100644 README.zaurus
 delete mode 100644 conf/machine/borzoi.conf
 delete mode 100644 conf/machine/boxer.conf
 delete mode 100644 conf/machine/corgi.conf
 delete mode 100644 conf/machine/husky.conf
 delete mode 100644 conf/machine/shepherd.conf
 delete mode 100644 conf/machine/terrier.conf
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/REGULATORS

-- 
1.7.12.4



