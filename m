Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCDA6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 08:30:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wRrHy35khz1qt0k;
	Tue, 16 May 2017 10:30:54 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wRrHy2KtYz3hj0h;
	Tue, 16 May 2017 10:30:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ye-lmTurShAu; Tue, 16 May 2017 10:30:53 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Tue, 16 May 2017 10:30:53 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id CB6D34540350;
	Tue, 16 May 2017 10:30:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4NidddQYQXuY; Tue, 16 May 2017 10:30:49 +0200 (CEST)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 31363454027E;
	Tue, 16 May 2017 10:30:49 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>, Stefano Babic <sbabic@denx.de>
References: <1494605830-18765-1-git-send-email-sbabic@denx.de>
	<20170516075639.GC3088@jama>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <2d867591-9f06-a260-2318-8751affebb4f@denx.de>
Date: Tue, 16 May 2017 10:30:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170516075639.GC3088@jama>
Cc: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Fix broken package fbida
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 May 2017 08:30:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Martin,

On 16/05/2017 09:56, Martin Jansa wrote:
> On Fri, May 12, 2017 at 06:17:10PM +0200, Stefano Babic wrote:
>> Missing pkgconfig does not let build the package.
> 
> The summary should start with
> fbida:

Sorry, noted for next time.

> I've updated the summary when adding it to master-next
> 
> How does this relate to:
> https://patchwork.openembedded.org/patch/138960/
> ?
> 
> Was Marek's change just a fix for the case when the pkgconfig wasn't
> used because of missing inherit?
> 

IMHO the changes are unrelated - I have also changed as Marek did and
after that I noted he has already sent a patch. Absolute path /usr/local
is hard-coded in Makefile, and this is what Marek fixed. Marek, is it
correct ?

Regards,
Stefano

>>
>> Signed-off-by: Stefano Babic <sbabic@denx.de>
>> ---
>>
>> Tested on current master, i.MX6 ARM target
>>
>>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> index eb31f7b..1febac8 100644
>> --- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
>> @@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d
>>  
>>  B = "${WORKDIR}/build"
>>  
>> +inherit pkgconfig
>> +
>>  EXTRA_OEMAKE = "STRIP= 'srcdir=${S}' -f ${S}/GNUmakefile"
>>  
>>  PACKAGECONFIG ??= "gif png curl"
>> @@ -66,5 +68,3 @@ do_install() {
>>  }
>>  
>>  RDEPENDS_${PN} = "ttf-dejavu-sans-mono bash"
>> -
>> -PNBLACKLIST[fbida] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

