Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgWSf-0003Xf-8n
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 07:24:17 +0200
Received: by pzk2 with SMTP id 2so1913115pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 22:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=MdfVTmUTqXb715ItXXKLxAKG/r+38kNP720ghDExmlc=;
	b=g2IWKZ6JSs7eBuRbvKNDF3hc+OIpl72JNfuqfSF4Goo1UDEdVvSXdO6NxSniKFSbZQ
	mqWcdi90ustXlJggjX9EsODDPpHs9+r0NtakQ+aVu/clelLlgUf6XfePyez6okB9XhJW
	1GggGMxnghjW9JOYmp/1wZ1sT7/edzekT4cj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nswSvutN7X8EUZvOuaeYdqOJZiq8FT7XyGe2Oh9imlYkCRZtenN/mpR3QUlnvXFwkD
	1bEJcrfsqFskRuDZ1CcE/xG+pjM0E2kCGBWk8nIDa6+T1j+K+YrOAnpNodmyO5e6Aq73
	/nAjQZ6jceBNxgIftCMKekJ6xpwikqZD27opM=
Received: by 10.142.200.21 with SMTP id x21mr7340731wff.84.1280899448731;
	Tue, 03 Aug 2010 22:24:08 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w8sm10094664wfd.7.2010.08.03.22.24.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 22:24:08 -0700 (PDT)
Date: Tue, 3 Aug 2010 22:24:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804052402.GC7085@gmail.com>
References: <1280890173-31915-1-git-send-email-raj.khem@gmail.com>
	<20100804032153.GH17391@denix.org>
	<AANLkTi=WHWm67_GkH7rFSvz+F=_cjP_CgBe5m5ME4tuH@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=WHWm67_GkH7rFSvz+F=_cjP_CgBe5m5ME4tuH@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 05:24:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (04/08/10 14:37), Graham Gower wrote:
> On 4 August 2010 12:51, Denys Dmytriyenko <denis@denix.org> wrote:
> > 1. Do you expect extensive fallout after this change? Since PRs are again not
> > bumped, people should probably try 2 builds - with existing TMPDIR and with a
> > clean one.
> >
> > 2. This doesn't seem right (special case not handled by your regexp):
> >
> > @@ -60,7 +60,7 @@ do_configure_append() {
> >  }
> >
> >  do_stage() {
> > -       autotools_stage_all
> > +       _all
> >        sed -i s,-l:libusb-gnur.a,,g ${STAGING_LIBDIR}/libusrp.la
> >  }
> >
> > --
> > Denys
> >
> 
> This doesn't look right either.


This is fixed in v2.

> 
> --- a/recipes/bluez/bluez4-libs.inc
> +++ b/recipes/bluez/bluez4-libs.inc
> @@ -10,7 +10,7 @@ SRC_URI =
> "http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
> 
>  S = "${WORKDIR}/bluez-${PV}"
> 
> -inherit autotools_stage
> +inherit
>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
> 
>  EXTRA_OECONF = "\
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


