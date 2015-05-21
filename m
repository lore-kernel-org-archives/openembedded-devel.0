Return-Path: <k4230r6@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF8F26E5D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 20:55:33 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so97574272wgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=jfgRUOS4GgqkwurnvAnY62jgfBAMu25jP69GXM20eL8=;
	b=w4/GkB8K7E12n5n5vVI1JBNv8kNFRKEedRRO0G4RJ3VfztD+jB7t+iqtk5n5daHjaO
	vg+pJjch4B7pmWmzIqBqA6aXer5oDXMN45q/ONBVG6gd+NHw+Ki3cxkg75llOSRRiUne
	oyirl4Nw2EyyUN8bYlsQGtbsVsckT8grEn9mADmJGrxWRvBpadLsHbiNMooZTGM1pcUu
	lDZ7Ny8lt6Dldt1UWn6FXZ4OsTNCpFG6R0y7HJQqPLANTqCmA65Ovl6f7x01BhGK5tQq
	LR+V7hhgrBtF/w8MJTXPidEy2NXnTn8fJwwK7nD89vuRPY2pikkCzfSSxJmfyy5TobNB
	wLfg==
X-Received: by 10.194.95.41 with SMTP id dh9mr8714643wjb.55.1432241735068;
	Thu, 21 May 2015 13:55:35 -0700 (PDT)
Received: from [192.168.23.113]
	(HSI-KBW-46-223-216-155.hsi.kabel-badenwuerttemberg.de.
	[46.223.216.155])
	by mx.google.com with ESMTPSA id a19sm4601847wiv.2.2015.05.21.13.55.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 13:55:34 -0700 (PDT)
Message-ID: <555E4645.7050409@gmail.com>
Date: Thu, 21 May 2015 22:55:33 +0200
From: Christian Ege <k4230r6@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5548E485.6080505@gmail.com> <555E2359.3080509@gmail.com>
In-Reply-To: <555E2359.3080509@gmail.com>
Subject: Re: ODROID-C1 support
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
X-List-Received-Date: Thu, 21 May 2015 20:55:36 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi Trevor,
> Hi Christian,
> 
> On 05/05/15 11:40, Christian Ege wrote:
>> I've created a BSP Layer for the ODROID-C1 and other Amlogic based
>> devices like the Wetek.Play
>>
>> https://github.com/linux-meson/meta-amlogic
> 
> Thanks! I've been playing with your layer. For the most part it's going
> well. I've noticed a small glitch, however, and I'm not 100% sure how to
> fix it (otherwise I would have just sent you a github pull request).
Maybe the easiest Part would be not to bbappend initscripts and just add
an own reecipe for amlsetfb. Within this recipe I can use
COMPATIBLE_MACHINE.

I guess if I am using  COMPATIBLE_MACHINE in the
initscripts_1.%.bbappend will cause to not build initscripts for any
other machine. :)

> If I have your layer added to the BBLAYERS mix but I'm _not_ building
> for "odroidc1" (or "wetekplay", I assume) then I get an error because
> the build system can't find the amlsetfb.sh file. You have two
> "amlsetfb.sh" files, one for the odroidc1 and one for the wetekplay
> which you've added to recipes-core/initscripts/odroidc1 and
> recipes-core/initscripts/wetekplay. If the MACHINE is odroidc1 then the
> recipes-core/initscripts/odroidc1/amsetfb.sh file is found, otherwise it
> is not.
> 
> I can work around this issue by adding a MACHINE-specific override to
> your initscripts_1.%.bbappend:
> 
> -SRC_URI_append = " file://amlsetfb.sh \
> +SRC_URI_append_odroidc1 = " file://amlsetfb.sh \
> 
> but I'm guessing another override would be required for the wetekplay as
> well.
> 
> Why would someone include your layer and not build for odroidc1 or
> wetekplay? Sometimes that's what people do ;-) (look at Angstrom, for
> example). Besides, a BSP layer should be able to play nicely with other
> layers even when its machines aren't being used :-)

Yes I know people do strange things :)


Regards,
Christian

