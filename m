Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Md9-0006Ix-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 19:57:47 +0200
Received: by iwn6 with SMTP id 6so31656iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wJO4aO3gZCZ/M67MLAoIAHNoWCK1uoouekkWMTMS3bo=;
	b=sUbNJROCqeczTaQBynoUHpWMHE8Ni4Ohdj3gSxGItqJWrMP6HeXnADlDY+T73G5Pp0
	0jMFf8/z23mIm4lYjYj0+fKbZ2a5uJpUd6ATitrlEYqNZeDEvmKrmzZa/vnulscsmtvd
	R1QnsEMLIRA0L0LKhHVx2rRmTzozolGVgRkr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FeJ1FGUDkSXhHFRYjles14xhjjr3RlTN70aE1wSeJ2O4Sy6+sYx0HyTWp49fexHFWn
	4aTUWz62biqU/yJzgUPxHdvhqaijXkuYHxSySXDr0VasztLLpKrTtuEHP7QA6efiMKOj
	VHGpXa8Jhi99tMdWVnbfthQUDKeM8Cq0PYZRY=
MIME-Version: 1.0
Received: by 10.42.138.7 with SMTP id a7mr2039314icu.452.1286819842453; Mon,
	11 Oct 2010 10:57:22 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 10:57:22 -0700 (PDT)
In-Reply-To: <201010111602.05916.khimov@altell.ru>
References: <AANLkTineQJGDAdjuuHpkKEsYPU1TuvmgE+7k+EoYqtTp@mail.gmail.com>
	<201010111602.05916.khimov@altell.ru>
Date: Mon, 11 Oct 2010 19:57:22 +0200
Message-ID: <AANLkTikoRgF_iRe0=8T97gPTXsa=HXRSxrWmEivtoa=e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] unpackaged files
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
X-List-Received-Date: Mon, 11 Oct 2010 17:57:47 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/10/11 Roman I Khimov <khimov@altell.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
11 =CF=CB=D4=D1=C2=D2=D1 2010 15:51:05 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> =9A- a way to indicate that a file is installed but purposedly not
>> packaged (e.g. I have such a thing in mythtv with a README file)
>> This could be by creating a pseudo-package (like -unused or -ignore)
>> which can be used to add files that are explicitly not packaged
>
> Shouldn't such files be removed with do_install_append()?

This is also an option. Didn't think of that one. No preference for
one or another.
And in either case we might want to allow choosing this to be handled
as error (and, in due time be forced to be an error)

Frans


