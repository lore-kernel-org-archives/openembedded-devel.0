Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NhhOp-00012u-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 11:44:58 +0100
Received: by ewy4 with SMTP id 4so2022876ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ikVm3lVDZl24kYoETF0Ul+W2IznTSAAmcAG5FG8spnA=;
	b=t+cmzotcj41R+EQKCYUY1VNPpHMY+Mj7OY+8JjQAtEUAdeNXgF1F2woiIqQW2uMnwm
	wPcvsZuPI/myurl6x0JiY+uqoiXZ8fXeDpP2oRqdyTCgZMYx4hgGS3Z/3sw1V92cjYYD
	SWAfM3A15a3OGecgBfNIl+8tMWmMXptMFCK0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RTOaCcdAjX9z9VOPEc9YS3GLZulwLDg62JSWCRhHYiMoDK0IqrUQwpItvtrYeWQfZB
	jbnvuyzOBFfmgkOGk+Fpl8BXeFJPTrzeGj6d0ztPtAKvaBIjb2HYUSe7bnMGPdPYIRoh
	1ezxDSUjTMeENwGsicnmoGVsGxKOmTd4Xpd8M=
MIME-Version: 1.0
Received: by 10.213.100.231 with SMTP id z39mr2559159ebn.39.1266403335728; 
	Wed, 17 Feb 2010 02:42:15 -0800 (PST)
In-Reply-To: <20100216204900.GH3233@jama>
References: <E1NhUHr-0004E5-VP@melo.openembedded.org>
	<20100216204900.GH3233@jama>
Date: Wed, 17 Feb 2010 11:42:15 +0100
Message-ID: <d1b08f941002170242oaee2f8by81de1afeced4c4f6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : kernel.bbclass: prepare for 2.6. 33 header move and simplify logic a bit
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
X-List-Received-Date: Wed, 17 Feb 2010 10:44:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Today I noticed that klibc is looking for some asm headers like
> asm/signal.h only in asm directory, but if there was only 2.6.33+ kernel
> built in staging, then there is no asm directory at all only ie
> asm-generic.
>
> Where this should be fixed? Created asm link ie here in kernel.bbclass
> or in klibc recipe (maybe newer klibc already looks also for asm-generic
> directory)..

Still awaiting the klibc-1.5.16 release, I'll try to commit

  [klibc] use headers_install to install headers

http://git.kernel.org/?p=libs/klibc/klibc.git

I'll just need some time to test against 2.6.2x and 2.6.3x kernels.

Andrea


