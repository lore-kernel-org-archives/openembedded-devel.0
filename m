Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7t3w-0000RE-1s
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 19:32:08 +0200
Received: by wye20 with SMTP id 20so2620129wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1UDMrb51U2fHlkI3kroTzTFy7dWiF1qygB37WfTxf6k=;
	b=u0TWBjHa2T5YhberoYwBHMFi4RWAGYCYj8wcszZQHhGH3cLOhkW5kz6kFH/W+V38EI
	yAQpmmoQL1QUQA24Fk1ftWcZ6oOjUGmCIzp//fHXl+EozMKf/mBinJcUvMgSMnhyG6tV
	PkH1dpCPsb/sIINb6DC6bfYV0vFefEO1qKxMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=hd4Evzm8DS5GBvoolcSJb4ssOwsDbDNU6h/UD6NM2nLYq5mPdHr6NpbFXn8EA2YcW6
	3FS+1pVLpd1ehOj81fTNWFhUpakALBf8K4ODJwzbnv/AiVc+L+6oQyeZ4VYy8qkPpPzE
	5aKwWFFI+ur1ru/hngLKI45u4T0Ri7ob51oU8=
MIME-Version: 1.0
Received: by 10.227.42.137 with SMTP id s9mr1226247wbe.8.1302197399569; Thu,
	07 Apr 2011 10:29:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Thu, 7 Apr 2011 10:29:59 -0700 (PDT)
In-Reply-To: <1302196981.14449.444.camel@phil-desktop>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
Date: Thu, 7 Apr 2011 14:29:59 -0300
X-Google-Sender-Auth: SF-PoIERsP5EHELuyD8JeUyMJCY
Message-ID: <BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 07 Apr 2011 17:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2011 at 14:23, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
>> =A0XZ_COMPRESSION_LEVEL ?=3D "-e -9"
>> =A0LZMA_COMPRESSION_LEVEL ?=3D "-e -9"
>> +GZIP_COMPRESSION_LEVEL ?=3D "-9"
>> +BZIP2_COMPRESSION_LEVEL ?=3D "-9"
>
> It seems a bit sad to have to keep adding new vars to the global
> configuration set (and hence parse them for every single recipe) every
> time someone wants to tweak a new compression format. =A0Can we not just
> have a single IMAGE_COMPRESSION_LEVEL that does for everything?

For me it doesn't matter; I can add it if preferred.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


