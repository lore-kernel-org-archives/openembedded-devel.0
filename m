Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B11D2763CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2015 00:44:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t890i7xZ008656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Sep 2015 17:44:07 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 8 Sep 2015 17:44:07 -0700
Message-ID: <55EF80D5.2050900@windriver.com>
Date: Wed, 9 Sep 2015 08:44:05 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1441521234-19902-1-git-send-email-rongqing.li@windriver.com>
	<20150908151040.GC2381@jama>
In-Reply-To: <20150908151040.GC2381@jama>
Subject: Re: [meta-oe][PATCH] collectd: fix a floating dependence on openldap
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
X-List-Received-Date: Wed, 09 Sep 2015 00:44:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年09月08日 23:10, Martin Jansa wrote:
> On Sun, Sep 06, 2015 at 02:33:54PM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
>> index fd3b1ab..55d7b38 100644
>> --- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
>> +++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
>> @@ -45,6 +45,7 @@ PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
>>   PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
>>   PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
>>   PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasmart"
>> +PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
>
> With this patch applied I've still seen:
> collectd-5.5.0: collectd rdepends on openldap, but it isn't a build dependency? [build-deps]
>
> so I haven't merged it from master-next, but lets see if it's shown in
> next build (maybe qemuarm was executed before I've included this in
> master-next).


I test it on both x86 and arm again, it works for me.

-Roy


>
>>
>>   EXTRA_OECONF = " \
>>                   ${FPLAYOUT} \
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

-- 
Best Reagrds,
Roy | RongQing Li

