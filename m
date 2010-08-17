Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlMw9-0000v2-2G
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 16:14:46 +0200
Received: by gya6 with SMTP id 6so138348gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tvg1c4gXr736Wl26RPH2kzglEI1ZDZSe+mfVOuC5qoE=;
	b=oKB8UHKeNri5Bi+sKAzbIrvaCyOQvPno2zmkY7eggZcPtdOkuap+kdi7p1AIOzOnHI
	4BNoGAlGNTDuDTJbUiBqc9+QnBiVAzTctX1PtKVaWGxoZy2i3k/a/XU17IQLPiGrF4nv
	XaaQGso39EtwPeRxIqHjGRj6mz2AfzZ05dm40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Guc6x22HlmwNUxXWkkrK8lgspIr1e75ey5rnKoei0kID6m/k3AaKiR86bw6h3wrmcl
	vK7KKTKOoCfqUFYxnEBLhkX30Is6V/r0PIa5nfzxN/yrARq5bLgpZmHbcAB3vUZFr8nS
	4uTlwtcpMtDPlkD/jlPENFhPkytf7XmiIKVHU=
MIME-Version: 1.0
Received: by 10.150.203.5 with SMTP id a5mr7183735ybg.437.1282054463966; Tue,
	17 Aug 2010 07:14:23 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 07:14:23 -0700 (PDT)
In-Reply-To: <1282053425.2692.1179.camel@mill.internal.reciva.com>
References: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
	<1282053425.2692.1179.camel@mill.internal.reciva.com>
Date: Tue, 17 Aug 2010 16:14:23 +0200
Message-ID: <AANLkTim1LTg=RyVBxZftu8bTC7D1Sac0Hs0Dsgo5tLSX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bison: add flex dependency
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
X-List-Received-Date: Tue, 17 Aug 2010 14:14:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Phil Blundell <philb@gnu.org>:
> On Mon, 2010-08-16 at 16:26 -0500, Jason Kridner wrote:
>> -DEPENDS =3D "virtual/libintl"
>> +DEPENDS =3D "virtual/libintl virtual/flex"
>
> Does this actually work? =A0I couldn't immediately spot any obvious
> package which PROVIDES virtual/flex, and that sounds like a strange kind
> of virtual to have since I don't think there are any alternative
> implementations of flex. =A0(But if bison actually depends on lex
> generically, rather than flex specifically, it might make some sense to
> introduce a virtual/lex and have flex PROVIDE it.)
>

is there another popular lexer apart from flex?
And will bison build with it?
We build flex-native anyway, so suggest doing the depends as I suggested.

Frans


