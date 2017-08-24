Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F17671C42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 05:33:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7O5XOGl009386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 22:33:24 -0700
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 22:33:23 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <CAMKF1spON1L-HeobLHk+GaQqcqSbXtzvPQPnaVnjfy8jyqYEQQ@mail.gmail.com>
	<1503467852-161518-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1srzoJzqCW_iYXQDd+hGB0dt2TZcDVK-Wy2GgtYOXkqx5w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <12285f58-5d0b-2e9e-542b-933339268f33@windriver.com>
Date: Thu, 24 Aug 2017 13:34:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srzoJzqCW_iYXQDd+hGB0dt2TZcDVK-Wy2GgtYOXkqx5w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2] netcf: upgrade to latest 0.2.8
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
X-List-Received-Date: Thu, 24 Aug 2017 05:33:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年08月23日 22:36, Khem Raj wrote:
> On Tue, Aug 22, 2017 at 10:57 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Fix compile failure while gnulib upgraded to 2017-08-20.18
>> ...
>> | In file included from ../../../git/gnulib/lib/printf-args.h:41:0,
>> |                  from ../../../git/gnulib/lib/printf-parse.h:29,
>> |                  from ../../../git/gnulib/lib/printf-parse.c:36:
>> | ./wchar.h:571:6: error: #if with no expression
>> |  # if
>> ...
>>
>> Update HOMEPAGE, SRC_URI since the formers are obsolete.
>>
>> Update SRCREV, although version not change, but the former
>> was two years ago.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb}     | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>   rename meta-networking/recipes-support/netcf/{netcf_git.bb => netcf_0.2.8.bb} (88%)
>>
>> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>> similarity index 88%
>> rename from meta-networking/recipes-support/netcf/netcf_git.bb
>> rename to meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>> index a7a5000..0b53add 100644
>> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
>> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>> @@ -1,15 +1,15 @@
>>   SUMMARY = "netcf"
>>   DESCRIPTION = "netcf is a cross-platform network configuration library."
>> -HOMEPAGE = "https://fedorahosted.org/netcf/"
>> +HOMEPAGE = "https://pagure.io/netcf"
>>   SECTION = "libs"
>>   LICENSE = "LGPLv2.1"
>>
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>>
>> -SRCREV = "9158278ad35b46ce9a49b2e887483c6d8c287994"
>> +SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
>>   PV = "0.2.8+git${SRCPV}"
> you can change it to
>
> PV .= "+git${SRCPV}"

Why? Since the PR Server used, will make version go backward?

//Hongxu

>> -SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
>> +SRC_URI = "git://pagure.io/netcf.git;protocol=https \
>>   "
>>
>>   DEPENDS += "augeas libnl libxslt libxml2 gnulib"
>> @@ -23,6 +23,8 @@ EXTRA_OECONF_append_class-target = " --with-driver=redhat"
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>   PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
>>
>> +EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
>> +
>>   do_configure_prepend() {
>>       currdir=`pwd`
>>       cd ${S}
>> --
>> 2.8.1
>>


