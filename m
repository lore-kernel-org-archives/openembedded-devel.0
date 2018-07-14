Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4717458A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jul 2018 08:42:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6E8gLFd012583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 14 Jul 2018 01:42:21 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sat, 14 Jul 2018 01:42:20 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-3-hongzhi.song@windriver.com>
	<CANNYZj8Doep17N+hmd_WbJr0V91kpHMDH_RdhsOPsCS3ax276A@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <80e376b9-c025-160d-18ce-1d02292baca6@windriver.com>
Date: Sat, 14 Jul 2018 16:44:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Doep17N+hmd_WbJr0V91kpHMDH_RdhsOPsCS3ax276A@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core][PATCH] x86: remove "qemu-usermode" from MACHINE_FEATURES_BACKFILL_CONSIDERED
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
X-List-Received-Date: Sat, 14 Jul 2018 08:42:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年07月13日 22:13, Alexander Kanavin wrote:
> 2018-07-13 16:06 GMT+02:00 Hongzhi.Song <hongzhi.song@windriver.com>:
>> error information:
>> ---
>> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>> If the above error message is about missing .so libraries,
>> then setting up GIR_EXTRA_LIBS_PATH in the recipe should help.
>> (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
>> ---
>>
>> qemux86 will face the error above.
> I believe this error does not happen on the autobuilder, and disabling
> qemu-usermode on x86 is an unacceptable reduction in functionality. We
> need to address the issue, not disable the feature.
>
> Please provide information about your environment. Which version of
> oe-core and qemu are you seeing this with?

qemux86
poky: master
local.conf is attached in cover-letter.
Others are default.

--Hongzhi

> Alex
>


