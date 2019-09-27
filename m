Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1946C13D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:20:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8R7Kj9u026520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2019 00:20:47 -0700 (PDT)
Received: from [128.224.158.233] (128.224.158.233) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 00:20:44 -0700
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
	<20190926194855.GA27652@localhost>
	<3a37c354-dfca-d7e3-70c3-842d13fae466@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b8fc2607-3244-84be-82a5-c27d942155ad@windriver.com>
Date: Fri, 27 Sep 2019 15:20:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a37c354-dfca-d7e3-70c3-842d13fae466@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Fri, 27 Sep 2019 07:20:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Martin,

We found another problem on spice_git.bb:

PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"

I can't find libcacard:

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libcacard


So it seems that this PACKAGECONFIG is invalid, should we remove it?

// Robert

On 9/27/19 11:56 AM, Robert Yang wrote:
> 
> 
> On 9/27/19 3:48 AM, Adrian Bunk wrote:
>> On Thu, Sep 26, 2019 at 04:26:54PM +0000, Martin Jansa wrote:
>>> * with older native gcc on host this will break spice-native with:
>>>    cc1: error: -Werror=address-of-packed-member: no option 
>>> -Waddress-of-packed-member
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>   meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb 
>>> b/meta-networking/recipes-support/spice/spice_git.bb
>>> index 30e939ac07..2829a59d15 100644
>>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>>> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
>>>   export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>>>   export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>>> -CFLAGS_append = " -Wno-error=address-of-packed-member"
>>> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
> 
> Yes, the error was the same as you mentioned in the commit message, and
> "bitbake spice-native" works with this change.
> 
>>> ...
>>
>> Least hassle would be
>>    CFLAGS_append = " -Wno-error"
> 
> "bitbake nativesdk-spice" works with this change, otherwise, it doesn't work.
> 
> This patch works for me.
> 
> // Robert
> 
>>
>> cu
>> Adrian
>>

