Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 428AB79E08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 21:13:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBJLC3gr007238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2018 13:12:18 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Dec 2018 13:12:06 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Ran Shalit <ranshalit@gmail.com>, 
	"Yu, Mingli" <mingli.yu@windriver.com>
References: <CAJ2oMhKm02QeiF5dqpvYqeXBRCo+jWh=cjb2Sj2DjAt+ZqirTg@mail.gmail.com>
	<CAJTo0LbddHddV+sFk326_Rj5GCZpaiMft77Zt_O_HQ5f3w-f+w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <36c4514c-fc6e-9c30-88b3-4f70a9e6a716@windriver.com>
Date: Wed, 19 Dec 2018 16:12:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbddHddV+sFk326_Rj5GCZpaiMft77Zt_O_HQ5f3w-f+w@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Build suddenly stops and desktop logouts !
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
X-List-Received-Date: Wed, 19 Dec 2018 21:13:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 12/19/18 11:24 AM, Burton, Ross wrote:
> The usual causes are not enough RAM (so the OOM killer steps in and
> kills something inappropriate), bad RAM (you're actually using all of
> it for a change), or CPU overheating.  The latter two often cause
> actual reboots instead of logouts, a logout suggests the OOM killer
> was involved.  Setting up a little bit of swap might be useful, or
> turn down the parallelism in local.conf.

Ran,

Grace/Mingli is working on this bug:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=11802
   system spontaneously logs out while building core-image
If you could help her to reproduce it in a controlled environment
that would be great! The stumbling block has always been that
it rarely happens and is difficult to reproduce, iirc.

../Randy

> 
> Ross
> On Wed, 19 Dec 2018 at 15:27, Ranran <ranshalit@gmail.com> wrote:
>>
>> Hello,
>>
>> I have strange behavior with ubuntu16.04 LTS, in which after building
>> for couple of hours, suddenly the ubuntu OS logouts.
>> I see that others also have the same issue but seems that there is no solution:
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130617.html
>> and
>> https://stackoverflow.com/questions/48148169/whenever-running-bitbake-stops-all-application-and-locks-the-system
>>
>> I have increased my virtualbox memory to 11G, (no swap in my ubuntu)
>> but it still happens (might be less than before not sure), also
>> strangely even after increase with "free" command I see that it get
>> sometimes below ~150M free.
>>
>> Is there any idea what's wrong?
>>
>> Thank you,
>> ran
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod
# Wind River Linux

