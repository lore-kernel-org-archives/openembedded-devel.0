Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2101174E1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:30:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R1UB2S009130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Aug 2018 18:30:12 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 26 Aug 2018 18:30:11 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1535102689-9093-1-git-send-email-mingli.yu@windriver.com>
	<21952e8e816346f2b5604a2daa93c9ff@XBOX02.axis.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B835398.3040705@windriver.com>
Date: Mon, 27 Aug 2018 09:27:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <21952e8e816346f2b5604a2daa93c9ff@XBOX02.axis.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-oe][PATCH] lmbench: fix usrmerge install path
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
X-List-Received-Date: Mon, 27 Aug 2018 01:30:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年08月24日 21:43, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
>> devel-bounces@lists.openembedded.org> On Behalf Of
>> mingli.yu@windriver.com
>> Sent: den 24 augusti 2018 11:25
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH] lmbench: fix usrmerge install path
>>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> Update $(base_libdir) to $(baselib) to fix
>> the below do_install error when usrmerge
>> enabled in DISTRO_FEATURES.
>>
>> | if [ ! -d /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-
>> a9-r2/image/usr/usr/lib64 ]; then mkdir
>> /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-
>> r2/image/usr/usr/lib64; fi
>> | mkdir: cannot create directory /poky-build/tmp-glibc/work/core2-64-
>> wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 No such file or
>> directory
>> | Makefile:141: recipe for target 'install-target' failed
>> | make[1]: *** [install-target] Error 1
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>> index 593b62f..c78e7a8 100644
>> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
>> @@ -51,8 +51,13 @@ do_compile () {
>>       install -d ${S}/bin/${TARGET_SYS}
>>       oe_runmake -C src
>>   }
>> +export baselib
>>
>>   do_install () {
>> +    # fix the lib path when usrmerge enabled
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
>> +        sed -i -e "s;\$(BASE)\$(base_libdir);\$(BASE)/\$(baselib);g" ${S}/src/Makefile
>
> The use of $(base_libdir) in the src/Makefile is introduced via an
> OE patch, "use-base_libdir-instead-of-hardcoded-lib.patch", and it
> Would be better to change that directly instead. There you should
> change "$(BASE)$(base_libdir)" to "$(DESTDIR)$(libdir)" while
> adding DESTDIR="${D}" to the oe_runmake install line in the
> recipe and things should end up where we want them.
>
> While at it you may as well correct the patch to install libmbench.a
> with its correct name again (currently it is installed as lmbench.a
> due to a mistake in the patch).

Thanks Peter!

I will resend V2 to update the logic. Thanks you very much!

Thanks,

>
> Oh, and the Upstream-Status tag in the patch is wrong as well (it is
> missing the dash in Upstream-Status)...
>
> As an alternative to the above, and this is what I would recommend,
> you can drop the patch and instead add the following after the call
> to oe_runmake in do_install:
>
>      if [ "${prefix}/lib" != "${libdir}" ]; then
>          mv ${D}${prefix}/lib ${D}${libdir}
>      fi
>
>> +    fi
>>       install -d ${D}${sysconfdir}/default/volatiles \
>>              ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
>>              ${D}${datadir}/lmbench/scripts
>> --
>> 2.7.4
>
> //Peter
>
>

