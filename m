Return-Path: <eduardo@monkey.io>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 97EDE724FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 13:38:49 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so219539888igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 06:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1ftT6OKr7YSCevf8cNm4Z1STSEV8J4k9rojBGamzFk0=;
	b=bMHffrD5o6rj4Kl0KFLNfAc/UAfk5BTVW/JPjzjQUmRjyXGGmkwk5Cz8pyASJ+FXBz
	w1RbgFXRq5XRxKYq2k5rWRHkhiBJ5EqUtWF9b9MK6HhM7Wtm8Yrw9h9iLAbKlk9i+y4I
	Ndo9nJ3BuuTmz+kOtDyH2el/nhoZK+aHdRYHarqjxNDAMfHQ8Wtnt5xdfOUXkjsvoCIY
	6ab+db2fu06z1F+LmygDPbeMjCuPcpP1KrZh5/LRRz4D3o1OW+eJbczM6Mff1Ulk751y
	FOcTjx62+V2CChcihq1OG4IsVj90ou57cnO6OOVXjniA3zFVYAFXDdULWRwA81t0kCcv
	QjDQ==
X-Gm-Message-State: ALoCoQm3rPb9SxrQ41MVaStRP0up5/LOyKXO7wB951hAy7pKkxF+zasUcT7GKRUojqoOveK3QSdJ
MIME-Version: 1.0
X-Received: by 10.42.109.206 with SMTP id m14mr20710191icp.97.1431697130362;
	Fri, 15 May 2015 06:38:50 -0700 (PDT)
Received: by 10.107.36.204 with HTTP; Fri, 15 May 2015 06:38:50 -0700 (PDT)
In-Reply-To: <55550B48.6050505@gmail.com>
References: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>
	<55550B48.6050505@gmail.com>
Date: Fri, 15 May 2015 07:38:50 -0600
Message-ID: <CAEaCVQi3f723PmbkobAdwJRRQiAthMDTiS=LpThoAFxy0qhiLw@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby] problems building Gem that contains C code
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
X-List-Received-Date: Fri, 15 May 2015 13:38:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

thanks for the update. If I try that patch I get the following error when
building Ruby:

ERROR: Function failed: do_install (log file is located at
/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
ERROR: Logfile of failure stored in:
/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 4 LIBRUBYARG=-lruby-static
DESTDIR=/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/image
install
| make: *** No rule to make target 'install'.  Stop.
| ERROR: oe_runmake failed
| WARNING:
/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/run.do_install.10344:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_install (log file is located at
/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
ERROR: Task 111
(virtual:native:/home/edsiper/coding/meta-openembedded/meta-ruby/recipes-devtools/ruby/
ruby_2.2.2.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 672 tasks of which 671 didn't need to be
rerun and 1 failed.
No currently running tasks (565 of 682)

regards,


On Thu, May 14, 2015 at 2:53 PM, akuster808 <akuster808@gmail.com> wrote:

> Eduardo,
>
> I think one issue is --sysroot is using the host path that might be
> contributing to the Arch mismatch message. I have a patch that I have not
> submitted, yet.
>
> Regarding the .debug, you might need to add
>
> FILE_${PN}-dbg +=
> "/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug"
>
>
> It you could try the patch I have attached and let me know if it helps.
>
> regards,
> Armin
>
>
> On 05/14/2015 06:25 AM, Eduardo Silva wrote:
>
>> Hi,
>>
>> I am packaging a Ruby gem that also contains C code:
>>
>>    http://github.com/msgpack/msgpack-ruby
>>
>> but when building it raise many QA issues about linking to 64 bits
>> version,
>> my target is "i586-poky-linux":
>>
>> ERROR: QA Issue: Architecture did not match (3 to 62) on
>>
>> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack.so
>> [arch]
>> ERROR: QA Issue: non debug package contains .debug directory: ruby-msgpack
>> path
>>
>> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpack/.debug/msgpack.so
>> [debug-files]
>> ERROR: QA Issue: Architecture did not match (3 to 62) on
>>
>> /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
>> [arch]
>> WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit),
>> libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
>> libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no providers in its
>> RDEPENDS [file-rdeps]
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in:
>>
>> /home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/temp/log.do_package_qa.7603
>> ERROR: Task 9
>> (/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
>> ruby-msgpack_git.bb, do_package_qa) failed with exit code '1'
>>
>> would you please advice if some specific flag/setup is required to build
>> Ruby gems that contains C code ?
>>
>> thanks,
>>
>>


-- 
Eduardo Silva
Monkey Software

