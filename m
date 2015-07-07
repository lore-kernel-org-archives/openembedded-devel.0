Return-Path: <mburtin@connected-labs.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C61EB75C49
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 09:40:06 +0000 (UTC)
Received: by lagc2 with SMTP id c2so186578184lag.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 02:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=vNUHu9WPVvL5ijXMkFDmHAgJ3wS4vYS9DD8I/ghCNWo=;
	b=W2cXqw0C+HT4OpQQKEmZGawmbxsdXE9eJhhRBkze0fcgKxCWIgFaTUuMGQllXhuFTb
	4maWC0YjoNvNC8JrEvYa3Bhq9yUAYPcgqmk1MmCekODkgQxCoSPTv1mDsZ1p1q9x9XjR
	dztqDAe9K9un+oMM3c2YCCtL3VVVdoCx1y8fYa2nBHJoLMXUuYyOnB8r3k6/sqm4OqAh
	o8mRHbaq8ATwpXMARTe3FuTO0tp/CjkU846jrOUJl72Lb69y7cAFmlmTuynMNyxuJqlV
	v8RR+S7VJ6bjZr2qA9qPxSM1/wb3n9CarhQuLWlJyE0PIhveM99nTMkITeMQrrRZ6EWu
	zGxQ==
X-Gm-Message-State: ALoCoQmFq6WXLeBkQPnBexfvevaTlR4gqX/a78HFcIofbtvkX4QTNiPEpqAxrb2tcF84ia2xMIPM
X-Received: by 10.152.37.67 with SMTP id w3mr3123943laj.123.1436262005336;
	Tue, 07 Jul 2015 02:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>
	<55550B48.6050505@gmail.com>
	<CAEaCVQi3f723PmbkobAdwJRRQiAthMDTiS=LpThoAFxy0qhiLw@mail.gmail.com>
	<55564206.8080500@gmail.com>
In-Reply-To: <55564206.8080500@gmail.com>
From: =?UTF-8?Q?Micha=C3=ABl_Burtin?= <mburtin@voxtok.com>
Date: Tue, 07 Jul 2015 09:39:55 +0000
Message-ID: <CAP7FSrg3-FVAehvdVmL=Qmr4PLnSEWBR7O23vMmT0APbxfEnVw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Eduardo Silva <eduardo@monkey.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 07 Jul 2015 09:40:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

We (at Voxtok Technologies) have written a bbclass to handle Gem
compilation that we use to run rails applications on ARM platform.
We exposed the class (together with ruby recipe and a collection of gem
recipes) as an external layer in a Github repository [1].
Unfortunately we didn't find enough time to upstream the patches as some
part of the recipes might need to be rewritten (e.g. the ruby "make
install-cross" related changes) but it seems stable enough to be shared.
This should allow you to install gem in your image as well as installing
gems at runtime, with native extension, supposing your image contains the
dev libraries and tools.

Regards,
Micha=C3=ABl

[1] https://github.com/voxtok/meta-oad-ruby

Le ven. 15 mai 2015 =C3=A0 21:00, akuster808 <akuster808@gmail.com> a =C3=
=A9crit :

>
>
> On 05/15/2015 06:38 AM, Eduardo Silva wrote:
> > Hi,
> >
> > thanks for the update. If I try that patch I get the following error
> > when building Ruby:
> >
> > ERROR: Function failed: do_install (log file is located at
> >
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r=
0/temp/log.do_install.10344)
> > ERROR: Logfile of failure stored in:
> >
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r=
0/temp/log.do_install.10344
> > Log data follows:
> > | DEBUG: Executing shell function do_install
> > | NOTE: make -j 4 LIBRUBYARG=3D-lruby-static
> >
> DESTDIR=3D/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-nati=
ve/2.2.2-r0/image
> > install
> > | make: *** No rule to make target 'install'.  Stop.
> > | ERROR: oe_runmake failed
> > | WARNING:
> >
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r=
0/temp/run.do_install.10344:1
> > exit 1 from
> > |   exit 1
> > | ERROR: Function failed: do_install (log file is located at
> >
> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r=
0/temp/log.do_install.10344)
> > ERROR: Task 111
> >
> (virtual:native:/home/edsiper/coding/meta-openembedded/meta-ruby/recipes-=
devtools/ruby/
> ruby_2.2.2.bb
> > <http://ruby_2.2.2.bb>, do_install) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 672 tasks of which 671 didn't need to be
> > rerun and 1 failed.
> > No currently running tasks (565 of 682)
>
> Hmm, weird.  let me poke at it.
>
> - armin
> >
> > regards,
> >
> >
> > On Thu, May 14, 2015 at 2:53 PM, akuster808 <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     Eduardo,
> >
> >     I think one issue is --sysroot is using the host path that might be
> >     contributing to the Arch mismatch message. I have a patch that I
> >     have not submitted, yet.
> >
> >     Regarding the .debug, you might need to add
> >
> >     FILE_${PN}-dbg +=3D
> >     "/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug"
> >
> >
> >     It you could try the patch I have attached and let me know if it
> helps.
> >
> >     regards,
> >     Armin
> >
> >
> >     On 05/14/2015 06:25 AM, Eduardo Silva wrote:
> >
> >         Hi,
> >
> >         I am packaging a Ruby gem that also contains C code:
> >
> >         http://github.com/msgpack/msgpack-ruby
> >
> >         but when building it raise many QA issues about linking to 64
> >         bits version,
> >         my target is "i586-poky-linux":
> >
> >         ERROR: QA Issue: Architecture did not match (3 to 62) on
> >
>  /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack=
-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack=
.so
> >         [arch]
> >         ERROR: QA Issue: non debug package contains .debug directory:
> >         ruby-msgpack
> >         path
> >
>  /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack=
/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpa=
ck/.debug/msgpack.so
> >         [debug-files]
> >         ERROR: QA Issue: Architecture did not match (3 to 62) on
> >
>  /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack=
/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
> >         [arch]
> >         WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit=
),
> >         libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
> >         libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no
> >         providers in its
> >         RDEPENDS [file-rdeps]
> >         ERROR: QA run found fatal errors. Please consider fixing them.
> >         ERROR: Function failed: do_package_qa
> >         ERROR: Logfile of failure stored in:
> >
>  /home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.=
5.11-r0/temp/log.do_package_qa.7603
> >         ERROR: Task 9
> >
>  (/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
> >         ruby-msgpack_git.bb <http://ruby-msgpack_git.bb>, do_package_qa=
)
> >         failed with exit code '1'
> >
> >         would you please advice if some specific flag/setup is required
> >         to build
> >         Ruby gems that contains C code ?
> >
> >         thanks,
> >
> >
> >
> >
> > --
> > Eduardo Silva
> > Monkey Software
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

