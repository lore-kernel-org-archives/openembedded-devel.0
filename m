Received: from qmta03.westchester.pa.hmc1.comcast.net ([76.96.53.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NZTB7-0001pq-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 18:56:48 +0100
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta03.westchester.pa.hmc1.comcast.net with comcast
	id ZpKF1d00C09Ku2s01tuRfv; Mon, 25 Jan 2010 17:54:25 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id ZtuB1d0084SLwm302tuQDY; Mon, 25 Jan 2010 17:54:25 +0000
Message-ID: <4B5DDAC1.3020106@soundmetrics.com>
Date: Mon, 25 Jan 2010 09:54:09 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
	<1264333871.3810.65.camel@mattotaupa>
In-Reply-To: <1264333871.3810.65.camel@mattotaupa>
X-SA-Exim-Connect-IP: 76.96.53.20
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] socat: Add version 1.7.1.2
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
X-List-Received-Date: Mon, 25 Jan 2010 17:56:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paul Menzel wrote:
> Am Samstag, den 23.01.2010, 15:16 -0800 schrieb John Faith:
>
> [Moved note about v2 to the end of commit message.]
>
>   
>> Allow socat 1.7.1.2 to cross build.  In configure.in, the 4th value in
>> AC_TRY_RUN() gives a default value for cross build environments since
>> a test program cannot be run on the build system.  There are 2 places
>> where AC_MSG_RESULT() is used instead of a default value which seems
>> to result in code like "#define CRDLY_SHIFT" which breaks preprocessor
>> checks like "#if CRDLY_SHIFT >= 0".
>>     
>
> Maybe add an item, why the change in do_configure() is needed. Just copy
> it from your reply to Koen maybe.
>   
Do you want a v3 of the patch for this or other changes?

>> The patch gives default values in configure and configure.in for cross
>> compiling and checks were added in the affected source.
>>     
>
> v2: Added package source checksums, changed PR to r0, and removed some
> trailing whitespace in the patch.
>
>   
>> Signed-off-by: John Faith <john@soundmetrics.com>
>>     
>
> Build-tested-by: Paul Menzel <paulepanter@users.sourceforge.net>
>   (beagleboard, Ångström)
>
>         /oe/angstrom-dev/deploy/glibc/ipk/armv7a$ ls -lh socat*
>         -rw-r--r-- 1 x x 146K 24. Jan 12:21 socat_1.7.1.2-r0.5_armv7a.ipk
>         -rw-r--r-- 1 x x 9,4M 24. Jan 12:21 socat-dbg_1.7.1.2-r0.5_armv7a.ipk
>         -rw-r--r-- 1 x x  790 24. Jan 12:21 socat-dev_1.7.1.2-r0.5_armv7a.ipk
>         -rw-r--r-- 1 x x  36K 24. Jan 12:21 socat-doc_1.7.1.2-r0.5_armv7a.ipk
>
> I am just wondering about the size of `socat-dbg*.ipk` though.
>
>   
Hm, my debug ipk is only 30k and contains 3 files:
~/oe/arago-deploy/ipk/armv5te $ ls -lh socat*1.7*r0*
-rw-r--r-- 1 148K 2010-01-23 13:37 socat_1.7.1.2-r0.2_armv5te.ipk
-rw-r--r-- 1 30K 2010-01-23 13:37 socat-dbg_1.7.1.2-r0.2_armv5te.ipk
-rw-r--r-- 1 784 2010-01-23 13:37 socat-dev_1.7.1.2-r0.2_armv5te.ipk
-rw-r--r-- 1 36K 2010-01-23 13:37 socat-doc_1.7.1.2-r0.2_armv5te.ipk

# opkg files socat-dbg
Package socat-dbg (1.7.1.2-r0.2) is installed on root and has the 
following files:
/usr/bin/.debug/procan
/usr/bin/.debug/filan
/usr/bin/.debug/socat

# ls -l /usr/bin/.debug
-rwxr-xr-x    1 root     root        20599 Jan 23 21:37 filan
-rwxr-xr-x    1 root     root        18750 Jan 23 21:37 procan
-rwxr-xr-x    1 root     root        59328 Jan 23 21:37 socat


>   
>> +--- socat-1.7.1.2/xioopts.c.orig	2010-01-04 04:29:36.000000000 -0800
>> ++++ socat-1.7.1.2/xioopts.c	2010-01-21 10:54:03.561742501 -0800
>> +@@ -763,7 +763,7 @@ const struct optname optionnames[] = {
>> + 	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
>>     
>
> Still some trailing whitespaces (in all ipv6 lines I think).
>
>         openembedded$ git am -s /tmp/\[oe\]_\[PATCH_v2\]_socat\:_Add_version_1.7.1.2 
>         Applying: socat: Add version 1.7.1.2
>         /oe/openembedded/.git/rebase-apply/patch:76: space before tab in indent.
>          	IF_IP6    ("ipv6only",	&opt_ipv6_v6only)
>         /oe/openembedded/.git/rebase-apply/patch:78: space before tab in indent.
>          	IF_TERMIOS("isig",	&opt_isig)
>         /oe/openembedded/.git/rebase-apply/patch:81: space before tab in indent.
>          	IF_TERMIOS("ispeed",	&opt_ispeed)
>         /oe/openembedded/.git/rebase-apply/patch:83: space before tab in indent.
>          	IF_TERMIOS("istrip",	&opt_istrip)
>         /oe/openembedded/.git/rebase-apply/patch:85: space before tab in indent.
>          	IF_OPENSSL("openssl-pseudo",	&opt_openssl_pseudo)
>         warning: squelched 5 whitespace errors
>         warning: 10 lines add whitespace errors.
>
> (Try to apply your patch yourself.) But I guess it is alright.
>
> […]
>   

I did try 'git am' and noticed that the number of whitespace warnings 
wend down after I manually removed spaces on  otherwise empty lines 
apparently introduced by my diff process.  The remaining "space before 
tab" warnings are in the socat source in adjacent lines created by diff 
-u; these of course could never go away since a patch to remove them 
containing the '-<space><tab>' would itself trigger a warning from "git 
am".  Not sure how the socat authors would feel about changing all these ;).
socat-1.7.1.2$ grep ' \t' * | wc -l
7615

Thanks for the review.
,
John



