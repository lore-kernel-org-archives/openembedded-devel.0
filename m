Return-Path: <akuster808@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7701D60167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 20:04:16 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so3960571qgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9iJa+4gvgVZ1wHQrBvgiRsQmFheeC7CaF7tzdlrnonc=;
	b=rBzoqZqBMwVw/VimFc5ofFZkfByXnlGoXLMSUtveo/0JrOhOEneu63V3FChAKUL1+e
	ErnVrwiQyeADpSEkn1h8mHE9MWYh6AdZOo08LqgPVd5t06c0g0C5GPFIkoRthNrDJogB
	YTGc975nqDElF34OfQuDywZrRgGfvmkcnb1STuuLY4zkAMuMRtC53oBVomjsLP3km5OD
	hQdDRBpd958qaPFQjfDjGb9850Y2YOerSQpqHTK0vIejiGP/nIcc/CA7Qo3mmrdFXVeR
	6/yJpvm1VEMSyNZ/g7q64L6QFtSI+58R5KG2Ipro13EWTATBXG49Slw6HdXbdUeDZ49T
	cmdQ==
X-Received: by 10.229.196.70 with SMTP id ef6mr329680qcb.31.1421179456473;
	Tue, 13 Jan 2015 12:04:16 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	z61sm18526844qge.21.2015.01.13.12.04.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 12:04:15 -0800 (PST)
Message-ID: <54B57A3D.5080703@gmail.com>
Date: Tue, 13 Jan 2015 12:04:13 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1421065834-29221-1-git-send-email-akuster808@gmail.com>
	<20150112144028.GC2513@jama>
In-Reply-To: <20150112144028.GC2513@jama>
Cc: otavio@ossystems.com.br
Subject: Re: [meta-oe][dizzy]PATCH] php5: update to later minor version 5.4.36
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jan 2015 20:04:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2015 06:40 AM, Martin Jansa wrote:
> On Mon, Jan 12, 2015 at 04:30:34AM -0800, Armin Kuster wrote:
>> Dizzy is missing several CVE's and upgrading to a later version within the same
>> series seems reasonable since most changes are bugfixes or Security releated.
>>
>> if you are ok with this approach, please Ack and I will stage this with the next series of updates I am working on.
>
> Looks good, except missing [ before "PATCH]" which breaks commit
> subject when cherry-picking from patchwor.

k. thanks. I found a typo in the README, it is missing the "[" in the 
patch submission example (cut&paste). I will send a fix the next time I 
send patches.

kind regards,
Armin

>
>>
>> - armin
>>
>> 18-Dec-2014
>> Core:
>>      Upgraded crypt_blowfish to version 1.3.
>>      Fixed bug #68545 (NULL pointer dereference in unserialize.c).
>>      Fixed bug #68594 (Use after free vulnerability in unserialize()). (CVE-2014-8142)
>>
>> Mcrypt:
>>      Fixed possible read after end of buffer and use after free.
>>
>> 13 Nov 2014
>> Core:
>>      Fixed bug #68365 (zend_mm_heap corrupted after memory overflow in zend_hash_copy).
>> Fileinfo:
>>      Fixed bug #68283 (fileinfo: out-of-bounds read in elf note headers). (CVE-2014-3710)
>> GMP:
>>      Fixed bug #63595 (GMP memory management conflicts with other libraries using GMP).
>> PDO_pgsql:
>>      Fixed bug #66584 (Segmentation fault on statement deallocation).
>>
>> 16 Oct 2014
>> Fileinfo:
>>      Fixed bug #66242 (libmagic: don't assume char is signed).
>> Core:
>>      Fixed bug #67985 (Incorrect last used array index copied to new array after unset).
>>      Fixed bug #68044 (Integer overflow in unserialize() (32-bits only)). (CVE-2014-3669)
>> cURL:
>>      Fixed bug #68089 (NULL byte injection - cURL lib).
>> EXIF:
>>      Fixed bug #68113 (Heap corruption in exif_thumbnail()). (CVE-2014-3670)
>> OpenSSL:
>>      Reverted fixes for bug #41631, due to regressions.
>> XMLRPC:
>>      Fixed bug #68027 (Global buffer overflow in mkgmtime() function). (CVE-2014-3668)
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-devtools/php/{php_5.4.33.bb => php_5.4.36.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php_5.4.33.bb b/meta-oe/recipes-devtools/php/php_5.4.36.bb
>> similarity index 97%
>> rename from meta-oe/recipes-devtools/php/php_5.4.33.bb
>> rename to meta-oe/recipes-devtools/php/php_5.4.36.bb
>> index 6fdfe0f..43c7736 100644
>> --- a/meta-oe/recipes-devtools/php/php_5.4.33.bb
>> +++ b/meta-oe/recipes-devtools/php/php_5.4.36.bb
>> @@ -30,8 +30,8 @@ SRC_URI_append_class-target += " \
>>               file://php-fpm-apache.conf \
>>             "
>>
>> -SRC_URI[md5sum] = "c6878bb1cdb46bfc1e1a5cd67a024737"
>> -SRC_URI[sha256sum] = "1a75b2d0835e74b8886cd3980d9598a0e06691441bb7f91d19b74c2278e40bb5"
>> +SRC_URI[md5sum] = "70e223be4bb460e465b7a9d7cb5b9cac"
>> +SRC_URI[sha256sum] = "b0951608c3e8afb978a624c7f79a889980210f5258f666c1d997bd6491e13241"
>>
>>   S = "${WORKDIR}/php-${PV}"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

