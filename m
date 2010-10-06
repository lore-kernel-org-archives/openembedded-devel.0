Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3UlR-0005qk-P7
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:14:48 +0200
Received: by bwz7 with SMTP id 7so8369bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=i5fd6fgmLK7oF9vctSOTdl7Br6isE3YHI5erZ2/MlWI=;
	b=N21amAjC5Ncfw1CyQWVaQlB3JL9WuH6gXs7wEVo39FP/pbIEj9RC/8ATX0lDqtNHSl
	pD/y6nZh3Q400p9J7QPPoCoNRCCLUc/1kWfanQcUiebCvcO7B9pS/wuLFjx1YKnfx2fd
	9fswyHRKqd0+fmIr9xJUu2wrVrsfFYhZa/cMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EafHiUPSObKLKm+tR/vc9yjt2O5WNpE+GfX7hUFqH7IOYG76Bm6Ixd4g3Lzhn2qDbP
	sUqGdhcZzgBSzh1aExZepNrvGSQ6psgKND3u61lAtDURJdJOWAvo1KYcp0w0WhC5AmcC
	axxEJ1MDbm2byt+B2frh8vra4UAVB6lxGF5ko=
Received: by 10.204.59.132 with SMTP id l4mr7461494bkh.132.1286374453683;
	Wed, 06 Oct 2010 07:14:13 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v7sm704844bkx.4.2010.10.06.07.14.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 07:14:12 -0700 (PDT)
Date: Wed, 6 Oct 2010 16:14:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Message-ID: <20101006141420.GI3264@jama>
References: <1286373970.3792.6.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1286373970.3792.6.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: libfsotransport_git: `do_compile()` fails with error: Pointer arithmetic not supported for `void*'
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
X-List-Received-Date: Wed, 06 Oct 2010 14:14:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2010 at 04:06:10PM +0200, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> `libfsotransport_git.bb` fails to compile with the following error [1]. The log from Tinderbox is is not from my build machine, but I do get the same error.
> 
>         NOTE: make
>         make  all-recursive
>         make[1]: Entering directory `/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r2.2/git/libfsotransport'
>         Making all in fsotransport
>         make[2]: Entering directory `/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r2.2/git/libfsotransport/fsotransport'
>         /home/shr/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/valac -C --basedir .. --vapidir ../vapi --pkg posix --pkg linux --pkg glib-2.0 --pkg gio-2.0 --pkg gee-1.0 --pkg fsobasics-2.0 --header fsotransport.h --library fsotransport-2.0  -D FAST_BAUD --pkg hsuart basetransport.vala commandqueue.vala delegate.vala null.vala parser.vala pipe.vala pty.vala serial.vala socket.vala transport.vala hsuart.vala
>         basetransport.vala:463.13-463.31: error: Pointer arithmetic not supported for `void*'
>                     rdata += (int)bread;
>                     ^^^^^^^^^^^^^^^^^^^
>         basetransport.vala:463.13-463.31: error: Assignment: Invalid callback assignment attempt
>                     rdata += (int)bread;
>                     ^^^^^^^^^^^^^^^^^^^
>         Compilation failed: 2 error(s), 0 warning(s)
>         make[2]: *** [.vala.stamp] Error 1
>         make[2]: Leaving directory `/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r2.2/git/libfsotransport/fsotransport'
>         make[1]: *** [all-recursive] Error 1
>         make[1]: Leaving directory `/home/shr/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/libfsotransport-1_0.9.6+gitr842+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r2.2/git/libfsotransport'
>         make: *** [all] Error 2
>         FATAL: oe_runmake failed
>         ERROR: Function do_compile failed
> 
> Might this be related to the switch to new Vala version 0.11.0 [3] which has such a check included [2]? Commit ecafbae [4] seems not to be enough.

Hi,

actually this commit is not enough ([4] doesn't change
FSO_CORNUCOPIA_SRCREV which is used in libfsotransport):
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4f8ed5aa3bd3d5d5144efea2b16cfef4822fcbaa

it fixes one kind of problems with new vala (detection), but
I wasn't able to fix libfsotransport and for fsogsmd I have patch not
yet pushed to cornucopia repo (both waiting for mickey).

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


