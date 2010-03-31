Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx4lL-0002Wj-Te
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:43:45 +0200
Received: by gyb11 with SMTP id 11so248002gyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4tnzAkSJvtFmB+HVQAg963Yrw8L8nGbeVVZyYUNWloI=;
	b=he6pX8RUAXdgFBI/88Qp+8u7sad0FZlo0r3nD8TFRraPuU2YzfXT0IZfO0SqPnte7/
	jpIBwnLfS8jg2lu0RDmLk7+6BMmLdjyWv2Rg0E+sfTBpnvKGIg4V70K6OSs1yiIr05lH
	Sy5fhxXmFyuRg3N9Zrokq/km0casb2kmt/bN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xmAUnkHrJJcEsgaI1b0w3ANNabPIJy39OjVefo84HAmCAHYj+YPQkbE2tIKNR/K0Wf
	kr7WNm07AxOe8+x+M0970QFiHv+Vk+eFVKAIhy0pbi62eIoLe9U7bxbL1IWEMnzC85Si
	/+veXXZV0MDsrUQYLdMn2G5rtuNfJWADoQaQk=
Received: by 10.90.203.10 with SMTP id a10mr408702agg.120.1270068027448;
	Wed, 31 Mar 2010 13:40:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 8sm1745657yxg.49.2010.03.31.13.40.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 13:40:27 -0700 (PDT)
Date: Wed, 31 Mar 2010 13:41:14 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331204114.GA14197@gmail.com>
References: <20100331152003.5828.26495.stgit@ES-J7S4D2J.amer.consind.ge.com>
MIME-Version: 1.0
In-Reply-To: <20100331152003.5828.26495.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] po4a: Add native recipe
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
X-List-Received-Date: Wed, 31 Mar 2010 20:43:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/03/10 16:20), Martyn Welch wrote:
> Add a recipe for building a native version of po4a version 0.36.3.
> 
> Signed-off-by: Martyn Welch <martyn.welch@ge.com>
> ---
> 
>  recipes/po4a/po4a-native_0.36.3.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/po4a/po4a-native_0.36.3.bb b/recipes/po4a/po4a-native_0.36.3.bb
> new file mode 100644
> index 0000000..07c9e08
> --- /dev/null
> +++ b/recipes/po4a/po4a-native_0.36.3.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Tools for helping translation of documentation"
> +SECTION = "utility"
> +PRIORITY = "optional"
> +LICENSE = "GPL"
> +DEPENDS = "libmodule-build-perl-native"
> +PR = "r0"
> +inherit native

may be you could use BBCLASSEXTEND to write native part and have recipe
also for target package. 

> +
> +SRC_URI = "${DEBIAN_MIRROR}/main/p/po4a/po4a_0.36.3.orig.tar.gz;name=po4a"
> +
> +SRC_URI[po4a.md5sum] = "47af91b7d2ad3a3a9e2aaa22473f42bf"
> +SRC_URI[po4a.sha256sum] = "4563f4651448300f3d05f9dfa5212535ef0bd97c6b51704c4cb9829f282915e2"
> 
> 
> --
> Martyn Welch (Principal Software Engineer)   |   Registered in England and
> GE Intelligent Platforms                     |   Wales (3828642) at 100
> T +44(0)127322748                            |   Barbirolli Square, Manchester,
> E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


