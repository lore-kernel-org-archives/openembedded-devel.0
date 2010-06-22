Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OQwak-0002KS-IW
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 08:04:16 +0200
Received: by wwb22 with SMTP id 22so6612wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 22:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Cb57zbyeKCqSRb3arJ4X3/U3b4n+t0vibzUsb/afXH4=;
	b=PSCcYATtclRPbP62dakR+XolmLoRGS9mwfYOrp1RA1ScSqjGy/G9Y4QCjjQ323CEoR
	VSRe/jJAJSpztGqQCFlThB6nYOu8CBv5vQlLDTKOVBBbGmHnIZ5u1OMZ7NlilO6MS1Vb
	3YhXS8vRaCy1SAYdc0EndtcyTED6MtCZXTBio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e5aJ3nk8bPKPlzGhR+NXKy5BauQ/fo/mO+qtjtF/cuPcMKSSi4zACFBTW6xSwCLRHc
	5IEFrBtfi3RAdKVBynF9dHT+Sm9+19s2RKJamG/fqI0WwJjFDr8YgLFEGeTxZuviMHSA
	OBzX/9D8jwzfx2tiYSRyP1f751jP3SdSKvpHA=
MIME-Version: 1.0
Received: by 10.216.85.71 with SMTP id t49mr951534wee.19.1277186379475; Mon, 
	21 Jun 2010 22:59:39 -0700 (PDT)
Received: by 10.216.17.136 with HTTP; Mon, 21 Jun 2010 22:59:39 -0700 (PDT)
In-Reply-To: <1276814379-13161-2-git-send-email-raj.khem@gmail.com>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
	<1276814379-13161-2-git-send-email-raj.khem@gmail.com>
Date: Tue, 22 Jun 2010 07:59:39 +0200
Message-ID: <AANLkTik6QLxTLQgYZaLpucQaU8etYax-invJna3D5kp_@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox_1.15.3.bb: Work around the gcc 4.5 ICE on thumb
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
X-List-Received-Date: Tue, 22 Jun 2010 06:04:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Fri, Jun 18, 2010 at 12:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> +# gcc 4.5 has this bug on thumb
> +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
> +# so add -fomit-frame-pointer
> +# this will be removed once the above bug is fixed.
> +
> +
> +CFLAGS_append = " -fomit-frame-pointer"
> +
Can we make this append conditional for ARM-only or even thumb-only?

In all cases:

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


