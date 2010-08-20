Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OmTcs-0004OE-I0
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 17:35:27 +0200
Received: by gwb15 with SMTP id 15so1319903gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Ndc+W4MUF9kRwIeQuMm3NuW+JoW+FQGd1clyUF8AK6I=;
	b=SI6IjiLwsNfJU+Le7usIbHpHOrhGKL5yiw4Ska/aKiGvlIjx0KjZw7xxqY9vCt71z/
	5wsQbrwJ1Q1AdAXY+Z60HJrl8nIh7Os/B7So6zaLhyjmy26kvgcQKsteRVp+YVI8a4oz
	qzpiB+CHcDHzYM+vfTjlRt9LxyL3BjBGZnIAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=BdU34zU2xLSL3wgO2dPb5d7k7U0BdCiuYr89FL4xQcxX5s66vqFMHpD71K9ih7t1V6
	tiTxfgs64xdpEGWc8HuDyEZ/28EIOVng1/U3bCv9LELPliwpaH/lp+XfViUfaICduQEj
	2NjEXCqRJqHIXfe3oHgMG7t81ZvPMvZ7RWrxk=
Received: by 10.90.26.1 with SMTP id 1mr1249060agz.186.1282318496311; Fri, 20
	Aug 2010 08:34:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Fri, 20 Aug 2010 08:34:36 -0700 (PDT)
In-Reply-To: <1282315196.13038.44.camel@mill.internal.reciva.com>
References: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1282315196.13038.44.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Aug 2010 08:34:36 -0700
Message-ID: <AANLkTin4OrsobbFpGe-vaTfUCdbjAi=XF65VfJzYjrWm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 15:35:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2010 at 7:39 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2010-08-20 at 16:19 +0200, Frans Meulenbroeks wrote:
>> @@ -23,6 +23,7 @@ TARGET_VENDOR =3D "${BUILD_VENDOR}"
>> =A0TARGET_PREFIX =3D "${BUILD_PREFIX}"
>> =A0TARGET_CC_ARCH =3D "${BUILD_CC_ARCH}"
>> =A0TARGET_EXEEXT =3D "${BUILD_EXEEXT}"
>> +TARGET_SYS =3D "${BUILD_SYS}"

bitbake.conf already has

TARGET_SYS=3D${TARGET_ARCH}${TARGET_VENDOR}${@['-' +
bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d,
1) =3D=3D ('' or 'custom')]}

so once you have TARGET_OS set correctly this should work well for native t=
oo.

>
> I don't think this is the right thing; native.bbclass already assigns
> TARGET_OS =3D "${BUILD_OS}".
>
> Do you really need to use a _local override for TARGET_OS? =A0If so then =
I
> guess you need to find a way to stop it applying for virtclass-native.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


