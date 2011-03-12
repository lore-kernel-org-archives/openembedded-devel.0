Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCYj-0004Iw-Gq
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:19:53 +0100
Received: by iyb26 with SMTP id 26so3334187iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 16:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=4sYnQUpMzzJ5o1+7jVWQW5r1tcpzguKd2Ch5wALmhWM=;
	b=yD8ptHlh4CN6m631t6dM27j4AJX1Yx7oiGjNA7i06QcHX+q+nZx3ivuKNqwZsFUXqU
	1FU5kumBg99FaOXygX59GE5S+H2+DHLQ0X6u6PR547kLz0L4YZ34k9JAsozN+dsFcNPb
	ErBdAIPwlWiUa04mcIW7WsNiI6GomlVPtkKgM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=BnB4hxilfNXu9GuWPkl+cAMstTR0NIO4IlkoVVqPd+e2tTGismCOojmM3E4H0wHI2r
	9cMFJ+f30mEFcxaJqIv7peGF4kLbSAsz2VQpBdPGGF6hKpg6t53f4ew/91GyFhgCH3c2
	mWG4Y0xH3bL8jAqzTtJUW2ZDMW7XSL7MrXmeY=
Received: by 10.42.18.197 with SMTP id y5mr4695322ica.317.1299889093852;
	Fri, 11 Mar 2011 16:18:13 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vm9sm3454493icb.12.2011.03.11.16.18.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 16:18:12 -0800 (PST)
Date: Fri, 11 Mar 2011 16:18:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110312001837.GH5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299879352-3665-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299879352-3665-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] nodejs: update to 0.4.2
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
X-List-Received-Date: Sat, 12 Mar 2011 00:19:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 22:35), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...s-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} |    0
>  .../nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb}    |    4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes/nodejs/files/{libev-cross-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} (100%)
>  rename recipes/nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb} (77%)
> 
> diff --git a/recipes/nodejs/files/libev-cross-cc_0.4.0.patch b/recipes/nodejs/files/libev-cross-cc_0.4.2.patch
> similarity index 100%
> rename from recipes/nodejs/files/libev-cross-cc_0.4.0.patch
> rename to recipes/nodejs/files/libev-cross-cc_0.4.2.patch
> diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.2.bb
> similarity index 77%
> rename from recipes/nodejs/nodejs_0.4.0.bb
> rename to recipes/nodejs/nodejs_0.4.2.bb
> index be3d23e..912eb5d 100644
> --- a/recipes/nodejs/nodejs_0.4.0.bb
> +++ b/recipes/nodejs/nodejs_0.4.2.bb
> @@ -9,8 +9,8 @@ SRC_URI = " \
>    file://libev-cross-cc_${PV}.patch \
>  "
>  
> -SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
> -SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
> +SRC_URI[md5sum] = "9e9e791e125f6a601ebc663dc99c72a8"
> +SRC_URI[sha256sum] = "09b1100ca6828eedbe52418fbeb3352d71c0b1ff3344c44a5af3efb80c5b908c"
>  
>  S = "${WORKDIR}/node-v${PV}"
>  
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


