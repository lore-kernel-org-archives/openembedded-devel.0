Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9C80774182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 18:59:28 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so862885igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2015 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=p0U8PiMiZ87qmmP4A5kg6qAuo/x/iwPebZSCpxxraOk=;
	b=GWRhRLRXd2ncM2XbMl8pnXpH1Dml+4g+BxYWjK1xqka8nJV6c379TN+NamVb9OYhwz
	+GMwMNxbeF6R59FEOBE6UR1QgZESSTOXagtymV3Da7BWpSByEqEGokelhWn0eBlRX0GC
	Hk9LHR9B2A7OhlXZGk/kdi654RPeVB+PXM6F34f0HoScfRRjCJlX+nJ2NZhNmUe/DE9c
	ZHHCDOMdiuIFrc6IShgsCmeNgtkCmwKclKxsWyspYNfdj1kp/s9UixvuZBJDES078mtB
	1Ec7N6Tt1nRbANBGTcPBW7PrmFrgrRsIlWNDFgcgF3QXbwXDmVUzQ9uv3wVh3SwOUBB9
	3t3A==
X-Received: by 10.68.205.33 with SMTP id ld1mr21316661pbc.22.1431716361715;
	Fri, 15 May 2015 11:59:21 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:f0a2:acf0:8681:7abc?
	([2601:c:a700:3ba7:f0a2:acf0:8681:7abc])
	by mx.google.com with ESMTPSA id jt2sm2592638pbc.21.2015.05.15.11.59.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 May 2015 11:59:20 -0700 (PDT)
Message-ID: <55564206.8080500@gmail.com>
Date: Fri, 15 May 2015 11:59:18 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Eduardo Silva <eduardo@monkey.io>
References: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>	<55550B48.6050505@gmail.com>
	<CAEaCVQi3f723PmbkobAdwJRRQiAthMDTiS=LpThoAFxy0qhiLw@mail.gmail.com>
In-Reply-To: <CAEaCVQi3f723PmbkobAdwJRRQiAthMDTiS=LpThoAFxy0qhiLw@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 May 2015 18:59:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/15/2015 06:38 AM, Eduardo Silva wrote:
> Hi,
>
> thanks for the update. If I try that patch I get the following error
> when building Ruby:
>
> ERROR: Function failed: do_install (log file is located at
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
> ERROR: Logfile of failure stored in:
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344
> Log data follows:
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 4 LIBRUBYARG=-lruby-static
> DESTDIR=/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/image
> install
> | make: *** No rule to make target 'install'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING:
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/run.do_install.10344:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_install (log file is located at
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
> ERROR: Task 111
> (virtual:native:/home/edsiper/coding/meta-openembedded/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
> <http://ruby_2.2.2.bb>, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 672 tasks of which 671 didn't need to be
> rerun and 1 failed.
> No currently running tasks (565 of 682)

Hmm, weird.  let me poke at it.

- armin
>
> regards,
>
>
> On Thu, May 14, 2015 at 2:53 PM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Eduardo,
>
>     I think one issue is --sysroot is using the host path that might be
>     contributing to the Arch mismatch message. I have a patch that I
>     have not submitted, yet.
>
>     Regarding the .debug, you might need to add
>
>     FILE_${PN}-dbg +=
>     "/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug"
>
>
>     It you could try the patch I have attached and let me know if it helps.
>
>     regards,
>     Armin
>
>
>     On 05/14/2015 06:25 AM, Eduardo Silva wrote:
>
>         Hi,
>
>         I am packaging a Ruby gem that also contains C code:
>
>         http://github.com/msgpack/msgpack-ruby
>
>         but when building it raise many QA issues about linking to 64
>         bits version,
>         my target is "i586-poky-linux":
>
>         ERROR: QA Issue: Architecture did not match (3 to 62) on
>         /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack.so
>         [arch]
>         ERROR: QA Issue: non debug package contains .debug directory:
>         ruby-msgpack
>         path
>         /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpack/.debug/msgpack.so
>         [debug-files]
>         ERROR: QA Issue: Architecture did not match (3 to 62) on
>         /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
>         [arch]
>         WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit),
>         libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
>         libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no
>         providers in its
>         RDEPENDS [file-rdeps]
>         ERROR: QA run found fatal errors. Please consider fixing them.
>         ERROR: Function failed: do_package_qa
>         ERROR: Logfile of failure stored in:
>         /home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/temp/log.do_package_qa.7603
>         ERROR: Task 9
>         (/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
>         ruby-msgpack_git.bb <http://ruby-msgpack_git.bb>, do_package_qa)
>         failed with exit code '1'
>
>         would you please advice if some specific flag/setup is required
>         to build
>         Ruby gems that contains C code ?
>
>         thanks,
>
>
>
>
> --
> Eduardo Silva
> Monkey Software

