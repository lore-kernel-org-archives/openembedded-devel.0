Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiWPw-0002CV-K8
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 19:18:00 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PiWP7-0004Bp-UV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 10:17:09 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 27 Jan 2011 10:17:09 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 27 Jan 2011 11:17:08 -0700
Message-ID: <4D41B69F.7030403@mentor.com>
Date: Thu, 27 Jan 2011 11:17:03 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296144645-16120-1-git-send-email-ryan_d_phillips@dell.com>
In-Reply-To: <1296144645-16120-1-git-send-email-ryan_d_phillips@dell.com>
X-OriginalArrivalTime: 27 Jan 2011 18:17:08.0788 (UTC)
	FILETIME=[68F62740:01CBBE4E]
Subject: Re: [PATCH] bind: Add DISTRO_FEATURES support for ipv6
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
X-List-Received-Date: Thu, 27 Jan 2011 18:18:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2011 09:10 AM, Ryan D Phillips wrote:
> Signed-off-by: Ryan D Phillips<ryan_d_phillips@dell.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/bind/bind_9.3.1.bb    |    6 ++++--
>   recipes/bind/bind_9.3.4-P1.bb |    6 ++++--
>   recipes/bind/bind_9.3.5-P1.bb |    6 ++++--
>   recipes/bind/bind_9.3.6.bb    |    7 +++++--
>   4 files changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/recipes/bind/bind_9.3.1.bb b/recipes/bind/bind_9.3.1.bb
> index 268253e..11d4c71 100644
> --- a/recipes/bind/bind_9.3.1.bb
> +++ b/recipes/bind/bind_9.3.1.bb
> @@ -1,7 +1,7 @@
>   DEPENDS = "openssl"
>   RPEDENDS = ""
>   DESCRIPTION = "ISC Internet Domain Name Server"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
>              file://lib_dns_Makefile.in.patch \
> @@ -9,7 +9,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
>   	   file://conf.patch \
>   	   "
>
> -EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
> +EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
> +                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
>   inherit autotools update-rc.d
>
>   INITSCRIPT_NAME = "bind"
> diff --git a/recipes/bind/bind_9.3.4-P1.bb b/recipes/bind/bind_9.3.4-P1.bb
> index 70c261e..f8ae48f 100644
> --- a/recipes/bind/bind_9.3.4-P1.bb
> +++ b/recipes/bind/bind_9.3.4-P1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
>   SECTION = "console/network"
>   HOMEPAGE = "http://www.isc.org/sw/bind/"
>   LICENSE = "BSD"
> -PR = "r0"
> +PR = "r1"
>
>   DEPENDS = "openssl"
>
> @@ -12,7 +12,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.4-P1/bind-9.3.4-P1.tar.gz \
>   	   file://so_bsdcompat.patch \
>   	   "
>
> -EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
> +EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
> +                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
>   inherit autotools update-rc.d
>
>   INITSCRIPT_NAME = "bind"
> diff --git a/recipes/bind/bind_9.3.5-P1.bb b/recipes/bind/bind_9.3.5-P1.bb
> index bb98261..f573e57 100644
> --- a/recipes/bind/bind_9.3.5-P1.bb
> +++ b/recipes/bind/bind_9.3.5-P1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
>   SECTION = "console/network"
>   HOMEPAGE = "http://www.isc.org/sw/bind/"
>   LICENSE = "BSD"
> -PR = "r0"
> +PR = "r1"
>
>   DEPENDS = "openssl"
>
> @@ -12,7 +12,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/9.3.5-P1/bind-9.3.5-P1.tar.gz \
>   	   file://so_bsdcompat.patch \
>   	   "
>
> -EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr"
> +EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
> +                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
>   inherit autotools update-rc.d
>
>   INITSCRIPT_NAME = "bind"
> diff --git a/recipes/bind/bind_9.3.6.bb b/recipes/bind/bind_9.3.6.bb
> index b10d6e8..2ea37f9 100644
> --- a/recipes/bind/bind_9.3.6.bb
> +++ b/recipes/bind/bind_9.3.6.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "ISC Internet Domain Name Server"
>   SECTION = "console/network"
>   HOMEPAGE = "http://www.isc.org/sw/bind/"
>   LICENSE = "BSD"
> -PR = "r1"
> +PR = "r2"
>
>   DEPENDS = "openssl"
>
> @@ -11,7 +11,10 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${PN}-${PV}.tar.gz \
>   	   file://configure.in.patch \
>   	   "
>
> -EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr --disable-devpoll --disable-epoll"
> +EXTRA_OECONF = "--with-randomdev=/dev/random --disable-threads \
> +                --sysconfdir=/etc/bind --localstatedir=/var --prefix=/usr --disable-devpoll \
> +                --disable-epoll \
> +                ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '--enable-ipv6=no', d)}"
>   inherit autotools update-rc.d
>
>   INITSCRIPT_NAME = "bind"


-- 
Tom Rini
Mentor Graphics Corporation


