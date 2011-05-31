Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRNqw-0000tU-17
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 14:15:18 +0200
Received: by bwz5 with SMTP id 5so4090020bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cRTdLes++z7Sysp6gxCUsuzTvKD8DsmESSNwIblEvWU=;
	b=eYUsvER2+4lLh19QNGrmNdI4cv3xtoWUP8gv5I2+wsDY8/P9ycbi7ukOH31LeqOd7+
	J+M0YHPeB60kiYyHVMQVUTxMtHUKbA3BVYKpSTWbdw6Sc4EdvMNWlL3vnQfAUapGfiWr
	YC2YA6IchMe8/Pos7DmuG0VRCQLqQBO3jADD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=VvMZEOILRsz5XFZClfySnR+4ehPuewxD1dukpIKWBhKHuoLZNiiS7oDgSzCDPXt1NP
	YMZNR0bFSZ+f0nJD64j2vDrz9jQ8rV8az6QUGYI+kOvaEyvGVSZVp6kQuszIPV897HII
	ox1VsmxihiBvJgRDYF3E6MzV9KHwmanLfpaGQ=
MIME-Version: 1.0
Received: by 10.204.164.2 with SMTP id c2mr5615765bky.85.1306843920767; Tue,
	31 May 2011 05:12:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Tue, 31 May 2011 05:12:00 -0700 (PDT)
In-Reply-To: <1306836321.2525.478.camel@phil-desktop>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
	<1306767263-29895-3-git-send-email-otavio@ossystems.com.br>
	<1306836321.2525.478.camel@phil-desktop>
Date: Tue, 31 May 2011 12:12:00 +0000
X-Google-Sender-Auth: Au9-W8qkjzlDsYQG0tPaLWyg85c
Message-ID: <BANLkTinQRY_3oRpP1e39g6m9Bsy2NO2jYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/17] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Tue, 31 May 2011 12:15:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 10:05, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-05-30 at 14:54 +0000, Otavio Salvador wrote:
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 17a494d..5b0f639 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -150,6 +150,8 @@ QEMU_OPTIONS_armv7a =A0 =3D "-cpu cortex-a8"
>> =A0# default compression levels
>> =A0XZ_COMPRESSION_LEVEL ?=3D "-e -9"
>> =A0LZMA_COMPRESSION_LEVEL ?=3D "-e -9"
>> +GZIP_COMPRESSION_LEVEL ?=3D "-9"
>> +BZIP2_COMPRESSION_LEVEL ?=3D "-9"
>
> We had some discussion of this patch last time you posted it, and I
> thought the outcome was that you were going to put these bits someplace
> other than bitbake.conf. =A0Am I remembering that wrong?

You're not wrong but I'm not focused on regular OE since we're moving
to OE-core and thus I just resent those so someone could pick those
and merge if fill they're useful.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


