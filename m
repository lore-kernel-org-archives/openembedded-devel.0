Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NVm5W-000592-9q
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 14:19:45 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 15 Jan 2010 14:17:29 +0100
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 15 Jan 2010 14:17:28 +0100
Received: from localhost.localdomain ([79.7.143.47]) by FBCMCL01B04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 15 Jan 2010 14:17:28 +0100
Date: Fri, 15 Jan 2010 13:17:29 +0000
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100115131729.64b2f17e@no-log.org>
In-Reply-To: <19c1b8a91001142249r1301da16h6abc63071ce9acc4@mail.gmail.com>
References: <1263507455.3757.37.camel@gnutoo-desktop>
	<19c1b8a91001142249r1301da16h6abc63071ce9acc4@mail.gmail.com>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.18.3; i686-angstrom-linux-gnu)
Mime-Version: 1.0
X-OriginalArrivalTime: 15 Jan 2010 13:17:28.0481 (UTC)
	FILETIME=[16214910:01CA95E5]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: illume-image
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
X-List-Received-Date: Fri, 15 Jan 2010 13:19:45 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Jan 2010 22:49:02 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> But the failure can be fixed easily of you just add
> #include <stdio.h>
It also needs #include <stdio.h>
That's not the problem I had,because that part can easely be fixed
The problem was related to enlightenment includes
I retried and it couldn't find includes like:
Efreet.h,Efreet_Mime.h and Efreet_Trash.h that is to say:
/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/Elementary.h:81:21:
error: Efreet.h: No such file or directory
/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/Elementary.h:82:26:
error: Efreet_Mime.h: No such file or directory
/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/Elementary.h:83:27:
error: Efreet_Trash.h: No such file or directory

they live
in /home/embedded/oetmp/staging/armv6-angstrom-linux-gnueabi/usr/include/efreet
in my system...

and a quick grep show:
grep -i efreet config*
config.log:pkg_cv_ELEMENTARY_CFLAGS='-I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/elementary
-I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/efreet 
and it is propagated into the Makefile:
grep -i efreet Makefile*
Makefile:ELEMENTARY_CFLAGS =
-I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/elementary
-I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/efreet

Strange that it doesn't work...

If there is a quick fix for that or if someone fix it it would be great
but I still think that it should be removed from the image as someone
may not want a phone image(or else there is a fix: putting an override
for the phone machine feature,it could be doable because images are
machine-specific.)

Denis


