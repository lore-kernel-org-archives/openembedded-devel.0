Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ob3S9-0006Rz-S3
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 05:25:10 +0200
Received: by pwi10 with SMTP id 10so2188891pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Nm062do2NPYBUkpnRLbaodkpmJoj9NiQSGZaIZ+toT0=;
	b=D4jQ1PhOZP80XGTFnKzOPEzo6L2GfMikT/CgSvsm4EtQc74717V2/2/JJORNEPdfDv
	jYrMrssxcDnqOwGSPlv7zNfwo3sE9UV2tv5RNe15IdDDF5tlsDBnTdiSV8cC3M3RdIEK
	droE8J87jaVLLEvJupg54MwbIjzMBuGVApKJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Okv7bw9JTCMrXtsQGUDyA9RmGJPZ2xo6vYSXEuw0//77dOYexZ0qHZN8FdOBXE1m7y
	f+rOczUl7I2/SNEuPoWDo70XSSKp3d3ggOBq3NEzrMZLUtoDIAjgs6PnYmuVRYGgvKxx
	3r6TrUIVoB3qViZ34bfKfzRmDhPpnGeGgNCQU=
Received: by 10.114.57.9 with SMTP id f9mr8406027waa.90.1279596299313;
	Mon, 19 Jul 2010 20:24:59 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q6sm82265351waj.22.2010.07.19.20.24.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 20:24:56 -0700 (PDT)
Date: Mon, 19 Jul 2010 20:25:14 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720032514.GB7574@gmail.com>
References: <1279531554-31896-1-git-send-email-zlo@zlo.nu>
MIME-Version: 1.0
In-Reply-To: <1279531554-31896-1-git-send-email-zlo@zlo.nu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpng: Add add 1.2.44, new version and new native version importing several security fixes.
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
X-List-Received-Date: Tue, 20 Jul 2010 03:25:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/07/10 11:25), Marc Olzheim wrote:
> From: Marc Olzheim <marc@iphion.nl>
> 
> ---
>  recipes/libpng/libpng-native_1.2.44.bb |    6 ++++++
>  recipes/libpng/libpng_1.2.44.bb        |    8 ++++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libpng/libpng-native_1.2.44.bb

You coul use BBCLASSEXTEND for -native recipe.


>  create mode 100644 recipes/libpng/libpng_1.2.44.bb
> 
> diff --git a/recipes/libpng/libpng-native_1.2.44.bb b/recipes/libpng/libpng-native_1.2.44.bb
> new file mode 100644
> index 0000000..3c36b52
> --- /dev/null
> +++ b/recipes/libpng/libpng-native_1.2.44.bb
> @@ -0,0 +1,6 @@
> +require libpng_${PV}.bb
> +require libpng-native.inc
> +
> +PR = "r1"
> +
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpng-${PV}"
> diff --git a/recipes/libpng/libpng_1.2.44.bb b/recipes/libpng/libpng_1.2.44.bb
> new file mode 100644
> index 0000000..e607f76
> --- /dev/null
> +++ b/recipes/libpng/libpng_1.2.44.bb
> @@ -0,0 +1,8 @@
> +require libpng.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "file://makefile_fix.patch"
> +
> +SRC_URI[tarball.md5sum] = "e3ac7879d62ad166a6f0c7441390d12b"
> +SRC_URI[tarball.sha256sum] = "b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


