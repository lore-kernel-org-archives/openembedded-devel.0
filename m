Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GQM0K-0005tH-Tq for openembedded-devel@lists.openembedded.org;
	Thu, 21 Sep 2006 12:42:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id E0F438C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2006 12:37:46 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 15445-10 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2006 12:37:42 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id EB43F8C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2006 12:37:42 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
References: <E1GPih1-0005v2-VO@linuxtogo.org>
	<74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
Organization: VanilleMedia
Date: Thu, 21 Sep 2006 12:37:42 +0200
Message-Id: <1158835062.30336.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev xserver-kdrive git supply	EXTRA_OECONF_x86 since w100 xserver doesn't build for x86
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2006 10:42:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> EXTRA_OECONF = "--enable-composite --enable-sdl --enable-kdrive \
>                 --disable-dga --disable-dri --disable-xinerama \
>                 --disable-xf86misc --disable-xf86vidmode \
>                 --disable-xorg --disable-xorgcfg \
>                 --disable-xkb --disable-xnest --disable-xvfb \
>                 --disable-xevie --disable-xprint --disable-xtrap \
>                 --disable-dmx \
>                 --with-default-font-path=built-ins \
>                 --enable-tslib --enable-xcalibrate \
>                 ac_cv_file__usr_share_X11_sgml_defs_ent=no"
> 
> # EXTRA_OECONF_append_x86 = " --disable-w100" (isn't w100 disabled by default?)
> EXTRA_OECONF_append_arm = " --enable-w100"

Yes, that'd work. I'll do it like that.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




