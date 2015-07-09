Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C2AC9607A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jul 2015 16:31:06 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so6723953pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2015 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/Z3IbIeyANiPh8DP2xDx5lhMRtma5fN23BJK7OOTnAs=;
	b=N5p7E2F5ouX6tR0AcF1OkyZsmwDFYkj4tE1531RiDdkm+1zd9EbZ0LGxpwXvfJhqEd
	MO0yjrENwo0It4VcKVwO1TVvDgRAVrKYz8qSZ8vClqcEfEbARgz+N2IP8AhMMPNEfh0+
	PMjQSshCIPCAKPEEZFCEXx76QOPiwbd1pC6umH+dz/D9h0RdGAg7h1RleydjXJxylF2v
	r65BKwNsTyoqd4Cif+rEYPJd/sTDqrWbz+kGOPzaEbl3nW26824z+2AD50siFX0O5Tdt
	y1y3FSR7NMtFNwRtEteFNRBhvPJM6LtHpgzLmrwQgDFzukVjnfun/L8BNfbMTrPQ5EzB
	gP+g==
X-Received: by 10.70.133.230 with SMTP id pf6mr33435888pdb.56.1436459466573;
	Thu, 09 Jul 2015 09:31:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:1f1:f366:7a5c:28ff?
	([2601:202:4000:1239:1f1:f366:7a5c:28ff])
	by smtp.googlemail.com with ESMTPSA id
	r10sm6496977pdj.62.2015.07.09.09.31.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 09:31:05 -0700 (PDT)
Message-ID: <559EA1C6.1050508@gmail.com>
Date: Thu, 09 Jul 2015 09:31:02 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Eduardo Silva <eduardo@monkey.io>, mburtin@voxtok.com
References: <CAEaCVQjMD+ZV3m5tv4M6B2eFTvceemTs7nOBgKAh_XDUt3O9jQ@mail.gmail.com>	<55550B48.6050505@gmail.com>	<CAEaCVQi3f723PmbkobAdwJRRQiAthMDTiS=LpThoAFxy0qhiLw@mail.gmail.com>	<55564206.8080500@gmail.com>
	<CAP7FSrg3-FVAehvdVmL=Qmr4PLnSEWBR7O23vMmT0APbxfEnVw@mail.gmail.com>
In-Reply-To: <CAP7FSrg3-FVAehvdVmL=Qmr4PLnSEWBR7O23vMmT0APbxfEnVw@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Jul 2015 16:31:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Michael,

very cool.  Thanks

- armin

On 07/07/2015 02:39 AM, Michaël Burtin wrote:
> Hi,
>
> We (at Voxtok Technologies) have written a bbclass to handle Gem
> compilation that we use to run rails applications on ARM platform.
> We exposed the class (together with ruby recipe and a collection of gem
> recipes) as an external layer in a Github repository [1].
> Unfortunately we didn't find enough time to upstream the patches as some
> part of the recipes might need to be rewritten (e.g. the ruby "make
> install-cross" related changes) but it seems stable enough to be shared.
> This should allow you to install gem in your image as well as installing
> gems at runtime, with native extension, supposing your image contains the
> dev libraries and tools.
>
> Regards,
> Michaël
>
> [1] https://github.com/voxtok/meta-oad-ruby
>
> Le ven. 15 mai 2015 à 21:00, akuster808 <akuster808@gmail.com> a écrit :
>
>>
>>
>> On 05/15/2015 06:38 AM, Eduardo Silva wrote:
>>> Hi,
>>>
>>> thanks for the update. If I try that patch I get the following error
>>> when building Ruby:
>>>
>>> ERROR: Function failed: do_install (log file is located at
>>>
>> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
>>> ERROR: Logfile of failure stored in:
>>>
>> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344
>>> Log data follows:
>>> | DEBUG: Executing shell function do_install
>>> | NOTE: make -j 4 LIBRUBYARG=-lruby-static
>>>
>> DESTDIR=/home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/image
>>> install
>>> | make: *** No rule to make target 'install'.  Stop.
>>> | ERROR: oe_runmake failed
>>> | WARNING:
>>>
>> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/run.do_install.10344:1
>>> exit 1 from
>>> |   exit 1
>>> | ERROR: Function failed: do_install (log file is located at
>>>
>> /home/edsiper/coding/poky/build/tmp/work/x86_64-linux/ruby-native/2.2.2-r0/temp/log.do_install.10344)
>>> ERROR: Task 111
>>>
>> (virtual:native:/home/edsiper/coding/meta-openembedded/meta-ruby/recipes-devtools/ruby/
>> ruby_2.2.2.bb
>>> <http://ruby_2.2.2.bb>, do_install) failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 672 tasks of which 671 didn't need to be
>>> rerun and 1 failed.
>>> No currently running tasks (565 of 682)
>>
>> Hmm, weird.  let me poke at it.
>>
>> - armin
>>>
>>> regards,
>>>
>>>
>>> On Thu, May 14, 2015 at 2:53 PM, akuster808 <akuster808@gmail.com
>>> <mailto:akuster808@gmail.com>> wrote:
>>>
>>>      Eduardo,
>>>
>>>      I think one issue is --sysroot is using the host path that might be
>>>      contributing to the Arch mismatch message. I have a patch that I
>>>      have not submitted, yet.
>>>
>>>      Regarding the .debug, you might need to add
>>>
>>>      FILE_${PN}-dbg +=
>>>      "/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug"
>>>
>>>
>>>      It you could try the patch I have attached and let me know if it
>> helps.
>>>
>>>      regards,
>>>      Armin
>>>
>>>
>>>      On 05/14/2015 06:25 AM, Eduardo Silva wrote:
>>>
>>>          Hi,
>>>
>>>          I am packaging a Ruby gem that also contains C code:
>>>
>>>          http://github.com/msgpack/msgpack-ruby
>>>
>>>          but when building it raise many QA issues about linking to 64
>>>          bits version,
>>>          my target is "i586-poky-linux":
>>>
>>>          ERROR: QA Issue: Architecture did not match (3 to 62) on
>>>
>>   /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack-dbg/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/.debug/msgpack.so
>>>          [arch]
>>>          ERROR: QA Issue: non debug package contains .debug directory:
>>>          ruby-msgpack
>>>          path
>>>
>>   /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/extensions/x86_64-linux/2.2.0/msgpack-0.5.11/msgpack/.debug/msgpack.so
>>>          [debug-files]
>>>          ERROR: QA Issue: Architecture did not match (3 to 62) on
>>>
>>   /work/i586-poky-linux/ruby-msgpack/0.5.11-r0/packages-split/ruby-msgpack/usr/lib/ruby/gems/2.2.0/gems/msgpack-0.5.11/lib/msgpack/msgpack.so
>>>          [arch]
>>>          WARNING: QA Issue: ruby-msgpack requires libruby.so.2.2()(64bit),
>>>          libc.so.6(GLIBC_2.14)(64bit), libc.so.6(GLIBC_2.4)(64bit),
>>>          libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)(64bit), but no
>>>          providers in its
>>>          RDEPENDS [file-rdeps]
>>>          ERROR: QA run found fatal errors. Please consider fixing them.
>>>          ERROR: Function failed: do_package_qa
>>>          ERROR: Logfile of failure stored in:
>>>
>>   /home/edsiper/coding/poky/build/tmp/work/i586-poky-linux/ruby-msgpack/0.5.11-r0/temp/log.do_package_qa.7603
>>>          ERROR: Task 9
>>>
>>   (/home/edsiper/coding/poky/meta-fluentd/recipes-core/ruby-msgpack/
>>>          ruby-msgpack_git.bb <http://ruby-msgpack_git.bb>, do_package_qa)
>>>          failed with exit code '1'
>>>
>>>          would you please advice if some specific flag/setup is required
>>>          to build
>>>          Ruby gems that contains C code ?
>>>
>>>          thanks,
>>>
>>>
>>>
>>>
>>> --
>>> Eduardo Silva
>>> Monkey Software
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

