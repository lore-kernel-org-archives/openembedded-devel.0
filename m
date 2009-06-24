Received: from [209.85.216.204] (helo=mail-px0-f204.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MJZYN-0005kM-GP
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 22:58:47 +0200
Received: by pxi42 with SMTP id 42so850118pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 13:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Od6TwDFnKZ/sVm02d0xwcD/50gmQXnK6wWfASPDIYiU=;
	b=wc/RbgfZiNHuXuJdBrlFdSAfGkZYYGHr9LoaTs/8AxrTTyJnpjb1AS+jhLIq9iaCOZ
	rRY68+RbE/hceBVKkvii4tcCuNQhsPadhk6GYl19Irx7N5mFK0e3/md51Vhpm7gEcKZE
	uCrmN4hitlf+XK3bCYNLcZCX1nuZu6+5a5At0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=s0AwnpI9R9NmR/Zz5ydljE4AES0f6JFVJsCERMjTuu52tuj+Y2ZgeMGgwACJN7P7LE
	eldAcSGet72Trd3jt0F7n9h6ypjvV+AjZte7k2iN9imau9rXbiEFXjY/1XykQqK6iXDd
	t92ToZEaMh5V3LaIdh++7FNB1eH2C9lpVQHjo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.51.4 with SMTP id y4mr733650wfy.155.1245876452725; Wed, 24 
	Jun 2009 13:47:32 -0700 (PDT)
In-Reply-To: <1245875929.5939.17.camel@utx.utx.cz>
References: <1245871136.5939.3.camel@utx.utx.cz>
	<b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
	<1245875929.5939.17.camel@utx.utx.cz>
Date: Wed, 24 Jun 2009 13:47:32 -0700
X-Google-Sender-Auth: 2a7f3c72d5c84f53
Message-ID: <b6ebd0a50906241347g1667f13cy83f7dc49f6e7ce86@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Wed, 24 Jun 2009 20:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2009 at 1:38 PM, Stanislav Brabec<utx@penguin.cz> wrote:
> Chris Larson wrote:
>> +++ b/recipes/bluez/bluez.inc
>> > +DEPENDS =3D "gstreamer gst-plugins-base virtual/libusb0 dbus glib-2.0=
"
>> This is wrong. =C2=A0libusb0 does not replace libusb1.
> =EF=BB=BF
> It was an attempt to make unrelated fix. bluez.inc is actually required
> only by bluez-hcidump_1.42.bb. And bluez-hcidump_1.42.bb does not
> require libusb at all (or at least not directly). So in fact it should
> be probably removed completely.

Understood.

>> It's worth noting that this could be done in a much less intrusive way.
>>
>> In libusb-compat:
>> PROVIDES +=3D "libusb"
>>
>> In libusb:
>> DEFAULT_PREFERENCE =3D "-1", or just set the PREFERRED_PROVIDER_libusb =
=3D
>> "libusb-compat" in the distros.
>
> I didn't know that DEFAULT_PREFERENCE_distroname is possible. But if
> this will work and allow distro maintainers to select one of another,
> then it may be used as well. But I still think that distro config is a
> more convenient way.

DEFAULT_PREFERENCE is just default behavior when no PREFERRED_PROVIDER
is set by the distro.  I'm just pointing out that you could use
"libusb" rather than "virtual/libusb0", and avoid having to change the
multitude of recipes.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


