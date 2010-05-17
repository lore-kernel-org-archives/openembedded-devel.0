Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE3ZA-0005Yx-HA
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 18:53:21 +0200
Received: by ywh26 with SMTP id 26so2396173ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ywcqsCTqUj0WhTc0IHFrXXbFQ+Pb4nnaP5t6fYWrzVI=;
	b=XM2ECt/vtMz1kMUEYCjS9Q0BL8IbLcYpDbnqI6C3C69DuFs8lezglXyfONM9MtwLC2
	42Hay9m1rqLGxZ+QNYJV923Cb8mMv9aF2DuGe0L3xOREcjLma9D+IYBuCy9iXtZwGl0j
	O7IXzL3rCqc1dh/WNVYvLUwT2GlmA9LdXDPgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=U5hD284nap1bEhQfufZjWqD6tAx8M44C+qNYNbtOb8wAfHRBqoVsoxz0Rm+2u8G894
	IT4M/qa9EDspIaYXAshyAm3/xfmw2NGoOPuCZmFrj9RKSi/aoF6siKuScljYUF8wAfxp
	zhMDBhsdeIH04Nl358IMGlT9ghDU3pMFiII20=
MIME-Version: 1.0
Received: by 10.101.156.18 with SMTP id i18mr5859755ano.180.1274114960778; 
	Mon, 17 May 2010 09:49:20 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Mon, 17 May 2010 09:49:20 -0700 (PDT)
In-Reply-To: <hsr2pr$4vp$1@dough.gmane.org>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
Date: Mon, 17 May 2010 09:49:20 -0700
Message-ID: <AANLkTin6PIr6ZgeYS6rB9IGK83vQH9Tn9xreVOwOAt0M@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Mon, 17 May 2010 16:53:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 17, 2010 at 2:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-05-10 07:55, Khem Raj wrote:
>> On (17/05/10 07:44), Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Hi,
>>>
>>> I just noticed that after doing 'bitbake gcc' the old libstdc++ gets
>>> replaced and the new one has:
>>>
>>> dependency_libs='
>>> /OE/angstrom-dev/sysroots/armv6-angstrom-linux-gnueabi/usr/lib/libstdc++.la'
>>>
>>> instead of the expected '-lm'. It now refers to itself :(
>>
>> hmmm target gcc should not have staged libstdc++ if it was already staged
>> by gcc-cross but the problem is casued by
>> gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch it passed the native libdir which
>> is build_libdir even for target library builds using -rpath. I am currently
>> looking into the reason. If possible we can get rid of that patch.
>
> I'm getting a build failure with 'gcc' now failing to find libstc++.la.
> I'm trying a build from scratch now to rule out any packaged-staging
> problems (>1 recipes installing the same file, pstage removing it prior
> to build).

I could not build a console-image as I ran out of disk space. Have you
considered removing
-g3 from default angstrom builds.

-Khem


