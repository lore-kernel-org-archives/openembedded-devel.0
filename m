Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pd77O-0003vF-3l
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:16:30 +0100
Received: by fxm17 with SMTP id 17so920106fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=C15iT8u2KxESjGPqu8gjYl4Px2/B9TomoNaTzypMmkg=;
	b=av+A8aS/4r7Zvn8A0bDcZcu1GtXN6vQLKCRkmbOdsQ9p7QVkwqPC4TLkaUgToHGVoY
	BSySVHiAWXfjT59PObais3O4XCvBMPanHkl/k0dsV3Bpr3RhvNE8EVCSyMLY/5DreYzh
	SIhc2PB2lsR8AR71BO2j3FhQA4gE2WL0u7+kA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VBEaLOdUhkapmoEAx65CfcSCNwgvsQ0+PSX7vnqygyLqBz9CXI62BVeoUHq8LkVjjI
	iXL5uuNvYja3Kf8siw9kqNKTWM8+PRStomK3VcqcmjyfnI3CCeJ3+0QT0wBVunk2bfsh
	M4DVGwOE9aGFqn0wJTWg4g7lQj/YjqsgqEtuw=
Received: by 10.223.122.146 with SMTP id l18mr1473508far.67.1294863358094;
	Wed, 12 Jan 2011 12:15:58 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y1sm378691fak.15.2011.01.12.12.15.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 12:15:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pd76n-0000OT-NR; Wed, 12 Jan 2011 21:15:53 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 21:15:49 +0100
Message-Id: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 0/3] autotools.bbclass misc trivia
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
X-List-Received-Date: Wed, 12 Jan 2011 20:16:30 -0000

Hi,

In an isolated test with dash and busybox ash the AC_CONFIG_MACRO_DIR
patch works as expected. Testers welcome.

Bernhard Reutner-Fischer (3):
  autotools.bbclass: pass distro_imposed_configure_flags
  autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
  autotools.bbclass: use grep -q

 classes/autotools.bbclass |   29 ++++++++++++++++++++++++-----
 1 files changed, 24 insertions(+), 5 deletions(-)

-- 
1.7.2.3



