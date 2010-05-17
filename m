Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE3bR-0002yj-Sm
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 18:55:43 +0200
Received: by ywh26 with SMTP id 26so2397926ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GTnducRNjGXJUhVrvyp4fJl8ZoqwJkR5l8eOGy37das=;
	b=s83W9EE2v2QilrRujERzwINYr3dM7rO1JrEC6J+yGtVTjcHQUlqndoB+rXL6XyMelu
	aYCl206tIIP4XjETHei7V817OzyFld5fa5KofBFsP1005SEzdmIHDDfRiKp/WmzTmOyu
	AFfKBhD8Hor9yl+XrOWptlONkrEPgW/YFVLes=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XHFRUlI9d/IdOzKfPMGEYYo3v3sDc97msbhxiRhVMBl/PuZRZ/KAVA+Cvhgpb+J1sS
	GHMOM11iwqpD1i2lazuzPpGDRM2/8WhYAEODmQr5c3qTXdrNuq8vMj/DIc2GVLfrWoxr
	+/v0aK8DeIZmEkvOXsrNl0pKfD6L5PDNa2wb4=
MIME-Version: 1.0
Received: by 10.101.156.18 with SMTP id i18mr5862442ano.180.1274115101863; 
	Mon, 17 May 2010 09:51:41 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Mon, 17 May 2010 09:51:41 -0700 (PDT)
In-Reply-To: <hsgbec$a9i$3@dough.gmane.org>
References: <alpine.DEB.2.00.1005121257070.3272@lynx>
	<hsgbec$a9i$3@dough.gmane.org>
Date: Mon, 17 May 2010 09:51:41 -0700
Message-ID: <AANLkTinjVnI2vk6VeF8q_n31Wt2ZFpqMme-8vq6yPH_C@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: on ubuntu 10.04, how to reset /bin/sh to refer to bash?
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
X-List-Received-Date: Mon, 17 May 2010 16:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2010 at 12:58 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12-05-10 18:58, Robert P. J. Day wrote:
>>
>> =A0 my first time setting up to build OE on ubuntu 10.04, and trying to
>> "bitbake fetch" complains that it's a bad idea for /bin/sh to refer to
>> dash. =A0fair enough, so since /bin/sh -> dash, do i just reset the
>> symlink manually? =A0or is there something more elegant? =A0thanks.
>
> And for the record: It's not OE (anymore) that requires bash, it's the
> software we build. E.g. GTK+'s libtool has bashisms. And there are a lot
> more.

I wonder how debian/ubuntu build them. I assume they should be using
dash as default
shell as well.


