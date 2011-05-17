Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QMENM-000495-Lk
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 09:07:28 +0200
Received: by fxm19 with SMTP id 19so334539fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 00:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=N0EAgsd+KAOaX9CeCgiL7L6x/t8IknvLONrJUlMSb0A=;
	b=pvoCip4i16s28WLITZcRN4/ckruVfbe+uUuKIxGx9w/frTK1q8Q+SCy2oAqO1DTY9/
	rcFsgCYq2aKWAAP6UcdZaHCMi8QEGcxUr+cZRiS2X+ABnDldQLEUGs0XKl7NT+NyCioV
	k7OTbF0BfdogiLWl4mDlpzOLvum2sOhg/Hxfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KfQUtJt6+IdAJ77QbvLm7rnYvsDFRrp8B/QxItCy1kbtjg+Odg36Tzl+aXPG/ymgrz
	y++ByIQspDEQysUaPhqpVnbiXJfQ0yK05d3PbK/H06GlLhEj8rGLBsH6Rtg463bSf1H0
	lEiFUjUhKZrK9U6vdaYTpGFx8J1HicyRzTaZw=
MIME-Version: 1.0
Received: by 10.223.92.132 with SMTP id r4mr342858fam.142.1305615875515; Tue,
	17 May 2011 00:04:35 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Tue, 17 May 2011 00:04:35 -0700 (PDT)
In-Reply-To: <iqt55i$59d$1@dough.gmane.org>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
	<1305564582.2429.90.camel@phil-desktop>
	<BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
	<iqt55i$59d$1@dough.gmane.org>
Date: Tue, 17 May 2011 09:04:35 +0200
Message-ID: <BANLkTikg=j9+Y-o8CfXEpBbY51u+tBLa8A@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Tue, 17 May 2011 07:07:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 17, 2011 at 08:38, Koen Kooi <koen@dominion.thruhere.net> wrote:
> On 17-05-11 08:23, Anders Darander wrote:
>> Yes, this is definitely needed. Which type of new
>> applications/libraries can get into meta-oe, and which are supposed to
>> be kept in higher layers...
>>
>> In what cases can additional versions of the recipe in oe-core be
>> added? E.g. dbus is built using 'EXTRA_OECONF = "--with-x"', which at
>> least on head-less systems seems to be overkill.
>
> Dbus is a really good example where the above knee-jerk reaction is
> misplaced :) The --with-x only turns on building dbus-launch, which is x
> specific, but that's the only bit that is. All the other dbus
> subpackages lack X dependencies.

Yes, from that point, Dbus was not the optimal example, I agree...

Though, that was only one example of a package that has either runtime
or only build-time dependencies on X in some form or another. Earlier,
in the 2011.03-releases, we had systemd depending on gtk+, which has
been removed in the lates updates. Thats just another example.

In some cases, removing direct or indirect dependencies like these,
would be something that we'd like to see integrated upstreams. Of
course, we are willing to supply patches for that, after a discussion
on how such things should be handled. Is it desired for package Y or
isn't it. This could sometimes be to reduce the image size, but in
cases like dbus, it might only be to reduce build time and
build-directory size.

In other cases, I assume that we're going to continue keeping our
patchsets local, as I guess that we probably have quite uncommon
desires to get a certain packet working without e.g. X or some other
dependency.

Regards,
Anders


