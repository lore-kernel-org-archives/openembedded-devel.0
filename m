Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OhYYF-0007CB-Bl
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 03:50:20 +0200
Received: by wwi17 with SMTP id 17so1750883wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 18:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=UQa720gBp7B71NKDAFD4keOJ+VqTHLj5/8ivoheSW8c=;
	b=A6U+j1/W3MTaq5RDKQf0J64kUZyPvaWn0TFTlvBWJ117Kvw1dv+Db3vHAfX9KI6u2a
	CsGSANqfDTQkrTze9m7Hl3gNDCEPW2zzLpldQdd2vi/e8S+rDaQ9PNEu2hZIbc+5Bbju
	+noxqV2o0tr3T9Cnl1ok1xasX77SEe3VBjY8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=GfBxC0N9iWn1Dwt/Hl+2hLK70N+aozuYDCRrw7VCfuA1J5WkzIMcyo0qQ4+k/ykrSF
	JQamIN5Whswp7qeddpNik3EZLcon3C5Dj/DUPH2pyRpDzBbhRGiComHe//NT+yQmQu2E
	KAPpOjAAoz7tePUL07bqpkEQt+fv4EkH/hTdI=
Received: by 10.216.30.10 with SMTP id j10mr181895wea.8.1281145811291; Fri, 06
	Aug 2010 18:50:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Fri, 6 Aug 2010 18:49:51 -0700 (PDT)
In-Reply-To: <AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
References: <4C5A612E.9040702@gmail.com>
	<AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
	<AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
	<AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 Aug 2010 18:49:51 -0700
X-Google-Sender-Auth: Dk1eAqkkp85IZirvnzxZ62MraLE
Message-ID: <AANLkTikiJFvOn_=VkTf7y5LTCUh5WOqfOhj8Udwbc5Ws@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Sat, 07 Aug 2010 01:50:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 6, 2010 at 6:29 PM, Graham Gower <graham.gower@gmail.com> wrote:

> On 6 August 2010 23:24, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Aug 5, 2010 at 4:15 PM, Chris Larson <clarson@kergoth.com>
> wrote:
> >> On Wed, Aug 4, 2010 at 11:58 PM, Graham Gower <graham.gower@gmail.com
> >wrote:
> >>
> >>> rootfs_ipk.bbclass already pulls these in, so avoid some confusion.
> >>>
> >>> This is totally untested.
> >>>
> >>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> >>>
> >>
> >> Looks reasonable to me.
> >>
> >> Acked-by: Chris Larson <clarson@kergoth.com>
> >
> > I've already pushed it, but too late I noticed that only rootfs_ipk is
> > handling DISTRO_PACKAGE_MANAGER and rpm/deb based rootfs will probably
> > loose DISTRO_PACKAGE_MANAGER from image.
> >
> > Should I revert now or can we fix it soon?
> >
>
> DISTRO_PACKAGE_MANAGER has been removed altogether. I can't see how it
> would work reliably for all images - which is probably why it had
> multiple definitions in the first place. And you could still end up
> with opkg in your image when setting it to something else, e.g.
> minimal-gpe-image and slugos pulled opkg in unconditionally.
> DISTRO_PACKAGE_MANAGER could be fixed if it was put in a common
> location like image.bbclass.
>
> What is the intended mechanism for selecting a package manager?
> INHERIT = "package_foo" looks like its going to do the trick for ipk
> and deb. package_rpm.bbclass might need BOOTSTRAP_EXTRA_RDEPENDS +=
> "rpm" or something.
>

BOOTSTRAP_EXTRA_RDEPENDS is a remnant.  We wouldn't want them controlling it
from there anyway.  The fact that I INHERIT package_ipk doesn't mean I'm
constructing an ipk image, only that I'm *emitting* packages of that
format.  IMAGE_PKGTYPE controls which rootfs_* bbclass will be used to
construct the image, but that doesn't control which package *manager* for
that type will be used, nor whether it should be installed at all
(ONLINE_PACKAGE_MANAGEMENT).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

