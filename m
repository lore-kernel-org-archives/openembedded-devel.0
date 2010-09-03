Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OrOU2-0004q8-4L
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 07:06:40 +0200
Received: by fxm6 with SMTP id 6so1011164fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 22:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=HOfyvkm1EisIvPwuWnvIEWiP3JCLDX2+RRMHQ34py9w=;
	b=Qfx2oEradFLieOcdLgnM6T+yN5WzizhBkYsMt6ErK7bPbUDpn8Fpr0Ag7VCKXQpqxW
	91loJ3UjIaqnUK+7RZXfALNrwZIIOV0rCojXCeRdhAR4fXFv+xEFxvjNCOPdjl6HCl3L
	zzDDxGKiLc1jeLcu7M8g3b88jRC2fYtFDOheU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=KWka6LUf3rZNLG4Ef9D9Vd6t6F+XdxTWBuKLvjmAoIe+6FXMi++T87Cmjm/m3DjieF
	rHaraP9e26bzIQfEPSfZpzXpHu1KZf98qhm/LWixu5zMLOnlDh8GEPs2SNwKztgOuDeJ
	yr+eVdFRTyKYFR+eK66PrTiM3RXbq6vB5A02M=
Received: by 10.223.125.142 with SMTP id y14mr140605far.2.1283490360203; Thu,
	02 Sep 2010 22:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.81 with HTTP; Thu, 2 Sep 2010 22:05:40 -0700 (PDT)
In-Reply-To: <AANLkTimSiMkabHG_VzXJBWfDxXZcgbzfTt46pbJ7ryWK@mail.gmail.com>
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
	<AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
	<4C804878.4060204@taitradio.com>
	<AANLkTimSiMkabHG_VzXJBWfDxXZcgbzfTt46pbJ7ryWK@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 2 Sep 2010 23:05:40 -0600
Message-ID: <AANLkTikV8sS4FiQP2-PJAmy3AZa+Wpx1VE2F6v+G=fpB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Does the OS make a difference?
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
X-List-Received-Date: Fri, 03 Sep 2010 05:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

As with any operating system, I would recommend a clean install. IME,
upgrades always leave cruft.

It's easy enough to get a list of installed packages
http://www.arsgeek.com/2006/09/19/ubuntu-tricks-how-to-generate-a-list-of-installed-packages-and-use-it-to-reinstall-packages/

git rid of any version numbers and diff that against the new clean install

You'll likely want to backup /home, /opt, /usr/local/.

I'm going to go ahead and give it a try on my development box at home and
see how it goes.


Ironically, my goal is to replace my web dev box at home with the gumstix
and nodejs.

AJ ONeal


On Thu, Sep 2, 2010 at 7:58 PM, J. L. <vwyodapink@gmail.com> wrote:

> Do you know if doing a standard method of upgrading would be ok or
> should I start from a full clean install? Thanks
>
>
>
> On Thu, Sep 2, 2010 at 5:59 PM, Douglas Royds
> <douglas.royds@taitradio.com> wrote:
> > On 03/09/10 05:19, J. L. wrote:
> >>
> >> I would be interested to know as well I am building on 9.10 and seem
> >> to get more errors than those building on 10.04 or 10.10 with 64 bit
> >>
> >>
> >>
> >> On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal<coolaj86@gmail.com>  wrote:
> >>
> >>>
> >>> It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it really
> >>> makes
> >>> a difference... but it would take time and disrupt workflow and
> otherwise
> >>> provide little advantage.
> >>>
> >
> > As an aside, you should both be aware that neither 9.10 nor 8.10 are
> "LTS"
> > (long-term support) Ubuntu releases. As such, Ubuntu are no longer
> > back-porting security fixes.
> >
> > I recommend that you both upgrade to 10.04 LTS. Ubuntu will support 10.04
> > for 3 years (ie. until April 2013).
> >
> > Douglas.
> >
> >
> >
> >
> > =======================================================================
> > This email, including any attachments, is only for the intended
> > addressee.  It is subject to copyright, is confidential and may be
> > the subject of legal or other privilege, none of which is waived or
> > lost by reason of this transmission.
> > If the receiver is not the intended addressee, please accept our
> > apologies, notify us by return, delete all copies and perform no
> > other act on the email.
> > Unfortunately, we cannot warrant that the email has not been
> > altered or corrupted during transmission.
> > =======================================================================
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

