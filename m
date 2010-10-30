Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PCD3Q-0002J0-79
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 17:09:16 +0200
Received: by gxk26 with SMTP id 26so1126396gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=b5+sCFSRdnG0XZ1vICzg4akhbZ+brzsunBdFE3dNtxk=;
	b=rM1s303Yvgpj8BJS0pDGFgH9U/8q2nl3KkqRkyeoIo2vUfI3rTsbxjiFkkatbUYyZq
	INpq8dVNO4Dp6bs7aofgqYfbCnbIbdmDbu8JhZF3XEFGUQAsJMbrIHAAJo/V3778oa4s
	t0QD9z+VqGFppNVSBG3cXxznWEOLzaR9BpdNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=I65wL9WY5XB0MjQjfLGg6yfpL0dpt6/Wv3cPBBcp3cPJSeZApSKS/uRtJR04KC/HkB
	zqTQEge2ep7V8tyTiH9enGrNxZRVB7COs4X95dtzPf/pNr/EpiOWqYOVejlIA6O2faqs
	AceE+6f21VUmLiNmzd7AJB6ZcGss+fNYS+bQw=
Received: by 10.150.57.9 with SMTP id f9mr8466512yba.231.1288451296776;
	Sat, 30 Oct 2010 08:08:16 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t4sm680103ybe.1.2010.10.30.08.08.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Oct 2010 08:08:15 -0700 (PDT)
Date: Sat, 30 Oct 2010 08:08:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030150811.GA4076@gmail.com>
References: <1288422869-3296-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1288422869-3296-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] valgrind: remove versions prior to 3.6.0
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
X-List-Received-Date: Sat, 30 Oct 2010 15:09:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/10/10 11:14), Roman I Khimov wrote:
> If you're using valgrind, you probably want latest and versions removed with
> this patch are 2+ years old.
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/valgrind/valgrind_3.2.1.bb |   17 -----------------
>  recipes/valgrind/valgrind_3.2.3.bb |   19 -------------------
>  recipes/valgrind/valgrind_3.3.1.bb |   19 -------------------
>  3 files changed, 0 insertions(+), 55 deletions(-)
>  delete mode 100644 recipes/valgrind/valgrind_3.2.1.bb
>  delete mode 100644 recipes/valgrind/valgrind_3.2.3.bb
>  delete mode 100644 recipes/valgrind/valgrind_3.3.1.bb
> 
> diff --git a/recipes/valgrind/valgrind_3.2.1.bb b/recipes/valgrind/valgrind_3.2.1.bb
> deleted file mode 100644
> index e125493..0000000
> --- a/recipes/valgrind/valgrind_3.2.1.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "Valgrind memory debugger"
> -HOMEPAGE = "http://www.valgrind.org/"
> -SECTION = "devel"
> -LICENSE = "GPL"
> -DEPENDS = "virtual/libx11"
> -PR = "r0"
> -
> -SRC_URI = "http://www.valgrind.org/downloads/archive/valgrind-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "9407d33961186814cef0e6ecedfd6318"
> -SRC_URI[sha256sum] = "7f9a15d7be16ca03a0912191e8d55a486bf69690e11bb76ccece3eaff3730a33"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--enable-tls"
> -
> -COMPATIBLE_HOST = "^i.86.*-linux"
> diff --git a/recipes/valgrind/valgrind_3.2.3.bb b/recipes/valgrind/valgrind_3.2.3.bb
> deleted file mode 100644
> index 5032204..0000000
> --- a/recipes/valgrind/valgrind_3.2.3.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Valgrind memory debugger"
> -HOMEPAGE = "http://www.valgrind.org/"
> -SECTION = "devel"
> -LICENSE = "GPL"
> -DEPENDS = "virtual/libx11"
> -PR = "r0"
> -
> -SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--enable-tls"
> -
> -COMPATIBLE_HOST = "^i.86.*-linux"
> -
> -FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
> -
> -SRC_URI[md5sum] = "978847992b136c8d8cb5c6559a91df1c"
> -SRC_URI[sha256sum] = "1bca920527f43fd0c68e8f8eb16a7996b34f415e73af54de0f2cd43a8247c441"
> diff --git a/recipes/valgrind/valgrind_3.3.1.bb b/recipes/valgrind/valgrind_3.3.1.bb
> deleted file mode 100644
> index b2cdd7f..0000000
> --- a/recipes/valgrind/valgrind_3.3.1.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Valgrind memory debugger"
> -HOMEPAGE = "http://www.valgrind.org/"
> -SECTION = "devel"
> -LICENSE = "GPL"
> -DEPENDS = "virtual/libx11"
> -PR = "r0"
> -
> -SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--enable-tls"
> -
> -COMPATIBLE_HOST = "^i.86.*-linux"
> -
> -FILES_${PN}-dbg += "/usr/lib/valgrind/x86-linux/.debug"
> -
> -SRC_URI[md5sum] = "0539e2fa4aadb2cd4ca4bba65b1fe8b5"
> -SRC_URI[sha256sum] = "95b7b4d815bd479332637c93e69ec24167cd28d4f9d9f9b718e1b091bb88aafa"
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


