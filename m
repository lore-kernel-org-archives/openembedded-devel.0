Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 67975728B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:59:29 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so31361573pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 07:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=NCldjBKoW+204fcZzg7wuQBlKF1yC7W/vkAwCJc+ITo=;
	b=vjovpnI4khuMU3TN53s0tFlh5gJDt6i9bmi2baYSNXMofol/TAHPc46O0ylCPchFLR
	x0/GaPo6jrQ28KQjzYaTZIZFrFRj/nM62TpepyuwY0+9BcRUbDyNZjRFBiWF0Ldok6eR
	zX8RmmLM7T6g1lAy3oLqg7xbRIf/0LnxYvmX7WN8yZo9IZnFVHqx7aLo2e411Em0lUGX
	KpwolwPqx3qyuHHDs/oG56dHEhA/rwxnFc8odSi7DBOTSt0q1DBMntUp3bO1Zml7ySdX
	8C5uWXGHS23AeE/l61CdUQx3zf2K9vBMZ39goDFHwHJtMAtyjA5p2NhbDLivweXBIDTU
	LqGA==
X-Received: by 10.66.162.105 with SMTP id xz9mr152087826pab.77.1420559970533; 
	Tue, 06 Jan 2015 07:59:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	kr10sm36866390pdb.42.2015.01.06.07.59.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jan 2015 07:59:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:59:18 -0800
Message-Id: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH 0/2] world build fixes
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
X-List-Received-Date: Tue, 06 Jan 2015 15:59:35 -0000

this should address the RDEPENDS issue found in world build

Armin Kuster (2):
  proftpd: fix rdepends  issue
  netkit-rwho: fix rdepends issue

 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb       | 2 +-
 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


