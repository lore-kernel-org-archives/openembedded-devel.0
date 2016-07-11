Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF0736FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 23:48:58 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q62so3867826qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 16:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yEdmj+9j3gX8gdcI/YSl5CbrJ4nz73uRkmR1AjaO6V0=;
	b=pLxhV0z+bIjj/9PBpLNUOKEDr93giNGBYPG1F3wGwtTowUpdgYPs199ohAfrFM2EK4
	ECHw4KT6THWzg2ElZk34z49fm71v4zwBbSMoxCcyN/jh9YtPlzQrwRPnwfTiQG1UwD8s
	lNYvS50+1T4gTQMXa3q4Qg4JYcSCQA1MuIcYSCFUAdD4FsvOBHA7ZJk9+LnHIeAj+fgv
	HrF2QTA3DbMhr9VskIS8aYOwD9+7BPQRNwytwr8tYA7TT4l46PP3mVo9G6Usva+bmVKw
	0ll8OPA19QJoJOGZelnBo87LKQRAIo0GT/l2qgf9FWKs4jboYjKuqQP61xoPVpeUkIX2
	50RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yEdmj+9j3gX8gdcI/YSl5CbrJ4nz73uRkmR1AjaO6V0=;
	b=feKwDYwMLVQlBJ3CDcWoI64k3UHZrt5Ol6XjiiZPDXp8FlDZiVPKFRSzN0oeMwk5oD
	xFl6URoRr1QO/rTV6ft0ZfyponysWcJnn3vR8STbZdf0yRQirnCoLQoSbb116/4QF3Z9
	q/1v2agXnfG40zXZSwt6dQCjJgPiCnXiRjHfPyyym/pm4p47ubgsaHHEzoQ6iUBOtvgR
	YNwH0WyNrNZc5FaQOI//PJhCEl0jLm2EGud6u8YKWmPQV4d1uK1q2kWqD/l+kWi7aE36
	rv1HD4Z+yf1rXneSJ+31oPUJHXCreKomLLDa+hrAwlWHD3YtEvI7o7ZZ19F9JQvHevsT
	+hmw==
X-Gm-Message-State: ALyK8tLG+EAUpCnsGgCa1MePxCMJa0FJq/On/N6XdDivh7QdeW+nv4iyTSQgSXqUUuVfJq320cXqGep+MlxZpQ==
X-Received: by 10.55.97.80 with SMTP id v77mr29904614qkb.41.1468280939163;
	Mon, 11 Jul 2016 16:48:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 16:48:29 -0700 (PDT)
In-Reply-To: <9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
	<9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 16:48:29 -0700
Message-ID: <CAMKF1srD_3zFdtdF_rGGpJhTvO8JFgeUOG8NCYhG08OjWVOwjQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 11 Jul 2016 23:49:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 3:32 PM, Jacopo Malvestio
<jacopo.malvestio@gmail.com> wrote:
> Hello All,
>
> I've created a .bbappend file with:
>
> CFLAGS_remove = "-fno-lifetime-dse"
> CXXFLAGS_remove = "-fno-lifetime-dse"
>
> but the do_configure step fail, bitbake -v openjdk-8 log:
>
> | configure: Current directory is /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build.
> | configure: Since this is not the source root, configure will output the configuration here
> | configure: (as opposed to creating a configuration in <src_root>/build/<conf-name>).
> | configure: However, this directory is not empty. This is not allowed, since it could
> | configure: seriously mess up just about everything.
> | configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
> | configure: (or create a new empty directory and cd to it).
> | configure: error: Will not continue creating configuration in /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build
> | NOTE: The following config.log files may provide further information.
> | NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build/config.log
> | ERROR: configure failed
> | ERROR: Function failed: do_configure (log file is located at /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.2980
>
> I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't think it's a side effect of the gcc6 patch,  but in your opinion, i forgot something?
>

this is building openjdk-8-native package. So you need to add a
bbappend for openjdk-8-native_72b05.bb as well

> thank you
>
> --
> Jacopo
>
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

