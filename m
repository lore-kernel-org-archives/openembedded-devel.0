Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTfFN-0000DL-37
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 20:09:25 +0200
Received: by fxm12 with SMTP id 12so995288fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=F3nrOt7YEkCV3MlQ67IMYRJUikbR4xiHmZY0O58sDQo=;
	b=ED+E0+ucWRjmPejx+++28o4juXfJvkKYbA3UZtVP/gti6oVCAF143S5mHFkqIdFHyP
	wb9pLqyaS8yMvGSnDuklpKsUbVMUBquU3ajhGKycTlAvUvybDULIdyhQuGuTt2klM8bV
	JCaTfTm3GgWB1sK9ND5P0ru8NfEa5k095BsTs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Bo8eeJHXivfBREyeH8OfHmG3k2O6dvUGJg0XrEyRo3b0PbpI3DujiJGpt5bcAVCj8u
	RZX8/neyillTWcdMTsMcdZ41e6yy9beLlYeEH5Rzay8FokZYCb5aVupDV6FR54b3w96y
	g9aAnABhwfkn8ITpYUbChbDQZYbGjQDqr+uFA=
Received: by 10.103.127.8 with SMTP id e8mr2425428mun.39.1277834681843; Tue, 
	29 Jun 2010 11:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Tue, 29 Jun 2010 11:04:20 -0700 (PDT)
In-Reply-To: <i0db6m$i2r$1@dough.gmane.org>
References: <i0db6m$i2r$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jun 2010 11:04:20 -0700
Message-ID: <AANLkTinUYu9iA2hbr7F6j1qFyIV9jF-pQWH4lsMneTmc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: realpath build breakage
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
X-List-Received-Date: Tue, 29 Jun 2010 18:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 29, 2010 at 10:40 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> ERROR: QA Issue with realpath: No GNU_HASH in the elf binary:
> '/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/realpath-1.15-r0/packages-split/realpath/usr/bin/realpath'
> FATAL: QA run found fatal errors. Please consider fixing them.
>
> Khem, would you please consider fixing that?

my bad. I tested it on mips and mips does not use gnuhash the arm
build was still running overnight
and it stopped at the very same error this morning.
fixed now with c86e303133eb530ea12a4e57cec5d3af62d141a0

-Khem


