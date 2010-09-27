Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1P0B5N-0008Vd-UI
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 12:37:30 +0200
Received: by qwb7 with SMTP id 7so2734231qwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VaJkpkBdXrUsNXvtFvD+/9FhR52rgY9aowU1Z3a9ObE=;
	b=DcWxPU3Ho9Rzu3PgoGd4oDOKwqQypOfuGugYPM1+tWHDtWEMFMRFCoQiW8I77pq1ju
	OKR4nWaZVOHOXcmzt9ro4DoqccaJ1AjtjZwBW1QQ91glqQXEmJIfslhu9fG3eEoY+foP
	XXT9gvajZwysKRmXosvqElLGmvnqvcklaTPvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=lm4TTD1RAQTwxRGVqK/eKiuFczByIS6InCPWxag2Dhn6OI71rDqgA8BhJLTNBIIYU6
	cNXVJqagUajOQ0waSEmy+139eTDTcLp2+GZBOj4HdT25XlrA9sjgd9i4rc3TQr47rWy6
	+GzlSX8g2I6SLsbBgfzC17Kfy4lW3uGUDfHeU=
Received: by 10.224.73.209 with SMTP id r17mr5278045qaj.393.1285583835237;
	Mon, 27 Sep 2010 03:37:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.22.2 with HTTP; Mon, 27 Sep 2010 03:36:54 -0700 (PDT)
In-Reply-To: <4CA06FF7.7060209@freyther.de>
References: <1285347950-27040-1-git-send-email-fahad_usman@mentor.com>
	<4CA063A4.90608@freyther.de>
	<AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
	<AANLkTimcPMXmC6KgnJmxayJ+6_M3xsEwZZTf9DH2TOhb@mail.gmail.com>
	<4CA06FF7.7060209@freyther.de>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 27 Sep 2010 12:36:54 +0200
Message-ID: <AANLkTi=r6DcA50F6yve8Xv2xq8E82uFxv__ozKjs8yQj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] qmake-native_1.07a.bb: Converted to new style staging
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
X-List-Received-Date: Mon, 27 Sep 2010 10:37:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ok thanks for the info!
I will try to build qt4-plugin-phonon-backend-vlc with qt4-tools-native so.

2010/9/27 Holger Freyther <holger+oe@freyther.de <holger%2Boe@freyther.de>>

> On 09/27/2010 06:16 PM, Sylvain Par=E9 wrote:
> > Hi Holger ,
> >
> > I just wanted to ask if with your Qt4.7 commits you could look at
> > automoc-nativ which did not build the last time I tried (i.e 3 weeks ag=
o)
> > and if it could not be provided directly by Qt packages . (I don't know
> if
> > it is possible)
> > Thanks!
>
> automoc-native should be deprecated... and is not used due
> qt4-tools-native.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

