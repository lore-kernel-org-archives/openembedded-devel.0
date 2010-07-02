Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUU1d-00026u-CQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 02:22:38 +0200
Received: by iwn34 with SMTP id 34so2663557iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 17:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LtxDwJd2Zan0DdrZeC5dW/pkxd7+OFf12qUmb0n1Y00=;
	b=S3cOPTFE7hU9lDhHwAIDV8g07bg60tqoY0LF725oawzFSEE9Ic4Ma5sl6SfvsiybTY
	lAbJwsUJ60XdPmQQ7/nw6B5+m6YZRInuu0XbKO3iSlDc0RFlNlN335CqaFkSkVYya/G5
	wjyAeDnZQ8Q+He+AQao1pDr4KbOF57IbWAy0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=abSDYYcB/jsrr0aE1pJ1UKR6EwH9mTqUoO1+/P7PSsMkSQcq6VURu0O1XVRoqup4ZS
	bXmz82o7Sf6ttwHf19RjKbK7UBTjIr/K5TUqZf4TSGV1+oY0EB/cqTvz6nZpdRlzGoqO
	EMxfiTyC2WvdDW7hW/jp0N0zQ7MyDeGuGCgQQ=
MIME-Version: 1.0
Received: by 10.231.36.72 with SMTP id s8mr312298ibd.49.1278029873555; Thu, 01 
	Jul 2010 17:17:53 -0700 (PDT)
Received: by 10.231.144.21 with HTTP; Thu, 1 Jul 2010 17:17:53 -0700 (PDT)
In-Reply-To: <AANLkTimOoAGoQQZx1FsubNGi-UX8hlgKCGPrDvTcNMAs@mail.gmail.com>
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com>
	<lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<i0ian8$pt3$1@dough.gmane.org>
	<lybpargq0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<i0iekt$aik$1@dough.gmane.org>
	<AANLkTimOoAGoQQZx1FsubNGi-UX8hlgKCGPrDvTcNMAs@mail.gmail.com>
Date: Fri, 2 Jul 2010 09:47:53 +0930
Message-ID: <AANLkTimD4NUnrafjemhg_tUJOuqCPI5jir_1HdPyOkJg@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 02 Jul 2010 00:22:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 July 2010 07:46, Graham Gower <graham.gower@gmail.com> wrote:
> On 2 July 2010 01:40, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-07-10 17:50, Enrico Scholz wrote:
>>> Koen Kooi <k.kooi@student.utwente.nl> writes:
>>>
>>>>> A better way might be to conditionalize your '--disable-*' options
>>>>> resp. make them depend on some DISTRO_FEATURE.
>>>>
>>>> Introducing USE flags would be a step backwards, so NAK on that.
>
> I don't like the idea of USE flags either. Every time you see one you
> would have to grep -r your tree to find out its impact.
>
>>>
>>> how would you reenable gpg and curl for https support then?
>>
>> By keeping the existing recipes?
>
> Or, by extending the defautl opkg_svn.bb recipe I have left behind.
>
> e.g. an opkg-fullyloaded.bb containing
> include opkg_svn.bb
> EXTRA_CFLAGS=""

And here's a tested version
$ cat opkg-fullyloaded_svn.bb
require opkg_svn.bb
DEPENDS = "curl gpgme openssl"
EXTRA_OECONF = ""

Is this recipe desirable? Put your hand up if you plan to use it, not
because "its nice to have the option".

-Graham


