Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpUZ2-0008BC-IV
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jan 2012 01:48:44 +0100
Received: by iabz21 with SMTP id z21so5928166iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 16:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=pKd1NfqQQZ/ddhELIYPKEYtNxkZripXEc7149B/g/ug=;
	b=UxRwSIDrzbc41wvHkHMyh7tqzlozRej0i2Hj+VRPQlwS7kabB+iOqmjFH9Qq1cwhCk
	vDY364/JC6VvjZVLMAvpWsUfXpgsar/qNTHL+QNuwHokngkLtwi2RYilANyc0G6y52m5
	JqI/JlsrtWA/6+zC68XxrKkVrvkYdxQW1AR4Q=
Received: by 10.43.133.9 with SMTP id hw9mr11630515icc.34.1327365659199;
	Mon, 23 Jan 2012 16:40:59 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ba5sm19540241igb.6.2012.01.23.16.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 16:40:57 -0800 (PST)
Date: Mon, 23 Jan 2012 16:41:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120124004151.GA11270@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1327303469-12803-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1327303469-12803-1-git-send-email-schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe 1/3] babl: initial add 0.1.6
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
X-List-Received-Date: Tue, 24 Jan 2012 00:48:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/01/12 08:24), Andreas Müller wrote:
> inspired by classic-oe [1]
> 
> [1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/babl_git.bb
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
> ---
>  meta-oe/recipes-graphics/babl/babl_0.1.6.bb |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/babl/babl_0.1.6.bb
> 
> diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.6.bb b/meta-oe/recipes-graphics/babl/babl_0.1.6.bb
> new file mode 100644
> index 0000000..005b85e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/babl/babl_0.1.6.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Babl is a dynamic, any to any, pixel format conversion library."
> +LICENSE = "LGPL-3.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
> +
> +inherit gnome
> +
> +SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "dc960981a5ec5330fc1c177be9f59068"
> +SRC_URI[sha256sum] = "319b9004a5366101fd522da02cc983a5d0f50a17af0fa5cbce3535e31bce19a4"
> +
> +FILES_${PN} += "${libdir}/babl-*/*.so"

sometimes .so are symlinks and should really go into -dev packages
can you double check if thats not the case here ?

> +FILES_${PN}-dev += "${libdir}/babl-*/*.la"
> +FILES_${PN}-dbg += "${libdir}/babl-*/.debug/"
> -- 
> 1.7.4.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


