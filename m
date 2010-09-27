Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1P0AlX-0002G3-Ho
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 12:17:00 +0200
Received: by qwb7 with SMTP id 7so2725896qwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=tKNktRxRsPVe8rDgYkDJrNCkGbPRfsdE7w0zifzCdKE=;
	b=uXDk5xG2oWC+/+Hr6T4HLwkDetwaSQWU+ziiGaYIXLx8siAEwsBc/uZr+JHjJWmkxr
	5jnu2unSd2ZSBBVw4Sor+n4+LGj0W9MTrNvP23SM8+vhVw0NvFFq+0yu3S3t2yt9XvC2
	YddPL+KE7f3nQRbCQoFGKrNPjYUM13ER7e0+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=EWrNAOiQEWXSZ37ZIVnuRwNM8aZaR2xEF8PTz49F/C9Kri65wqCz50/55ao9w9wv2P
	M6TSOiGAj5K9zJbgUD0dH/347SA8A1HfQpy/8fpUElh0i3RHxoLwA/WyFj22VHVnHNY0
	nqeufwfUE7Z6hOYypj5p4L1K2ZUe9RS6Vm4S8=
Received: by 10.229.222.8 with SMTP id ie8mr5516454qcb.106.1285582608309; Mon,
	27 Sep 2010 03:16:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.22.2 with HTTP; Mon, 27 Sep 2010 03:16:28 -0700 (PDT)
In-Reply-To: <AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
References: <1285347950-27040-1-git-send-email-fahad_usman@mentor.com>
	<4CA063A4.90608@freyther.de>
	<AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Mon, 27 Sep 2010 12:16:28 +0200
Message-ID: <AANLkTimcPMXmC6KgnJmxayJ+6_M3xsEwZZTf9DH2TOhb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Mon, 27 Sep 2010 10:17:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Holger ,

I just wanted to ask if with your Qt4.7 commits you could look at
automoc-nativ which did not build the last time I tried (i.e 3 weeks ago)
and if it could not be provided directly by Qt packages . (I don't know if
it is possible)
Thanks!

BR

Sylvain ( aka GarthPS)


2010/9/27 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> 2010/9/27 Holger Freyther <holger+oe@freyther.de <holger%2Boe@freyther.de>
> >:
> > On 09/25/2010 01:05 AM, Fahad Usman wrote:
> >> * Converted do_stage to do_install.
> >> * Added NATIVE_INSTALL_WORKS = "1"
> >> * replaced QMAKE_MKSPEC_PATH (which is defined in bitbake.conf) with
> ${D}${datadir}/qmake as discussed on irc
> >> * Bumped PR
> >>
> >
> > Hi,
> > is qmake-native still used by something?
>
> Apparently yes:
>
> qt/qt-x11-free-native_3.3.5.bb:DEPENDS = "qmake-native x11-native"
> uicmoc/uicmoc3-native_3.3.5.bb:DEPENDS = "qmake-native"
>
> grep also gave me these:
>
> dcop/dcopidl2cpp-native_3.5.8.bb:inherit native qmake qt3e
> dcop/dcopidl-native_3.5.8.bb:inherit native qmake qt3e
> opie-i18n/opie-lrelease-native.inc:inherit native qmake qt3e
> opie-i18n/opie-lupdate-native.inc:inherit native qmake qt3e
> sip/sip3-native_3.10.1:inherit qmake native
> sip/sip3-native_4.0.1.bb:inherit qmake native
>
> didn't peek into qmake.bbclass to see whether it drags in qmake-native
> one way or another.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

