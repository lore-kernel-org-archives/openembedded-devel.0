Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PQbdR-0001pw-Ra
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 09:13:54 +0100
Received: by fxm11 with SMTP id 11so1868651fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 00:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=zFKs7RxrPVyqU+SxCreVZRp4FIOIlejBq2lZrjZ2C3w=;
	b=iJY/gMwCQ+BVeQXRPGvR08NK2AvHHT72QhoDjZZRlhDwghp4VjzqDPm7voOKn+lZch
	CJYZTggblX9Vm5OvWkHL6rlsSzx/gIrNGAwaPBdp9wjQ0PJ4GG5LI6GULRLrmETOCTM1
	O03DNEfgxGUN38QI9qq8Wp34na6inpdS7wGv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JPiiJ/JZR3+W6I0z9T8E8y0/qJYk2XHRXpb+IF3xByCFRuzT8v2/hTonKwQoLfNVT1
	hoxnjhcQHe5+UwHSF62ElZr5kvw7mjOM106cV1lvgMkJb9Fbi1UyCWOs4cjCNFHUofm4
	JOZULj8DcIGOiDJJ/ACn0FUBpny/nOuGuD+7s=
Received: by 10.223.101.140 with SMTP id c12mr9534829fao.16.1291882343551;
	Thu, 09 Dec 2010 00:12:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k6sm422942faa.6.2010.12.09.00.12.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Dec 2010 00:12:22 -0800 (PST)
Date: Thu, 9 Dec 2010 09:12:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101209081207.GI3186@jama>
References: <1291864997-30025-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1291864997-30025-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] minimal.conf: Prefer libtool 2.4 with sysroot support
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
X-List-Received-Date: Thu, 09 Dec 2010 08:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2010 at 07:23:17PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/minimal.conf |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 5b92a36..451d010 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -102,13 +102,20 @@ require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>  
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
> -PREFERRED_QT_VERSION ?= "4.7.1"
> +PREFERRED_QT_VERSION                 ?= "4.7.1"
> +PREFERRED_LIBTOOL_VERSION            ?= "2.4"
> +LIBTOOL_HAS_SYSROOT                  ?= "yes"

what about setting this libtool version in sane-toolchain.inc? with more
distros using it we'll get better test coverage and state of recipes
built with it seems good enough to me (SHR is using it for a while).

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


