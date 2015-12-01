Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 498DB606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:51:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB19psaF024062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Dec 2015 01:51:54 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Dec 2015 01:51:54 -0800
Message-ID: <565D6DB8.6020209@windriver.com>
Date: Tue, 1 Dec 2015 17:51:52 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1448534206-31940-1-git-send-email-hongxu.jia@windriver.com>
	<20151130204652.GB20849@mentor.com>
In-Reply-To: <20151130204652.GB20849@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] postfix.inc: fix start postfix failed while hostname is numeric
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
X-List-Received-Date: Tue, 01 Dec 2015 09:51:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2015 04:46 AM, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] postfix.inc: fix start postfix failed while hostname is numeric] On 15.11.26 (Thu 18:36) Hongxu Jia wrote:
>
>> While hostname is numeric, start postfix failed
>> ...
>> root@localhost:~# hostname
>> 128.224.163.251
>> root@localhost:~# postfix start
>> postfix: warning: valid_hostname: numeric hostname: 128.224.163.251
>> postfix: fatal: unable to use my own hostname
>> ...
>>
>> The postfix define a macro SLOPPY_VALID_HOSTNAME to allow the
>> numeric hostname.
> This seems like it's asking for a lot of trouble, if you either assign
> your hostname to '128.224.163.251' (as it appears to be in your commit
> log, but I don't know off-hand how you'd do that without writing a
> program specifically for that purpose, and even then ...) or if you
> assign your hostname to be '128' and the FQDN to be '128.224.163.251'.
> Certainly the postfix folks think this is a sufficiently unusual and
> presumably hazzard-prone to make it not even a runtime option but a
> compile-time one.
>
> Are you sure the issue you're trying to solve here won't be resolved by
> applying [] throughout your .cf files?  I'm reluctant to take this patch
> since it turns on a surprising feature that, my sense is, is not
> desirable in common setups.

With more investigation, for customer convenience,
I think we could add a hostname check before postfix start,
if the hostname is not long host name (FQDN), we set
"myhostname=localhost" to main.cf

The idea refers postfix's postinst in ubuntu 14.04.

V2 incoming.

//Hongxu


>
> -J.
>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index 6d39570..f8b8e43 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -67,7 +67,7 @@ export CCARGS-sasl_class-native = ""
>>   export AUXLIBS-sasl_class-native = ""
>>   
>>   # PCRE, TLS support default
>> -export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl}"
>> +export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -DSLOPPY_VALID_HOSTNAME ${CCARGS-ldap} ${CCARGS-sasl}"
>>   export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
>>   export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
>>   
>> -- 
>> 1.9.1
>>


