Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 542B26FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:44:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6P1iV2r014750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jul 2016 18:44:31 -0700
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Jul 2016 18:44:30 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
	<CA+chaQdaFXOOqCuoVXcUPPXmM4TbMEkk_n-a-r=v_t48snag3Q@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57956EFD.7090607@windriver.com>
Date: Mon, 25 Jul 2016 09:44:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdaFXOOqCuoVXcUPPXmM4TbMEkk_n-a-r=v_t48snag3Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add 2 ttf fonts
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
X-List-Received-Date: Mon, 25 Jul 2016 01:44:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年07月23日 16:48, Martin Jansa wrote:
> You forgot to update layer.conf, causing:
>
> ERROR: ttf-vlgothic different signature for task
> do_package_write_ipk.sigdata between qemux86 and qemux86copy
> runtaskdeps changed from ['fontconfigfontconfig_2.12.0.bb.do_packagedata',
> 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native',
> 'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:native',
> 'ttf-fontsttf-vlgothic_20141206.bb.do_package',
> 'ttf-fontsttf-vlgothic_20141206.bb.do_packagedata'] to
> ['fontconfigfontconfig_2.12.0.bb.do_packagedata',
> 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native',
> 'pseudopseudo_1.8.1.bb.do_populate_sysroot:virtual:native',
> 'ttf-fontsttf-vlgothic_20141206.bb.do_package',
> 'ttf-fontsttf-vlgothic_20141206.bb.do_packagedata']
>
> I'll fix it this time, but next time I'll just reject this.

Thanks.

--Kai

>
> On Mon, Jul 18, 2016 at 4:28 AM, <kai.kang@windriver.com> wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>>
>> Kai Kang (2):
>>    liberation-sans-narrow: add a ttf font
>>    ttf-vlgothic: add a ttf font
>>
>>   .../30-0-liberation-sans-narrow.conf               | 18 ++++++++++++
>>   .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 32
>> ++++++++++++++++++++++
>>   .../ttf-fonts/ttf-vlgothic_20141206.bb             | 28
>> +++++++++++++++++++
>>   3 files changed, 78 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
>>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
>> ttf-liberation-sans-narrow_1.07.4.bb
>>   create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
>> ttf-vlgothic_20141206.bb
>>
>> --
>> 2.6.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


-- 
Regards,
Neil | Kai Kang


