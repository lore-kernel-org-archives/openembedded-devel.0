Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 19E577239E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 05:34:17 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so6151979pab.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 21:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=REscM2s4ZmQ65090KgF4xqWW9SHfY2a/EeFVD7REr/c=;
	b=GPNTObFr21VsWj75AVnD7X9kG0RW7+jvnsITpgwk4aScryabOOJzhwXQii+emlAZov
	olsrThd26p5Bxyy4AS1shBN40zVcnvVwJ4bfU2ZAXuMhNvXQBFuhCOQcvJKEc7TX169D
	phniDkeAjSlVQWrBFPTmT6tY3Xiy/GBNbY4XczglushAU7umpf702RlXkX/E1+j6eZP4
	9Ksz7kW1ZT7T2AeVUMH1l4VqhlH+Qd/7QOJm7dvNJxYs+ef0rcbkRGvaklDd5OzmPvVj
	L3ZgMX5cwXZcGeobs+I59RT/wfDK9DD+DuoMEkq2M/VsfM6QhAi1qfjbBy2n3XqXuw0M
	83iQ==
X-Received: by 10.68.217.197 with SMTP id pa5mr68991756pbc.32.1417152858608;
	Thu, 27 Nov 2014 21:34:18 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x10sm8696360pdr.11.2014.11.27.21.34.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Nov 2014 21:34:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Nov 2014 21:34:02 -0800
Message-Id: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH 0/2] two more Netkit packages
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
X-List-Received-Date: Fri, 28 Nov 2014 05:34:20 -0000

Please consider these two packages for inclusion to meta-networking.
I have placed them in their own recipes location for others from the family to be added later.

Armin Kuster (2):
  New package: netkit-rsh
  New package: Netkit-ftp

 .../netkit-ftp/files/Add_ARG_MAX_define.patch      | 28 ++++++++++
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   | 46 ++++++++++++++++
 .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 +++++++++++++++++++++
 4 files changed, 199 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb

-- 
1.9.1


