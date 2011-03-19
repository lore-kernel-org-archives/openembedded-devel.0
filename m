Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q10yf-0003Rr-3f
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 19:34:17 +0100
Received: by pvc30 with SMTP id 30so557982pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=QdnjYLZYgh/wO2C9pJ24OLajBO0VIPlfGpXsmupUWs0=;
	b=O0tTykr3f9V4G0fhmcd5NdmhWHu1Y/iuSGSttZei849VS48hvEkxXNcqGPk1NV/Y6U
	R4VGSkLOfAV1TIo0A8RSMcvujhLKTnlidv4W1EOQjBZkAN7Re+k7P9lVo3IRtpE/9fO+
	r0GaJXL7XF+AXzkr5fTfiNx1kH7wTF/Y/rbgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=V4QsK+eG/jnTUm/5ailxJDIdzImuOHHxFlhAg0847lqzxPLefXm7Tg+bL+Dtqb7TEx
	fqI303lYide0jp9pqqiHl3cobHAYGUViI4GotOhSvO6KxZiCEJjsPeFQ4Ck+m9YKgeMF
	lpg6Zeoxi+JC1hjkhv+HxMcGcNVUzxJ3V9ihA=
Received: by 10.142.50.2 with SMTP id x2mr1038358wfx.138.1300559547484;
	Sat, 19 Mar 2011 11:32:27 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w27sm4657758wfd.16.2011.03.19.11.32.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Mar 2011 11:32:24 -0700 (PDT)
Date: Sat, 19 Mar 2011 11:33:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110319183329.GA14868@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
	<1300364903.3950.21.camel@mattotaupa>
	<1300402006.17833.14.camel@mattotaupa>
	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>
	<1300449625.3830.47.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300449625.3830.47.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Sat, 19 Mar 2011 18:34:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (18/03/11 13:00), Paul Menzel wrote:
> Date: Fri, 18 Mar 2011 12:03:43 +0100
> 
> Xfce Session build depends on the executable `iceauth`, which fails when cross compiling for a different architecture.
> 
>         checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is GNU ld... (cached) yes
>         checking whether to build with profiling support... no
>         checking whether to compile with coverage profiling instrumentation... no
>         checking whether to disable assertions... no
>         checking whether to build final version... yes
>         checking whether arm-oe-linux-gnueabi-ld --sysroot=/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1... yes
>         checking for iceauth... no
>         configure: error: iceauth missing, please check your X11 installation
> 
> As suggested by Khem Raj [1] pass the value – `/usr/bin/iceauth` is taken – to the configure script so that the test is avoided.
> 
> Therefore `iceauth` is removed from `DEPENDS` and the `PR` variable is incremented.
> 
> This issue has been reported upstream as ticket #7420 [2].
> 
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/031115.html
> [2] http://bugzilla.xfce.org/show_bug.cgi?id=7420
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/xfce-base/xfce4-session_4.6.1.bb |    6 ++++--
>  recipes/xfce-base/xfce4-session_4.6.2.bb |    6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/xfce4-session_4.6.1.bb
> index ba66ac1..5029b21 100644
> --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> +++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
> @@ -1,13 +1,15 @@
>  DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
> -DEPENDS = "lbwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> +DEPENDS = "lbwnck libxfcegui4 libxfce4util dbus xfce-utils"
>  SECTION = "x11"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  inherit xfce46
>  
>  RDEPENDS_${PN} = "iceauth xfce-utils xinit dbus-x11"
>  
> +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"

Would it make sense to have iceauth-native instead ?
> +
>  FILES_${PN} += "${libdir}/xfce4/splash/engines/*.so"
>  FILES_${PN} += "${datadir}/xfce4/tips/*"
>  FILES_${PN} += "${datadir}/themes/Default/balou/*"
> diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-base/xfce4-session_4.6.2.bb
> index d7f768a..c937775 100644
> --- a/recipes/xfce-base/xfce4-session_4.6.2.bb
> +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
> @@ -1,13 +1,15 @@
>  DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
> -DEPENDS = "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> +DEPENDS = "libwnck libxfcegui4 libxfce4util dbus xfce-utils"
>  SECTION = "x11"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  inherit xfce46
>  
>  RDEPENDS_${PN} = "iceauth xfce-utils xinit dbus-x11"
>  
> +EXTRA_OECONF += "ac_cv_path_ICEAUTH=/usr/bin/iceauth"
> +
>  FILES_${PN} += "${libdir}/xfce4/splash/engines/*.so"
>  FILES_${PN} += "${datadir}/xfce4/tips/*"
>  FILES_${PN} += "${datadir}/themes/Default/balou/*"
> -- 
> 1.7.4.1



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
-Khem


