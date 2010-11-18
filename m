Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PJAA3-0007Z2-Eb
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 20:28:48 +0100
Received: by gxk2 with SMTP id 2so2196035gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 11:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=TrTdn8Xb1nfjmn1+M0uYUkN2FXddgafSgVoQG3XxMkA=;
	b=SNdU4CjPpxWkKlaLFGiU5v2RscxKazBvBrHrW0uejxvD5NBumZ9PDvwkarPsBirjXR
	WLkbhrZuXba9yKMZ+JZMtUUJRa8BaqPESINCRZDyZ8yRhVWAgPg1Ru3dSU0rT4d0n1f9
	bNPeUpn6Lgn0tycFbhoAIOkk+j2NR56xCM0rI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fLOs2aW6CCBInbH7Vz0t/Gqm4AxSLXYFWBhL4Q96+nI2WW9AX1+Vbj1d8p3YiIDPJF
	E2BvYQbEinz3QTghAwxTeXvClGP0IEV25N3ngHkiDPoExo3j4d6Zepd0TZNYqo5mzLel
	s/8rGbjIUqd8PpIScNW9mFAIi3qbsa0LeK5kA=
Received: by 10.223.108.147 with SMTP id f19mr973341fap.68.1290108458084;
	Thu, 18 Nov 2010 11:27:38 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id l23sm272705fam.43.2010.11.18.11.27.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 11:27:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PJA8r-0003qP-NR; Thu, 18 Nov 2010 20:27:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Nov 2010 20:27:27 +0100
Message-Id: <1290108449-14749-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
References: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] add ext4 image support
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
X-List-Received-Date: Thu, 18 Nov 2010 19:28:49 -0000

Hi,
This adds ext4 image support.
The bump patch can be considered optional.

The 2 patches were build tested on an i386 host.

chattr and tune2fs could potentially come from busybox too, to be
considered later.

Please apply.


Bernhard Reutner-Fischer (2):
  e2fsprogs: add 1.41.12, remove old versions
  bitbake.conf: add ext4 image support

 conf/bitbake.conf                      |    8 ++++++
 conf/local.conf.sample                 |    2 +-
 recipes/e2fsprogs/e2fsprogs.inc        |   41 +++++++++++++------------------
 recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 +++++++
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 -------
 5 files changed, 36 insertions(+), 35 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

-- 
1.7.2.3



