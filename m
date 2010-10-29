Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PBnP3-0000bd-DA for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 13:45:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PBnOK-0008IM-2D for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 13:45:04 +0200
Received: from cpc2-yead1-0-0-cust818.7-1.cable.virginmedia.com
	([81.96.139.51]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 13:45:04 +0200
Received: from nick.lee by cpc2-yead1-0-0-cust818.7-1.cable.virginmedia.com
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 13:45:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Nick Lee <nick.lee@nortechonline.co.uk>
Date: Fri, 29 Oct 2010 12:43:16 +0100
Message-ID: <iaec0k$78o$1@dough.gmane.org>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>	<AEB54AFF070EB34A921BC7E006B711BE11905D1147@SRV10.nortechonline.net>	<76E258664B189C4CBEF125491CA11ECC9445E0CF88@KCINPUNHJCMS01.kpit.com>	<AANLkTinJcbZ3ApaSpSvsrte40TWF8f5Rz3NIIXX8ZhCR@mail.gmail.com>
	<AEB54AFF070EB34A921BC7E006B711BE11905D114A@SRV10.nortechonline.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: cpc2-yead1-0-0-cust818.7-1.cable.virginmedia.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101006 Lightning/1.0pre Thunderbird/3.0.9
In-Reply-To: <AEB54AFF070EB34A921BC7E006B711BE11905D114A@SRV10.nortechonline.net>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Fri, 29 Oct 2010 11:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

It turned out to be a likewise-open issue (for us at least) - if we log 
in as a normal user (i.e. not through likewise-open), the build works 
fine.  If we log in using likewise-open, the python file needs to be 
patched as described, but this then breaks the build for normal logins! 
  Our solution was to just not use likewise-open.

Nick

On 03/06/10 09:24, Hodgson, Simon wrote:
> I'm using Angstrom, and at91sam9g20-ek, on two machines with new installs of Ubuntu 10.4 we see this problem, on another that was upgraded from 9.10 we don't see it.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: 03 June 2010 06:11
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] (no subject)
>
> On Wed, Jun 2, 2010 at 7:37 PM, Soumya R<Soumya.R@kpitcummins.com>  wrote:
>> Ya you are right i am using Ubuntu 10.4..
>> Thanks a lot for the reply it worked..
>>
>> Thank you so much:-)
>
> are you using .dev ?. I don't see this issue here locally on ubuntu
> 10.04. whats your distro
> and machine.it could be issue in ipkg-utils-native
>
> Thx
> -Khem
>
>> home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/arfile.py
>>
>> Change the line:
>> size = int(descriptor[5])
>>
>> To:
>> size = int(descriptor[3])
>>
>> I'm afraid I can't explain why you need to do this, only that it works for me.
>>
>> Simon
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Soumya R
>> Sent: 02 June 2010 10:20
>> To: openembedded-devel@lists.openembedded.org
>> Cc: angstrom-distro-devel@linuxtogo.org
>> Subject: [oe] (no subject)
>>
>> Hi All,
>>
>>    I am running bibake micro-image i got the following error,
>>
>> NOTE: Running task 965 of 970 (ID: 93, /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_write)
>> NOTE: Running task 966 of 970 (ID: 18, /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/micro-image.bb, do_package_update_index_ipk)
>> ERROR: function do_package_update_index_ipk failed
>> ERROR: log data follows (/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/at91sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_package_update_index_ipk.24831)
>> | + ipkgarchs='all any noarch arm  armv4 armv4t armv5te at91sam9263ek'
>> | + '[' '!' -z '' ']'
>> | + mkdir -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk
>> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/Packages
>> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/Packages.filelist -m /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk
>> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashlib instead
>> |   import md5
>> |
>> | + for arch in '$ipkgarchs'
>> | + '[' -e /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/ ']'
>> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/Packages
>> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/Packages.filelist -m /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/all/
>> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashlib instead
>> |   import md5
>> | Traceback (most recent call last):
>> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ipkg-make-index", line 114, in<module>
>> |     pkg = ipkg.Package(filename)
>> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ipkg.py", line 161, in __init__
>> |     tarStream = ar.open("control.tar.gz")
>> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/arfile.py", line 59, in open
>> |     f = self._scan(fname)
>> |   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/arfile.py", line 79, in _scan
>> |     size = int(descriptor[5])
>> | IndexError: list index out of range
>> NOTE: Task failed: /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/at91sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_package_update_index_ipk.24831
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/micro-image.bb do_package_update_index_ipk failed
>> NOTE: Running task 967 of 970 (ID: 95, /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_stage)
>> ERROR: Task 18 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/micro-image.bb, do_package_update_index_ipk) failed
>> NOTE: Waiting for 1 active tasks to finish
>> NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_stage (24841)
>> NOTE: Tasks Summary: Attempted 965 tasks of which 927 didn't need to be rerun and 1 failed.
>> ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/micro-image.bb' failed
>> KPIT\soumyar@d-5289lnx:~/oe/build$
>>
>>    Anybody can help me out to resolve this.Any suggestions are welcome:-)
>>
>> Thanks in advance:-)
>>
>> Regards,
>> Soumya
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




