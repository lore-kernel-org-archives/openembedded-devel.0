Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxS3P-0006Rv-OX
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 23:40:27 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PxS1t-0007kK-NB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 14:38:53 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 14:38:53 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 9 Mar 2011 14:38:52 -0800
Message-ID: <4D780174.2010303@mentor.com>
Date: Wed, 9 Mar 2011 15:38:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299591092.3785.121.camel@mattotaupa>
In-Reply-To: <1299591092.3785.121.camel@mattotaupa>
X-OriginalArrivalTime: 09 Mar 2011 22:38:53.0390 (UTC)
	FILETIME=[C491FEE0:01CBDEAA]
Subject: Re: [PATCH] xfce4-session_4.6.{1, 2}: add `libwnck` to `DEPENDS`
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
X-List-Received-Date: Wed, 09 Mar 2011 22:40:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2011 06:31 AM, Paul Menzel wrote:
> Date: Tue, 8 Mar 2011 12:27:26 +0100
>
> Task `configure` fails with the following error.
>
> 	checking for pkg-config>= 0.9.0... 0.23
> 	checking for libxfce4util-1.0>= 4.6.0... 4.6.2
> 	checking LIBXFCE4UTIL_CFLAGS... -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/xfce4 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include
> 	checking LIBXFCE4UTIL_LIBS... -lxfce4util -lglib-2.0
> 	checking for libxfcegui4-1.0>= 4.6.0... 4.6.4
> 	checking LIBXFCEGUI4_CFLAGS... -pthread -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/xfce4 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/cairo -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/libpng12 -I/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0
> 	checking LIBXFCEGUI4_LIBS... -pthread -lxfcegui4 -lgtk-x11-2.0 -lxfce4util -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
> 	checking for libwnck-1.0>= 2.12... not found
> 	*** The required package libwnck-1.0 was not found on your system.
> 	*** Please install libwnck-1.0 (atleast version 2.12) or adjust
> 	*** the PKG_CONFIG_PATH environment variable if you
> 	*** installed the package in a nonstandard prefix so that
> 	*** pkg-config is able to find it.
>
> Adding `libwnck` to `DEPENDS` makes this error go away.
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
> `xfce4-session_4.4.2.bb` does not seem to require `libwnck`.
> ---
>   recipes/xfce-base/xfce4-session_4.6.1.bb |    2 +-
>   recipes/xfce-base/xfce4-session_4.6.2.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/xfce4-session_4.6.1.bb
> index de07fb3..72b58d3 100644
> --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> +++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "xfce4-session is a sessionmanager for Xfce 4 Desktop  Environment"
> -DEPENDS = "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> +DEPENDS = "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
>   SECTION = "x11"
>
>   PR = "r4"
> diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-base/xfce4-session_4.6.2.bb
> index c85bb8c..d7f768a 100644
> --- a/recipes/xfce-base/xfce4-session_4.6.2.bb
> +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
> -DEPENDS = "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> +DEPENDS = "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
>   SECTION = "x11"
>
>   PR = "r0"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Tom Rini
Mentor Graphics Corporation


