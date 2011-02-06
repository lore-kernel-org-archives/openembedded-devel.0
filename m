Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pm3LK-0007um-Vj
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 13:03:51 +0100
Received: by iwn8 with SMTP id 8so3713104iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wRAOoHOThOaWJfRBnKiwNXDNFmeeTDh5R0JYF4qJVlM=;
	b=kNS5Z6dJDLW7mkyvIlvWeFbjlvYzetDqI3jYjpIEa/Fwaam9flgAqAeRATwnP+D7mW
	8U9mrQ4vpJ8oM5Q5pxHTi/mc+7UCmHsO0EPcjbMtB9+Zp2sud/lJfPO4TkBxs1lQlLCx
	T3+uRaRWrkV5Xw7b1U1/FzL5ctBy/RZq1je30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J4wtzttyid5pLLW5B7LIMxfnqoRcBvU9new3oaDyw2RWrHwG+GhOgvFcwZadvWWOH5
	joB972tLdKG0NYWGMXhTZzPaE6OZwEDEAEPuZny4GBBtUjvNbkfqpABmtDy3aCm9eJn2
	GnthveL13owSVxtpiC0gGtxdZTulN+VE7z6mU=
MIME-Version: 1.0
Received: by 10.231.40.12 with SMTP id i12mr2924344ibe.183.1296993770269; Sun,
	06 Feb 2011 04:02:50 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sun, 6 Feb 2011 04:02:50 -0800 (PST)
In-Reply-To: <AANLkTinwGvKALxGwacSnJhKf+7wWxwpn018fRD=EL7nZ@mail.gmail.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
	<AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
	<AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
	<AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
	<AANLkTinwGvKALxGwacSnJhKf+7wWxwpn018fRD=EL7nZ@mail.gmail.com>
Date: Sun, 6 Feb 2011 13:02:50 +0100
Message-ID: <AANLkTik7TXk23zPeHomArz2RFtDp8u4G3UcqcFpvnOck@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Sun, 06 Feb 2011 12:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/6 Otavio Salvador <otavio@ossystems.com.br>:
> On Sat, Feb 5, 2011 at 13:35, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
>>> I can work on cups next week (I am on VAC right now).
>>
>> Actually the cups thing is the one I would feel fairly comfortable with.
>> The question here is mainly when/how to drop the DP = -1.
>> A pinning of 1.4.4 is already in my local.conf for quite a while.
>
> In fact I have a more mature recipe in our company tree and I can
> share it, for sure. It builds a splited cups package but I need to add
> a meta-package to avoid breaking upgrades from other distros.

That would be cool!
Thanks alot! Frans


