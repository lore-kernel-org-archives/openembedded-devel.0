Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C708977419
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7D88731C2D2E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 14:13:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KuUU2Fm-b6iA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 14:12:58 +0100 (CET)
Received: from [172.22.22.61] (55d4656a.access.ecotel.net [85.212.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4320531C2F51
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 14:12:58 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481940923-12914-4-git-send-email-joe_macdonald@mentor.com>
	<20161217030519.GA16746@mentor.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <ce2313d2-20ad-6ca7-be1a-c7a5bb7aa9f4@opendreambox.org>
Date: Sat, 17 Dec 2016 14:12:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161217030519.GA16746@mentor.com>
Subject: Re: [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_STATIC
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
X-List-Received-Date: Sat, 17 Dec 2016 13:13:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 17.12.2016 04:05, Joe MacDonald wrote:
> Oh, I just realized this one sneaked back in despite my having thrown it
> out at least twice now.  I've already rejected it in patchwork, but if
> anyone is picking this up off the mailing list, DISABLE_STATIC is very
> much still needed AFAICT.

Sorry, I didn't recognize it as a global variable.

Regards,
Andreas

> 
> -J.
> 
> [[oe] [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_STATIC] On 16.12.16 (Fri 21:15) Joe MacDonald wrote:
> 
>> From: Andreas Oberritter <obi@opendreambox.org>
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> index aabc043..c9e0953 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> @@ -93,7 +93,6 @@ EXTRA_OECONF += "--enable-fhs \
>>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
>>                   --with-pam --with-pammodulesdir=${base_libdir}/security \
>>                  "
>> -DISABLE_STATIC = ""
>>  
>>  LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
>>  
>> -- 
>> 1.9.1
>>
>>
>>


