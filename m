Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Nbyvb-0006S4-G8
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 17:15:10 +0100
Received: by fxm4 with SMTP id 4so242295fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 08:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Hxzf1ZtLTsdFJiXqd+6gYukbZgw9IuSoBenQYOdpKsg=;
	b=egCc4s9DKImLejmZ5m1xnt4SeSPynb2jLDOSzzFgmaDr2doLBFaXbW9L+O0hENWX86
	vuHyuNAafi5h01zeS8sEpijrMII4Deb11fjFRMRKwXj92Pi8LymFROAdayEy1YRuXL/T
	Gruv7Er4wpwNx9TrbzM0pnhYFfquwfWVvRog0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=oEvaHDGzp5wsYGcKfu6uGC6og2vUU/jI2B9WOrBQ/GwDHiAYbz/TtY4jmRucyHKk7U
	yQ5aSAt1s+yz2g2s7kYzClgdGxaMN4U01P3RB0PL8PxfJ4LzuE7tbltuQZQX7sJiUfli
	+Zzv8GJNMF6gYowjEi/aQ1N3S9Wos+DS1EotY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.165.72 with SMTP id w8mr733012hbd.8.1265040761286; Mon, 01 
	Feb 2010 08:12:41 -0800 (PST)
In-Reply-To: <1265028954.3777.317.camel@mill.internal.reciva.com>
References: <1265011036-9086-1-git-send-email-raj.khem@gmail.com>
	<1265028954.3777.317.camel@mill.internal.reciva.com>
Date: Mon, 1 Feb 2010 14:12:41 -0200
X-Google-Sender-Auth: b4fd49af955733ff
Message-ID: <be7a9f3d1002010812id8428d8x4176503e98f23501@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][RFC] gcc: Restructure package creation.
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
X-List-Received-Date: Mon, 01 Feb 2010 16:15:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 1, 2010 at 10:55 AM, Phil Blundell <philb@gnu.org> wrote:
> I think it might be better to unbundle the libraries from gcc{-cross}
> altogether, and put them in a new recipe called gcc-runtime or
> something. =A0Having them built as part of gcc-cross seems to cause a
> certain level of headache for people who are using external toolchains;
> this happens already with libgcc and libstdc++, and I suspect your patch
> will cause the same issues to start popping up with the other libraries.

Indeed; for a outsider the gcc-cross looks like the really basic stuff
needed; not libraries and like.

> Or, even better, put the different language runtimes in separate recipes
> so that folks who want to use Fortran can build those libraries without
> everybody else needing to do so.

That would be really nice and could speedup the building time a bit.

Cheers,

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


