Received: from mail-ew0-f166.google.com ([209.85.219.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <niko84embedded@googlemail.com>) id 1NIMrZ-0004Om-Sw
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 14:45:56 +0100
Received: by ewy6 with SMTP id 6so4312265ewy.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=jzwqY0srFZnHK/SghhFo2nyrLHtD+tVdoSxhueExUsA=;
	b=KdVLIRY9RcrmCgVtJinUyc9elKQKTMctgQ/FiudlsqDtrR/0ivlf2m8U4YzCHZjm+u
	/nIPAoOnPgenatNMvF53txb7TfIxyzyq5oPudWHn90MZQ6LumXAeIx9UZDuAY/6qGt71
	XHmO7Ld1GUC1wCFKYsSgplT5XEoA2nt2psGrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hJKHgcKA/vXXp3Z15xZZLyA5KElCJk78yd/K0gl42sfvHXDR7jzCfrGl03DdnXCpWv
	RW0DyCJDRuzrUk6hI+tZgitGsdsxRV+1DVN4IU+ueVBOg+s1fUKUx0eFnr+yrviWOI6V
	7wVBYWNmAwd1iEET0fHax8X/EhE2yUFM1peK0=
MIME-Version: 1.0
Received: by 10.216.91.20 with SMTP id g20mr3437442wef.94.1260366252433; Wed, 
	09 Dec 2009 05:44:12 -0800 (PST)
In-Reply-To: <4B1EC6FC.90207@soundmetrics.com>
References: <c1c0c07e0912081255r2bcb06c9mcf5485d478bad1dc@mail.gmail.com>
	<4B1EC6FC.90207@soundmetrics.com>
Date: Wed, 9 Dec 2009 14:44:12 +0100
Message-ID: <c1c0c07e0912090544v52ac1525ve37d4a59b6d056f8@mail.gmail.com>
From: Niko Lau <niko84embedded@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.166
X-SA-Exim-Mail-From: niko84embedded@googlemail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?UmU6IC4vZ251cGxvdDogY2FuwrR0IHJlc29sdmUgc3ltYm9sICdwbmdfcGFzc195c3RhcnQn?=
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
X-List-Received-Date: Wed, 09 Dec 2009 13:45:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I built gnuplot statically then it worked fine.
There is something messed up with my handmade rfs. If I switch completly to
oe it should work also with dynamic libs.
Thanks.

2009/12/8 John Faith <john@soundmetrics.com>

> Hi Niko,
> You might try 'strace gnuplot' to see exactly what's failing at run time.
>  Even if libpng is installed , you might get a missing symbol error for
> png_pass_ystart if you've built against a different version than what's
> installed.  I'd guess just building gnuplot in oe without first building the
> libs it needs is the root cause.  You could check your gnuplot build log to
> make sure headers from outside oe are not leaking in somehow.
>
> If libpng is left over from building your pre-oe target file system, you
> should rebuild everything using oe.
>
> Good luck,
> John
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

