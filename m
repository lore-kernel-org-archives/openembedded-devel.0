Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol618-0001KX-SD
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 22:10:47 +0200
Received: by gwb15 with SMTP id 15so2147312gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=y0DkfaOWROvKUtuwx0chl5AZM87C+tzINAvRrQH3US4=;
	b=fp399TpRCyYHbWK70Z4vKvWGXD673nS18yTYnMhNdVMEggtJj9IuL/QF6QxIHqhaDA
	7EbCguepALsw4AS0idwyAVETZt+hnZvALkf+Zn/j+IjYmhtLgkMkgrqZpA368L6fFSQs
	vR/ZpSIsuIJiuPIzwrcxPjAKBEnF/TUEsSxOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IWxVwRCB9VWqkS18b2vb6u3y+QQlfq4+xiguxBF005aeIAvmlBWt775nuSMhPbGrvT
	6sABLNyF9TybYNgP9qrdVcRcUjknXqSgpiefdPvscmq9C/oEJYWVWlivgGt45AqZ0YXv
	IOHbOyzqLpGofsGK9bTwbFMpce7FvmtVocwiQ=
MIME-Version: 1.0
Received: by 10.231.36.134 with SMTP id t6mr6290614ibd.128.1281989428939; Mon,
	16 Aug 2010 13:10:28 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 13:10:28 -0700 (PDT)
In-Reply-To: <AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
	<201008162325.59305.roman@khimov.ru>
	<AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
Date: Mon, 16 Aug 2010 22:10:28 +0200
Message-ID: <AANLkTinc3hESrnWRPeRs2EnGoqAy=fXB9PZxN2sOe_dg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Mon, 16 Aug 2010 20:10:47 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/16 Khem Raj <raj.khem@gmail.com>:
> On Mon, Aug 16, 2010 at 12:25 PM, Roman I Khimov <roman@khimov.ru> wrote:
>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB=
 16 =C1=D7=C7=D5=D3=D4=C1 2010 22:59:53 =C1=D7=D4=CF=D2 Frans Meulenbroeks
>> =CE=C1=D0=C9=D3=C1=CC:
>>> One small question: Do we want to keep this recipe at
>>> DEFAULT_PREFERENCE =3D "-1" ??
>>
>> Well, we're using 1.0.0 since the day it's been released, and it's a per=
fect
>> fit for us, but I know that it _might_ break some things, just google fo=
r
>> openssl 1.0.0 breakage/compatibility patches/etc, that's why I've pushed=
 it
>> that way so that distro maintainers could test whether it works for them=
 with
>> their particular package sets and act accordingly.
>>
>> I certainly have nothing against removing that line if everyone is OK wi=
th
>> that.
>>
>
> IMO the newest version in a recipe should always be default preference
> this way we can
> stabilize recipe upgrades quicker. This also means a wider testing
> before pushing a new recipe
> DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.
>
For the record. We have 451 recipes with a DEFAULT_PREFERENCE clause.
425 of these seem to have a negative value in it.
In total there are 712 lines with DEFAULT_PREFERENCE
(especailly kernel recipes have preferences for specific machines and
have multiple DEFAULT_PREFERENCE lines)

Frans


