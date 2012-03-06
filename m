Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yXj-0005FA-SC
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 18:51:24 +0100
Received: by yhjj56 with SMTP id j56so2319887yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.186.1 as permitted sender) client-ip=10.236.186.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.186.1 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.186.1])
	by 10.236.186.1 with SMTP id v1mr36161994yhm.4.1331055767705 (num_hops
	= 1); Tue, 06 Mar 2012 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=Z4DVQrBFOHRAgpSdvNHR0cK2h2mzgJ+KReFG877iwxY=;
	b=0jxUBkcN7lU40vKZtQCZRUhArC8vE2fjZ1caPV8K747HxUZP0JeO1tKna6qUtCoPug
	HfeOG5tB+Hs8y/uOcT/DNm2mrukbhbCcAHcz7EcZsQ49nQ9azgVgyJ9wTOwkfke2zIiT
	61b+OV3GtsQ/MzgMuzC3LOx2hqeOdBOv1uN+nSsFZ3jQUg94JopTE2A7YIrU8O7S70aN
	3zXDAlkHU1arN5HxrGbOpQR4nYLUufsnA7u3K+D01O7bbov7erKG7eP0sG3CvBdacdP5
	SIXM9fc08/JnwuryV1/Scx3EIq7n/OzjFSBf1JIc/eAfZD4wffKbEpe+FSOE8XTqx5DH
	f/VA==
Received: by 10.236.186.1 with SMTP id v1mr28677011yhm.4.1331055767655;
	Tue, 06 Mar 2012 09:42:47 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v26sm50765044yhk.1.2012.03.06.09.42.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:42:46 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:42:38 +0000
Message-Id: <cover.1331055665.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/1] Postinst trigger improvements for images
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
X-List-Received-Date: Tue, 06 Mar 2012 17:51:24 -0000

Please ONLY merge this after the equivalent changes are merged onto OE-Core.

The following changes since commit 13354c9e1993f6196c2c9f714a8c815f4fe27b54:

  networkmanager: cleanup (2012-03-06 10:01:14 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  systemd-compat-units: rename service to run postinst scripts

 .../recipes-core/systemd/systemd-compat-units.bb   |    8 ++++----
 .../{opkg.service => run-postinsts.service}        |    6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-core/systemd/systemd-compat-units/{opkg.service => run-postinsts.service} (64%)

-- 
1.7.2.5



