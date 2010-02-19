Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NiX5x-0005DK-IT
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 18:56:56 +0100
Received: by iwn10 with SMTP id 10so917469iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 09:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DC7Y0sxEVXMZjZ9wjDr5B046BQlUTfCmAuJNJ3zmz3E=;
	b=mw2yCnO+yJkVhBvCb9lBSVTNllrohs+zxBQt3TYHs4AY68Mw+EzNkfd8XLWaLI9VLZ
	1tupWxFRFyItirD0+YpYd+lCqXTAVoqhI01GNBv8ghIQo4yrtpj4V81j/xMFV6lQYGVS
	cyqYe+QMUb9D7334Mg+k+F8UY+j1Mcsr+fPc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FkwVJYr8bAmwt/cVYV8BSgzQ1VIC0NtOmwMq4QVJS7v3w96V8CkNtZ4dn6mIWGm8Wu
	DETSyhKveKnHFNPokj+2Vm4mzuCZJ/wYt8t+iBKVEdnwyGK3zdGvrmN8MOWDTTAAFc8X
	oQGo8oq76plAI/cS2W9wGHWC5s5kCT0TpSaP8=
MIME-Version: 1.0
Received: by 10.231.146.66 with SMTP id g2mr119150ibv.60.1266602050558; Fri, 
	19 Feb 2010 09:54:10 -0800 (PST)
In-Reply-To: <201002190832.06903.ml@vdm-design.de>
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
	<hl9u05$48d$1@ger.gmane.org>
	<19c1b8a91002181628w7a30333an148bc00cb687ca36@mail.gmail.com>
	<201002190832.06903.ml@vdm-design.de>
Date: Fri, 19 Feb 2010 09:54:10 -0800
Message-ID: <19c1b8a91002190954kf95fb4s5c4a4ff445ab2694@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc:
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
X-List-Received-Date: Fri, 19 Feb 2010 17:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2010 at 11:32 PM, Thomas Zimmermann <ml@vdm-design.de> wrot=
e:
> Am Freitag 19 Februar 2010 01:28:57 schrieb Khem Raj:
>> On Sun, Feb 14, 2010 at 2:37 PM, Koen Kooi <k.kooi@student.utwente.nl>
> wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 14-02-10 23:33, Florian Boor wrote:
>> >> Hi,
>> >>
>> >> Thomas Zimmermann schrieb:
>> >>> * ldd has shebang #!/bin/bash: so add bash RDEPNDS
>> >>
>> >> last time I checked it worked with the Busybox built-in shell as well=
. I
>> >> wonder if it would be a good idea to verify this and patch ldd for ou=
r
>> >> purposes.
>> >
>> > like this:
>> > http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/glibc/=
gli
>> >bc-2.4/ldd-unbash.patch ?
>>
>> or patch posted in http://sourceware.org/bugzilla/show_bug.cgi?id=3D832
>> it lets it work as it is if shell is bash.
>>
>> Thx
>>
>> -Khem
> I tried ldd today with busyboy and it was enough to replace just the sheb=
ang:
>
> --- /usr/bin/ldd =A0 =A0 =A0 =A0Fri Feb 19 08:27:44 2010
> +++ /usr/bin/ldd =A0 =A0 =A0 =A0Fri Feb 19 08:27:51 2010
> @@ -1,4 +1,4 @@
> -#! /bin/bash
> +#! /bin/sh
> =A0# Copyright (C) 1996-2008, 2009 Free Software Foundation, Inc.
> =A0# This file is part of the GNU C Library.
>
> I think this is because we have in eglibc:
>
> if x=3D`set -o` && test "$x" !=3D "${x#*pipefail}" && set -o pipefail ; t=
hen
>
> and the second term fails, so set -o pipefail is never executed.

yes thats right.

>
> I will resend this patch.
>
> Thomas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


