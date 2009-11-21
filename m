Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NBuOW-00027M-SU
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 19:09:16 +0100
Received: by ywh26 with SMTP id 26so3801913ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rVu6VyQtItet+onqbF5sXHXWDPiBDEC4hk/35+3aBCM=;
	b=dxyi99H11ykA00eXKOhW55raon1eiRxbDLc/s6I2n1/Senk1y0Cdwyp0kynChb29bD
	FQaMqlrdjdMCrz+kDeKQR3jBgGfK9dNTJC7CYgycscVp3n7eUbI25aW11iiJh6BF+Hek
	Kk1PG4zblsEGfY9ZH0KeIeZVBiZCDrO94+rNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bhBeD8lskNz1G5o97Df3Em+fau2JH07eTPljeikPvhN2ALSp01SGxTLFiwhCr9GdRy
	d5J48SmFqbdH6/pewxfxwkX6rRqiRXlqdkouNXx1qKFrjRP86VscReFzfSYtBzesmq9U
	wcKeR+iDM9SZsrrATZHsKq5kzzrDgmKd0BQS0=
MIME-Version: 1.0
Received: by 10.101.182.20 with SMTP id j20mr3195676anp.65.1258826865851; Sat, 
	21 Nov 2009 10:07:45 -0800 (PST)
In-Reply-To: <4B082733.1060504@gmx.net>
References: <1258782956.5424.17.camel@gnutoo-desktop>
	<alpine.LFD.2.00.0911210112500.25956@localhost>
	<4B07F8F8.3060802@balister.org> <4B082733.1060504@gmx.net>
Date: Sat, 21 Nov 2009 19:07:45 +0100
Message-ID: <ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 18:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/21 Bernhard Kaindl <bernhard.kaindl@gmx.net>:
> Hi,
> =A0 indeed, the SDL_mixer-1.2.9.tar.gz has changed on
> http://www.libsdl.org/projects/SDL_net/release,
> so conf/checksums.ini is outdated, as it stands, and has to be updated:
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>
>
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 784a092..e1aac1f 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1099,8 +1099,8 @@ md5=3D0b5b91015d0f3bd9597e094ba67c4d65
> =A0sha256=3Da8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e=
0b6
>
> =A0[http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.=
gz]
> -md5=3Da9eb8750e920829ff41dbe7555850156
> -sha256=3D557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8=
d
> +md5=3D09eb4585f46d3527fe7fce8af8f9e591
> +sha256=3D7216a89d92327d2f0fe03e78f3c758a52be68c29daf8e971c226f4a3191e9ec=
0
>
> =A0[http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
> =A0md5=3De45b1048d2747480dcc65ece4130a920
>
> Philip Balister schrieb:
>>
>> On 11/21/2009 01:15 AM, Robert P. J. Day wrote:
>>>
>>> On Sat, 21 Nov 2009, GNUtoo wrote:
>>>>
>>>> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766=
]
>>>>
>>>> NOTE: The MD5Sums did not match. Wanted:
>>>> 'a9eb8750e920829ff41dbe7555850156' and Got:
>>>> '09eb4585f46d3527fe7fce8af8f9e591'
>>>
>>> =A0 that second checksum is, in fact, the correct one for that tarball.
>>> and the sha256sum in conf/checksums.ini also doesn't match the one for
>>> that tarball. =A0if that used to be correct, does that mean someone has
>>> replaced a tarball with a different but identically-named one?

Before committing this patch I would suggest comparing the new and the
old version to find out what is actually causing this and what has
been changed.
If we just blindly change checksums we might as well abandon them.
Also note that a change of the checksum means that everyone who has
the file in his/her download dir will get a checksum error.

For now a nack from me.

As this already happened before recently (perl twig) I suggest we
adapt a policy for this or maybe some automated removal (e.g. if you
have a file in your downloads dir with a checksum in blacklist.ini
that version is not used but removed or parked aside or something like
that).

Frans


