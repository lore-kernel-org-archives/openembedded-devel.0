Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0802E62252
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 09:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s769TCWs003549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 02:29:12 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 02:29:12 -0700
Message-ID: <53E1F570.8010209@windriver.com>
Date: Wed, 6 Aug 2014 17:29:20 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1406316789-27514-1-git-send-email-akuster@mvista.com>
	<53E1DC2A.5040903@windriver.com> <20140806081740.GA14848@jama>
In-Reply-To: <20140806081740.GA14848@jama>
Subject: Re: [meta-networking][PATCH] V4 wireshark: fix build depends
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
X-List-Received-Date: Wed, 06 Aug 2014 09:29:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/06/2014 04:17 PM, Martin Jansa wrote:
> On Wed, Aug 06, 2014 at 03:41:30PM +0800, Rongqing Li wrote:
>>
>>
>> On 07/26/2014 03:33 AM, Armin Kuster wrote:
>>> This should address issues found in test-dependencies 2014-07-25
>>>
>>> wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl libnl-nf libnl-route portaudio-v19 sbc
>>>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>    meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>> index 5d6df40..b965fdf 100644
>>> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.wireshark.org"
>>>    SECTION = "network"
>>>    LICENSE = "GPL-2.0"
>>>
>>> -DEPENDS = "perl-native libpcap pcre expat glib-2.0 libsmi"
>>> +DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libsmi libnl portaudio-v19 sbc"
>>>
>>>    inherit autotools pkgconfig
>>>
>>
>> 1. I can not download wireshark-1.12.0-rc2.tar.bz2, seems it has been
>> removed
>>
>> wget
>> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2
>> --2014-08-06 15:00:13--
>> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2
>> Resolving wiresharkdownloads.riverbed.com
>> (wiresharkdownloads.riverbed.com)... 69.4.231.52
>> Connecting to wiresharkdownloads.riverbed.com
>> (wiresharkdownloads.riverbed.com)|69.4.231.52|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2014-08-06 15:00:14 ERROR 404: Not Found.
>>
>>
>> 2. which layers do I found the libsmi/portaudio recipes?
>
> both are in meta-oe
> http://layers.openembedded.org/layerindex/recipe/23397/
> http://layers.openembedded.org/layerindex/recipe/1080/
>


PACKAGECONFIG should work on libsmi and portaudio.

-Roy

>
>

-- 
Best Reagrds,
Roy | RongQing Li

