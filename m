Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqIAF-0007GC-Vf
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 06:46:28 +0100
Received: by dakf10 with SMTP id f10so160081dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 21:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ostzZsZYKlej5IXGmjw/dU2jUcmNIIZYRQ/xu0hgPk0=;
	b=rdmyiSi6gy4aDFB3KxWukviQk0E2RFO3JlbnfjuieNsMXoCWz+ZAe3tGINzejKxG2k
	1G4fRCaxghx/tvDDN5iELRLI7/LYTVcXihW5ufPerfu/bgtbb5hxgXfPQ8cXINgxehQz
	xW2gb2kRXDaEdphspdtHqB2WVnJbiLcfDLPUs=
Received: by 10.68.234.199 with SMTP id ug7mr2337663pbc.6.1327556319971;
	Wed, 25 Jan 2012 21:38:39 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id j4sm8325682pbg.12.2012.01.25.21.38.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 21:38:38 -0800 (PST)
Date: Wed, 25 Jan 2012 21:38:34 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126053834.GD5566@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
References: <1327488981-28305-1-git-send-email-yauhen.kharuzhy@promwad.com>
MIME-Version: 1.0
In-Reply-To: <1327488981-28305-1-git-send-email-yauhen.kharuzhy@promwad.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: Re: [PATCH 08/10] Add recipe for xerces-c 3.1.1
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
X-List-Received-Date: Thu, 26 Jan 2012 05:46:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/12 13:56), Yauhen Kharuzhy wrote:
> From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
> 
> Add recipe for Xerces-C++: a validating XML parser written in
> a portable subset of C++.
> 
> Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
> ---
>  meta/recipes-support/xerces-c/xerces-c_3.1.1.bb |   35 +++++++++++++++++++++++
>  1 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/xerces-c/xerces-c_3.1.1.bb
> 
> diff --git a/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb b/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb
> new file mode 100644
> index 0000000..e73a690
> --- /dev/null
> +++ b/meta/recipes-support/xerces-c/xerces-c_3.1.1.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION = "Xerces-c is a validating xml parser written in C++"
> +HOMEPAGE = "http://xerces.apache.org/xerces-c/"
> +SECTION =  "libs"
> +PRIORITY = "optional"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57
> +
> +PR = "r1"

not necessary but start with r0 in new recipes

> +
> +SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES = "libxerces-c \
> +    libxerces-c-dbg \
> +    libxerces-c-dev \
> +    xerces-c-samples \
> +    xerces-c-samples-dbg \
> +" 
> +
> +FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
> +FILES_libxerces-c-dbg = "${libdir}/.debug/"
> +FILES_libxerces-c-dev = "${libdir}/lib*.la \
> +    ${libdir}/lib*.a \

.a should go into -staticdev package so remove above line

> +    ${libdir}/libxerces-c.so \
> +    ${libdir}/pkgconfig/xerces-c.pc \
> +    ${includedir}/xercesc \
> +"
> +FILES_xerces-c-samples = "${bindir}/*"
> +FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
> +
> +SRC_URI[md5sum] = "6a8ec45d83c8cfb1584c5a5345cb51ae"
> +SRC_URI[sha256sum] = "a42785f71e0b91d5fd273831c87410ce60a73ccfdd207de1b805d26d44968736"
> +
> +BBCLASSEXTEND += "native"
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


