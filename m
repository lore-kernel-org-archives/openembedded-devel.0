Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5756E65D08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 03:29:01 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so1983222yha.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LP+CpjR/mmRXAJp0W4RpQvn9m0u/GjypwupErojtrS8=;
	b=GXyKb+MDxyr5N7CsFXSa9rdCQhyQLCkd5IK6yBzG9o8ePjcWwztWvEWVyc5HxMPlDq
	O5kJxmtjF+QpOySCflyGrFxt/2jEap26Dm73HK9aF9R3acjF4BNBK7M11z/xng9yRSwi
	pokdqg27wnEwtADR4hQaiuRKdwuaAJHWTLR4lF9+UWhF/RbGIoVkmBebroHb6Zshgccp
	AIFoZuiGOGng7PUu8xowenWCvEyxvn7rUiAwkhUL88C5g8hnZYehzcVRH53Yutb0fhfg
	12lcWZJmDt5mESIXl/r8tUdrxFxQVBirVvRfiVW4slzE2YhutcvGMVFUXtaFsSNsn4Cg
	rCvA==
MIME-Version: 1.0
X-Received: by 10.236.86.226 with SMTP id w62mr115608yhe.94.1397878142621;
	Fri, 18 Apr 2014 20:29:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 18 Apr 2014 20:29:02 -0700 (PDT)
In-Reply-To: <5351EAC7.9040503@gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
	<1394664760-8615-2-git-send-email-net147@gmail.com>
	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
	<53389231.2020209@gmail.com>
	<CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>
	<5351EAC7.9040503@gmail.com>
Date: Sat, 19 Apr 2014 00:29:02 -0300
X-Google-Sender-Auth: zxDHgLWqH04WE3d1Q6B859EmBE4
Message-ID: <CAP9ODKrKNoMkMWZDA+XYzvLnyxQykRZ1HJ+ShXAhvhtWG0zB5A@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Apr 2014 03:29:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 19, 2014 at 12:17 AM, Jonathan Liu <net147@gmail.com> wrote:
> On 19/04/2014 12:27 PM, Otavio Salvador wrote:
>>
>> Hello Jonathan,
>>
>> On Sun, Mar 30, 2014 at 6:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>
>>> On 13/03/2014 1:01 PM, Otavio Salvador wrote:
>>>>
>>>> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>
>>>>> This adds the necessary target packages for development with all of the
>>>>> Qt 5 modules.
>>>>>
>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>
>>>> | Computing transaction...error: Can't install
>>>> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
>>>> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
>>>> |
>>>> | Saving cache...
>>>> |
>>>> | WARNING:
>>>>
>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
>>>> exit 1 from
>>>> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
>>>> ${pkgs_to_install}
>>>> | DEBUG: Python function do_populate_sdk finished
>>>> | ERROR: Function failed: populate_sdk_image (log file is located at
>>>>
>>>>
>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>>>>
>>>> Please fix this and test the combinations of enable/disable features.
>>>> They seem not well tested.
>>>>
>>> It looks like qtwayland is not being built properly in your configration.
>>>
>>> Can you provide configuration and steps to reproduce this failure?
>>> I have not had any luck in reproducing it.
>>
>> The wayland packages cannot be installed if wayland distro feature is
>> not available.
>>
> By default, DISTRO_FEATURES does not contain wayland so I wonder if it makes
> sense for to add wayland to DISTRO_FEATURES if it is not available.
> Is there a better method than checking if DISTRO_FEATURES has wayland for
> qtwayland?

You can check for x11 or wayland in this case. But I think qtwayland
is useless without wayland in distro features, isn't it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

