Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8H9I-0004lJ-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:38:31 +0100
Received: by yxe5 with SMTP id 5so1183910yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NgJXIO08q8BjgYgjio4VufvzZsQ4r9tEtnT0SK8mtHU=;
	b=ilvA2ww0MYTOIPJKttDZygbtjWolVhcsKbrfb6Di1QFBA7b/rA7zim86PgBbCtI7mp
	FTHJUP6RMTCFKlt5DoDI0Yw6MEwZTPyOrHyuKNuUNKpliVWrCPZAOUi/nILIsqFsEIO1
	dwZMbLBkZa1GGswU5WincTLONT6G+Po6eg1IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ob7uakoL6i3V8lmqjUydnvw9QCX9Qnw7u3J9ivKchOXWpx4pU3k0tqDhT+OQ1tmvJZ
	XiBSWqVk9is6mUqzWSQylPms5lpMHKskKtP3G3ODclFCN97zTo/Z6NJikiloynVKKmyd
	V+GNzHcRvp/6a7quOBhpTC+NQ7QZny65u3YFo=
MIME-Version: 1.0
Received: by 10.101.113.4 with SMTP id q4mr1774193anm.64.1257961029519; Wed, 
	11 Nov 2009 09:37:09 -0800 (PST)
In-Reply-To: <1257955603.25369.325.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 18:37:09 +0100
Message-ID: <ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 17:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/11 Phil Blundell <pb@reciva.com>:
> On Wed, 2009-11-11 at 17:01 +0100, Frans Meulenbroeks wrote:
>> 2009/11/11 Phil Blundell <philb@gnu.org>:
>> > On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
>> >> SCR_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
>> >>
>> >> MD5SUM_bar =3D ""
>> >>
>> >> or maybe :
>> >>
>> >> MD5SUM[bar] =3D ""
>> >
>> > The labelling is a good idea, although I am not especially keen on
>> > either of those notations. =A0How about:
>> >
>> > SRC_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
>> > SRC_URI[md5sum:bar] =3D "..."
>> > SRC_URI[sha256sum:bar] =3D "..."
>> >
>> Would we still be able to use PN and PV in the md5sum:bar etc?
>
> Not directly, though it isn't entirely obvious to me why this would be a
> useful thing to do. =A0Did you have a situation in mind where this would
> be desirable?
>
I am somewhat lazy so if a new version of a recipe has to be made I'd
like to touch as little as possible.
(the less I have to do the less chance of an error occurring)
So preferably I would use PV an PN in the url and not copy it from
somewhere (as that is more error prone too.

(btw I can also envision a new bitbake task which will rewrite the checksum=
s).

Frans


