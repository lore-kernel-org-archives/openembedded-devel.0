Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 661626DF6D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 06:50:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB56oxHn016234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Dec 2013 22:50:59 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 4 Dec 2013 22:50:58 -0800
Message-ID: <52A0227C.6050603@windriver.com>
Date: Thu, 5 Dec 2013 14:51:40 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1385087849-30272-1-git-send-email-Qi.Chen@windriver.com>
	<6163089.YiV9QuLgku@helios> <529DB651.2080505@windriver.com>
	<27180610.K2R9aiVLnQ@helios>
In-Reply-To: <27180610.K2R9aiVLnQ@helios>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] webmin: fix failures in do_install task
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
X-List-Received-Date: Thu, 05 Dec 2013 06:51:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2013 07:02 PM, Paul Eggleton wrote:
> On Tuesday 03 December 2013 18:45:37 ChenQi wrote:
>> On 12/03/2013 06:19 PM, Paul Eggleton wrote:
>>> On Friday 22 November 2013 10:37:29 Qi.Chen@windriver.com wrote:
>>>> -    export perl=perl
>>>> +    export perl=${OECMAKE_PERLNATIVE_DIR}/perl
>>> I'm afraid I don't like the look of this - OECMAKE_PERLNATIVE_DIR is set
>>> for use by cmake, and perlnative.bbclass should be putting our perl
>>> binary into PATH so it should be run anyway. Is this change actually
>>> necessary?
>> Please drop this patch. I found that the do_install task in webmin runs
>> some perl scripts (e.g. postinstall.pl and enable-collections.pl) that
>> are supposed to be run on target. I suspect webmin has never worked
>> correctly on target as a result. I'm gonna propose another fix. The goal
>> is to make it work on target.
> I can assure you that it has worked on the target; at least it did about 6
> months ago (perhaps more by chance rather than design though).
>
> Cheers,
> Paul
>

Hi Paul,

Thanks for your information :)

I just tried it out on sato image with 'webmin' and 'midori' installed.
1) https://localhost:10000
Cannot connect
2) http://localhost:10000
Login page appeared, but I cannot login even if I provided the correct 
username and password.

I did this test on qemu, but I think the result should have nothing to 
do with qemu.

Best Regards,
Chen Qi

