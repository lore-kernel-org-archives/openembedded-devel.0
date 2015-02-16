Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 27EC065C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 22:28:13 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id x3so31754315wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4KMegJHiyYzwIQJZ3RJT0JJ32wIzQYBiYnWllE/IuNk=;
	b=dax5hVwkoQZovNOY24cr2X5vTUvBt7z7z/T4tWlHVvUs1d5jtLdd1OB+kRtQApPvmC
	xp6yka1+jVwadgxew7xxLVtOQzYu5sqsIABy67azN35kE6qXi92omUQ8yJ6kWWDcPrM0
	k7e/CylEOtAO4D/BpgMUF6XhzzJLXcGYsPlS7bl9JZKl/cvXtsrrAOCaBR+Zm5ECCEar
	TPm3mNpIu8DXg7vkna+rCwkiXNtogKRvLlrkeG7XHeJni3LX9sXJ6Tf671RErlUrlYPr
	UtwRFTenM1rF3NJJUIV0Td+bWuR7U4nKXbmnr8S7qQKywo23lMF4ak4oIp75v3EYBFyP
	Gw9Q==
X-Received: by 10.180.211.206 with SMTP id ne14mr50114954wic.79.1424125694690; 
	Mon, 16 Feb 2015 14:28:14 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id
	fo15sm21520200wic.19.2015.02.16.14.28.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 14:28:13 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 23:27:37 +0100
Message-Id: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Cc: koen@dominion.thruhere.net
Subject: [OE-core][RFC] openjdk-7: enable xawt
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
X-List-Received-Date: Mon, 16 Feb 2015 22:28:15 -0000

Hi all

Currently xawt is disabled when building openjdk-7-jre for all architectures.
I'd like to reenable this. The attached patch works fine for armv7.
My guess is that the patches which disabled xawt were applied because of
qemu failing to executed and thus making the whole build fail. I guess
that recent changes to the way binaries are built for and executed by qemu
in meta-java makes openjdk-7 build again.

This has been done in a first step for the ppc architecture by commit
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=f03d3e5bbb6a096960a781547884015f50be96da
and then extended to all architectures with:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=4e862f09394dccc15d26c6e8768072cf98cb013f

Henning, Koen do you have any comments what additionally needs to be tested
from your original work on the patches?

Regards
Max

Max Krummenacher (1):
  openjdk-7: enable xawt

 .../icedtea-jdk-nio-use-host-cc.patch              | 22 ----------------------
 1 file changed, 22 deletions(-)

-- 
1.9.3


