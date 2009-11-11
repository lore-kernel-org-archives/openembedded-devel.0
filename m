Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8KED-0008W1-BU
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 21:55:48 +0100
Received: by ywh7 with SMTP id 7so1379749ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 12:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7E3PHP1L6lGLuVN9lTRNYpTBdo+cCwdmVxzXqushMPQ=;
	b=Cu+msl3Hl+806Z3hbKw5IteB50fxlPCQl8lGJRAp617UrQgzARyBLmpGR2KGKNuF/j
	lnxegiA00ketdwBvbOMEa9ma0re4MMy6HzoOFRXwXKyADcHJZe1S7Uhsu0ZqjzyTtnSB
	MvPjsWmvVeEJB8RV0Pu36tuU+EmQ0ckgWKEmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=t9enxh+VGFnawgaWVE0x1zNKdqZudiG8CW5v5LJRYRJWDg9JSTVQYCDMhqCSq2oFuw
	Xof040rNEeMxUKv6wb2Hlcb7Zv3uNs8bTOD46kotrmYlijtykYNaO1ewIJgQ5naX3DqM
	vcWqUoZXPwbYNBsoZ3Uj596WFyoPKautLxi5A=
MIME-Version: 1.0
Received: by 10.101.142.31 with SMTP id u31mr2090285ann.159.1257972529483; 
	Wed, 11 Nov 2009 12:48:49 -0800 (PST)
In-Reply-To: <1257971641.25369.426.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
	<1257971641.25369.426.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 21:48:49 +0100
Message-ID: <ac9c93b10911111248s460d3864w6fbc7903c2eddd3b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
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
X-List-Received-Date: Wed, 11 Nov 2009 20:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/11 Phil Blundell <philb@gnu.org>:
> On Wed, 2009-11-11 at 18:37 +0100, Frans Meulenbroeks wrote:
>> 2009/11/11 Phil Blundell <pb@reciva.com>:
>> > On Wed, 2009-11-11 at 17:01 +0100, Frans Meulenbroeks wrote:
>> >> 2009/11/11 Phil Blundell <philb@gnu.org>:
>> >> > On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
>> >> >> SCR_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
>> >> >>
>> >> >> MD5SUM_bar =3D ""
>> >> >>
>> >> >> or maybe :
>> >> >>
>> >> >> MD5SUM[bar] =3D ""
>> >> >
>> >> > The labelling is a good idea, although I am not especially keen on
>> >> > either of those notations. =A0How about:
>> >> >
>> >> > SRC_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
>> >> > SRC_URI[md5sum:bar] =3D "..."
>> >> > SRC_URI[sha256sum:bar] =3D "..."
>> >> >
>> >> Would we still be able to use PN and PV in the md5sum:bar etc?
>> >
>> > Not directly, though it isn't entirely obvious to me why this would be=
 a
>> > useful thing to do. =A0Did you have a situation in mind where this wou=
ld
>> > be desirable?
>> >
>> I am somewhat lazy so if a new version of a recipe has to be made I'd
>> like to touch as little as possible.
>> (the less I have to do the less chance of an error occurring)
>> So preferably I would use PV an PN in the url and not copy it from
>> somewhere (as that is more error prone too.
>
> That should still work fine. =A0The purpose of the "name=3Dbar" thing is =
to
> decouple the checksum from the exact URI in use. =A0So, you can write:
>
> SRC_URI =3D "${MIRROR}/somedir/${PN}-${PV}.tar.gz;name=3Dmytarball \
> =A0 =A0 =A0 =A0 =A0 ${OTHERMIRROR}/${PN}-${PV}-extra-files.tar.gz;name=3D=
extrafiles"
>
> and then, in another file if you prefer, add:
>
> SRC_URI[md5sum:mytarball] =3D "d3b07384d113edec49eaa6238ad5ff00"
> SRC_URI[md5sum:extrafiles] =3D "c157a79031e1c40f85931829bc5fc552"
>

Ah ok, now I understand. I thought at the place of bar I would get the
url, not a name tag associated to the url.

Thanks for clarifying , Frans


