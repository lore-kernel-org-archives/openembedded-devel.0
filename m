Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1TBGYT-0001MN-S3
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 04:50:25 +0200
Received: by lban1 with SMTP id n1so56773lba.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=VeIbO8d7GVeduAjPJBPGbNAhsICGrgX3i55NteU47Vc=;
	b=Nb2rnqfm9DuOeprnnvIkuLHd+KaljamFjqQF91WIcPc66Fbhchx4STKaJ2xxABCJp8
	67+nfBwG7Y+M+J3XjNHtk590Rv0IdO9OrAlJ06+jqaact+iHH0U1jlcNctjF0tqjt88z
	fOhwr7kcp2uyPI9EPvNp1PpOiPHW3dHGD5a3XqVHzKCWDiPFuw7foaufqH1vO+qxnKJJ
	HM6dx+dSOANnFJdeM0SR6MUxWOQI5Oj/MbBv15VXZ8h9DljdW4wyKx3HIVq0nQD4C+Za
	8INLCd2QltvLRWcvyA/0OcJY593OC9szggaRyiRQE8YTWgDAWEzXs0skEALVamDx6sKL
	XXtQ==
MIME-Version: 1.0
Received: by 10.152.114.3 with SMTP id jc3mr14374786lab.11.1347331075336; Mon,
	10 Sep 2012 19:37:55 -0700 (PDT)
Received: by 10.114.24.65 with HTTP; Mon, 10 Sep 2012 19:37:55 -0700 (PDT)
Date: Mon, 10 Sep 2012 19:37:55 -0700
Message-ID: <CAG4_upS_8o4j4EhL4mvaGY--kwnYh3SgwnyHPfc_yFjo-3k6Hg@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: at91bootstrap and gcc 4.6+
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
X-List-Received-Date: Tue, 11 Sep 2012 02:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

For anyone doing development on the AT91-based platforms, there is a known
issue with at91bootstrap and gcc 4.6 (and later) where the
linker erroneously causes an overlap between sections.  There is a known
fix here, just needs to be turned into a patch file for OE:

http://www.at91.com/forum/viewtopic.php/f,12/t,20624/

Chris

