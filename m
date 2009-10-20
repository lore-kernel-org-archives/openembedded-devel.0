Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0JT4-0002mz-2b
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 20:30:01 +0200
Received: by qyk6 with SMTP id 6so2392224qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=X/ryeaNxxImrNpl4VofEzOGK0XFF/dQUIqBMU02YWI0=;
	b=PSCao8bCVlS3kSTXvpXpLOZyiX037a1QcFiwWRXHK3Gc3Uq4N1PshnBG63VOb2b9FW
	FeOUp+SKU3AARln8fAF+LROJBQljhT0LgD7nALlCXmcLqJvSJpRiTlBfCFzCO2nKXt/1
	cI4MiwHGh43g7ce6qn6O9b6ZOKtglgNXPmQHc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UghK3yJYUWjtjjpAW6B2dRGkOLzkfaJAlzXZ9AgWNdPWXKep2Yo1i1Y5konG1J02lF
	zEdQhFc3zhP9tR9p3Y+fuw6IxU+r9L5AULe8tEWYRM4CDTQ1mkWwOSjgImQGVJxgcdqZ
	+XlZPXdRNvU7BQjfFseLsbCM4/3T1MWakVENE=
MIME-Version: 1.0
Received: by 10.229.31.147 with SMTP id y19mr1032294qcc.5.1256063336009; Tue, 
	20 Oct 2009 11:28:56 -0700 (PDT)
In-Reply-To: <4AD4BAD9.3080609@2mi.com.br>
References: <4AD4BAD9.3080609@2mi.com.br>
Date: Tue, 20 Oct 2009 11:28:55 -0700
Message-ID: <19c1b8a90910201128j220050b9q1eb981db99e1da91@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Unable to fetch bootsplash, uri broken?
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
X-List-Received-Date: Tue, 20 Oct 2009 18:30:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2009 at 10:37 AM, Jader H. Silva <jader@2mi.com.br> wrote:
> Hello all.
>
> I am unable to fetch bootsplash-native.
> From a quick look into BB's URI and bootsplash site, it seems it's URI has
> changed (from
> ftp://ftp.openbios.org/pub/bootsplash/rpm-sources/bootsplash/bootsplash-3.0.7.tar.bz2)
> to
> ftp://ftp.bootsplash.org/pub/bootsplash/rpm-sources/bootsplash/bootsplash-3.0.7.tar.bz2
>
> Even if I changed it's URI in bootsplash_3.0.7.bb and checksums.ini, I was
> still unable to fetch it.
> I eventually downloaded the tarball from this page:
> http://www.filewatcher.com/m/bootsplash-3.0.7.tar.bz2.110507.0.0.html
>
> Just want to know if someone else is having the same problem, I tested it
> only in stable/2009.
>

the note on the main webpage of bootsplash says that it has been
superseded by splashy. We do not have recipes for splashy yet for OE
but it would make sense to copy the tar
file into OE mirror.

>
> Att.
> Jader H. Silva
> Analista de desenvolvimento
> 2MI Tecnologia
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


