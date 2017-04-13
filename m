Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58CE377D28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 01:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3D1lTX7013394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:47:29 -0700
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 18:47:28 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170410021815.13689-1-kai.kang@windriver.com>
	<ec89de92-7b7e-ee75-e398-35bb5d715b42@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <9037463a-4d33-c26e-d2a3-335973e12deb@windriver.com>
Date: Thu, 13 Apr 2017 09:46:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <ec89de92-7b7e-ee75-e398-35bb5d715b42@windriver.com>
Subject: Re: [meta-networking][PATCH] postfix: do NOT create directory /var/spool/mail
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
X-List-Received-Date: Thu, 13 Apr 2017 01:47:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年04月13日 03:32, Mark Hatle wrote:
> On 4/9/17 9:18 PM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> postfix installs directory /var/spool/mail which conflicts with package
>> shadow.
>>
>> | Error: Transaction check error:
>> |  file /var/spool/mail conflicts between attempted installs of
>> |  postfix-3.1.1-r0.ppc64e6500 and shadow-4.2.1-r0.1.ppc64e6500
>>
>> Make postfix not create /var/spool/mail that it does NOT create the
>> directory on Fedora and Ubuntu either.
> I am not sure this is correct.
>
> The two packages have (according to DNF/RPM) different permissions, owner or
> group assigned to that particular directory.
>
> I think it's reasonable for both of the packages to create the directory,
> however they must match in perms/owner/group.  I would defer to shadow as the
> correct source for this information.

Do you mean use to update-alternative to keep them both?

>
> It may be necessary though to change shadow's default to something more
> reasonable if 'root:root' is not right.

I checked on both Fedora and Ubuntu that /var/spool/mail is set with 
'root:mail'.  I will update it in recipe shadow.
And it also set with  'setgid' on Ubuntu, do we need 'setgid' too?

Thanks.



--Kai


>
> --Mark
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/postfix/postfix.inc | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index 5bb2491..4c794ff 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -164,8 +164,6 @@ do_install () {
>>       install -m 770 -d ${D}${localstatedir}/spool/postfix
>>       chown postfix:postfix ${D}${localstatedir}/spool/postfix
>>   
>> -    install -m 2755 -d ${D}${localstatedir}/spool/mail
>> -    chown postfix:nogroup ${D}${localstatedir}/spool/mail
>>       install -m 0755 -d ${D}${localstatedir}/lib/postfix
>>       chown postfix:nogroup ${D}${localstatedir}/lib/postfix
>>       install -m 0755 -d ${D}${localstatedir}/spool/postfix
>>
>


-- 
Regards,
Neil | Kai Kang


