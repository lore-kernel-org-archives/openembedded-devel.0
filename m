Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PrXv2-0000Ft-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 16:43:24 +0100
Received: by eye27 with SMTP id 27so215484eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Lp4wa8uh0BeUrVnELsjurWbs+IB6jF7Yha2XRXgkK9U=;
	b=gdQvq23d3IrB6B6Z/UcNI/BY5a+5vZ1ijWxb0JCFlkqjKbmBUg1yS7nA2UxsSQ7jGK
	xA6+al2Gp9xxN1LXApWI4/8RymN7vHZ12js0orUPq5FiFnZI2ry2AeNa24Eqt9q8OQ38
	2NDR1eelHKESq1a69vxJakvNETfFRQQTSF7PM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=RMGScsWx35XFwjRjHMiE9qoSgdWbcKuWUvAsgr3k9Q8rBeUOoZ8GSS4/GtdsSCZhzz
	lN+uKexYW0ZRALp/AAkLX8FKrEEGiJ1v5YTW4wzswc3MXtJjpBk/GbcBsgYwGdrmJ51r
	eNcQEbR50OChZb6UrwocPyx4WUm7dpkSaVXcI=
MIME-Version: 1.0
Received: by 10.223.101.131 with SMTP id c3mr2020577fao.5.1298302900569; Mon,
	21 Feb 2011 07:41:40 -0800 (PST)
Received: by 10.223.108.83 with HTTP; Mon, 21 Feb 2011 07:41:40 -0800 (PST)
In-Reply-To: <1298301152.2178.375.camel@phil-desktop>
References: <4D5E45C1.7010504@opendreambox.org>
	<1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D5EE9A9.10205@mentor.com>
	<1298301152.2178.375.camel@phil-desktop>
Date: Mon, 21 Feb 2011 16:41:40 +0100
Message-ID: <AANLkTim7XbP9Oe6TFRmOWd42m7iZJu8dGMvoW16zJrxA@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package_deb.bbclass: armel architecture name for eabi systems.
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
X-List-Received-Date: Mon, 21 Feb 2011 15:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 21, 2011 at 4:12 PM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-02-18 at 14:50 -0700, Tom Rini wrote:
>> I'm a little puzzled. So little endian gnueabi ARM is armel, little
>> endian OABI ARM is arm. =A0What about big endian ARM cases? =A0Thanks!
>
> Debian has never had big-endian ARM as an officially supported
> architecture, so to that extent there's no precedent to follow in this
> area.
>
> The natural name for a big-endian gnueabi port would obviously be
> "armeb". =A0That does leave big-endian OABI somewhat out in the cold but,
> given that OABI has been obsolescent for the best part of a decade, this
> doesn't seem totally unreasonable. =A0If anybody did want to use dpkg wit=
h
> such a thing (and wanted to avoid colliding with armeb) then I guess
> they'd have to name it "armob" or something.
>

adding some history here:

<quoting Lennert Buytenhek>

> It's not so unusual anymore since intel introduced the IXP series
> of chips which come with mostly BE oriented reference designs.

The nslu2 itself comes with an ixp4xx CPU, but the armeb port is also
used on a number of ixp2000 boards. Having a big-endian arm distro to
run on the ixp2000 was an important reason for developing this port.

As to why I chose armeb instead of armbe, partially because of the
-EB/-EL thing, partially because the arch name also has the endianity
at the end (armv4b, armv4l, armv5teb, armv5tel), partially because when
I first started porting a distro to armeb, a number of tools (binutils?
I can't remember now.) did accept arm*b-*-* as target string but didn't
accept armbe-*-*.

The latter might have changed in the meanwhile, but the original
decision to use armeb instead of armbe was made over two years ago.

cheers,
Lennert
</quoting Lennert Buytenhek>


Please note that there have been lots of issues with armbe (in
configure scripts etc), so I would recommend using armeb.


Regards,
--=20
Leon


