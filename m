Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqI7a-00072I-SI
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 06:43:49 +0100
Received: by pbaa13 with SMTP id a13so354598pba.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wNmXScc/BWi9+XGNUp6m1NYKC6fpRdhwg0zl9rjzCvE=;
	b=Q0mWQmNdEpYjdKWRQYXdQ3mQ86X/+YCxNDaG/4YcKSE9xupCCDcyOd6RxKsYR1+laj
	SBFvn4FWA4gMRR9rlKXd3pt6qvoUg7AWS6uHMI9JbV4aoZNxvCMyjKNF+DHmppmu9Efw
	D3inukttBvrSr4nZiw2TJ/7eo6xwqNRplHmv0=
Received: by 10.68.211.38 with SMTP id mz6mr1954076pbc.130.1327556115668;
	Wed, 25 Jan 2012 21:35:15 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id n8sm8334414pbq.7.2012.01.25.21.35.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 21:35:14 -0800 (PST)
Date: Wed, 25 Jan 2012 21:35:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126053509.GB5566@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
References: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
	<1327488928-28127-2-git-send-email-yauhen.kharuzhy@promwad.com>
MIME-Version: 1.0
In-Reply-To: <1327488928-28127-2-git-send-email-yauhen.kharuzhy@promwad.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 04/10] Add libnetfilter-conntrack 1.0.0
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
X-List-Received-Date: Thu, 26 Jan 2012 05:43:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/12 13:55), Yauhen Kharuzhy wrote:
> Add libnetfilter-conntrack 1.0.0 package.
> Recipe was taken from the OE-classic and was updated.
> 
> Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
> ---
>  .../libnetfilter/libnetfilter-conntrack_0.0.101.bb |   12 ++++++++++++
>  .../libnetfilter/libnetfilter-conntrack_1.0.0.bb   |   12 ++++++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
>  create mode 100644 meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb


why did you take 2 versions ?

> 
> diff --git a/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
> new file mode 100644
> index 0000000..2debed4
> --- /dev/null
> +++ b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
> +LICENSE = "GPL"

be specific about gpl version here

> +LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +DEPENDS = "libnfnetlink"
> +
> +SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
> +SRC_URI[tar.md5sum] = "3c4b4048c914f2694c3ca6de2bb457dc"
> +SRC_URI[tar.sha256sum] = "9d2919df3794e1e8f2311ad31949698103061206379b75094cb2bf7851378ab2"
> +
> +S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
> +
> +inherit autotools pkgconfig
> diff --git a/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
> new file mode 100644
> index 0000000..e81fe85
> --- /dev/null
> +++ b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
> +LICENSE = "GPL"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +DEPENDS = "libnfnetlink"
> +
> +SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
> +SRC_URI[tar.md5sum] = "bc4638602d0e8dd144a11e510e2c236b"
> +SRC_URI[tar.sha256sum] = "0a09a61ad26a43190a1858cb0391198ae3c952a9bdc4488e63dcb5c59aa3d608"
> +
> +S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
> +
> +inherit autotools pkgconfig
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


