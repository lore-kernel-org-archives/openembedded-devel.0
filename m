Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SMm9L-0000n9-8f
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:15:47 +0200
Received: by vcbfl13 with SMTP id fl13so890011vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=kSg4NAgfxXFp9FP3IKaoKw7t5gQqajde3HcKrCkJAk0=;
	b=wK0pQelhqvcKw5PxDvoCe9aKcplJeuZ/ZQTQchYpEqm3MLHTyjpaIHULwjnS8Lez29
	Wtxl5rLJk8KrOlQFXhIpbQ2l8UdXu9seqrGsiPpt0SxFYyaJ4kYlepm10zR2+bxjISGm
	kGUzE77ZSEJOuJ72XHWe10JBiZ2U1Nudi35ocb028QHwTx97lbmTYmslgBvg7vIQtkVb
	LDtOJzUxtfcBWXamkDUXv7bobYz0mWLqoehlduG71oPSXCmycJ59EL8W2LSR0LsV5kzl
	d56ZpF49Azx2f52XgAZWIgDiKq65blp4PE1uKVwjvKnzKVJNXXKikgE/F/apY9gdkavc
	isUQ==
Received: by 10.52.100.228 with SMTP id fb4mr4812681vdb.62.1335297971819;
	Tue, 24 Apr 2012 13:06:11 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id i4sm33183810vdk.8.2012.04.24.13.06.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 13:06:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 17:05:59 -0300
Message-Id: <cover.1335297926.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/2] Changes pending in O.S. Systems' tree
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
X-List-Received-Date: Tue, 24 Apr 2012 20:15:47 -0000

The following changes since commit e360922f652af30c4222f447b5145706df375bfc:

  klibc_1.5.25: add patches to build with 3.2 kernel headers (2012-04-24 08:07:41 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Mario Domenech Goulart (1):
  net-snmp: split net-snmp-server

Otavio Salvador (1):
  xserver-common: drop xinput-calibrator call as it is done by xdg now

 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |   16 +++++++----
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   10 +++++--
 ...brate_xinput_calibrator-Xsession.d-script.patch |   27 --------------------
 .../xserver-common/xserver-common_1.34.bb          |    1 -
 4 files changed, 17 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0004-add-Ts_Calibrate_xinput_calibrator-Xsession.d-script.patch

-- 
1.7.2.5



