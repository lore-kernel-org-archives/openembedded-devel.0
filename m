Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KvxRn-0002vN-CB
	for openembedded-devel@openembedded.org; Fri, 31 Oct 2008 18:06:07 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KvwLv-0005ik-FH
	for openembedded-devel@openembedded.org; Fri, 31 Oct 2008 15:55:59 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 31 Oct 2008 15:55:59 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 31 Oct 2008 15:55:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 31 Oct 2008 16:55:50 +0100
Message-ID: <gef9q7$o65$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081023 Shredder/3.0b1pre
In-Reply-To: <20081031233753.43f5f09d.raster@rasterman.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Fri, 31 Oct 2008 17:06:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-10-2008 13:37, Carsten Haitzler (The Rasterman) wrote:
> On Fri, 31 Oct 2008 12:00:45 +0100 (CET) git@amethyst.openembedded.net (GIT
> User account) babbled:
>
> is there any reason to run ldconfig on boot? this should be handled by opkg on
> package install/upgrade or by the flash image creation (this slows boot
> significantly and i've patched out/disabled ldconfig run in bootmisc.sh with no
> ill effects).

Not all images have a package management tool inside, so depending on 
that is a no-go. Recently OE stopped shipping ld.so.conf so the ldconfig 
on boot won't get run. Doing it this way seemed to me the safest way to 
get a nice speedup and keep things working for the funky people needing 
ld.so.conf without a package manager :)

regards,

Koen


>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 6628886e858d77a8f9f94dd3229143e144d39f0e
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6628886e858d77a8f9f94dd3229143e144d39f0e
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Fri Oct 31 11:57:54 2008 +0100
>>
>> initscripts: only run ldconfig on boot when ld.so.conf is present
>>
>> ---
>>
>>   packages/initscripts/initscripts-1.0/bootmisc.sh |    6 ++++--
>>   packages/initscripts/initscripts_1.0.bb          |    2 +-
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/packages/initscripts/initscripts-1.0/bootmisc.sh
>> b/packages/initscripts/initscripts-1.0/bootmisc.sh index 2a40e0c..dde1209
>> 100755
>> --- a/packages/initscripts/initscripts-1.0/bootmisc.sh
>> +++ b/packages/initscripts/initscripts-1.0/bootmisc.sh
>> @@ -57,9 +57,11 @@ then
>>   fi
>>
>>   #
>> -# Update dynamic library cache
>> +# Update dynamic library cache, but only if ld.so.conf is present
>>   #
>> -/sbin/ldconfig
>> +if [ -e /etc/ld.so.conf ] ; then
>> +	/sbin/ldconfig
>> +fi
>>
>>   # Set the system clock from hardware clock
>>   # If the timestamp is 1 day or more recent than the current time,
>> diff --git a/packages/initscripts/initscripts_1.0.bb
>> b/packages/initscripts/initscripts_1.0.bb index b1c4317..8daefc5 100644
>> --- a/packages/initscripts/initscripts_1.0.bb
>> +++ b/packages/initscripts/initscripts_1.0.bb
>> @@ -4,7 +4,7 @@ PRIORITY = "required"
>>   DEPENDS = "makedevs"
>>   RDEPENDS = "makedevs"
>>   LICENSE = "GPL"
>> -PR = "r109"
>> +PR = "r110"
>>
>>   SRC_URI = "file://functions \
>>              file://halt \
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>
>
>




