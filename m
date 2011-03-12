Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCfH-0004vM-Hx
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:26:40 +0100
Received: by yxn22 with SMTP id 22so1418003yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=oCLwHsxjeprL5XPVHsxyP453TrZmHcU7GlKibaIlt9s=;
	b=OqaRArfJzFb9Ss3KZiyopSiwlqHW/7OCK48L9cFZaWhp/2DVXS5s1z1uYwM7+H3s7L
	Ia5O8KQazxUdbP9bko7Br88j9cnIYOBMZITxdEwn9hGZT8b7lISBvyP0AhbWpYyUH1+J
	I/9yaoc6GgylME3enNNuZxFJha5QZ3giWW7c0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=xVfEBBw2l9MJr8IdWt7rM60reotQcqNDnGk3XIucuZCZcluvX8I5eqAzuaCcUTiIh8
	cuz3d5tZX082Um7axTvQciVNMFVZw7ViCtce5bkSiCpF074hkVzZhGNpK9+4DalEwcnp
	77ZNTk36GLLm2nfIEWXKubC5ZdLsjqN3+nzOs=
Received: by 10.101.36.9 with SMTP id o9mr1577605anj.127.1299889500602;
	Fri, 11 Mar 2011 16:25:00 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 37sm1847348anr.4.2011.03.11.16.24.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:24:59 -0800 (PST)
Date: Fri, 11 Mar 2011 16:25:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312002524.GN5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299886498-22190-1-git-send-email-eric@eukrea.com>
	<1299886498-22190-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299886498-22190-3-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] bluez-hcidump: add 2.0
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
X-List-Received-Date: Sat, 12 Mar 2011 00:26:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/03/11 00:34), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/bluez/bluez-hcidump_2.0.bb |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/bluez/bluez-hcidump_2.0.bb
> 
> diff --git a/recipes/bluez/bluez-hcidump_2.0.bb b/recipes/bluez/bluez-hcidump_2.0.bb
> new file mode 100644
> index 0000000..94a7097
> --- /dev/null
> +++ b/recipes/bluez/bluez-hcidump_2.0.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Linux Bluetooth Stack HCI Debugger Tool."
> +SECTION = "console"
> +PRIORITY = "optional"
> +DEPENDS = "bluez-libs"
> +LICENSE = "GPLv2"
> +PR = "r0"
> +
> +DEFAULT_PREFERENCE = "-1"

why DP -1 ?

> +
> +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
> +S = "${WORKDIR}/bluez-hcidump-${PV}"
> +
> +EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
> +SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


