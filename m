Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMKNi-0000We-Fa
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 14:00:00 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id D8F471B421
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 14:00:00 +0100 (CET)
Message-ID: <4CF10083.6080006@sensortherm.de>
Date: Sat, 27 Nov 2010 13:58:43 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290860534-8484-1-git-send-email-schwarzkopf@sensortherm.de>
	<20101127124756.GC3238@jama>
In-Reply-To: <20101127124756.GC3238@jama>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dash_0.5.5.1: New download link for patch
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
X-List-Received-Date: Sat, 27 Nov 2010 13:00:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

thanks for the information!

Regards,

Klaus

Am 27.11.2010 13:47, schrieb Martin Jansa:
> On Sat, Nov 27, 2010 at 01:22:14PM +0100, Klaus Schwarzkopf wrote:
>> The newest patch on the old download directory is dash_0.5.5.1-7.3.diff.gz
>> ---
>>   recipes/dash/dash_0.5.5.1.bb |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/dash/dash_0.5.5.1.bb b/recipes/dash/dash_0.5.5.1.bb
>> index 319917d..bf00d4c 100644
>> --- a/recipes/dash/dash_0.5.5.1.bb
>> +++ b/recipes/dash/dash_0.5.5.1.bb
>> @@ -1,9 +1,10 @@
>>   DESCRIPTION = "The Debian Almquist Shell is a POSIX compliant shell that is much smaller than 'bash'."
>>   PROVIDES = "virtual/sh"
>>   LICENSE = "BSD GPL"
>> +PR = "r0"
>
> this is defaut, putting it here won't change anything, if you want
> everyone to rebuild it (with new, but same sources) then you have to
> use r1.
>
>>   SRC_URI = "http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}.orig.tar.gz;name=archive \
>> -	http://ftp.debian.org/debian/pool/main/d/dash/dash_${PV}-2.3.diff.gz;name=patch \
>> +	https://launchpad.net/debian/sid/+source/dash/0.5.5.1-2.3/+files/dash_${PV}-2.3.diff.gz;name=patch \
>>   	file://makefile-build-cc.diff"
>>
>>   SRC_URI[archive.md5sum] = "7ac832b440b91f5a52cf8eb68e172616"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



