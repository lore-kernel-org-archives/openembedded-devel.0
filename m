Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QfHkk-0007li-3t
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 22:34:22 +0200
Received: by bwf20 with SMTP id 20so2368461bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:30:28 -0700 (PDT)
Received: by 10.205.36.66 with SMTP id sz2mr567699bkb.405.1310157028613;
	Fri, 08 Jul 2011 13:30:28 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id k5sm353864bka.38.2011.07.08.13.30.27
	(version=SSLv3 cipher=OTHER); Fri, 08 Jul 2011 13:30:27 -0700 (PDT)
Received: by bwf20 with SMTP id 20so2368443bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.205.83.1 with SMTP id ae1mr1610021bkc.8.1310157026321; Fri, 08
	Jul 2011 13:30:26 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Fri, 8 Jul 2011 13:30:26 -0700 (PDT)
In-Reply-To: <CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
	<CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
Date: Fri, 8 Jul 2011 16:30:26 -0400
Message-ID: <CA+T6QPkurkyuotg4yLc=Gg1aL9r5QPE4u7scWEza0=GohnMX=Q@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: "Fernandes, Joel A" <joelagnel@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	Paul Menzel <paulepanter@users.sourceforge.net>, "Kooi,
	Koen" <k-kooi@ti.com>
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
X-List-Received-Date: Fri, 08 Jul 2011 20:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 8, 2011 at 3:10 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> On Fri, Jul 8, 2011 at 11:07 AM, Kooi, Koen <k-kooi@ti.com> wrote:
>> (posting from the airport)
>>
>> If I understood correctly Joel is going to try out 0.9.22 to see if that fixes session mode, and it not, try to make systemmode a separate recipe that both .15 and .22 could optionally use.
>>
>> Joel, please correct me if I'm wrong :)
>
> Hi Koen,
>
> That's right :)
>
> While I'm doing a build, I am also posting detailed logs to pulseaudio
> ML about the failure of an older version, just incase.
>
> Just mentioning that I'm setting PREFERRED_VERSION_pulseaudio to
> 0.9.22 in conf/.../angstrom-2008-preferred-versions.inc

Is it 2008 or 2010 that gets used?

>
> I do recall from the phone that you mentioned something about an
> "armv7" specific variable but I couldn't find it. Let me know if
> setting the above mentioned variable is ok.

I believe I've found an example at
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/conf/distro/angstrom-2008.1.conf?h=2011.03-maintenance#n107:

ANGSTROM_BINUTILS_VERSION                ?= "2.18"
ANGSTROM_BINUTILS_VERSION_armv4          ?= "2.20"
ANGSTROM_BINUTILS_VERSION_armv7a         ?= "2.18.50.0.7"

PREFERRED_VERSION_binutils               ?= "${ANGSTROM_BINUTILS_VERSION}"

Looking at http://cgit.openembedded.net/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-2010-preferred-versions.inc,
it seems to have "0.9.22" already!
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-2010-preferred-versions.inc?h=2011.03-maintenance
seems to be at "0.9.21".

I'd guess that you'd want to submit a patch for maintenance that did
something similar:

ANGSTROM_PULSEAUDIO_VERSION        = "0.9.21" (or whatever the old version was)
ANGSTROM_PULSEAUDIO_VERSION_armv7a = "0.9.22"

PREFERRED_VERSION_pulseaudio       = "${ANGSTROM_PULSEAUDIO_VERSION}"

>
> Thanks and Have a safe flight.

Hopefully I've saved Koen some typing from the phone!  (probably not :-) )

>
> Regards,
> Joel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


