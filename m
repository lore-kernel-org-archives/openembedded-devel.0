Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IInjv-0008Ns-TQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 17:46:33 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 2639328C013; Wed,  8 Aug 2007 17:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180177247.adsl.alicedsl.de [85.180.177.247])
	by srv043.dedi23.de (Postfix) with ESMTP id 243A028C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2007 17:41:26 +0200 (CEST)
Date: Wed, 8 Aug 2007 17:43:47 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1089553613.20070808174347@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d543f5920708080835g76bf1633jcb46c4337c7629c4@mail.gmail.com>
References: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
	<1186575579.6091.43.camel@localhost.localdomain>
	<d543f5920708080620h171bb132o91d4aba695d9209@mail.gmail.com>
	<14210558366.20070808155849@vanille-media.de>
	<d543f5920708080835g76bf1633jcb46c4337c7629c4@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 08 Aug 2007 15:46:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Matt Hoosier wrote:
> On 8/8/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
>> Matt Hoosier wrote:
>> > Thanks. I also got the "bright" idea to install a dummy init script
>> > for any distribution other than mine:
>>
>> > do_install () {
>>
>> >   ...
>>
>> >   install -d -m 0755 ${D}${sysconfdir}/init.d
>> >   if [ "${DISTRO}" = "foinse" ] ; then
>> >       install -m 0755 ${WORKDIR}/init
>> > ${D}${sysconfdir}/init.d/pulseaudio
>> >   else
>> >       echo "#! /bin/sh" > ${D}${sysconfdir}/init.d/pulseaudio
>> >       chmod 0755 ${D}${sysconfdir}/init.d/pulseaudio
>> >   fi
>> > }
>>
>> This looks like something that could be much better done using the
>> distro OVERRIDE.

> Hmm, http://www.openembedded.org/user-manual&dpage=special_overrides
> doesn't have anything at the moment.

> I also had trouble finding a good example in the existing packages
> (well, it was Poky, which contains fewer packages than full OE). Do
> you happen to know a good example?

Check initscripts. We're using DISTRO overrides here to provide some
branding in issue and issue.net.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



