Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCEA26AE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 08:26:07 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1Uv1LC-003sj6-Ub>; Fri, 05 Jul 2013 10:26:06 +0200
Received: from g225144004.adsl.alicedsl.de ([92.225.144.4]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-devel@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1Uv1LC-000UwI-NW>; Fri, 05 Jul 2013 10:26:06 +0200
Date: Fri, 5 Jul 2013 10:26:00 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130705082559.GA4858@mail.zedat.fu-berlin.de>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
	<5fec7e15e0f9d37c1b764f6e5998d5f70e46cecf.1372987207.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5fec7e15e0f9d37c1b764f6e5998d5f70e46cecf.1372987207.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 92.225.144.4
Subject: Re: [PATCH 02/10] ruby: add missing dependency on ruby-native
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
X-List-Received-Date: Fri, 05 Jul 2013 08:26:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2013 at 03:23:46AM +0200, Martin Jansa wrote:
> * without ruby available on host it fails:
>   | NOTE: make LIBRUBYARG=-lruby-static
>   |       CC = i586-starfish-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86
>   |       LD = i586-starfish-linux-ld --sysroot=/OE/sysroots/qemux86
>   |       LDSHARED = i586-starfish-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86 -shared
>   |       CFLAGS = -O2 -pipe -g -feliminate-unused-debug-types -fPIC
>   |       XCFLAGS = -include ruby/config.h -include ruby/missing.h -fvisibility=hidden -DRUBY_EXPORT
>   |       CPPFLAGS =   -I. -I.ext/include/i386-linux -I./include -I.
>   |       DLDFLAGS = -Wl,-soname,libruby.so.1.9
>   |       SOLIBS = -lpthread -lrt -ldl -lcrypt -lm
>   | executable host ruby is required. use --with-baseruby option.
>   | make: *** [.rbconfig.time] Error 1
> ---
>  meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> index 7c5be36..868d0ff 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> +++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
> @@ -1,7 +1,7 @@
>  require ruby.inc
>  PR = "${INC_PR}.0"
>  
> -DEPENDS += "libyaml"
> +DEPENDS += "libyaml ruby-native"

Uhm,

after compiling ruby myself it has some more depends like ssl or gdbm or do you need only a minimal version?

Bye Henning

