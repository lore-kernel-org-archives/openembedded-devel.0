Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Q2mcp-0000HK-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:39:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CCC96314F481
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:37:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 00gia2BxUyUv
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:37:05 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 3A022314F49A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:37:04 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 24 Mar 2011 15:37:04 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 15:37:03 +0000
Message-Id: <1300981024-9111-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
References: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
Subject: Re: MACHINE_KERNEL_PR overrides PR for modules
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
X-List-Received-Date: Thu, 24 Mar 2011 15:39:04 -0000

Hello,

how about this solution? For MACHINE_KERNEL_PR = "r11" and PR = "r20" it
creates PR = "r11.20", to mimic the revision numbers commonly seen with
recipes using INC_PR.

If PR doesn't start with 'r', +${PR} gets appended, so MACHINE_KERNEL_PR =
"foo1" and PR = "bar2" results in PR = "foo1+bar2".

Regards,
Andreas

Andreas Oberritter (1):
  kernel/module-base: Append PR to MACHINE_KERNEL_PR

 classes/kernel.bbclass      |   10 +++++++++-
 classes/module-base.bbclass |   10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
1.7.2.3



