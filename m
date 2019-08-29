Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3687F2EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 02:03:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T22Uex013602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2019 19:02:40 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 19:02:19 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
	<20190828195635.GB3044@localhost>
	<CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
	<20190828214003.GE3044@localhost>
	<0454f751-2c68-6654-0ba0-8aa0b4d72259@windriver.com>
	<CAMKF1srNLP=ZZqVBSGVriWP_MDxW6-KxLdU5Z_Ry4d55ciZKLA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d892fe7f-9ffd-1fc5-02d3-a5055ffad21a@windriver.com>
Date: Thu, 29 Aug 2019 10:01:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srNLP=ZZqVBSGVriWP_MDxW6-KxLdU5Z_Ry4d55ciZKLA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Thu, 29 Aug 2019 02:03:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/29 上午9:57, Khem Raj wrote:
> On Wed, Aug 28, 2019 at 6:47 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/8/29 上午5:40, Adrian Bunk wrote:
>>> On Wed, Aug 28, 2019 at 01:32:52PM -0700, Khem Raj wrote:
>>>> On Wed, Aug 28, 2019 at 12:56 PM Adrian Bunk <bunk@stusta.de> wrote:
>>>>> On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
>>>>>> On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
>>>>>>> What about marking networkmanager as incompatible with musl instead of
>>>>>>> maintaining an ever-growing mess?
>>>>>>>
>>>>>> if the fix is specifically done for musl alone then I would agree, but
>>>>>> in many cases, the fixes
>>>>>> have been cleaning up assumptions in kernel UAPI headers on glibc
>>>>>> provided headers
>>>>>> which is a good thing, and it does take some time for kernel header
>>>>>> changes to flow upstream
>>>>>> but eventually, they do. e.g. see [1]
>>>>> This is not a cleanup, this is a workaround for a misfeature of musl.
>>>>>
>>>>> The kernel userspace headers are the userspace ABI of the kernel for
>>>>> usage by all C libraries provided in one place, they are not tied to
>>>>> any specific C library.
>>>>>
>>>>> musl upstream does not even try to use the kernel userspace headers.
>>>>>
>>>>> The kernel userspace headers used to be a mess, but after more than 10
>>>>> years of cleanup there is no excuse for musl to insist on providing own
>>>>> definitions of what is already provided by the kernel headers.
>>>> I was citing an example, you might have good feedback maybe bring it up
>>>> upstream with musl or
>>> musl upstream says the patched kernel-headers package from sabotage
>>> linux should be used:
>>>     https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-
>> There has been a patch of networkmanger for the headers issue. And I
>> update it then this problem gone.
>>
>>
>>>> ...
>>>>> There is a benefit of a small C library when your flash space is
>>>>> single-digit megabytes, but maintaining plenty of not upstreamable
>>>>> OE-only patches for using networkmanager on musl without a sane
>>>>> usecase is a waste of effort.
>>>> I have said it before as well, I will say it again if we can improve an upstream
>>>> packages portability that itself is a good thing, but we should not go overboard
>>>> if its too much of work.
>>> Networkmanager doesn't aim at portability and is too much work.
>> Yes, another following issue is that NetworkManger uses non-posix
>> portable functions mrand48_r() and struct drand48_data. musl doesn't
>> recognize them.
>> After adapt to posix functions jrand48(), it segment fault when startup.
>> (The point of segment fault is far from my patch). Still working on it. :(
>>
> Can you look at
> https://code.foxkit.us/adelie/packages/tree/master/user/networkmanager
> especially https://code.foxkit.us/adelie/packages/blob/master/user/networkmanager/random.patch


I referred to 
https://github.com/tpm2-software/tpm2-abrmd/pull/503/commits/4d652c679ab687e0253a65c2677f73661af76725#diff-99e087f6c795d91b5c4d4362fc9dc1ff
and my patch is almost same with you listed:

diff --git a/shared/n-dhcp4/src/n-dhcp4-c-probe.c 
b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
index 308cff8..6522dda 100644
--- a/shared/n-dhcp4/src/n-dhcp4-c-probe.c
+++ b/shared/n-dhcp4/src/n-dhcp4-c-probe.c
@@ -362,8 +362,9 @@ static void 
n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
          seed16v[1] = (u64 >> 16) ^ (u64 >>  0);
          seed16v[2] = (u64 >> 32) ^ (u64 >> 16);

-        r = seed48_r(seed16v, &config->entropy);
-        c_assert(!r);
+        config->entropy[0] = seed16v[0];
+        config->entropy[1] = seed16v[1];
+        config->entropy[2] = seed16v[2];
  }

  /**
@@ -377,10 +378,8 @@ static void 
n_dhcp4_client_probe_config_initialize_random_seed(NDhcp4ClientProbe
   */
  uint32_t 
n_dhcp4_client_probe_config_get_random(NDhcp4ClientProbeConfig *config) {
          long int result;
-        int r;

-        r = mrand48_r(&config->entropy, &result);
-        c_assert(!r);
+        result = jrand48(config->entropy);

          return result;
  };
diff --git a/shared/n-dhcp4/src/n-dhcp4-private.h 
b/shared/n-dhcp4/src/n-dhcp4-private.h
index c38ddbf..a12af7a 100644
--- a/shared/n-dhcp4/src/n-dhcp4-private.h
+++ b/shared/n-dhcp4/src/n-dhcp4-private.h
@@ -259,7 +259,7 @@ struct NDhcp4ClientProbeConfig {
          bool inform_only;
          bool init_reboot;
          struct in_addr requested_ip;
-        struct drand48_data entropy;    /* entropy pool */
+        unsigned short entropy[3];    /* entropy pool */
          uint64_t ms_start_delay;        /* max ms to wait before 
starting probe */
          NDhcp4ClientProbeOption *options[UINT8_MAX + 1];
          int8_t request_parameters[UINT8_MAX + 1];


Regards,
Kai



>
>> Regards,
>> Kai
>>
>>
>>>> there are container distros using musl so we
>>>> have a wide
>>>> list of packages which work well with musl, and this list is always
>>>> increasing, so I
>>>> would refrain from pushing musl to a narrow usecase
>>> AFAIK OE is the only distribution trying to build software like systemd
>>> or networkmanager with musl, and container distros optimized for size
>>> are only supporting smaller alternatives.
>>>
>>> cu
>>> Adrian
>>>
>> --
>> Kai Kang
>>

-- 
Kai Kang


