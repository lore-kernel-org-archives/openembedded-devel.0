Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id BFA9476710
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 02:22:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9T2Mwfk017862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Oct 2015 19:22:59 -0700
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 28 Oct 2015 19:22:58 -0700
To: akuster808 <akuster808@gmail.com>
References: <1445914005-23569-1-git-send-email-rongqing.li@windriver.com>
	<5630F654.6010009@gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <56318300.8020600@windriver.com>
Date: Thu, 29 Oct 2015 10:22:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <5630F654.6010009@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] dovecot: add PACKAGECONFIG for lz4
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
X-List-Received-Date: Thu, 29 Oct 2015 02:23:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年10月29日 00:22, akuster808 wrote:
> Roy,
>
> Should any of these be back ported to Fido and Dizzy?
>
> - armin


not, I think;

it is not a fatal

-Rpu

>
> On 10/26/2015 07:46 PM, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
>> index 9b5f536..a01ef83 100644
>> --- a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
>> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
>> @@ -23,6 +23,7 @@ PACKAGECONFIG ??= " \
>>
>>   PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>>   PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
>> +PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
>>
>>   # From native build in armv7a-hf/eglibc
>>   CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
>>
>

-- 
Best Reagrds,
Roy | RongQing Li

