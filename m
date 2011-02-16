Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqRd-0003Yj-81
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:06:01 +0100
Received: by pvd12 with SMTP id 12so263216pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=OOoCdWvJ9T0J98ilNtqZKJ2ANek16kPOdnT21R0PNvg=;
	b=ozeE1zUq8KCkgnZHSXQ5McoNTGAPrKmJ15/G4ycjwrVMqJ9cZnRdP7sblQJ0BeHkF5
	DEvUPkOViV2uRqtp+RqkLwpc9qJ1ZIgSKQp0lz+6vDfsW08O2ph3g6Rs/yWmMH8Nvnls
	9w38izkptFX2o2EJ5v0AuM+2mWGWuSOaO436o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=THlxnmhp2aVmb2HeE+FAADsMqu717I1OmFA6XydGIN4K6zeGHTSVCcxG8OnYkVkBPS
	pmHjPVf2qRvXalHIv3p6QJoIUe2GYm4FmotEAlnYRFmPOhWwaDOo8eTq7Zg27o7EfjUg
	aTnwaipJbBQXxnJjDZjr8Ti+0chDgF0f1d8Sg=
Received: by 10.142.43.16 with SMTP id q16mr923622wfq.78.1297897485869;
	Wed, 16 Feb 2011 15:04:45 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o11sm344811wfa.0.2011.02.16.15.04.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:04:44 -0800 (PST)
Date: Wed, 16 Feb 2011 15:04:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216230438.GQ14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 02/13] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Wed, 16 Feb 2011 23:06:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/02/11 11:18), Otavio Salvador wrote:
> In case prefix and exec_prefix are empty, rpath can end up with no
> absolute paths thus failing to build due a linking issue.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes/python/python-dbus_0.83.0.bb |   29 -----------------------------
>  recipes/python/python-dbus_0.83.2.bb |   33 +++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 29 deletions(-)
>  delete mode 100644 recipes/python/python-dbus_0.83.0.bb
>  create mode 100644 recipes/python/python-dbus_0.83.2.bb
> 
> diff --git a/recipes/python/python-dbus_0.83.0.bb b/recipes/python/python-dbus_0.83.0.bb
> deleted file mode 100644
> index 9766604..0000000
> --- a/recipes/python/python-dbus_0.83.0.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
> -SECTION = "devel/python"
> -HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
> -LICENSE = "MIT"
> -DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native python-epydoc-native"
> -PR = "ml2"
> -
> -SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
> -S = "${WORKDIR}/dbus-python-${PV}"
> -
> -inherit distutils-base autotools pkgconfig
> -
> -export BUILD_SYS
> -export HOST_SYS
> -
> -RDEPENDS_${PN} = "\
> -  python-io \
> -  python-lang \
> -  python-logging \
> -  python-threading \
> -  python-xml \
> -"
> -
> -FILES_${PN}-dev += "\
> -  ${libdir}/pkgconfig \
> -"
> -
> -SRC_URI[md5sum] = "562c78876219bf458d79a041af18293d"
> -SRC_URI[sha256sum] = "89dd1d5aa5c2ba04677d1aa2616caa50274d8c08f3d6bc164e6f7b9930776191"
> diff --git a/recipes/python/python-dbus_0.83.2.bb b/recipes/python/python-dbus_0.83.2.bb
> new file mode 100644
> index 0000000..c2495dc
> --- /dev/null
> +++ b/recipes/python/python-dbus_0.83.2.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
> +SECTION = "devel/python"
> +HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
> +LICENSE = "MIT"
> +DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native python-epydoc-native"
> +PR = "r1"

why is PR different then 'mlX'

> +
> +SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
> +S = "${WORKDIR}/dbus-python-${PV}"
> +
> +inherit distutils-base autotools pkgconfig
> +
> +export BUILD_SYS
> +export HOST_SYS
> +
> +RDEPENDS_${PN} = "\
> +  python-io \
> +  python-lang \
> +  python-logging \
> +  python-threading \
> +  python-xml \
> +"
> +
> +FILES_${PN}-dev += "\
> +  ${libdir}/pkgconfig \
> +"
> +
> +do_configure_append() {
> +	find ${S} -name Makefile | xargs -n 1 sed -i 's,prefix}lib,prefix}/lib,g'
> +}
> +
> +SRC_URI[md5sum] = "4ebcaa905bdcb4132b915196b0a3691b"
> +SRC_URI[sha256sum] = "883729c98f40790021e3be0f7028ae863ee1c4a7b922a5578c1342592adfff64"
> -- 
> 1.7.2.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


