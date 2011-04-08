Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q8AzI-0005jj-5W
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 14:40:32 +0200
Received: by bwz5 with SMTP id 5so2911739bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=j+5sodSpQTNKqVSZwML4STWquWpMtxAyzM0jaqX7fAQ=;
	b=bdPBHIRf7v8IBO1v8fwFv7YHtnDatdaaQJzVVhlNyeR8TQGL9s3y9NoCAUU1v1IJMF
	OlbXtQVvx1YzZcZVx+gS2SgrJB6HjdLTjn6SAQo6YRR/krw7demO+ibLUaxG745eRWr9
	cLVFVlBFre0WLDHBEYdTAMQ42dguNlfJrM62c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=wYx+jrdS+92v/uS5TWOJhi/5CQfTP4emgsTLSI2UlqKO7uAdmM9CRHzWcyuM6jw5BS
	EzcF/MVYcFUZEF/qAJ4S0m+U0bpf+BXczFBp+Zr07WNFXUeL5zYD3oFD/p/ihs2gDajE
	6O0HoiQupjZSc1A2NUBGvEnzdPJiGrOlJJNRU=
MIME-Version: 1.0
Received: by 10.204.45.226 with SMTP id g34mr55848bkf.67.1302266303201; Fri,
	08 Apr 2011 05:38:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.14.137 with HTTP; Fri, 8 Apr 2011 05:38:23 -0700 (PDT)
In-Reply-To: <1302265080.14449.513.camel@phil-desktop>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
	<BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
	<4D9E4D66.1000701@mentor.com>
	<1302265080.14449.513.camel@phil-desktop>
Date: Fri, 8 Apr 2011 09:38:23 -0300
X-Google-Sender-Auth: SJEBm8YbgRpm2nrvTWjf6LRe5zw
Message-ID: <BANLkTi=LZ-FT8O-wdS-ttecwWNDs06nOAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 08 Apr 2011 12:40:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 8, 2011 at 09:18, Phil Blundell <philb@gnu.org> wrote:
> There is a bit of a tradeoff for gzip, though I'm not sure you would
> notice it on modern hardware. =A0For bzip2 it's more significant; if
> you're bzipping large files (several GB) then the choice between -9 and
> -1 is quite noticeable even on a relatively powerful cpu. =A0I'm not sure
> you'd notice much difference with either gzip or bzip on a 32MB jffs2
> image.

It is noticible; I am doing images for some quite slow machine and it
does matter otherwise I wouldn't have done it.

> And for unzipping, my recollection is that the decompressor stages of
> both gzip and bzip run in more-or-less constant time irrespective of the
> settings that you used when compressing.
>
> So yeah, I agree, it isn't obvious that there is going to be much
> real-world benefit from tweaking these knobs for gzip and bzip2. =A0If
> someone wants that ability then fine, but ideally in a way that doesn't
> cause further metadata bloat for everyone else. =A0One obvious way to do
> that would be to put the default variable settings in the
> image-generating classes, rather than in bitbake.conf, so that they
> don't get set at all for the majority of recipes if you are happy to
> accept the defaults.

I agree its place is on the image class or another; this doesn't
matter too much to me if I have a place to change it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


