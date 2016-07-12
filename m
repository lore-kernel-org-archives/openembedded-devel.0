Return-Path: <jacopo.malvestio@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EB681731AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 05:09:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so864315wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 22:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:from:message-id:date:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=2ZWG2+JbZhgEiH1MfXr33C3ZUqU4Oe0S5A/ofBjSS6s=;
	b=uAsQ/tsC7nUyfM0GcVC4oFENdCWMQ2SaAD5CvRotSMByhkU5ZKlcZX7xKvUCmGLZsc
	tJzpsByKMNEd5eZhlCXVbC0x6wJ+8vU06TIu0BijTS8HxFhNvT7o6MAOUgk3aG96bCoQ
	+C13trF1DdC6VOJlKGIkvjXszmErFgExsvsMYJ0V7YHKnY0TNXi10Prinzl6RweKcqIM
	Ea8k0/iMTc8TByqVdluMimfWOgWVsX3yGG4vonWkAraDfVW4HSMj+z/5FTstIkR9GdrI
	6L/6Hqzaw7ZtShmWYWY/HWXKp0UxN+4cclHOCb0FidHyRW+yS8fJYkmbUdD5phvf62xM
	k+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:from:message-id
	:date:mime-version:in-reply-to:content-transfer-encoding;
	bh=2ZWG2+JbZhgEiH1MfXr33C3ZUqU4Oe0S5A/ofBjSS6s=;
	b=XZGiA62u0gNn23Jf2Pl/elhC/mAGgBE4DG8E4jIGwEwzRubTNZSfKALuD8kuhgrpoX
	vB9pE9XU+yePcATwMknm5J6VOdbSJHlhDSMf6kP51C5irWgzI6FjyPMMG9bHElf2A4/m
	OPnOYd6KSdpgMfBzofzq76Tt/p8E0YpDZn7xty7EYBuCJzlsw1nYPyFKGp+bJegnesQD
	prfgVWgVZn4hTkgS6TNbNbKSX972dm/877v7NX9bvqPK99ze1BTWo5wx9uyD/+Y7pQ0A
	4A7pWIE7Bzn3mCMFyIyWUoGiE2m400P/5KOe8i8fOZJZfO2wPPfQTFSYQiGg4QBINgPX
	oQSQ==
X-Gm-Message-State: ALyK8tLP1B5ifSz5WLfCx6EEsXndmCVeaXoTYxinvLWvwJkAWJRGyZXu4cjBVd2EukS9JA==
X-Received: by 10.28.7.20 with SMTP id 20mr738217wmh.52.1468300175899;
	Mon, 11 Jul 2016 22:09:35 -0700 (PDT)
Received: from [172.20.10.2] ([5.90.34.26]) by smtp.gmail.com with ESMTPSA id
	a198sm26382369wme.16.2016.07.11.22.09.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 22:09:35 -0700 (PDT)
Reply-To: jacopo.malvestio@gmail.com
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
	<9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
	<CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
From: Jacopo Malvestio <jacopo.malvestio@gmail.com>
Message-ID: <36c35de6-8808-cc4a-5868-f9616fb0ec95@gmail.com>
Date: Tue, 12 Jul 2016 07:09:32 +0200
MIME-Version: 1.0
In-Reply-To: <CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
Subject: Re: [meta-java] gcc 4.8 and openjdk-8
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
X-List-Received-Date: Tue, 12 Jul 2016 05:09:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2016 01:48, Khem Raj wrote:
> On Mon, Jul 11, 2016 at 3:32 PM, Jacopo Malvestio
> <jacopo.malvestio@gmail.com> wrote:
>> Hello All,
>>
>> I've created a .bbappend file with:
>>
>> CFLAGS_remove = "-fno-lifetime-dse"
>> CXXFLAGS_remove = "-fno-lifetime-dse"
>>
>> but the do_configure step fail, bitbake -v openjdk-8 log:
>>
>> | configure: Current directory is /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build.
>> | configure: Since this is not the source root, configure will output the configuration here
>> | configure: (as opposed to creating a configuration in <src_root>/build/<conf-name>).
>> | configure: However, this directory is not empty. This is not allowed, since it could
>> | configure: seriously mess up just about everything.
>> | configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
>> | configure: (or create a new empty directory and cd to it).
>> | configure: error: Will not continue creating configuration in /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build
>> | NOTE: The following config.log files may provide further information.
>> | NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build/config.log
>> | ERROR: configure failed
>> | ERROR: Function failed: do_configure (log file is located at /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.2980
>>
>> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't think it's a side effect of the gcc6 patch,  but in your opinion, i forgot something?
>>
> 
> this is building openjdk-8-native package. So you need to add a
> bbappend for openjdk-8-native_72b05.bb as well

already done:

➜  openjdk git:(develop) cat openjdk-8-native_72b05.bbappend
CFLAGS_remove = "-fno-lifetime-dse"
CXXFLAGS_remove = "-fno-lifetime-dse"

openjdk-8 is not a recipe, correct? any suggestion?

thank you. jacob

