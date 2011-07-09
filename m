Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfLUO-0003Us-0W
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 02:33:44 +0200
Received: by iwn4 with SMTP id 4so2285330iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eAwCYcsvDrwlEXCl9c1FDGYsI4OYSwmWnlmufK6Wk6I=;
	b=DMk3/4/faXyGGX9CnEJfxqGxKCO3HOXxHC2dhuzCNTkK3XyK5+g/Sc/LUEQ6XEIlMA
	DXJhnRV10gMVpw15tsimYL7fVh0SvnKSKeaViYaduGDsrG/mdWOjWMKvnqI39DLFE1WC
	Kg4sPRC/lev5DXSjZJPE7VHu0FYI3w0AiNKoo=
MIME-Version: 1.0
Received: by 10.231.203.136 with SMTP id fi8mr2282061ibb.181.1310171390297;
	Fri, 08 Jul 2011 17:29:50 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Fri, 8 Jul 2011 17:29:50 -0700 (PDT)
In-Reply-To: <1310140818.4517.3.camel@mattotaupa>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
Date: Fri, 8 Jul 2011 19:29:50 -0500
Message-ID: <CAD=GYpYxH6E3rho_vW3Q9ncXna7EPHK5M=icjFn0eQ3v7YJ=Lw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: joelagnel@ti.com, k-kooi@ti.com, openembedded-devel@lists.openembedded.org,
	jdk@ti.com
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Sat, 09 Jul 2011 00:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

Can we ignore this patch and use one I just submitted titled
"pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03"?

Thanks for reviewing my patch,

Regards,
Joel

On Fri, Jul 8, 2011 at 11:00 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> [Just adding back everyone to CC list.]
>
>
> Am Freitag, den 08.07.2011, 17:55 +0200 schrieb Paul Menzel:
>> Am Donnerstag, den 07.07.2011, 21:55 -0500 schrieb Joel A Fernandes:
>> > >> As far as I understood system mode can sometimes be the right thing to
>> > >> do but most of the time it is just a configuration error. Running PA and
>> > >> printing out the debug messages should give you a clue.
>> > >
>> > > Pulseaudio isn't printing any debug messages to syslog or stdout ( -vv
>> > > -log-level pulseaudio options )
>> > >
>> > > Here was the thread on BeagleBoard mailing list that discusses this issue:
>> > > http://groups.google.com/group/beagleboard/browse_thread/thread/4dc82483a8d000fb/ccbd0e21fa5e89a0
>> > >
>> > > I will post the details of the problem on the pulseaudio mailing list
>> > > and try to get some other alternatives.
>> > >
>> > > For now, can we temporarily merge this patch while I followup with them?
>> >
>> > Here is a discussion I started on the pulseaudio list:
>> > http://lists.freedesktop.org/archives/pulseaudio-discuss/2011-July/010565.html
>>
>> Thank you very much for bringing this issue to upstreams attention.
>>
>> Regarding to pushing this patch, I am still a little confused since you
>> wrote to the PA list you are using PA 0.9.15 and your patch is against
>> 0.9.22.
>>
>>
>> Thanks,
>>
>> Paul
>


