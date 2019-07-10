Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 116C97EE00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 03:18:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6A3I2cR007368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2019 20:18:02 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 9 Jul 2019 20:18:01 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190710023525.25506-1-kai.kang@windriver.com>
	<CAMKF1sq+-Zic8ZBCwQ4vGoupT61DrSMbffeOrqoTnj73AM3QWw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <6206c8fd-78d4-38b3-7683-64edbf823655@windriver.com>
Date: Wed, 10 Jul 2019 11:17:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq+-Zic8ZBCwQ4vGoupT61DrSMbffeOrqoTnj73AM3QWw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libvncserver: update to latest commit 1354f7f
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
X-List-Received-Date: Wed, 10 Jul 2019 03:18:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/10 上午11:14, Khem Raj wrote:
> On Tue, Jul 9, 2019 at 7:35 PM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update libvncserver to latest git commit 1354f7f which could help to fix
>> do_package error when multilib is enabled:
>>
>> | Files/directories were installed but not shipped in any package:
>> |   /usr/lib/libvncclient.so.0.9.12
>> |   /usr/lib/libvncclient.so.1
>> |   /usr/lib/libvncclient.so
>> |   /usr/lib/libvncserver.so.0.9.12
>> |   /usr/lib/libvncserver.so.1
>> |   /usr/lib/libvncserver.so
>> |   /usr/lib/pkgconfig
>> |   /usr/lib/pkgconfig/libvncserver.pc
>> |   /usr/lib/pkgconfig/libvncclient.pc
>>
>> Rename recipe name from _git.bb to _${version}.bb as well.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../{libvncserver_git.bb => libvncserver_0.9.12.bb}           | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>   rename meta-oe/recipes-graphics/libvncserver/{libvncserver_git.bb => libvncserver_0.9.12.bb} (92%)
>>
>> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
>> similarity index 92%
>> rename from meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
>> rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
>> index bc47a3f15..683a29f94 100644
>> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
>> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
>> @@ -31,7 +31,9 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
>>   inherit cmake
>>
>>   SRC_URI = "git://github.com/LibVNC/libvncserver"
>> -SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
>> +SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
>>   PV = "0.9.12+git${SRCPV}"
> now that PV is set in recipe name you might want to turn this into
>
> PV .= "+git{SRCPV}"

OK. V2 will be sent.

Regards,
Kai


>   S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Kai Kang


