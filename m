Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1ND058-00005B-Q5
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 19:25:45 +0100
Received: by fxm8 with SMTP id 8so7173319fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Se1W1H+us4vOG9M08o3FUU4unYgRUAJ69VJbZBee1Hw=;
	b=qvtY7K0dR6fIc3MyNeprJBwSGKkXxGa5IeDmsHuU+7pOUCrW01g6bgrhB4CUsp4GWa
	MTJ7372dnXYi/cSth1IMyqfgpQf2b1kyHpNnLrriZIPMajbGP5LGJDkwWFtmYwbiob+r
	PE/ovoEYqwrmU/Pp9MVUuOrXwOh3zD5QVuflU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lnxcJLCryPyxPghja/Y/9ZCtvosSRteoUNvkE3AUF43052+5UEuSBiqAGhxYHyEiSW
	nDeY+AIj+u19MX2zHM7AZK8lWjpXPHLWptvSrWKB+V26XyI76EZSsL6Q98s0Io04fdx6
	kDV80PMwVO+PV6Sjxlz2f2y5C2NJ1LEjS60Do=
MIME-Version: 1.0
Received: by 10.216.87.133 with SMTP id y5mr2118503wee.139.1259087053869; Tue, 
	24 Nov 2009 10:24:13 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911220719570.13278@localhost>
References: <alpine.LFD.2.00.0911220719570.13278@localhost>
Date: Tue, 24 Nov 2009 13:24:13 -0500
Message-ID: <f96d234e0911241024h3d9d4ed3i63b63bf657982a41@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: more observations on the usermanual dir and docbook translation
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
X-List-Received-Date: Tue, 24 Nov 2009 18:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2009 at 7:25 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =A0since i've done a fair bit of docbook processing, i took a quick
> look at the usermanual dir, and here's another observation from the
> README, where it reads:
>
> =A0For html and xhtml you need xsltproc installed.
> =A0For the other you need docbook-utils installed.
>
> at least under fedora, that's not all -- you'll need the
> docbook-utils-pdf package as well:
>
> $ rpm -ql docbook-utils-pdf
> /usr/bin/db2dvi
> /usr/bin/db2pdf
> /usr/bin/db2ps
> /usr/bin/docbook2dvi
> /usr/bin/docbook2pdf
> /usr/bin/docbook2ps
> /usr/share/man/man1/db2pdf.1.gz
> /usr/share/man/man1/docbook2dvi.1.gz
> /usr/share/man/man1/docbook2pdf.1.gz
> /usr/share/man/man1/docbook2ps.1.gz
> $
>
> =A0not sure what the situation is under other distros. =A0also, the last
> time i looked, most output formats can now be generated with no
> reference to SGML or DSSSL or jade, but i'd have to go back and verify
> that. =A0(pdf output can be generated using fop.)
>
> =A0if no one else wants to handle this, i can start putting together
> patches to bring that directory up to date as long as i can do it in
> bite-size pieces.

If you want to send patches, and I'll try to test and make sure they
get committed.

Thanks,
Cliff


