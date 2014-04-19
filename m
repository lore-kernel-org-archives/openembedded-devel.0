Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB04A60C14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 03:57:09 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id x10so1991957pdj.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=jyi6Exha2iHSBLxJNOpvXPXbN7oD89SvdVtHfGx1uYM=;
	b=jNiELCMZ7ghGDJDPxNYP/cwYqKI3HPprquu7EY2qpbAIkaIgofH0ftAIOV3u19vRP3
	W5D7gopShePM7jsNryL02nnfIt2WDcbt4xAgIITOM/hdFWoPWxHUyNu1C/D+hG74oF2x
	aQ9Nz0q8HmsJ6Y8OYQOenq159NqY61JkZluDMDkseMmd5K5cC3YKsZ2iGtBetrAHo/d9
	b2CE+4DOiX/twxsYZ3s8zS5fyjZJnplt3/4krSK/45nzlNNrYdqf7Axm+/MJs6dG8NmQ
	3D+O3kZQBxFIz6rBtwbo2J1rdFPg6cc/3ZCIvmWJjCXcWUaf+rC6H7KXWEO1kuTb9RPy
	v5JA==
X-Received: by 10.67.3.132 with SMTP id bw4mr19458282pad.54.1397879830180;
	Fri, 18 Apr 2014 20:57:10 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id yx3sm63133310pbb.6.2014.04.18.20.57.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 20:57:09 -0700 (PDT)
Message-ID: <5351F3FB.5090205@gmail.com>
Date: Sat, 19 Apr 2014 13:56:43 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>	<1394664760-8615-2-git-send-email-net147@gmail.com>	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>	<53389231.2020209@gmail.com>	<CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>	<5351EAC7.9040503@gmail.com>
	<CAP9ODKrKNoMkMWZDA+XYzvLnyxQykRZ1HJ+ShXAhvhtWG0zB5A@mail.gmail.com>
In-Reply-To: <CAP9ODKrKNoMkMWZDA+XYzvLnyxQykRZ1HJ+ShXAhvhtWG0zB5A@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Apr 2014 03:57:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2014 1:29 PM, Otavio Salvador wrote:
> On Sat, Apr 19, 2014 at 12:17 AM, Jonathan Liu <net147@gmail.com> wrote:
>> On 19/04/2014 12:27 PM, Otavio Salvador wrote:
>>> Hello Jonathan,
>>>
>>> On Sun, Mar 30, 2014 at 6:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>> On 13/03/2014 1:01 PM, Otavio Salvador wrote:
>>>>> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>>>> This adds the necessary target packages for development with all of the
>>>>>> Qt 5 modules.
>>>>>>
>>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>> | Computing transaction...error: Can't install
>>>>> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
>>>>> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
>>>>> |
>>>>> | Saving cache...
>>>>> |
>>>>> | WARNING:
>>>>>
>>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
>>>>> exit 1 from
>>>>> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
>>>>> ${pkgs_to_install}
>>>>> | DEBUG: Python function do_populate_sdk finished
>>>>> | ERROR: Function failed: populate_sdk_image (log file is located at
>>>>>
>>>>>
>>>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>>>>>
>>>>> Please fix this and test the combinations of enable/disable features.
>>>>> They seem not well tested.
>>>>>
>>>> It looks like qtwayland is not being built properly in your configration.
>>>>
>>>> Can you provide configuration and steps to reproduce this failure?
>>>> I have not had any luck in reproducing it.
>>> The wayland packages cannot be installed if wayland distro feature is
>>> not available.
>>>
>> By default, DISTRO_FEATURES does not contain wayland so I wonder if it makes
>> sense for to add wayland to DISTRO_FEATURES if it is not available.
>> Is there a better method than checking if DISTRO_FEATURES has wayland for
>> qtwayland?
> You can check for x11 or wayland in this case. But I think qtwayland
> is useless without wayland in distro features, isn't it?
>
I already do check for wayland in DISTRO_FEATURES before including 
qtwayland packages:
${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)}

Is this not enough?

I could perhaps change USE_RUBY, USE_WAYLAND, and USE_X11 to assign with 
?= instead of = so that the packages depending on those can be excluded 
from the SDK if desired by setting them to "" in local.conf.

Regards,
Jonathan

