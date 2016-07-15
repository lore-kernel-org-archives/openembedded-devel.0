Return-Path: <jacopo.malvestio@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFFF606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 09:48:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so1631519wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:from:message-id:date:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=o1nm/PF171JGloilUKoV2CkaBYhwq4X85g5vJFpECVo=;
	b=VIfXNrPmbm0rW++5PJumFJk1lgdjA2OKIEfdrYroCkZZFPy5qvitlzE+/ImCD+B716
	CjySJBBJXTzp8SRjKEc7p3+jS9RKVG0aJmL+ueiZFbHzDRtYyM/IqBhl4H8DiMJs4PyG
	sN4Mv1InZI8k3IV7T2IyklnsnBBll687lxZqqfu/gs/GpwlWbSWZz7eD66CHIQYGk7Vg
	fVpSmyhlmXutrnqVtndwOh+wCCDSSinZ8rXGcuz0zB0poUiNX9Lx/eR+hDhkrQGWX4HV
	rcyp2H3DaMAMCnfzQYqYNOnQ0IeNi9lYfUV1tjk/9Ap4h8PwlkSEz5soHsLNYk2HS+Yr
	wuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:from:message-id
	:date:mime-version:in-reply-to:content-transfer-encoding;
	bh=o1nm/PF171JGloilUKoV2CkaBYhwq4X85g5vJFpECVo=;
	b=WVJGcTYkoIfmzGhy2GBPPUVQnosmRbkjErdV6zpyep6w3dmlbo8+BNHvr0kmhUEbm2
	cbBUV7nKcEZInWiq3R+jp0tUo8B6CzOxWgLTOZpv/J/IuIqqPVFyYIES0xI3rrxN4GgU
	eJvtkPKY7tv1p63OsiDp0xNgQdvn3osDbF1amO4JIiSLrVGfBvVPMpPcxi1rtGyakoqi
	rQYzebG3rNb9cbzK+KY/Q609rjYYqTHIe+eS/2hEvy+uTPjoc4MJEh9Y6pKvruzISnxU
	DgXCa4orLHK3vmOMSmWhhx1Rko4pX8neB3l8kpfyOwu+BhIDLi1Kr/l8Ic3cBlBJf+No
	VXWw==
X-Gm-Message-State: ALyK8tKJgKQqRUXKyX4C6KegiNWu8Pq1bzobqw8K4zEUy4mFF06Z3KcZBaVfSOP5lX/o+g==
X-Received: by 10.28.184.67 with SMTP id i64mr10162625wmf.31.1468576081758;
	Fri, 15 Jul 2016 02:48:01 -0700 (PDT)
Received: from [192.168.0.82] ([185.4.152.2])
	by smtp.gmail.com with ESMTPSA id 207sm868239wmb.7.2016.07.15.02.48.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 02:48:01 -0700 (PDT)
Reply-To: jacopo.malvestio@gmail.com
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
	<9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
	<CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
	<36c35de6-8808-cc4a-5868-f9616fb0ec95@gmail.com>
	<CAMKF1sopO0twm2zWKttP8G2UamUr5H_6wQq-ZqMDsqBenZ1WpQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
From: Jacopo Malvestio <jacopo.malvestio@gmail.com>
Message-ID: <b70dfd66-f630-b95e-59fa-8dc94c50d0aa@gmail.com>
Date: Fri, 15 Jul 2016 11:47:58 +0200
MIME-Version: 1.0
In-Reply-To: <CAMKF1sopO0twm2zWKttP8G2UamUr5H_6wQq-ZqMDsqBenZ1WpQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 Jul 2016 09:48:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 13/07/2016 01:23, Khem Raj wrote:
> On Mon, Jul 11, 2016 at 10:09 PM, Jacopo Malvestio
> <jacopo.malvestio@gmail.com> wrote:
>> On 12/07/2016 01:48, Khem Raj wrote:
>>> On Mon, Jul 11, 2016 at 3:32 PM, Jacopo Malvestio
>>> <jacopo.malvestio@gmail.com> wrote:
>>>> Hello All,
>>>>
>>>> I've created a .bbappend file with:
>>>>
>>>> CFLAGS_remove = "-fno-lifetime-dse"
>>>> CXXFLAGS_remove = "-fno-lifetime-dse"
>>>>
>>>> but the do_configure step fail, bitbake -v openjdk-8 log:
>>>>
>>>> | configure: Current directory is /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build.
>>>> | configure: Since this is not the source root, configure will output the configuration here
>>>> | configure: (as opposed to creating a configuration in <src_root>/build/<conf-name>).
>>>> | configure: However, this directory is not empty. This is not allowed, since it could
>>>> | configure: seriously mess up just about everything.
>>>> | configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
>>>> | configure: (or create a new empty directory and cd to it).
>>>> | configure: error: Will not continue creating configuration in /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build
>>>> | NOTE: The following config.log files may provide further information.
>>>> | NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build/config.log
>>>> | ERROR: configure failed
>>>> | ERROR: Function failed: do_configure (log file is located at /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.2980
>>>>
>>>> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't think it's a side effect of the gcc6 patch,  but in your opinion, i forgot something?
>>>>
>>>
>>> this is building openjdk-8-native package. So you need to add a
>>> bbappend for openjdk-8-native_72b05.bb as well
>>
>> already done:
>>
>> ➜  openjdk git:(develop) cat openjdk-8-native_72b05.bbappend
>> CFLAGS_remove = "-fno-lifetime-dse"
>> CXXFLAGS_remove = "-fno-lifetime-dse"
>>
>> openjdk-8 is not a recipe, correct? any suggestion?
> 
> Hmm can you revert.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=33ddb28a6428b02ddcc82d1954ecf27cd426fbb5

reverted and works...

thank you

>>
>> thank you. jacob
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

