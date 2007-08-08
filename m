Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IInbt-0008Bu-CS
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 17:38:09 +0200
Received: by nz-out-0506.google.com with SMTP id j2so72036nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2007 08:35:31 -0700 (PDT)
Received: by 10.114.199.1 with SMTP id w1mr288137waf.1186587330531;
	Wed, 08 Aug 2007 08:35:30 -0700 (PDT)
Received: by 10.114.73.7 with HTTP; Wed, 8 Aug 2007 08:35:30 -0700 (PDT)
Message-ID: <d543f5920708080835g76bf1633jcb46c4337c7629c4@mail.gmail.com>
Date: Wed, 8 Aug 2007 10:35:30 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <14210558366.20070808155849@vanille-media.de>
MIME-Version: 1.0
References: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
	<1186575579.6091.43.camel@localhost.localdomain>
	<d543f5920708080620h171bb132o91d4aba695d9209@mail.gmail.com>
	<14210558366.20070808155849@vanille-media.de>
X-Google-Sender-Auth: 88568c7371a067e9
Subject: Re: Inheriting conditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2007 15:38:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/8/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
> Matt Hoosier wrote:
> > Thanks. I also got the "bright" idea to install a dummy init script
> > for any distribution other than mine:
>
> > do_install () {
>
> >   ...
>
> >   install -d -m 0755 ${D}${sysconfdir}/init.d
> >   if [ "${DISTRO}" = "foinse" ] ; then
> >       install -m 0755 ${WORKDIR}/init
> > ${D}${sysconfdir}/init.d/pulseaudio
> >   else
> >       echo "#! /bin/sh" > ${D}${sysconfdir}/init.d/pulseaudio
> >       chmod 0755 ${D}${sysconfdir}/init.d/pulseaudio
> >   fi
> > }
>
> This looks like something that could be much better done using the
> distro OVERRIDE.

Hmm, http://www.openembedded.org/user-manual&dpage=special_overrides
doesn't have anything at the moment.

I also had trouble finding a good example in the existing packages
(well, it was Poky, which contains fewer packages than full OE). Do
you happen to know a good example?


