Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SVGZQ-0008I7-Gi for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 08:21:48 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SVGPd-0006FD-7S for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 08:11:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 08:11:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 08:11:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 May 2012 08:11:30 +0200
Message-ID: <jp4p6i$h3t$1@dough.gmane.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
	<jp3k9b$p58$1@dough.gmane.org>
	<CALbNGRRGD=oykOV8mb0tTi+ZhHHTjsA7bbSTGSPr_OYUi=sPUQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRRGD=oykOV8mb0tTi+ZhHHTjsA7bbSTGSPr_OYUi=sPUQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: meta-systemd
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
X-List-Received-Date: Fri, 18 May 2012 06:21:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-05-12 22:18, Andreas Müller schreef:
> On Thu, May 17, 2012 at 9:41 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 17-05-12 15:07, Andreas Müller schreef:
>>> Hi
>>> 
>>> happy to see this happen I have few questions on what is planned.
>>> 
>>> In README is written:
>>> 
>>>> And we're working to break the dependency on this one:
>>>> 
>>>> URI: git://git.openembedded.org/meta-openembedded
>>> 
>>> Maybe it is a misunderstanding but I would expect for contents of
>>> this layer
>>> 
>>> * systemd.bbclass * all from meta-oe/recipes-core/systemd * bbappends
>>> for all recipes with systemd support.
>>> 
>>> Is this correct?
>> 
>> Correct. The bbappends will likely cause dependencies on non-oecore
>> layers, but so be it. We might need to set the unbreak-me flag for
>> missing bb files that match our bbappends. Unless people actually start
>> reporting the bugs they encounter by including meta-oe...
> Two more questions:
> 
> 1. Has anybody patches in queue to fill meta-systemd? If not I would 
> stand up to prepare some.

The ones I had don't apply anymore.

> 2. Any complaints against the original idea to RRECOMMEND *-systemd 
> package as suggested [1] to avoid *-systemd packages in tasks/images. 
> AFAICR this was NAKed because a distro-var was necessary.

That's a statement, not a question :) I've been discussing this a lot the
past few months (conferences, irc, jabber) and I think we should have a
distro feature for every init system: sysvinit, systemd, upstart, openrc,
etc. I'm not sure if those would need to be mutually exclusive or not.

And finally: let's not make a lot of subpackages for things containing only
tmpfiles.d snippets. Consistency is good, but don't go overboard.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPtegSAAoJEHZqAkdh1vT6dzAP/RQOOuxzgeZHOXpcKqBV+Qfz
GEbOMDdGN/kdvJk6hEEmVc3QnqtJmeyNW614xs0JQPDJMTOcMQ5OJT35qhPOkq5y
TxRJ1A1R/IbFmtQnhwkltkIeMfqeXo1PasiZGXc+ebbrHrtVDqI2Dl1Mb3HjrOup
rzLXQ6JEwYOY/agsHHGncKz/wjEhh9hW1nF24F/APHd1qcHHESx9LS9hV2fSbZDv
TJvzQMznN5Jiw3TomgdCrGpMI+oSjYY0aUugqUNkEor766pyhalMumqVBbHLEqyx
bSRCTChSKDv/txdjGetx46iwd4LI3BXsczxqewAWGxG9QoLMV6fSmRs0TDwItjbL
0VqbM9qY1AHLvXOVjzJrh3ds7i02iFsP9ffT+5dDFArYik7eZmkhJMlTVKC+UMjL
t+pVEvIJasFpZZ36jOxdzRTpD1qZa/5qBpS9hENbyXzMZDyYVsc4m1EObMXzBQvX
QRjwBNNXbuLufHWIi4oPd8YNyoqgP9CiakLFT2AtHnFb8n5PcNTHdPUAlYFrdx7U
Nmo4u5zjLmKkjKViujjvKGxvJPKw5KIiPyNlnDiDZtgLgdHlal51YRFLHKYhiHXK
A7YPcNhvv+V4RhDUxzXHkZ35mCKaTDIXP1/MdxIYiIQgkAe8FCrAkn+/xhu/x4hZ
/TJNHwWLO1tTym+l4KEj
=mMlk
-----END PGP SIGNATURE-----



