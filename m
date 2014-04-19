Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7992B65D08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 03:17:53 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so1990281pab.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+2pVwKPhSmUejPTnIajfrx34KcyTbNsw8u5Yj+h91ZQ=;
	b=do4j+/X24tPG9NfxjQRz37cjpLooJ5rlVKJWJ1Wb21H9Jdgi6vMiulUXXPgM7zyPdw
	BaKu+HFpTh9e/cWLq7kJeEXL5HdHYyWC0i9jAR+/9Ob/bfJPcxmAq160IDW8UqXQ9aoo
	WoqofO+7YQiYvektPGg0z0UWCS8GbeExe8HvjSvw0Dwdk+JPCAqe8uP6IytdrpjRGRuj
	+V7OwIaUY5UWqtFWgoDifnyExL6g2mNmgPvqVVUOO0HHZBknjHbMSlffyU4LcNuqHpje
	j0Iti6Vg/FQYIY9lN6se8bAWAE7ugi9BpZrk9Vol3NHy0JjjqLt+/GTF4SVYHzvAWvPt
	KD/g==
X-Received: by 10.68.226.35 with SMTP id rp3mr25596698pbc.73.1397877474559;
	Fri, 18 Apr 2014 20:17:54 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm39869678pbo.51.2014.04.18.20.17.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 20:17:53 -0700 (PDT)
Message-ID: <5351EAC7.9040503@gmail.com>
Date: Sat, 19 Apr 2014 13:17:27 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>	<1394664760-8615-2-git-send-email-net147@gmail.com>	<CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>	<53389231.2020209@gmail.com>
	<CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>
In-Reply-To: <CAP9ODKqnv0urkjLSwC9k-WhWwwnX0zqCg=nOUhMEqtMPMaEceA@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Apr 2014 03:17:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2014 12:27 PM, Otavio Salvador wrote:
> Hello Jonathan,
>
> On Sun, Mar 30, 2014 at 6:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>> On 13/03/2014 1:01 PM, Otavio Salvador wrote:
>>> On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>> This adds the necessary target packages for development with all of the
>>>> Qt 5 modules.
>>>>
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> | Computing transaction...error: Can't install
>>> qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
>>> package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
>>> |
>>> | Saving cache...
>>> |
>>> | WARNING:
>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
>>> exit 1 from
>>> |   smart --data-dir=${target_rootfs}/var/lib/smart install -y
>>> ${pkgs_to_install}
>>> | DEBUG: Python function do_populate_sdk finished
>>> | ERROR: Function failed: populate_sdk_image (log file is located at
>>>
>>> /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo
>>>
>>> Please fix this and test the combinations of enable/disable features.
>>> They seem not well tested.
>>>
>> It looks like qtwayland is not being built properly in your configration.
>>
>> Can you provide configuration and steps to reproduce this failure?
>> I have not had any luck in reproducing it.
> The wayland packages cannot be installed if wayland distro feature is
> not available.
>
By default, DISTRO_FEATURES does not contain wayland so I wonder if it 
makes sense for to add wayland to DISTRO_FEATURES if it is not available.
Is there a better method than checking if DISTRO_FEATURES has wayland 
for qtwayland?

Regards,
Jonathan

