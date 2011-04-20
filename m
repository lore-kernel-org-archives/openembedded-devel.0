Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRiF-0007Hx-87
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:20:35 +0200
Received: by ewy5 with SMTP id 5so128716ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=z/CAFbgzOq40vw5+vZYmm/sR5kzfbaW2OvTF60GOVcE=;
	b=IpBNKIQxd4dzZLLDIVzE5XVujdih4IrTwfjbwO7xNLixakULd8y1uiFCVnRo3ChAdQ
	Km3z9c2MNFsNYutFI3c+B6qQ8k0fy2bXT/Q6VKNSrYAM2iWVzThtu3Pb7746vl2CL7jV
	kCC52I9BPsi35LF+lBbt5CU91v24OUTPaAysM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=h3THzJGGAtrtF9e6p4j8pAIj/bIbGku3d2yJg2dOddFsIJ6mwt3DSCZ/6RQViNwPgh
	arvUAdWRxMDrkGCCVlVHgmnahzPaF9+Ikusl+oCllZzikkJ3H7QVianpuxySHvdIKziu
	Xnl0TFmu1BTYKTN1l9h1pG2OfdXLZ++lGL1sw=
Received: by 10.213.102.133 with SMTP id g5mr1028401ebo.129.1303283892463;
	Wed, 20 Apr 2011 00:18:12 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id r48sm449598eei.9.2011.04.20.00.18.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:18:11 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:18:08 +0200
Message-Id: <cover.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe 0/6] add syslog-ng/eventlog/libnet
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
X-List-Received-Date: Wed, 20 Apr 2011 07:20:35 -0000

This is an re-import and upgrade from org.oe.dev. If everything is fine I can 
also apply them to org.oe.dev.

libnet: 
* libnet at packetfactory.net is dead... 
* Get the latest version from a github fork that claimes to update and maintain 
  it
* README tells it's compatible with libnet-1.1
* dynamic build, instead of static
* removed cruft that is handled by autotools class
* removed already applied patches and rebased endianess one

eventlog: minor upgrade

syslog-ng:
* adapt EXTRA_OECONF
* move to latest stable (3.2.2)

Pull URL: git://gitorious.org/oe-zoid/meta-openembedded.git
  Branch: master
  Browse: http://gitorious.org/oe-zoid/meta-openembedded/commits/master

Thanks,
    Michael Lippautz <michael.lippautz@gmail.com>
---


Michael Lippautz (6):
  syslog-ng: Re-import 2.0.5 from org.oe.dev
  eventlog: Re-import 0.2.5 from org.oe.dev
  eventlog: Clean recipe and upgrade to 0.2.12
  libnet: Re-import 1.1.2.1 from org.oe.dev
  libnet: Clean and upgrade (see below)
  syslog-ng: Update to 3.2.2

 .../libnet/libnet-1.1.5/fix-endianess-test.patch   |   38 +++
 .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 ++
 .../recipes-support/eventlog/eventlog_0.2.12.bb    |   11 +
 meta-oe/recipes-support/syslog-ng/files/initscript |   45 +++
 .../recipes-support/syslog-ng/files/syslog-ng.conf |  338 ++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   78 +++++
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 +
 7 files changed, 544 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
 create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/initscript
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb

-- 
1.7.3.4



