Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNiRD-0003Qh-Lu
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:53:20 +0100
Received: by iwn8 with SMTP id 8so5576328iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 00:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=W8egJ5GhYWhxyIqLomy8t+KHWU/o2nSzebnux+LVW3Y=;
	b=FZIJEuuTnZqRor4w+l0Li1HeGYviYe0Drbug8UB9NDCFOIoT+1q1CbzTVIonyVbBY3
	l2NphLUfKCfWoendEHFF4BknRq+/c8/m7c35ixpTIUCXPlRg4CsBAZ/ce6WI3q/0rUH9
	z7EMY25OWq5Wc8prjfX+dyW1PHB9R+96D4qi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xi/CQ3NBVqir8w/gSuKpjg57YFcKD8u1UBPosA6RLzwyWcxbLhYwEribHAnIKe6bgR
	9J5lVAp0dZVv1OiOHGkixlgavw8kOBM/luUFNtH6PTRgfnWbLAgBq8C7zl2oFBDX/l3M
	uc2yVQfCcmezfuRUIDDg8bNp6F0KaEjGgE0Ow=
MIME-Version: 1.0
Received: by 10.231.191.4 with SMTP id dk4mr8689015ibb.82.1291193518026; Wed,
	01 Dec 2010 00:51:58 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 00:51:57 -0800 (PST)
In-Reply-To: <20101201084510.GM10755@ibawizard.net>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
	<AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>
	<20101201084510.GM10755@ibawizard.net>
Date: Wed, 1 Dec 2010 09:51:57 +0100
Message-ID: <AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Wed, 01 Dec 2010 08:53:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/1 Petr =C5=A0tetiar <ynezz@true.cz>:
> Khem Raj <raj.khem@gmail.com> [2010-11-30 10:12:08]:
>
>> Do we already have some resolutions to these issues ? are there
>> existing patches
>
> Yes, there are few patches around, but Koen didn't told us yet[1] what
> fix/workaround he would preffer for Angstrom 2008/2010.
>
> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/=
msg13494.html
>
> -- ynezz

OE is more than angstrom, and no single distro should  block progress
for the rest, even not if it is the primary distro.
My suggestion would be to upgrade uclibc + binutils. to fix things.
Angstrom then can (and probably already does) pin the current versions.

My 2 cents, Frans.


