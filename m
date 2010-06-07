Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OLjzP-000088-N4
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 23:36:13 +0200
Received: by pxi14 with SMTP id 14so1247278pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 14:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=PFFx0HEbcFOMrJsSO8zgy/j2QTJhd8fc0Uy/WLWdoz8=;
	b=enjgRC8MG1HhWsG1SQb+kVtlw0TUAM7jyZne1gSTnDYWwK+7XNYmsMct2XYTAn9qMf
	M5/QNkxUu0x/PkqTtQdwfnEnILrAswh+i9hsSnvFdWvYAqypcjAWbNpzNodo1vPqMdfk
	lMnK/B7H6Rsn3fLkpPxnpgvsu9qb+dYHfIZR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Zy8GdFbcQx7C8HUCmobaTpvSyzREznN1hQWx3J7FOrR9ciKEugqBYfLlJ2c/z934X5
	ZvqNGX0DYuMLkQouNGql8Dli49xuzWYEf3WRk3H/M2wEH4QcwLXO9XLRfH2Lub/+a3gr
	pExm4ELPl7TFMoiFLR6Eqx3P4sLmr2fS3WB40=
Received: by 10.142.150.37 with SMTP id x37mr11293715wfd.97.1275946310465; 
	Mon, 07 Jun 2010 14:31:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.211.2 with HTTP; Mon, 7 Jun 2010 14:31:30 -0700 (PDT)
In-Reply-To: <AANLkTil8i1-1ie4msx9B09WeJ5ggquP7WisRIyWKMUpx@mail.gmail.com>
References: <4C0D498A.4030709@mentor.com>
	<AANLkTil8i1-1ie4msx9B09WeJ5ggquP7WisRIyWKMUpx@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 7 Jun 2010 14:31:30 -0700
X-Google-Sender-Auth: KZjFovvwqeeuCiVj2nVqmzx6oAg
Message-ID: <AANLkTil27vjcFzRuEIAZp6rEYY7xq2_ozqdU_QdjtEWI@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Mon, 07 Jun 2010 21:36:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 7, 2010 at 2:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jun 7, 2010 at 12:33 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > On some host distributions the provided linux kernel headers are too old
> > to compile utilities we need[1].  Given that we need these utilities to
> > run things on the target the best solution is to provide
> > linux-libc-headers-native.  Rather than get things into an inconsistent
> > state, we make linux-libc-headers-native be a default dependency.
>
> could it be made optional so people who use distribution where this is not
> needed are not penalized.
>

You mean like ASSUME_PROVIDED += "linux-libc-headers-native"?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

