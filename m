Received: from [209.85.221.180] (helo=mail-qy0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MyRRY-0004Kr-9u
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 16:36:43 +0200
Received: by qyk10 with SMTP id 10so626382qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZOviMiQzyw1jtmWNNpXxDwV6W/i+O8+/JWTHPgott80=;
	b=DdGO68IS+GNUAwZ03AY76lbdDm0+LF6IFneOTm//kU27pf448/i7dcYDxJHvUHe1/n
	/9OsCXluGoj/50TyhHz5VQP0mnB9O2ssoFU5aZJfhgiFe7Wke1JJMVoXTRwZodjhWQ6S
	NzcDUeIvF8bI9XzVckh8ingmsCHFvP9PlMsIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=w9TofM+qxpg9wJBzTP0GfIcuHMOC75dCHgYiZKuvv6AOQw5kSwtDfK0C6+oJ6ZvG2o
	5gGrU8F4ecWTp5e3hXFiGeY6HIt8bxBvLyEk7WJbOSwnfcio2kMYocDHGnCzSK3VnIbL
	iovMDm8TDMaDk5ZwSWtThM6AeXDjNnvbOCYX4=
MIME-Version: 1.0
Received: by 10.239.182.161 with SMTP id q33mr13820hbg.41.1255617343161; Thu, 
	15 Oct 2009 07:35:43 -0700 (PDT)
In-Reply-To: <ac9c93b10910020328u79f48783of8f64a048484ee5a@mail.gmail.com>
References: <ac9c93b10910020010s10fc04fdy6da8c2696d412844@mail.gmail.com>
	<ha4c1o$s05$1@ger.gmane.org>
	<ac9c93b10910020328u79f48783of8f64a048484ee5a@mail.gmail.com>
Date: Thu, 15 Oct 2009 16:35:43 +0200
Message-ID: <c384c5ea0910150735g8a41d59p4c40f6109a22cb47@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.180
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build inconsistency (strip)
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
X-List-Received-Date: Thu, 15 Oct 2009 14:36:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, Oct 2, 2009 at 12:28 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Still the following is strange to me:
> I would expect
> /home/frans/oe/tmp_angstrom/staging/i686-linux/usr/bin/install -s to
> call the target strip (or maybe ignore the strip command).
>
No, AFAIK install is unaware of the preferred strip executable.

Some target architecture binaries can be stripped with the host strip
command (for example, this seems to work for x86->arm, but NOT
x86->powerpc).

One proposal (from me) was to patch core-utils to use env. var. STRIP
instead of strip.

However, the OpenEmbedded solution is to patch the Makefiles to remove
the "-s" flag from the install targets.
This approach is best as the stripping is then done neatly during
packaging the debug strip-off.


Regards,
-- 
Leon


