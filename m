Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6156971C69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:16:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3v4FVX0MCwz3hjYt;
	Thu, 19 Jan 2017 21:16:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3v4FVX04DgzvknN;
	Thu, 19 Jan 2017 21:16:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id Evt_ZpvuKP4I; Thu, 19 Jan 2017 21:16:50 +0100 (CET)
X-Auth-Info: 7RyA7VscfeqiRy/hd1iDp+KAK/O8E+MpCz0jM60s084=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 19 Jan 2017 21:16:50 +0100 (CET)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20170119152109.15745-1-marex@denx.de>
	<CA+chaQcwB3_CY9AbyMM9DAYguBHC_C8JW72USFdG4Qfetsqs+w@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3a70e9c7-4e56-0e43-bb1c-4ad9cd0d0a77@denx.de>
Date: Thu, 19 Jan 2017 21:16:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcwB3_CY9AbyMM9DAYguBHC_C8JW72USFdG4Qfetsqs+w@mail.gmail.com>
Subject: Re: [PATCH] picocom: Fix build
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
X-List-Received-Date: Thu, 19 Jan 2017 20:16:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/19/2017 08:17 PM, Martin Jansa wrote:
> Why not use EXTRA_OEMAKE to set these variables?

Clearly because I wasn't thinking, I'll send a V2, thanks for spotting this.

> On Thu, Jan 19, 2017 at 4:21 PM, Marek Vasut <marex@denx.de> wrote:
> 
>> The picocom complains about missing GNU_HASH from the binary during
>> QA stage, this is because the picocom Makefile overrides CPPFLAGS,
>> CFLAGS and LDFLAGS. Fix this by passing those as an argument to make.
>> Moreover, since picocom 1.7 now accepts VERSION variable and the
>> UUCP_LOCK_DIR is set to /var/lock by default, drop the CPPFLAGS
>> override altogether and replace it simply with passing VERSION
>> argument to make to precisely retain the original intention.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>  meta-oe/recipes-support/picocom/picocom_1.7.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/picocom/picocom_1.7.bb
>> b/meta-oe/recipes-support/picocom/picocom_1.7.bb
>> index dbee65609..0f85b3ec8 100644
>> --- a/meta-oe/recipes-support/picocom/picocom_1.7.bb
>> +++ b/meta-oe/recipes-support/picocom/picocom_1.7.bb
>> @@ -9,7 +9,10 @@ SRC_URI = "http://picocom.googlecode.
>> com/files/picocom-${PV}.tar.gz"
>>  SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
>>  SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9
>> a2348c89e02a84935517002b3bc2c1129e"
>>
>> -CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\"
>> -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
>> +do_compile () {
>> +    oe_runmake 'CC=${CC}' 'LD=${LD}' 'VERSION=${PV}' \
>> +               'CFLAGS=${CFLAGS}' 'LDFLAGS=${LDFLAGS}'
>> +}
>>
>>  do_install () {
>>      install -d ${D}${bindir}
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> 


-- 
Best regards,
Marek Vasut

