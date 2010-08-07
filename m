Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OhYEd-0005Jh-Fe
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 03:30:05 +0200
Received: by iwn38 with SMTP id 38so1747137iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 18:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YlHeIGjNT0hRSs/bJUTeh0Ec9u4AAzAnlgdUUcxMDrA=;
	b=Co80JlLw38SVO+Wl/NZhtaWDbQl3QlEXX3SmYXpO1Tlxrh7TFFqyefiPmd2ugbHTSA
	T4E/L+N4oYMHSHMYlZDBXso65+g7hUXUqcwYq0FTYwYREouUPgcsmk8oglEpEw+VQkRk
	WRrD7PsajfgLSZ43L+YafGQ6AkmUXuHxW0PaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=je1eXuOiBsTHSZnFCu57xN66VcppxSPU1uG8WxChn+N1iQa88YMy/97gqxkj0P4q4V
	fizVivPhbJf3I48ek0Y2qxOvz52gBL+o6odX21yKPsSBtu4LOImD/cE8VnsKiOaPhJoo
	olKU9gpvHB8QVUf2NEvCOvklTrW0v+ypnOsU0=
MIME-Version: 1.0
Received: by 10.231.14.200 with SMTP id h8mr13603489iba.188.1281144597539; 
	Fri, 06 Aug 2010 18:29:57 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Fri, 6 Aug 2010 18:29:57 -0700 (PDT)
In-Reply-To: <AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
References: <4C5A612E.9040702@gmail.com>
	<AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
	<AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
Date: Sat, 7 Aug 2010 10:59:57 +0930
Message-ID: <AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Sat, 07 Aug 2010 01:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 August 2010 23:24, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 5, 2010 at 4:15 PM, Chris Larson <clarson@kergoth.com> wrote:
>> On Wed, Aug 4, 2010 at 11:58 PM, Graham Gower <graham.gower@gmail.com>wrote:
>>
>>> rootfs_ipk.bbclass already pulls these in, so avoid some confusion.
>>>
>>> This is totally untested.
>>>
>>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>>>
>>
>> Looks reasonable to me.
>>
>> Acked-by: Chris Larson <clarson@kergoth.com>
>
> I've already pushed it, but too late I noticed that only rootfs_ipk is
> handling DISTRO_PACKAGE_MANAGER and rpm/deb based rootfs will probably
> loose DISTRO_PACKAGE_MANAGER from image.
>
> Should I revert now or can we fix it soon?
>

DISTRO_PACKAGE_MANAGER has been removed altogether. I can't see how it
would work reliably for all images - which is probably why it had
multiple definitions in the first place. And you could still end up
with opkg in your image when setting it to something else, e.g.
minimal-gpe-image and slugos pulled opkg in unconditionally.
DISTRO_PACKAGE_MANAGER could be fixed if it was put in a common
location like image.bbclass.

What is the intended mechanism for selecting a package manager?
INHERIT = "package_foo" looks like its going to do the trick for ipk
and deb. package_rpm.bbclass might need BOOTSTRAP_EXTRA_RDEPENDS +=
"rpm" or something.

-Graham


