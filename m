Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8C387C6F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 03:51:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S3prMD022706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Feb 2019 19:51:53 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 27 Feb 2019 19:51:52 -0800
To: Tom Rini <trini@konsulko.com>, <bunk@stusta.de>, Khem Raj
	<raj.khem@gmail.com>
References: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
	<1551256910-119653-5-git-send-email-changqing.li@windriver.com>
	<20190227163511.GR12046@bill-the-cat>
	<e98a80c6-e1ab-1aef-6613-489d1b233358@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <2e6345b9-1be8-1a76-e3db-db8e87ec7ca5@windriver.com>
Date: Thu, 28 Feb 2019 11:51:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <e98a80c6-e1ab-1aef-6613-489d1b233358@windriver.com>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 4/4] freeradius: add PACKAGECONFIGs
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
X-List-Received-Date: Thu, 28 Feb 2019 03:51:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/28/19 10:57 AM, Changqing Li wrote:
>
> On 2/28/19 12:35 AM, Tom Rini wrote:
>> On Wed, Feb 27, 2019 at 04:41:50PM +0800, changqing.li@windriver.com 
>> wrote:
>>
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> add 3 PACKAGECONFIG
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>> meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb 
>>> | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git 
>>> a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb 
>>> b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
>>> index c17d56d..cee3b47 100644
>>> --- 
>>> a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
>>> +++ 
>>> b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
>>> @@ -83,6 +83,9 @@ PACKAGECONFIG[perl] = 
>>> "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --w
>>>   PACKAGECONFIG[python] = "--with-rlm_python 
>>> --with-rlm-python-bin=${STAGING_BINDIR_NATIVE}/python-native/python 
>>> --with-rlm-python-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python,python-native 
>>> python"
>>>   PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl 
>>> json-c"
>>>   PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
>>> +PACKAGECONFIG[no-ssl] = "--without-openssl,--with-openssl"
>> This is commonly done with 'openssl' as the PACKAGECONFIG flag.
>>
>>> +PACKAGECONFIG[no-rlm-eap-fast] = 
>>> "--without-rlm_eap_fast,--with-rlm_eap_fast"
>>> +PACKAGECONFIG[no-rlm-eap-pwd] = 
>>> "--without-rlm_eap_pwd,--with-rlm_eap_pwd"
>> We also don't have any other examples of "no-xxx".  What is the behavior
>> we have here today?  If "enabled" we should put them in the default
>> PACKAGECONFIG instead, imho.
>>
> Hi, Khem
>
> My original idea is default option is enable,  add 
> PACKAGECONFIG[disable-xxx] is for
>
> someone who want to disable it by append PACKAGECONFIG.  but if we 
> have the
>
> traditional way  like tom and Adrian said,  I am ok with that way.
>
>
> I noticed that this patch is now on master-next,  so I will send a 
> !fixup  of these patches based on master-next
>
> branch in case we need to keep the traditional way.   Sorry for the 
> inconvenient.

I also need to  correct my commit message, so I will send a v2 today.

>
>
-- 
BRs

Sandy(Li Changqing)


