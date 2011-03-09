Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PxQMs-0002PC-ML
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 21:52:26 +0100
Received: by wwb17 with SMTP id 17so973883wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2011 12:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=crjOqisE0A8iD0rKbg//HxCbT4SRCd4/qgoP9ERFlHc=;
	b=ZPewch8AueOW9nJwkMe8Q/D9dH1U9il+lf1oW6xn9nZfQXhYAcQ/xvAwHF+0Sy3yzM
	v4anUAnV89TQxbhkEEhTRtlt5TGLnWRoT30olH+i4KHIYOYUhDO+1/ozFRHnH6ZPLirK
	MBHU3BhRBj6K+f4UdJ/jV7dIzrvEDVr39kW10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=oLKhj6ai0PK0NIQ5QuLD9UwY/JkrliUOvI6VPgv+DO9Y1sGB9ONvVth4SdEbmMp4Xu
	bfCiT1rmhL04szmy2YMLbYE985PmXwXd1BUO1pi6gbBXhz5Pwai3s1fX2T1jw49TQI8r
	1JX71NgNXLiR64jyKyWkM+jmSgvU89qlmPW0M=
Received: by 10.216.133.199 with SMTP id q49mr390148wei.17.1299703850626;
	Wed, 09 Mar 2011 12:50:50 -0800 (PST)
Received: from [192.168.1.103] (189.44-240-81.adsl-dyn.isp.belgacom.be
	[81.240.44.189])
	by mx.google.com with ESMTPS id n78sm1122379weq.27.2011.03.09.12.50.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2011 12:50:49 -0800 (PST)
Message-ID: <4D77E827.3090400@gmail.com>
Date: Wed, 09 Mar 2011 21:50:47 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20110131 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299679954.22332.8.camel@gnutoo-laptop>
In-Reply-To: <1299679954.22332.8.camel@gnutoo-laptop>
Subject: Re: fennec build problem
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
X-List-Received-Date: Wed, 09 Mar 2011 20:52:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As far as I know, it seems like a missing dependency, gconf2 is provided
by the gconf recipe but I didn't find any immediate dependencies on
gconf. Or maybe there is something wrong in the configuration step for
fennec that should disable the use of gconf.
Looking at the rest of the libraries used, there might the more missing
dependencies or missing disables in the configuration step of fennec.

Hope this helps,

Regards,

Jan
> Hi,
> I never succeeded to build Fennec because I never had the time and the
> will to fix it (the Mozilla build system seem complicated...), but
> dcordes_ on #oe On Freenode on irc really wanted  fennec.
> So I decided to give a try because it didn't compile for him for another
> reason.
>
> Here is the build error:
> | make[5]: *** No rule to make target `-lgconf-2', needed by
> `libmozgnome.so'.  Stop.
> | make[5]: *** Waiting for unfinished jobs....
> [...]
> | make[5]: Leaving directory
> `/home/gnutoo/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner/toolkit/system/gnome'
> | make[4]: *** [libs_tier_platform] Error 2
>
> here's a grep for -lgconf-2:
> gnutoo@gnutoo-laptop:~/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner$ grep "\-lgconf-2" -r *
>
> config/autoconf.mk:MOZ_GNOMEUI_LIBS = -pthread -lgnomeui-2 -lSM -lICE
> -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
> -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
> -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
> -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
> -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0
>
> config/autoconf.mk:MOZ_GNOMEVFS_LIBS = -pthread -lgnomevfs-2 -lgconf-2
> -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0
>
> config/autoconf.mk:MOZ_GCONF_LIBS = -pthread -lgconf-2 -lgobject-2.0
> -lgthread-2.0 -lrt -lglib-2.0
>
> config.status:s%@MOZ_GNOMEVFS_LIBS@%-pthread -lgnomevfs-2 -lgconf-2
> -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g
>
> config.status:s%@MOZ_GCONF_LIBS@%-pthread -lgconf-2 -lgobject-2.0
> -lgthread-2.0 -lrt -lglib-2.0%g
>
> config.status:s%@MOZ_GNOMEUI_LIBS@%-pthread -lgnomeui-2 -lSM -lICE
> -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
> -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
> -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
> -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
> -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g
>
> Note that it need a modified autoconf.inc, that I will send for
> review(as it's core).
>
> Denis
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



