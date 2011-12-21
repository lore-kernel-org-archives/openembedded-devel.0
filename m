Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RdOlg-0005sF-Cb
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 17:11:48 +0100
Received: by qadb17 with SMTP id b17so4103860qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=f2LZcV8iLqE12k2xstlZMBPwfF2kih9y6Ua5N1RJbuM=;
	b=Kniabt/Ixip0iGJkkVG/KEYUaIhj/eP7Izx04kVBfKfNEKSwOUJNtnaDF9u2FJPLmc
	bWa5dcrmqFQ/kIpAWKRfFGAeURVll5YyiqCmwgN9yWkPSox8PGELMredMJ4FDY0D6mct
	qcVLCN3Yr9SHD2SOz9sWFBY2645SjPQYMgX1o=
MIME-Version: 1.0
Received: by 10.224.95.196 with SMTP id e4mr1668093qan.18.1324483482568; Wed,
	21 Dec 2011 08:04:42 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 21 Dec 2011 08:04:42 -0800 (PST)
In-Reply-To: <CAAJ_Y3kksFvP84YPNV0=oQE7x8XxH0-CoDq02eO-MsODi_2B0g@mail.gmail.com>
References: <CAAJ_Y3kksFvP84YPNV0=oQE7x8XxH0-CoDq02eO-MsODi_2B0g@mail.gmail.com>
Date: Wed, 21 Dec 2011 09:04:42 -0700
Message-ID: <CA+M6bX=sR9QVCM7AmqQY-xY74Tp-y9iebQsg3L_E1rGDsJR6ZQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Wed, 21 Dec 2011 16:11:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 7:16 AM, Christopher Sarra
<chris.sarra@gmail.com> wrote:
> Hi All,
>
> I'm writing to ask about a recent thread I saw about problems with OE
> fetching fakeroot 1.15.1. I'm new to OE and BitBake, and I'm having a
> problem similar to what I saw in that previous post:
>
> <<
> NOTE: package fakeroot-native-1.15.1-r0.0: task do_fetch: Started
> ERROR: The checksums for
> "/localhome/cwsarra/oe/sources/downloads/fakeroot_1.15.1.orig.tar.bz2" di=
d
> not match.
> =A0MD5: expected "248c408b1e06e776c5739871b49bd968", got
> "c33f8b2be5bfafc0258efb8139cc5972"
> =A0SHA256: expected
> "45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a", got
> "92ed10b39922bb2890ef7cc7512fdfe57bd2d1f54a894364518b292f79455138"
>
> NOTE: package fakeroot-native-1.15.1-r0.0: task Fetch failed:
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar=
.bz2checksum
> mismatch.: Failed
> ERROR: Function 'Fetch failed:
> ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar=
.bz2checksum
> mismatch.' failed
>>>
>
> I read through the proposed patches, but I'm still not clear on which fil=
es
> I need to edit to work around this issue. There was a fix proposed for th=
e
> fakeroot_1.15.1 recipe file, but that didn't seem to work for me. Can
> someone tell me which [additional] files I need to update?

If you just do a git pull it should all be working again.

--=20
Tom


