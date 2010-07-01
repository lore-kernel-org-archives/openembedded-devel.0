Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUS8C-0004vh-Gg
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:21:18 +0200
Received: by iwn34 with SMTP id 34so2561288iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 15:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZNY7Wg+Js/YYGSMXUpU6BkaTb0TkgXgjK4qOTjffS2A=;
	b=n6kGkIiWYjlL1knHfi3IqbVJ3VXMB9Ihu7DJSIJybIRSd7JUkWSjAjMr1dCFpsmD2P
	+XXCdk3k3Z5vtP+XPkWuBpbsNA6ooDCWqAuQ3rgVvBej3j+XKCNR5cb4lxXrywBkfiAQ
	KIDs1ldk31iUEcqxx3+52S+BCsvg1BHfa7dkk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dhmsDWvR60oSgMCGx7MIfuIMDlP0SL6wUFcbv8xQlE3CYPTHW/MYeiiDLrQcOsvVC5
	mhC16eFs+ttA82EHzD3Go/u/kHxgkXqsEaqVsg4+uWs35Ym6vR9Ey/w79ZBXBA7VL7nW
	FEeARrx8D3HMUDFbXWf76cnB7VibZOgOiNaLU=
MIME-Version: 1.0
Received: by 10.231.167.69 with SMTP id p5mr134767iby.126.1278022589813; Thu, 
	01 Jul 2010 15:16:29 -0700 (PDT)
Received: by 10.231.144.21 with HTTP; Thu, 1 Jul 2010 15:16:29 -0700 (PDT)
In-Reply-To: <i0iekt$aik$1@dough.gmane.org>
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com>
	<lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<i0ian8$pt3$1@dough.gmane.org>
	<lybpargq0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<i0iekt$aik$1@dough.gmane.org>
Date: Fri, 2 Jul 2010 07:46:29 +0930
Message-ID: <AANLkTimOoAGoQQZx1FsubNGi-UX8hlgKCGPrDvTcNMAs@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Thu, 01 Jul 2010 22:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 July 2010 01:40, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-07-10 17:50, Enrico Scholz wrote:
>> Koen Kooi <k.kooi@student.utwente.nl> writes:
>>
>>>> A better way might be to conditionalize your '--disable-*' options
>>>> resp. make them depend on some DISTRO_FEATURE.
>>>
>>> Introducing USE flags would be a step backwards, so NAK on that.

I don't like the idea of USE flags either. Every time you see one you
would have to grep -r your tree to find out its impact.

>>
>> how would you reenable gpg and curl for https support then?
>
> By keeping the existing recipes?

Or, by extending the defautl opkg_svn.bb recipe I have left behind.

e.g. an opkg-fullyloaded.bb containing
include opkg_svn.bb
EXTRA_CFLAGS=""

But since there really don't appear to be any in tree users of this, I
didn't bother to include the recipe in my patch (i assumed it would be
trivial for anyone to do with an overlay). Opkg-native has no reason
whatsoever to require gpg or curl.

In the future, I may change opkg to have gpg and curl support be
disabled by default and require them to be explicitly enabled with
--enable-foo. Gpg is disabled by most users anyway and curl doesn't
offer much over simply using wget, so why not make it the default?

-Graham


