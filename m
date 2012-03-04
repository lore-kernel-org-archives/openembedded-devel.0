Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <craigswank@gmail.com>) id 1S4Iqp-0001On-J5
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2012 22:20:19 +0100
Received: by iaag37 with SMTP id g37so4518857iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2012 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=Yz3W+xxI9QGqA7vuw0furufAJR/ZeQDod5BQG3indqU=;
	b=0lehi2q106SK0KTyZr2QNM0B5tkimMeAK/0W7uexzNpasDsVc+g2K1sMOsF8/Hy15k
	chnHiHNF2QzTNP76D55QGiNGRvage+ctk5eH/SBB6tJ9BKeuas8htfjfb8wP/WDFsxmf
	+Oriffp6BvTMyXlUn1M+TftVmaLefElsCkPBPbtMkFIJSvmN3hi0gCWvD63o7wA/PwPM
	nDGHIXOwSPhZL0fX1i9MwG7Z5lVRyaIynjw7qqvBISjhRWx2LW8uiUBzKKto5bRovrZH
	YcVDZuNH30u5rdNHcz9tFM77LI3qEUcCze7nst9+W49b1eso0kP97wt9SGkmD2FOvIYS
	6lxA==
Received: by 10.50.188.167 with SMTP id gb7mr3949463igc.37.1330895505477;
	Sun, 04 Mar 2012 13:11:45 -0800 (PST)
Received: from [192.168.1.9] (184-99-250-219.hlrn.qwest.net. [184.99.250.219])
	by mx.google.com with ESMTPS id
	cx9sm9300690igc.12.2012.03.04.13.11.44 (version=SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 13:11:44 -0800 (PST)
Message-ID: <4F53DA8F.5050109@gmail.com>
Date: Sun, 04 Mar 2012 14:11:43 -0700
From: Craig Swank <craigswank@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: ncurses
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
X-List-Received-Date: Sun, 04 Mar 2012 21:20:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I'm getting an error when I try to bitbake ncurses.  I set up my 
openembedded environment according to the instructions at:
http://www.angstrom-distribution.org/building-angstrom

when I do bitbake ncurses I get the following error:

| error: unknown type name 'SIG_ATOMIC_T'
| In file included from 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/build.priv.h:85:0,
|                  from 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/tinfo/make_keys.c:40:
| 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/../include/nc_alloc.h:97:0: 
warning: "strdup" redefined [enabled by default]
| /usr/include/x86_64-linux-gnu/bits/string2.h:1316:0: note: this is the 
location of the previous definition
| 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/curses.priv.h:1165:1: 
error: unknown type name 'SIG_ATOMIC_T'
| In file included from 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/curses.priv.h:1444:0,
|                  from 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/tinfo/access.c:33:
| 
/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/ncurses/../include/nc_alloc.h:97:0: 
warning: "strdup" redefined [enabled by default]
| /usr/include/x86_64-linux-gnu/bits/string2.h:1316:0: note: this is the 
location of the previous definition
| make[1]: *** [../obj_s/access.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory 
`/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/narrowc/ncurses'
| make: *** [libs] Error 2
| make: Leaving directory 
`/home/craig/Projects/OE/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/x86_64-linux/ncurses-native-5.9-r4.1/ncurses-5.9/narrowc'
| ERROR: oe_runmake failed
NOTE: package ncurses-native-5.9-r4.1: task do_compile: Failed
ERROR: Task 219 
(virtual:native:/home/craig/Projects/OE/setup-scripts/sources/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, 
do_compile) failed with exit code '1'

Can anyone suggest how I can get it working?

Just in case you need this:

OS: Ubuntu 11.10
Processor: quad core AMD (64 bit)


Craig


