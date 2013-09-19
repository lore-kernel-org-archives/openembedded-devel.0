Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id E4EC060130
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 07:53:28 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id w6so7414748lbh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 00:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=n7KFbtHN8miaheALSwUVIk9Y4VMOFaaVgwjav3vK4YU=;
	b=DlG7KlOKQWZ3WB0FYKZS3AxksGjYrVn6NFODUtFyEnF3DqMfjpbRjTqHcdl9c0Gx6n
	mlFR0AcMYJzouVbFjGMj5E3g1qZun8UCIYYgBy8GY92X6cvTq29qEDrVDzAd9V4Ck+3o
	j0tDAcSPx/Fmqnf3cT1avYGYvdh/iQlOrMU3nu3DjO+sN6rxI1NwZ7u/MB5yyqYYVFZO
	t+qsuq85UjTDwQ3TAM9YuKXhOpNVlyHuG3SzwMjZ461tEevRvNvFiQCCcCxZeaByByJg
	BgD1XBE7jcfa5BVAnWwcQ61oKwQpQ1XW6CsfVBVHv9RMRE2ezKxE9T1TCLsvS+fHzvFK
	knAw==
X-Gm-Message-State: ALoCoQm9TOYW3Jeyu1hNdPUYlnYNZ70hv2LUnoT7LKrZA+8HkOm8iUVwE7nn8Vt5EDCAsZHMqM/k
MIME-Version: 1.0
X-Received: by 10.112.156.74 with SMTP id wc10mr210716lbb.44.1379577209504;
	Thu, 19 Sep 2013 00:53:29 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Thu, 19 Sep 2013 00:53:29 -0700 (PDT)
In-Reply-To: <5239EB61.1090805@mlbassoc.com>
References: <CAKS01ok2XmnwqMz2i0radhW3UB87AXmMa3zW2nxZpGmmBeE60g@mail.gmail.com>
	<5239EB61.1090805@mlbassoc.com>
Date: Thu, 19 Sep 2013 09:53:29 +0200
Message-ID: <CAKS01o=hhbKaWsFEvv2jdeTAWYeZZjpufVqsuEdZ6+seNJgvYQ@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: help with building image.
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
X-List-Received-Date: Thu, 19 Sep 2013 07:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Gary

Sorry for being so vague about my problem.
Here are some details from my build.

Build Configuration:
BB_VERSION        = "1.19.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "zc702-zynq7"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = " armv7a vfp neon zynq"
TARGET_FPU        = "vfp-neon"
meta              = "master:b26157a8b575aa7b5c96ffe782fc23ec0920311c"
meta-linaro
meta-linaro-toolchain = "master:31b095141ef2a2d691bf3d6914fda48375c24400"
meta-xilinx       = "master:f10288fe45eb30893bea37d10d533079d4c8b7f9"
meta-neo          = "<unknown>:<unknown>"
meta-hob          = "master:b26157a8b575aa7b5c96ffe782fc23ec0920311c"


I am trying to build a core-minimal-image with linaro toolchain 4.7 for the
Zynq board.

Let me know if i can provide any more details, so that u all can guide me
on resolving this issue.


On 18 September 2013 20:05, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2013-09-18 08:12, Anup Kini wrote:
>
>> Hi All,
>>
>> When i try to run build images in HOB, i end up with the following error.
>>
>> dpkg-scanpackages: info: Wrote 4631 entries to output Packages file.
>> dpkg-scanpackages: info: Wrote 38 entries to output Packages file.
>> dpkg-scanpackages: info: Wrote 14 entries to output Packages file.
>> Reading package lists...
>> W: Unable to read
>> /home/akini/oe/openembedded-**core/build/tmp-eglibc-eglibc/**
>> sysroots/x86_64-linux/etc/apt/**sources.list.d/
>> - DirectoryExists (2: No such file or directory)
>> W: Unable to read
>> /home/akini/oe/openembedded-**core/build/tmp-eglibc-eglibc/**
>> sysroots/x86_64-linux/etc/apt/**sources.list
>> - RealFileExists (2: No such file or directory)
>> Reading package lists...
>> Building dependency tree...
>> W: Unable to read
>> /home/akini/oe/openembedded-**core/build/tmp-eglibc-eglibc/**
>> sysroots/x86_64-linux/etc/apt/**sources.list.d/
>> - DirectoryExists (2: No such file or directory)
>> W: Unable to read
>> /home/akini/oe/openembedded-**core/build/tmp-eglibc-eglibc/**
>> sysroots/x86_64-linux/etc/apt/**sources.list
>> - RealFileExists (2: No such file or directory)
>> W: You may want to run apt-get update to correct these problems
>> E: Unable to locate package libgcc1
>> E: Unable to locate package busybox
>> E: Unable to locate package libglapi-dev
>> ...
>>
>>
>> What am i missing here ?
>>
>>
> Actually, it's what we are missing (from you) in order to be able to help!
>
> Please provide some more details - what are your values for:
>   OE-core version?
>   Host machine?
>   Build target (machine)?
>
> Exactly what steps did you perform to try this?
> What might one need to do to recreate your problem?
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/**mailman/listinfo/openembedded-**devel<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>



-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

