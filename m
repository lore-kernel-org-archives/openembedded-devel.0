Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NkMY7-0003B7-KE
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 20:05:36 +0100
Received: by iwn9 with SMTP id 9so4646962iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 11:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YoK1ueEIL8PuhNqu0ScnHQWeXIModocQaTQuwbhFeE0=;
	b=LXbOcBCiijfe36vvhkEYoOm06rqTN42TxSL+WCImHHm/uVZ2L8i6hqhY8pT7SWHVM8
	Cf5OlIumuHejHNh381B14Nd8GjeecI5Qw7gweyu+NkdgpBZ60gA9JBFg+2uCu3CM7Hzl
	JTjQb/RxFzwJsqawV1rV+324yyBdyOH8XnqUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NKRqPDTBJ42YsMAs5NgDOI7UPnB0SpAe7P0PyldBTgLUVLBH61tK3HJ0JrnWclKUSL
	kXsJZ9CNWb6O1+rJ+ncP2C+euSBDuCS0R1lDXolBVa3uetkaHe0VwhGCAAYkKSpNWisC
	XiBK0UVayNKJH2UUP9C2YSEy6wnky6fKn1sVE=
MIME-Version: 1.0
Received: by 10.231.150.2 with SMTP id w2mr352977ibv.90.1267038165287; Wed, 24 
	Feb 2010 11:02:45 -0800 (PST)
In-Reply-To: <f96d234e1002240613i75bfab0byfcabe9aa6737dc6a@mail.gmail.com>
References: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
	<19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
	<f96d234e1002231243h1e75af62g90d490aa792fbe96@mail.gmail.com>
	<19c1b8a91002231910y3b44f0ecuc8992499c1a4086@mail.gmail.com>
	<f96d234e1002240613i75bfab0byfcabe9aa6737dc6a@mail.gmail.com>
Date: Wed, 24 Feb 2010 11:02:45 -0800
Message-ID: <19c1b8a91002241102s2e8c9e9bm27efd0f4846f2a0a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gettext native failure
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
X-List-Received-Date: Wed, 24 Feb 2010 19:05:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2010 at 6:13 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Tue, Feb 23, 2010 at 10:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I see. gettext requires libxml2 at buildtime therefore adding
>> libxml2-native to DEPENDS
>> should solve this. libxml2-native should not depend on gettext-native
>> if it does then its a bug.
>>
>> Dependency chain which pulls in gettext-native is
>>
>> insane.bbclass -> desktop-file-utils-native -> glib-2.0-native -> gettex=
t-native
>>
>> so my guess is that it has not yet built libxml2-native when it starts
>> to build gettext-native and defaults to whatever is on the build
>> system due to parallel'ness of bitbake
>
> Thanks. =A0I had a mental block thinking linxml2-native depended on
> gettext, but it was the parallel build that was getting it build
> first. =A0The following patch fixes it:
>
> diff --git a/recipes/gettext/gettext_0.17.bb b/recipes/gettext/gettext_0.=
17.bb
> index 2f7faa7..fbb479a 100644
> --- a/recipes/gettext/gettext_0.17.bb
> +++ b/recipes/gettext/gettext_0.17.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "GPLv3"
> =A0PR =3D "r5"
> =A0DEPENDS =3D "gettext-native virtual/libiconv ncurses expat"
> -DEPENDS_virtclass-native =3D ""
> +DEPENDS_virtclass-native =3D "libxml2-native"
> =A0PROVIDES =3D "virtual/libintl"
> =A0PROVIDES_virtclass-native =3D ""
> =A0RCONFLICTS_gettext-libintl =3D "proxy-libintl"
>
> Are there any objections to pushing this change? =A0Do I need acks for th=
is?

Acked-by: Khem Raj <raj.khem@gmail.com>

just in case

>
> Thanks,
> Cliff
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


