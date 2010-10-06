Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3bGP-0002SC-8k
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:11:02 +0200
Received: by ewy7 with SMTP id 7so4822ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=kdrZ5zcu11qPYguahdqZs8ODadVzFJyXSnTKddN40IU=;
	b=pW7KjrCaPydIlscI62K0LlwibCnOmEsHSWavtw5mIsGnCN/m1FnwFoQNDwXW0kDlZ4
	CdxcqBrOPdIfQlBqgx1Zo2olcpjtDI9R7VCGcWmaZHyvTbKJHqrnGHkisBpKjkmqoWDz
	JlguqiidtctA6HFkIeg8FiGnZ+HeLmMlyfipU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z87MBatOWtluf//7MsNboZ7ZWsNm9QbdlcPuGJDtcA+oRhDksakYUKSj9iHyuJ++cZ
	2sIpo+RXpVoukIC5awIyFWlC7J14Fq/yHk1YRh0nWXnxkVVx3Jj9HEB8uxGR1llRGpsV
	8JuPW8jELm4u/iThp2vbMuh86YlzVGZEJ1Gw0=
Received: by 10.213.22.203 with SMTP id o11mr9887981ebb.83.1286399350345;
	Wed, 06 Oct 2010 14:09:10 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2171654eei.1.2010.10.06.14.09.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 14:09:09 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 23:08:56 +0200
Message-Id: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:11:02 -0000

Below are 4 patches that change RDEPENDS into RDEPENDS_${PN}
As I am not too familiar with these files your review comments are appreciated

Frans Meulenbroeks (4):
  RDEPENDS -> RDEPENDS_${PN}
  RDEPENDS -> RDEPENDS_${PN}
  RDEPENDS -> RDEPENDS_${PN}
  RDEPENDS -> RDEPENDS_${PN}

 classes/cpan-base.bbclass      |    2 +-
 classes/distutils-base.bbclass |    2 +-
 classes/image.bbclass          |    2 +-
 classes/rubyextension.bbclass  |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)



