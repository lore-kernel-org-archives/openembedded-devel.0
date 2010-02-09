Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NexOs-0002ZG-P5
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:13:41 +0100
Received: by bwz7 with SMTP id 7so2348850bwz.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 13:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Erb3RKIwTYyjGpCBWRzQlXvPrH0rFj8SKrruH7LSSLI=;
	b=jt7s/IvQjLjxj4+0SGDwe4UweI4u8RQbAm16GKr+vNGSXvtNpBdXCgMzmQ9tac2wux
	66BObY4kyaNPGX/+bPr7OUuADXwW4GYWOjVDDlO3xdduU5bCbcdbpoQ4bQf3mwudlvLw
	KUlI3Q2LjfIN92qwusTDplVvwh0BEE8Isn9lc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fXU5Uz/HQ2PKSrzSTYvtAVEDpLByi1XO//KVw+aEoprRP/3rY4Jpx5b5n2l6xxS3hA
	JccywRjqLJUxZCaN53Md9To12SH3P1VBqcIDohYESqAimXEJ8YNu0x8+XSmhq1mwdRuP
	u0QEWDpV2mN7VhgupQxedp1ThvMgqf7E3lig0=
Received: by 10.204.34.135 with SMTP id l7mr548899bkd.57.1265749865262;
	Tue, 09 Feb 2010 13:11:05 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 14sm251826bwz.1.2010.02.09.13.11.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Feb 2010 13:11:04 -0800 (PST)
Date: Tue, 9 Feb 2010 13:10:58 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209211058.GD3142@gmail.com>
References: <1265737098-5430-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1265737098-5430-2-git-send-email-marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <1265737098-5430-2-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/3] gcc csl 2007q3: import header hack from Poky to get glibc 2.5 built
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
X-List-Received-Date: Tue, 09 Feb 2010 21:13:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/02/10 18:38), Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb    |    6 ++++++
>  .../gcc/gcc-cross-intermediate_csl-arm-2007q3.bb   |    6 ++++++
>  recipes/gcc/gcc-cross_csl-arm-2007q3.bb            |    2 +-
>  recipes/gcc/gcc_csl-arm-2007q3.bb                  |    2 +-
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> index c9f03a7..cfa64dc 100644
> --- a/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross-initial_csl-arm-2007q3.bb
> @@ -4,3 +4,9 @@ require gcc-cross-initial.inc
>  S = "${WORKDIR}/gcc-4.2"
>  
>  EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
> +
> +# Hack till we fix *libc properly
> +do_install_append() {
> +	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> +}
> +
> diff --git a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> index 5423626..3532590 100644
> --- a/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross-intermediate_csl-arm-2007q3.bb
> @@ -4,3 +4,9 @@ require gcc-cross-intermediate.inc
>  S = "${WORKDIR}/gcc-4.2"
>  
>  EXTRA_OECONF += "--disable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap "
> +
> +# Hack till we fix *libc properly
> +do_install_append() {
> +	ln -sf ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/include/
> +}
> +
> diff --git a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> index 34bd251..adf7f5a 100644
> --- a/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc-cross_csl-arm-2007q3.bb
> @@ -1,4 +1,4 @@
> -PR = "r5"
> +PR = "r6"
>  
>  require gcc-csl-arm-2007q3.inc
>  require gcc-cross4.inc
> diff --git a/recipes/gcc/gcc_csl-arm-2007q3.bb b/recipes/gcc/gcc_csl-arm-2007q3.bb
> index cc7540a..2df12ef 100644
> --- a/recipes/gcc/gcc_csl-arm-2007q3.bb
> +++ b/recipes/gcc/gcc_csl-arm-2007q3.bb
> @@ -1,4 +1,4 @@
> -PR = "r3"
> +PR = "r4"
>  
>  require gcc-${PV}.inc
>  require gcc-configure-target.inc
> -- 
> 1.6.6.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


