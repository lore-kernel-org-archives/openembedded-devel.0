Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Gj4-0004K8-81
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:39:31 +0200
Received: by iwn7 with SMTP id 7so2574096iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u44C8wYDozMctbGOzSaF2Ztp4DZJuBuQ5sLiN1LRJNo=;
	b=EAPP1f3ZQGf+kMltnMemMWRjNhYppPlcPvJkTVcdo6Z8/6NASOmIXV/cvYcelxfkyI
	TWGuCeyNpm5VA3m98LW+1vMjJ79G5DbmhrV8FU5GID2CcbPh4Npt1T3vv4LPi5cHGdjl
	LboFK49poZ/gIZ5xQN83cK1LKdubEGOzQzprw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=miITFLSCzjVqSNgkjwVeFyp6aE26R+xI9N66Irxf+QitHT3uYye+W3kx92WudnQEBv
	mM5EpUlnx6dGL4BIVz/4viIZXdtHE/NuuwyjPrI77Eqs7TO906Aib3zXzi+BC16RjvA6
	N2Ps9artx5MJfg6pvNM49dMq2/Mp6gvo0bbEI=
MIME-Version: 1.0
Received: by 10.42.1.14 with SMTP id 14mr1807495ice.49.1286797146371; Mon, 11
	Oct 2010 04:39:06 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:39:06 -0700 (PDT)
In-Reply-To: <20101011105848.GB4715@lit.local.igalia.com>
References: <1286561232-31048-1-git-send-email-vjaquez@igalia.com>
	<20101011093357.GA4715@lit.local.igalia.com>
	<i8uotg$c41$1@dough.gmane.org>
	<20101011105848.GB4715@lit.local.igalia.com>
Date: Mon, 11 Oct 2010 13:39:06 +0200
Message-ID: <AANLkTi=KdhAEwnLOMY7v6D8=UhVjkWV_tCGrcmJhyizx@mail.gmail.com>
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
Subject: Re: [PATCH] angstrom.inc: set TARGET_VENDOR ?= "-angstrom"
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
X-List-Received-Date: Mon, 11 Oct 2010 11:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
> On Mon, Oct 11, 2010 at 12:29:04PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 11-10-10 11:33, V=EDctor M. J=E1quez L. wrote:
>> > On Fri, Oct 08, 2010 at 08:07:11PM +0200, V=EDctor Manuel J=E1quez Lea=
l wrote:
>> >> By doing this we could use external toolchains for build angstrom
>> >> based images.
>> >>
>> >
>> > Ping. Any comment about this patch?
>>
>> Something like this should be done in external-toolchain.inc
>
> There's no external-toolchain.inc in OE's org.openembedded.dev branch. So=
 I
> assume that you refer to a user's local.conf require.
>
> I done that and it doesn't work: the distro/include/angstrom.inc evaluati=
on
> happens later and overrides the TARGET_VENDOR variable, that why a ?=3D i=
s
> needed.
>
> vmjl

It is toolchain-external.inc, not external-toolchain.inc

/home/frans/workspace/openembedded.git/conf/distro/include/toolchain-extern=
al.inc

Enjoy! Frans


