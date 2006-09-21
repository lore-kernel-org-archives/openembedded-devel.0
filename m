Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <leoncamel@gmail.com>) id 1GQKL3-0003ur-3w
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Sep 2006 10:55:21 +0200
Received: by nf-out-0910.google.com with SMTP id l23so740475nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2006 01:51:03 -0700 (PDT)
Received: by 10.49.94.20 with SMTP id w20mr338590nfl;
	Thu, 21 Sep 2006 01:51:02 -0700 (PDT)
Received: by 10.48.215.2 with HTTP; Thu, 21 Sep 2006 01:51:02 -0700 (PDT)
Message-ID: <ad39a30f0609210151n6be5faf2led64c3767379b272@mail.gmail.com>
Date: Thu, 21 Sep 2006 16:51:02 +0800
From: "Leon Zhang" <leoncamel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
MIME-Version: 1.0
References: <E1GPih1-0005v2-VO@linuxtogo.org>
	<74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Re: [oe-commits] org.oe.dev xserver-kdrive git supply EXTRA_OECONF_x86 since w100 xserver doesn't build for x86
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
X-List-Received-Date: Thu, 21 Sep 2006 08:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

So, what is w100 then ?

Hmm, couldn't this be done with _append?
>
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
> # EXTRA_OECONF_append_x86 = " --disable-w100" (isn't w100 disabled by
> default?)
> EXTRA_OECONF_append_arm = " --enable-w100"
>
> Or even apply the w100.patch only on arm?
>
> cheers
> Philipp
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

