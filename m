Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PwxcH-0003ke-Rr
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 15:10:26 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pwxan-0006IY-Bd from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 06:08:53 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 8 Mar 2011 06:08:52 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 8 Mar 2011 06:08:52 -0800
Message-ID: <4D76386D.1040505@mentor.com>
Date: Tue, 8 Mar 2011 07:08:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <il56eoMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1299588887-18797-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1299588887-18797-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 08 Mar 2011 14:08:52.0992 (UTC)
	FILETIME=[5AE61000:01CBDD9A]
Subject: Re: [PATCH v3] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Tue, 08 Mar 2011 14:10:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2011 05:54 AM, Steffen Sledz wrote:
> Introspection uses host tools within compile stage. Missing tools or
> tools of wrong version result in errors like
>
> |   GEN    GUPnP-1.0.gir
> | Couldn't find include 'Soup-2.4.gir' (search path: ...)
>
> or
>
> |   GEN    GUPnP-1.0.gir
> | /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported: 1.2)
>
> Signed-off-by: Steffen Sledz<sledz@dresearch.de>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/upnp/gupnp-av_0.5.9.bb |    3 +++
>   recipes/upnp/gupnp_0.13.4.bb   |    3 ++-
>   2 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/upnp/gupnp-av_0.5.9.bb b/recipes/upnp/gupnp-av_0.5.9.bb
> index 0370e91..f3e1d50 100644
> --- a/recipes/upnp/gupnp-av_0.5.9.bb
> +++ b/recipes/upnp/gupnp-av_0.5.9.bb
> @@ -2,8 +2,11 @@ LICENSE = "LGPL"
>   DEPENDS = "gupnp"
>
>   require gupnp.inc
> +PR = "r1"
>
>   SRC_URI[md5sum] = "5940df3c1152894685c3fc38ee95fd78"
>   SRC_URI[sha256sum] = "a909129997f79dcb6d35221ce205854d64c47a7390843e420cfba753485087bd"
>
>   inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--enable-introspection=no"
> diff --git a/recipes/upnp/gupnp_0.13.4.bb b/recipes/upnp/gupnp_0.13.4.bb
> index 07266a1..54c62ea 100644
> --- a/recipes/upnp/gupnp_0.13.4.bb
> +++ b/recipes/upnp/gupnp_0.13.4.bb
> @@ -2,13 +2,14 @@ LICENSE = "LGPL"
>   DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
>
>   require gupnp.inc
> +PR = "r1"
>
>   SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
>   SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
>
>   inherit autotools pkgconfig
>
> -EXTRA_OECONF = "--disable-gtk-doc"
> +EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"
>
>   do_configure() {
>   	libtoolize --force


-- 
Tom Rini
Mentor Graphics Corporation


