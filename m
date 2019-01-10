Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 058CD6B50B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 03:42:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A3fYXB029744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 19:41:50 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 9 Jan 2019 19:41:36 -0800
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
References: <20190109061610.34471-1-yongxin.liu@windriver.com>
	<CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129ED63A@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sqJTnt6R7F83Ta47Kbt3nzyeT5-LYYgyzAm2Q6y0j2Gaw@mail.gmail.com>
	<83702874-3257-4d80-e601-6e2f770eeb42@windriver.com>
	<597B109EC20B76429F71A8A97770610D129EDC9A@ALA-MBD.corp.ad.wrs.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ddc7f272-8e2e-58f5-f664-949234ed67bb@windriver.com>
Date: Wed, 9 Jan 2019 22:41:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <597B109EC20B76429F71A8A97770610D129EDC9A@ALA-MBD.corp.ad.wrs.com>
X-Originating-IP: [172.25.44.4]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pmdk: fix install error
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
X-List-Received-Date: Thu, 10 Jan 2019 03:42:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/9/19 9:59 PM, Liu, Yongxin wrote:
> 
>> -----Original Message-----
>> From: MacLeod, Randy
>> Sent: Thursday, January 10, 2019 05:36
>> To: Liu, Yongxin
>> Cc: Khem Raj; openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH] pmdk: fix install error
>>
>> On 1/9/19 1:18 PM, Khem Raj wrote:
>>> On Wed, Jan 9, 2019 at 2:17 AM Liu, Yongxin <Yongxin.Liu@windriver.com>
>> wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Khem Raj [mailto:raj.khem@gmail.com]
>>>>> Sent: Wednesday, January 9, 2019 18:06
>>>>> To: Liu, Yongxin
>>>>> Cc: openembeded-devel
>>>>> Subject: Re: [oe] [meta-oe][PATCH] pmdk: fix install error
>>>>>
>>>>> On Tue, Jan 8, 2019 at 10:20 PM Yongxin Liu
>> <yongxin.liu@windriver.com>
>>>>> wrote:
>>>>>>
>>>>>> .so files are not generated in usr/local/lib/ but in usr/local/lib64.
>>>>>>
>>>>>> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>>>>>> ---
>>>>>>    meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 4 ++--
>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-
>>>>> oe/recipes-extended/pmdk/pmdk_1.4.2.bb
>>>>>> index 3da22a970..af2229f1c 100644
>>>>>> --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
>>>>>> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
>>>>>> @@ -43,10 +43,10 @@ do_install() {
>>>>>>           mv ${D}/usr/local/bin/daxio ${D}${bindir}/
>>>>>>
>>>>>>           install -d ${D}${libdir}
>>>>>> -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
>>>>>> +       mv ${D}/usr/local/lib64/*so* ${D}${libdir}/
>>>>>>
>>>>>
>>>>> I wonder if this should be using /usr/local/${base_libdir} here
>>>>
>>>> Since ${base_libdir} is "/lib64", should we use
>> "/usr/local${base_libdir}" ?
>>>> Or it is fine to go with "/usr/local//lib64" after parsing?
>>>
>>> using /usr/local${base_libdir} is fine
>>
>> It's a little odd that the default prefix is /usr/local rather
>> than /usr . It would make sense to start with /usr/local in
>> early development but the first commit to pmdk on github was
>> in 2014...
>>
>> If this is part of the system, use /usr, if it's a hack or
>> an install owned by the local system admin, use /usr/local.
>> As per, for example:
>>     https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s09.html
> 
> In configure file of pmdk, I find the following sentences.
> 
>      if test "x$prefix" = "xNONE" ; then
>        prefix="/usr/local"
>      fi
>      if test "x$exec_prefix" = "xNONE" ; then
>        exec_prefix=$prefix
>      fi
>      PREFIX=$prefix
> 
> So in bb file, even ${prefix} is /usr, "oe_runmake PREFIX=${prefix} DESTDIR=${D} install"
> doesn't set PREFIX to /usr for pmdk installation.
> 
> "oe_runmake prefix=/usr DESTDIR=${D} install" works.
> 
> If you are OK with this change, I will send patch V2.


Fine with me. Other recipes do similar things:

$ cd .../oe-core.git
$ rg e_runmake |grep prefix | tail -3
meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb:	oe_runmake 
PREFIX=${prefix} DESTDIR=${D} install
meta/recipes-kernel/blktrace/blktrace_git.bb:	oe_runmake ARCH="${ARCH}" 
prefix=${prefix} \
meta/recipes-devtools/unifdef/unifdef_2.11.bb:	oe_runmake install 
DESTDIR=${D} prefix=${prefix}


../Randy
> 
> 
> Thanks,
> Yongxin
> 
> 
>>
>> ../Randy
>>
>>>
>>>>
>>>>
>>>> Thanks,
>>>> Yongxin
>>>>
>>>>>>           install -d ${D}${libdir}/pkgconfig
>>>>>> -       mv ${D}/usr/local/lib/pkgconfig/*.pc
>> ${D}${libdir}/pkgconfig/
>>>>>> +       mv ${D}/usr/local/lib64/pkgconfig/*.pc
>> ${D}${libdir}/pkgconfig/
>>>>>>
>>>>>>           install -d ${D}${includedir}
>>>>>>           mv ${D}/usr/local/include/* ${D}${includedir}/
>>>>>> --
>>>>>> 2.14.4
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


-- 
# Randy MacLeod
# Wind River Linux

