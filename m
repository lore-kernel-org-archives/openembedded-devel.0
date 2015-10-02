Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4797702D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:27:49 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so17062423igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=342nPgXXLVZ4DWnGvWgD7KoW+BERVXwAQh9LPpq/5BQ=;
	b=YUh5qf4eQWZi7uSNgJlxt0JpJao56DjZ3xsfzKGjaaYTD6KF770zB02LY465pqo8O4
	ct7odUelS4184cD0rFGhO7TeeaJM8CUi2P172D7lV/dD5wta8RVyPsvQLgxHUfaATR9M
	q2brVSzIXW+Ur6TfIc1pZUjqRU1HFXKVkHpkMMrc4Zyx8JhCYmu4NDEEsdN7zxmNAAPk
	uWpxmz7Mkf9v0jl62jayM/qdhgLpzfqNzegK/qAbm/wsYijjiMASdH3mB5YX03lVxO4a
	F/IlI5iwCPAjNxP6NYd8vOXBmxPdqt1qbJElJCwu978O+XZ9ccnwpfhBVNNwEOn9fqy+
	7qkw==
X-Gm-Message-State: ALoCoQkZGx89qgEgfNjOxlfBnMElI4iO8HSu3pmNyIBchv2Nbtd0TXtKBWTvRdstA5wxXPcTfaqW
X-Received: by 10.50.112.68 with SMTP id io4mr3900704igb.72.1443792469633;
	Fri, 02 Oct 2015 06:27:49 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	n68sm4995739ion.26.2015.10.02.06.27.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Oct 2015 06:27:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so18270919igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 06:27:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr4434035igt.5.1443792468149; Fri,
	02 Oct 2015 06:27:48 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 2 Oct 2015 06:27:48 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
Date: Fri, 2 Oct 2015 10:27:48 -0300
Message-ID: <CAP9ODKq=ewQFGaJ3nWwTb0=d-Gxhk=hJrH_=URMs5kxY9G0KaA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Jens Rehsack <rehsack@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 02 Oct 2015 13:27:53 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Adding Jens in Cc.

On Wed, Sep 30, 2015 at 7:58 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:
> I have 2 inputs...
>
> openjdk-8 is pointing to unrelased 8u72b00 can we roll it back to released version 8u60b27 (http://hg.openjdk.java.net/jdk8u/jdk8u60/tags ).
>
> I am getting a failure in do_configure for openjdk-8... see logs and list of files in
>
> ls -al  /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790
> total 440
> drwxrwxr-x 15 vinay vinay   4096 Sep 30 15:30 .
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 ..
> -rw-r--r--  1 vinay vinay   1503 Aug  7 11:52 ASSEMBLY_EXCEPTION
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 common
> -rw-r--r--  1 vinay vinay   1235 Aug  7 11:52 configure
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 corba
> -rw-r--r--  1 vinay vinay   3095 Aug  7 11:52 get_source.sh
> -rw-r--r--  1 vinay vinay    154 Aug  7 11:52 .hg_archival.txt
> -rw-r--r--  1 vinay vinay     70 Aug  7 11:52 .hgignore
> -rw-r--r--  1 vinay vinay  23202 Aug  7 11:52 .hgtags
> drwxrwxr-x  7 vinay vinay   4096 Sep 30 15:00 hotspot
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxp
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jaxws
> drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 .jcheck
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 jdk
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 langtools
> -rw-r--r--  1 vinay vinay  19263 Aug  7 11:52 LICENSE
> drwxrwxr-x  6 vinay vinay   4096 Sep 30 15:00 make
> -rw-r--r--  1 vinay vinay   6232 Aug  7 11:52 Makefile
> drwxrwxr-x 12 vinay vinay   4096 Sep 30 15:00 nashorn
> drwxrwxr-x  2 vinay vinay   4096 Sep 30 15:00 patches
> drwxrwxr-x  5 vinay vinay   4096 Sep 30 15:00 .pc
> -rw-r--r--  1 vinay vinay   1549 Aug  7 11:52 README
> -rw-r--r--  1 vinay vinay 129333 Aug  7 11:52 README-builds.html
> drwxrwxr-x  3 vinay vinay   4096 Sep 30 15:00 test
> -rw-r--r--  1 vinay vinay 177094 Aug  7 11:52 THIRD_PARTY_README
>
>
>
> DEBUG: Executing python function sysroot_cleansstate
> DEBUG: Python function sysroot_cleansstate finished
> DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
> DEBUG: Executing shell function autotools_preconfigure
> + cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/build
> + autotools_preconfigure
> + [ -n /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate -a -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate ]
> + ret=0
> + trap  0
> + exit 0
>
> + cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/build
> + autotools_preconfigure
> + [ -n /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate -a -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/configure.sstate ]
> + ret=0
> + trap  0
> + exit 0
> DEBUG: Shell function autotools_preconfigure finished
> DEBUG: Executing python function autotools_copy_aclocals
> DEBUG: Python function autotools_copy_aclocals finished
> DEBUG: Executing shell function do_configure
> + cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes PULSE_NOT_NEEDED=yes
> + autotools_do_configure
>
> + find /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.in -o -name configure.ac
>
> + dirname /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
>
> + rm -f /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
>
> + CS=/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790
>
> + dirname configure
>
> + test . != .
> + [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure.ac ]
> + [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]
>
> + cd /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/build
> + do_configure
> + export X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes PULSE_NOT_NEEDED=yes
> + autotools_do_configure
> + find /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790 -ignore_readdir_race -name configure.in -o -name configure.ac
> + dirname /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure.ac
> + rm -f /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/common/autoconf/configure
> + CS=/home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790
> + dirname configure
> + test . != .
> + [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure.in -o -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure.ac ]
> + [ -e /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure ]
> ERROR: Function failed: do_configure (log file is located at /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/temp/log.do_configure.1566)
>
> I do see configure here .. /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure but for some reason build just bails out..
>
> ls /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/work/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/
> ASSEMBLY_EXCEPTION  configure  get_source.sh  jaxp   jdk        LICENSE  Makefile  patches  README-builds.html  THIRD_PARTY_README
> common              corba      hotspot        jaxws  langtools  make     nashorn   README   test
>
> Thanks,
> Vinay
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel-bounces@lists.openembedded.org] on behalf of Otavio Salvador [otavio.salvador@ossystems.com.br]
> Sent: Wednesday, September 30, 2015 2:20 PM
> To: OpenEmbedded Devel List
> Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br
> Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
>
> Hello Vinay,
>
> On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K
> <vinay.k.awasthi@intel.com> wrote:
>> Any update on when openjdk-8 is going to be part of meta-java? It has been over a month..
>
> Jens has prepared the patches and it has the ARM side fixed as well.
>
> Is it possible for you to take a look at his changes and see if those
> work for you?
>
> * https://github.com/rehsack/poky/tree/master
> * https://github.com/rehsack/meta-openembedded/tree/master
> * https://github.com/rehsack/meta-fsl-arm/tree/master
> * https://github.com/rehsack/meta-java/tree/master
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

