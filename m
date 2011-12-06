Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RY4ze-0002EU-Jo
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 01:04:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Dec 2011 15:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,309,1320652800"; d="scan'208";a="82955095"
Received: from unknown (HELO [10.255.12.199]) ([10.255.12.199])
	by azsmga001.ch.intel.com with ESMTP; 06 Dec 2011 15:56:21 -0800
Message-ID: <4EDEABA5.2030505@linux.intel.com>
Date: Tue, 06 Dec 2011 15:56:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
	<db85bdb92ce1ffd1840f4fb719035d3b5692888e.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <db85bdb92ce1ffd1840f4fb719035d3b5692888e.1323141676.git.xiaofeng.yan@windriver.com>
Subject: Re: [OE-core][PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Wed, 07 Dec 2011 00:04:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2011 09:58 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
> the configuration related to x11 should be disabled and directfb should be enabled.
>
> [YOCTO #1674]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-gnome/gtk+/gtk+.inc |   16 ++++++++++++++--
>   1 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
> index 39a4f4a..7fc55e2 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -12,11 +12,18 @@ SECTION = "libs"
>
>   X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
>   DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
> -           libgcrypt cairo gdk-pixbuf ${X11DEPENDS}"
> +           libgcrypt cairo gdk-pixbuf"
> +
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +            ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> +
> +PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
> +PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
> +
>
This change with the change prior (Split X11 Dependencies) should be 1 
commit, while below should be a second commit, you are still mixing 
different items together in 1 commit.

>   inherit autotools pkgconfig
>
> -PACKAGES += "libgail"
> +PACKAGES += "libgail gtk-demo"
>
>   FILES_${PN} = "${bindir}/gtk-update-icon-cache \
>   	${bindir}/gtk-query-immodules-2.0 \
> @@ -41,6 +48,11 @@ FILES_${PN}-dbg += " \
>   	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
>   	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
>
> +FILES_gtk-demo = " \
> +         ${datadir}/gtk-2.0/demo/* \
> +         ${bindir}/gtk-demo \
> +         "
> +
This and the above PACKAGES += change should be in a separate commit 
from the PACKAGECONFIG and DEPENDS changes above.

Sau!

>   FILES_libgail = " \
>   	${libdir}/gtk-2.0/modules/libgail.so \
>   	${libdir}/gtk-2.0/modules/libferret.so \


