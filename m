Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OseWi-00016Z-6o
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 18:26:37 +0200
Received: by ywa8 with SMTP id 8so1778115ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=2JSBFvIyzE9D2v3e68Xm1QySRQzRMwtSPkO0wowFQKc=;
	b=HkLkCmUKx1VsggfgnBiaMukDKzFhiHj91qsaBMj4GgEHJv32BvS3AA45zFe3IzV0vC
	J0fluvJvuKSqabW8eZWd+o7N5S3a2tIqa0ttyoUQ7lYSSdaOVTONxnrNIebcLggPsKBz
	9f69pxRpj3dwnfMfgATX5n1cP3CjxPgoexskU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=aZu/u9olapN5su5G24NK0e9H5e0jCu7BacjRngIuYjQo6hkYHqDqTiCe05GpPktzWH
	25njNL4dJcYnGIv7EcZXgIngbsMcE6wY8UIZuLYM1PT698zBR0VDNOuuYkWnD5WjL0VE
	EXtYPF+OjlZ5xHQVNWxv+32b9Gk+yi52x39uY=
Received: by 10.150.53.18 with SMTP id b18mr104431yba.331.1283790355605; Mon,
	06 Sep 2010 09:25:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 6 Sep 2010 09:25:35 -0700 (PDT)
In-Reply-To: <AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
	<AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Sep 2010 09:25:35 -0700
Message-ID: <AANLkTi=Zy32F8kE3WdWmdmyj6Avg=D6Uv6YEaNLUHtBM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 16:26:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2010 at 6:54 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Sep 6, 2010 at 12:41 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> 2010/9/6 Khem Raj <raj.khem@gmail.com>:
>> > On (19/08/10 21:14), Frans Meulenbroeks wrote:
>> >> 2010/8/19 Chris Larson <clarson@kergoth.com>:
>> >> > On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
>> >> > fransmeulenbroeks@gmail.com> wrote:
>> >> >
>> >> >> Hi,
>> >> >>
>> >> >> Found this in our reicpes:
>> >> >>
>> >> >> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
>> >> >>
>> >> >
>> >> > This prepends to do_install_virtclass-native, which will then repla=
ce
>> >> > do_install when the overrides are applied. =A0This is prepending to=
 a
>> variable
>> >> > which overrides, as opposed to the other, which is a conditional
>> prepend.
>> >> > =A0The two are quite different. =A0It's unlikely that this is what =
they
>> >> > intended. =A0Far more likely that it should be changed to
>> >> > _prepend_virtclass-native.
>> >>
>> >> I have no idea what is intended and I have no dbus knowledge, so can'=
t
>> fix this.
>> >> I'll leave it to someone else to resolve this.
>> >
>> > I think the correct fix is as Chris suggested. Please go ahead and fix
>> it.
>> >
>>
>> Well I am a little bit hesitating as I am by no means an expert on the
>> dbus recipe.
>>
>> The other question that immediately popped up is:
>> If the code is wrong and no-one noticed, is it actually needed?
>>
>> The code is:
>> do_install_virtclass-native_prepend() {
>> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/dbus
>> =A0 =A0 =A0 =A0install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/db=
us
>> }
>>
>> Actually if the standard do_install needs to be changed, it generally
>> raises some alarms with me.
>> Why would we need to install something that the package normally does
>> not install?
>> (of course this could be a bug in the package, but then I would prefer
>> a patch that we also try to push upstream).
>>
>
> Agreed, that is odd. =A0If it's something that dbus using things might ne=
ed,
> why is it only prepended for the native version, and as you say, why is i=
t
> not installed by the upstream install target. =A0I'd do a git blame and f=
igure
> out who added that and ask them :)

I guess it was part of converting dbus recipes to new staging in which case
it is converted but may not be used

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


