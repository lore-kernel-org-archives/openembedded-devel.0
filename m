Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpqIn-0002XP-NG
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:56:54 +0100
Received: by yie16 with SMTP id 16so834999yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=FDJlfdNLN65SkDN4FtR5Sq6tFpE1P+tgrMpGgngBgR0=;
	b=OXaEJW2zAPQcScUk4cnnztSaIyvGuLE8Xsnck5H0t3ZLn0uEdey7v3Mdg4YRITvWUD
	7Y05hkbTgmb0SsoDNJzXHRbTEtMHPA9rrqbH6376OCimOzXOBUy09gHnasJ1kk3pHXz4
	YZHs4js73/16KMO+yCUbGdD8tZLiJa6vytQ2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=ZF7iZHBReQHYcGklmJqRK4Do7OJxFlQGvWNih2XB3lB8qevbXMWmq1ARGoXcpJojZD
	Q3SjWcosZcDhiIRN5XvbyrJVaEAzVwZQ/Vcl4dgmtuNwMcBRO17EHookziam7QD2KnFh
	fveK/sj9JgBwsOdtxYn/duQkQGweL6m/mcv9E=
Received: by 10.100.163.16 with SMTP id l16mr511092ane.24.1297896941322;
	Wed, 16 Feb 2011 14:55:41 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c7sm286298ana.37.2011.02.16.14.55.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:55:40 -0800 (PST)
Date: Wed, 16 Feb 2011 14:55:43 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110216225543.GI14525@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1297852433-31160-3-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 03/10] gnokii: add latest version
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
X-List-Received-Date: Wed, 16 Feb 2011 22:56:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 11:33), Eric Bénard wrote:
> - build tested for armv5 with PARALLEL_MAKE="-j8" so I removed
> PARALLEL_MAKE = "" which was set in previous recipes.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/gnokii/gnokii_0.6.30.bb |   28 ++++++++++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gnokii/gnokii_0.6.30.bb
> 
> diff --git a/recipes/gnokii/gnokii_0.6.30.bb b/recipes/gnokii/gnokii_0.6.30.bb
> new file mode 100644
> index 0000000..0f82c5d
> --- /dev/null
> +++ b/recipes/gnokii/gnokii_0.6.30.bb
> @@ -0,0 +1,28 @@
> +LICENSE = "GPL"

which version of GPL ?

> +DESCRIPTION = "Cellphone tools and driver software"
> +SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2 \
> +	"
> +
> +DEPENDS = "libxpm gtk+"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES += "libgnokii libgnokii-dev"
> +
> +FILES_${PN} = "${bindir} ${sbindir}"
> +FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
> +                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> +	        /lib/*.a /lib/*.o ${datadir}/aclocal"
> +FILES_${PN}-dev = ""
> +FILES_libgnokii = "${libdir}/libgnokii.so.*"
> +
> +do_stage() {
> +	autotools_stage_includes
> +
> +	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
> +}

get rid of do_stage


> +
> +
> +SRC_URI[md5sum] = "c90137d403febbc16712d64f0eb196de"
> +SRC_URI[sha256sum] = "337c75369901cc6665219e3b92e29949fc83823e8d63608979230d72fe2e1dd4"
> +
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


