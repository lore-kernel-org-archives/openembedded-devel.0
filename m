Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N6Az5-00035S-NX for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 23:39:18 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 07C648E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 22:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id AMY8xzfa8aE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 23:38:00 +0100 (CET)
Received: from [192.168.0.100] (103-215.echostar.pl [213.156.103.215])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 3EEB38B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 23:38:00 +0100 (CET)
Message-ID: <4AF353C8.80904@cs.put.poznan.pl>
Date: Thu, 05 Nov 2009 23:38:00 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: menuconfig task for kernels
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
X-List-Received-Date: Thu, 05 Nov 2009 22:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Hi,

today I decided to modify the kernel compiled by OE. Accidentally, in
the same time a person on IRC pointed out problems with that. After some
investigation we discovered that menuconfig task in kernels is somewhat
misleading, if not broken.

The order of tasks to do menuconfig is, more or less: fetch, patch,
menuconfig. It means that when menuconfig is run, there is no .config*
files in linux build dir, and generated .config is far different than
defconfig resulting from applying OE patches.

The order for correct configuring of Linux is: fetch, patch, configure,
so I tried:

  1. bitbake virtual/kernel -c configure
  2. bitbake virtual/kernel -c menuconfig
  3. bitbake virtual/kernel

and this allowed me to apply my local changes to OE-proposed .config.

Is this the "right" way to do? If so, maybe menuconfig should be added
as 'after do_configure', instead of 'after do_patch'?

Przemek


