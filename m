Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ooy1Z-0006Tf-QW
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:27:16 +0200
Received: by iwn2 with SMTP id 2so2488561iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jDoJ5BjV07O8r3KJcrQXOS/4zLD8LnXYtZL/ZUtwpKI=;
	b=ecI+/a67Ig+ADiNqt4KmQv9YwKvPGpwQZkecT1a8UW5H414QVWXwLlSoUSyiw1XhYV
	fHcJnrQaPk8HpigrfCRIQblKZFbfM9Eww40fv8VKSwT7Ahr9v2Qrzin23hg9+1tfFxGV
	DdXrlYFjlofUY83cDGK8SwdHiY7we+rf9POrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=smLo0YQptxRc5u7CJJatUmEbFe3ZAO/STc7f1Y6FJ2yJbJxgEGn7oLmRutDz1HLfm4
	Cmzn2fRkViTUm1I6b23Ql8DIah+Ra/gqOTrKm/03ajJeUxJNed4Tmh9GMlaiGPb9knby
	VbeNuvE/UqM/RzzHVUxdgI7U9IcptgZQzO34o=
MIME-Version: 1.0
Received: by 10.231.80.213 with SMTP id u21mr1030577ibk.173.1282911998883;
	Fri, 27 Aug 2010 05:26:38 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 05:26:38 -0700 (PDT)
In-Reply-To: <1282911442.13038.166.camel@mill.internal.reciva.com>
References: <AANLkTimHJqkoxBAhBo=HJDqC=joPovjO6joi2sXiLJHM@mail.gmail.com>
	<1282911442.13038.166.camel@mill.internal.reciva.com>
Date: Fri, 27 Aug 2010 14:26:38 +0200
Message-ID: <AANLkTik3o52babGkXESeY5-_myv_5nZ2Xc4HFvB6OaGq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: lemon install
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
X-List-Received-Date: Fri, 27 Aug 2010 12:27:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Phil Blundell <philb@gnu.org>:
> On Fri, 2010-08-27 at 13:48 +0200, Frans Meulenbroeks wrote:
>> A .c file that is copied to bindir?
>> I know this is a parser, but I would expect .c files to be placed in a
>> different location.
>> Can someone shed a light on this?
>> Or, even better: fix this?
>
> That does look fairly bogus. =A0Debian ships that file in
> ${datadir}/lemon/lempar.c and I guess that would be a reasonable
> precedent to follow.
>

Seems fine with me.
The issue is, I do not know lemon, so not sure if a patch is needed to
find the file in ${datadir}/lemon.

Frans


