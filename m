Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MBxSA-0000nW-5U
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 22:52:54 +0200
Received: by wa-out-1112.google.com with SMTP id j4so58118wah.12
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Jun 2009 13:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=E82GocotYoU5c1kiClgqwCITtFOLV8Sh9iE4JZQvcYw=;
	b=PTmuATnIuaLHJ+XSXBJ+pssHZE4VVnl72gCJ7/pRHlU201HzgDAgEDypsvaeUl14aE
	V24D8RH4Jbi6CJK5bfuLJWSn8h2nNgpO2xieZqIs0eQ7ot8m//Hg7PZ6iowwBTDcUZpt
	M5CX43e1yY6vj70MiuDhVmgtWZ+zwASJgnvGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=slXpIusqSnFWJrnwfDd5PLX+7uigwtkGGOMR35pws/7g5RnhP4oEZ4yuarmDNSR7aM
	oZCgytOpAJzQJ85841ZfcmiVAZsM+x3l6Otr0X4wq/dJd0g51wdyDOvz4Q8mcDK1DMSX
	TCyAU3ZVCmcKPAjeEyoNKBxO2t8UgnMRu32yA=
MIME-Version: 1.0
Received: by 10.231.36.198 with SMTP id u6mr355780ibd.29.1244061834466; Wed, 
	03 Jun 2009 13:43:54 -0700 (PDT)
In-Reply-To: <1244060602.5049.64.camel@lenovo.internal.reciva.com>
References: <4A26ACDA.2060806@kernelconcepts.de>
	<1244060602.5049.64.camel@lenovo.internal.reciva.com>
Date: Wed, 3 Jun 2009 22:43:54 +0200
Message-ID: <c384c5ea0906031343y49bf2bf7jef61480de3860471@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [RFC] gtk+ and gdk-pixbuf
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
X-List-Received-Date: Wed, 03 Jun 2009 20:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 3, 2009 at 10:23 PM, Phil Blundell <pb@reciva.com> wrote:
> On Wed, 2009-06-03 at 19:03 +0200, Florian Boor wrote:

> bundled with GTK+. =A0I guess the standalone gdk-pixbuf recipe was added
> to eliminate the requirement for building X and the whole other
> dependency stack that GTK requires if you just want the pixbuf
> functions.
>
Exactly.

The pixbuf stuff is still handy for framebuffer devices, but the
gdk-pixbuf recipe should not DEPEND on the complete X11 stuff.

Regards,
--=20
Leon


