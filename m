Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA45C65CFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 15:05:57 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 19so2205067ykq.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LLYPm2shNU32KCNJZ9xcUbVADOtynAtUjZ+XKsUDPmU=;
	b=IjNnh2K3968QT4yVVPn2uOnVcbvNPARYQhxF8D0sXsmasygl2wSYgDnBAbePl9eKAT
	L5eUatOlfgyfittBEs4cKxH0T6G7GLLa4azoz1qyNwsgmAexIcUM9z+VERt/x7ZyihqW
	vZqGwKmI2M22SsHszkZYJdwMnfVqhaMnowuq8l70Ub+1QCtYtryz/KdFFYyWpCu8lLmX
	esR2Cgu/NdcJGFCxFH+v3Tsy9FE3SgphatjetojmkWV3Za5j/paiAMD78laaQfA894F/
	8tUlo57MdTfaYwklKHa6jbE7NVvQZE8aTnVJVKMfsw3bdLYrY1amcuCoLS9DTq+jO332
	zeIA==
MIME-Version: 1.0
X-Received: by 10.236.90.225 with SMTP id e61mr36919332yhf.15.1397919958249;
	Sat, 19 Apr 2014 08:05:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sat, 19 Apr 2014 08:05:58 -0700 (PDT)
In-Reply-To: <CAP9ODKr=UuQ3K5kZhEg8oj2RvO-+txN39Yzx_Cj6BkGnj1RGmA@mail.gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
	<1394664760-8615-2-git-send-email-net147@gmail.com>
	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
	<53389231.2020209@gmail.com>
	<CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>
	<5351EAC7.9040503@gmail.com>
	<CAP9ODKrKNoMkMWZDA+XYzvLnyxQykRZ1HJ+ShXAhvhtWG0zB5A@mail.gmail.com>
	<5351F3FB.5090205@gmail.com>
	<CAP9ODKr=UuQ3K5kZhEg8oj2RvO-+txN39Yzx_Cj6BkGnj1RGmA@mail.gmail.com>
Date: Sat, 19 Apr 2014 12:05:58 -0300
X-Google-Sender-Auth: PeZbNH7SaECB_Uv3Hv4tMaMsgCg
Message-ID: <CAP9ODKobT4Z-bS6cD30AqKknzLvWkudxgoYAznRnVai7aN9W=A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jonathan Liu <net147@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sat, 19 Apr 2014 15:06:01 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 19, 2014 at 1:03 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Apr 19, 2014 at 12:56 AM, Jonathan Liu <net147@gmail.com> wrote:
>> On 19/04/2014 1:29 PM, Otavio Salvador wrote:
>>>
>>> On Sat, Apr 19, 2014 at 12:17 AM, Jonathan Liu <net147@gmail.com> wrote:
>>>>
>>>> On 19/04/2014 12:27 PM, Otavio Salvador wrote:
>>>>>
>>>>> Hello Jonathan,
>>>>>
>>>>> On Sun, Mar 30, 2014 at 6:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>>
>>>>>> On 13/03/2014 1:01 PM, Otavio Salvador wrote:
>>>>>>>
>>>>>>> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> This adds the necessary target packages for development with all of
>>>>>>>> the
>>>>>>>> Qt 5 modules.
>>>>>>>>
>>>>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>>>>
>>>>>>> | Computing transaction...error: Can't install
>>>>>>> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
>>>>>>> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
>>>>>>> |
>>>>>>> | Saving cache...
>>>>>>> |
>>>>>>> | WARNING:
>>>>>>>
>>>>>>>
>>>>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
>>>>>>> exit 1 from
>>>>>>> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
>>>>>>> ${pkgs_to_install}
>>>>>>> | DEBUG: Python function do_populate_sdk finished
>>>>>>> | ERROR: Function failed: populate_sdk_image (log file is located at
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>>>>>>>
>>>>>>> Please fix this and test the combinations of enable/disable features.
>>>>>>> They seem not well tested.
>>>>>>>
>>>>>> It looks like qtwayland is not being built properly in your
>>>>>> configration.
>>>>>>
>>>>>> Can you provide configuration and steps to reproduce this failure?
>>>>>> I have not had any luck in reproducing it.
>>>>>
>>>>> The wayland packages cannot be installed if wayland distro feature is
>>>>> not available.
>>>>>
>>>> By default, DISTRO_FEATURES does not contain wayland so I wonder if it
>>>> makes
>>>> sense for to add wayland to DISTRO_FEATURES if it is not available.
>>>> Is there a better method than checking if DISTRO_FEATURES has wayland for
>>>> qtwayland?
>>>
>>> You can check for x11 or wayland in this case. But I think qtwayland
>>> is useless without wayland in distro features, isn't it?
>>>
>> I already do check for wayland in DISTRO_FEATURES before including qtwayland
>> packages:
>>
>> ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)}
>>
>> Is this not enough?
>>
>> I could perhaps change USE_RUBY, USE_WAYLAND, and USE_X11 to assign with ?=
>> instead of = so that the packages depending on those can be excluded from
>> the SDK if desired by setting them to "" in local.conf.
>
> It is. I am rebuilding here and will debug it ...

Alright. It was my fault here.

I merged it :-) Sorry for taking so long in checking it. I was out and
couldn't get it done before.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

