Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NFBQ2-0005nQ-Mr
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 19:56:21 +0100
Received: by iwn32 with SMTP id 32so2261519iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 10:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uPPLykn0M+A95+QwpL6GHyy5FLIO0+KFAf8zfoh7mOs=;
	b=adQv1xwCw1idvZaeHnZtQZpQkAljcI6cAnFYwsbovQDbADzIDA3hrTB3ekbBryWgDy
	4QAqcl/h8cm+DA7Q49kbdAmLKlBLvlphRX45FI5x7FERTAlFI4O2DtFtwgtLqSscUaD4
	HaYw23bCej/gnDPzLrfe0esBHGWNoUOWNNRvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UMvu1YQbT7JOux6tcfRxkfgUXRQsEvxtU6EkZ00k7jCZHEBqmyiICOmBbMu5WHDkZv
	daF27vaOUcNu4AT+TXnjNb4cqLzUoAjPu5N9tybL2yPKGuiphXUzLgdrt+ZPp9KoOzWJ
	p05nlXHVVWVcnFb+gosLK6vrTlxkUZhuh3QZI=
MIME-Version: 1.0
Received: by 10.231.25.160 with SMTP id z32mr1897149ibb.5.1259607284136; Mon, 
	30 Nov 2009 10:54:44 -0800 (PST)
In-Reply-To: <1259504704.24812.2.camel@gregoire-laptop>
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
	<1259504704.24812.2.camel@gregoire-laptop>
Date: Mon, 30 Nov 2009 10:54:44 -0800
Message-ID: <19c1b8a90911301054j62ceed78jc58f99b26faf8939@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Boost compilation error
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
X-List-Received-Date: Mon, 30 Nov 2009 18:56:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 29, 2009 at 6:25 AM, Gregoire Gentil <gregoire@gentil.com> wrot=
e:
> Hello,
>
> I get this error when building latest of boost:
> http://pastebin.com/m6bb87892

The message says that the ELF machine headers did not match.  EM_ARM
is 40 and EM_386 is 3
so it seems your build did not use cross compiler for some reason. If
you were compiling for arm it should show EM_ARM
try to dump one of the file using readelf -h and check what it says for Mac=
hine:


> I'm on Ubuntu 9.10 with gcc4.4.

gcc version on host would not be of significance as the package should
be compiled using the cross gcc that
was built with openembedded build you did.

> The do compile is here:
> http://pastebin.com/m1822da98
>
> I didn't have such problem on Ubuntu 9.04.
>
> Any idea if I'm doing something wrong or if the latest commit on boost
> has a problem?
>
> Thanks in advance,
>
> Gr=C3=A9goire
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


