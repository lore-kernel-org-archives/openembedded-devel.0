Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mjcz0-0001E3-SA
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 19:53:59 +0200
Received: by qw-out-1920.google.com with SMTP id 4so263329qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=61cjkye5tt1kzDGIzBn/blo046EP/RJuKEEkwXA0F1s=;
	b=ArjE/qff9TVz4hDodEY5pI5Kdz0SrxPLWNFVs842LNmjxDxSxqd/JdEN5Nbon+1jad
	32SF9hdkOzehOb5Bgu5PQ9y8OveVaJ6syrF8D5jeRCcprb1hv+UbJVWFliXq4AdBLTYY
	dUQ+j7JNwGM5zsm41d/FO+uNLlB9dqJzBwDtk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZEbtcwMgT+5qT4nXwY1bCiuOcS7121xWInSZFvSyu1k21yXe3+O8qrfSu2LtNsBN+j
	vLfuB4bbpTeEHGiph2Ix4FvtnexexbtdB9YO3rI/meN+/M6hr6pRfrks6xZVi/KOUt5U
	d+1Sc3q1e8NoT5UB1mDcgROBzhbHq38Nh1slc=
MIME-Version: 1.0
Received: by 10.229.10.229 with SMTP id q37mr3295677qcq.106.1252085699404; 
	Fri, 04 Sep 2009 10:34:59 -0700 (PDT)
In-Reply-To: <1252078620.27780.515.camel@mill.internal.reciva.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
	<19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
	<1252078620.27780.515.camel@mill.internal.reciva.com>
Date: Fri, 4 Sep 2009 10:34:59 -0700
Message-ID: <19c1b8a90909041034w2648fa24pbc0f5899ca229fa2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Fri, 04 Sep 2009 17:53:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2009 at 8:37 AM, Phil Blundell<philb@gnu.org> wrote:
> On Fri, 2009-09-04 at 08:27 -0700, Khem Raj wrote:
>> Other distros also need this change. IMO it will be better
>> that we enforce a rebuild otherwise users might have issues that
>> are hard to debug.
>
> Why do other DISTROs need this change? =C2=A0Surely if they aren't using
> sane-toolchain.inc to set TARGET_OS then they oughtn't to be affected.

because of the TARGET_OS OVERRIDES now depend upon the new target triplet.
Probably one way would be to leave the old overrides in there but that woul=
d
have been more confusing.

Thx

-Khem

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


