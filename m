Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P428C-0004Fz-QD
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 03:52:26 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P427j-0001lm-Ds from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 18:51:51 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 7 Oct 2010 18:51:51 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 7 Oct 2010 19:51:50 -0600
Message-ID: <4CAE7927.70308@mentor.com>
Date: Thu, 07 Oct 2010 18:51:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286499432.3659.37.camel@mattotaupa>
In-Reply-To: <1286499432.3659.37.camel@mattotaupa>
X-OriginalArrivalTime: 08 Oct 2010 01:51:50.0144 (UTC)
	FILETIME=[5FA6B800:01CB668B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cairo_1.10.0: add `glib-2.0-native` to `DEPENDS`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Oct 2010 01:52:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Paul Menzel wrote:
> Date: Thu, 7 Oct 2010 13:38:44 +0200
> 
> `do_compile()` of `cairo_1.10.0.bb` fails with the following error.
> 
> […]
>         make[4]: Entering directory `/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/cairo-1.10.0-r0/cairo-1.10.0/util/cairo-gobject'
>           CC     libcairo_gobject_la-cairo-gobject-enums.lo
>         In file included from cairo-gobject-enums.c:8:
>         cairo-gobject.h:44:25: error: glib-object.h: No such file or directory
>         In file included from cairo-gobject-enums.c:8:
>         cairo-gobject.h:52: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'cairo_gobject_context_get_type'
>         cairo-gobject.h:56: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'cairo_gobject_device_get_type'
>         cairo-gobject.h:60: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'cairo_gobject_pattern_get_type'
>         […]
> 
> `glib-object.h` is only in sysroot of the build host.
> 
>     $ find angstrom-dev/ -name glib-object.h
>     angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.h
> 
> `cairo_1.8.8.bb` builds fine.
> 
> Adding `glib-2.0-native` to `DEPENDS` puts `glib-object.h` also into the sysroot of the target machine and fixes the build.
> 
>     $ find angstrom-dev/ -name glib-object.h
>     angstrom-dev/sysroots/i686-linux/usr/include/glib-2.0/glib-object.h
>     angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0/glib-object.h
> 
> Build tested with `angstrom-2008.1` for `MACHINE = "beagleboard"`.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/cairo/cairo_1.10.0.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/cairo/cairo_1.10.0.bb b/recipes/cairo/cairo_1.10.0.bb
> index 7530cd1..9859b9c 100644
> --- a/recipes/cairo/cairo_1.10.0.bb
> +++ b/recipes/cairo/cairo_1.10.0.bb
> @@ -1,5 +1,7 @@
>  require cairo.inc
>  
> +DEPENDS += "glib-2.0-native"

This should probably go into cairo.inc.  And would you please try and 
experiment?  Diff the bitbake -g files before and after this change and 
make sure we aren't otherwise leaking unwanted changes around into the 
dep graph.  I suspect this will end up being fine...

-- 
Tom Rini
Mentor Graphics Corporation


