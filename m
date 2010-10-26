Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAeId-0001vj-VE
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 09:50:29 +0200
Received: by qwd6 with SMTP id 6so2276380qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=z7B35uSQqvZmam/MzXSPEvXM8nTlAXBqcSq78RDgKdc=;
	b=RJ8BAHO6Jk9NMQ7yuJN9vEYUna9O8teOvA3jaaJOzd49L2su2FLXkY3PJxBYO5jPJg
	ejvXkL/FD1s67v3p29cbZXnFcndSTtb0v29lmWCp4UJWQP14wziL6nf6POHIMR3gxHWa
	YacaNm2DC0S8UEjZr6ia+lkBo7KIVZm/1JzYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FPUOlXkqRdo0I+FBYoFY2cHsQ3QHJxkj3Gu2Pz2y7mZtuSBNzOTAlZENiylirdiMvR
	+9duJv2NRLlRahlB1KpdFYgDaZeX8phrKeiIjD600X4VihCOlLjEyJUSeN3Vp1/LjH56
	DYog0v30sdag98LkvXiSg/W2xYnLW1AEkvgK0=
MIME-Version: 1.0
Received: by 10.224.196.138 with SMTP id eg10mr1131489qab.80.1288079385921;
	Tue, 26 Oct 2010 00:49:45 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Tue, 26 Oct 2010 00:49:45 -0700 (PDT)
In-Reply-To: <20100528052720.GA15949@gmail.com>
References: <20100528052720.GA15949@gmail.com>
Date: Tue, 26 Oct 2010 09:49:45 +0200
Message-ID: <AANLkTi=wO9jS-U8GZtnpHwbmb9Kmw-TvJY975wq2hnu-@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: <package>-static name conflict with some recipes
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
X-List-Received-Date: Tue, 26 Oct 2010 07:50:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

BUMP

only a few recipes remaining.
First question is, are those -static really needed? If so, then please
propose a renaming.

Regards

Andrea

On Fri, May 28, 2010 at 7:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I have seen that we have parallel recipes for some applications for static
> build
> called package-static.bb like below
>
> ./dialog/dialog-static_1.1-20080819.bb
> ./busybox/busybox-static_1.2.1.bb
> ./busybox/busybox-static_1.11.3.bb
DONE > ./kexec-tools/kexec-tools-klibc-static_1.101.bb
DONE> ./kexec-tools/kexec-tools-klibc-static_2.0.1.bb
DONE> ./zaurus-utils/nandlogical-klibc-static_1.0.0.bb
DONE> ./klibc/klibc-utils-static_1.5.15+1.5.16.bb
DONE> ./klibc/klibc-utils-static_1.5.18.bb
DONE> ./klibc/klibc-utils-static_1.5.15.bb
DONE> ./klibc/klibc-utils-static_1.5.bb
DONE> ./klibc/klibc-utils-static_1.5.17.bb
> ./skype/skype-static_2.0.0.72.bb
> ./udev/udev-static-devices.bb
> ./udev/udev-static_124.bb
>
> Now they conflict with the automatic package that we generate to bundle
> static libraries. Since the the packages which bundle static libraries
> are essentially development packages may be they should be called
>
> <package>-dev-static instead of <package>-static
>
> IMO that will avoid the conflict and also clarify the package content
> a bit
>
> Thoughts?
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


