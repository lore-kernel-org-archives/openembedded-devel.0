Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nm8At-0000XR-AQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:08:56 +0100
Received: from [192.168.1.4] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 299BD58438E;
	Mon,  1 Mar 2010 18:01:16 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1077)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <20100301165444.82e3fa2e.ospite@studenti.unina.it>
Date: Mon, 1 Mar 2010 17:06:02 +0100
Message-Id: <364696FC-E268-4E09-9E41-1059F5FD932D@vanille-media.de>
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
	<hmehnp$n57$1@dough.gmane.org> <4B8AE4F8.1000906@balister.org>
	<1267394698.13054.5.camel@andromeda>
	<20100301165444.82e3fa2e.ospite@studenti.unina.it>
To: Antonio Ospite <ospite@studenti.unina.it>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Mon, 01 Mar 2010 16:08:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

> Be patient but my knowledge of OE is still limited, the point here is
> that distros can override PREFERRED_VERSIONs set in machine files, =
isn't
> it?

Machines should not limit versions, only providers; distros and local =
configurations are
the ones supposed to specify versions. Then again, this assumption =
relies on the
"default" configuration being working, which -- in case of pulseaudio -- =
it obviously
is not.

>> Of course one could argue that there is a bug in the OE recipes =
metadata
>> rather than the distro, since the pulseaudio recipes are known broken
>> for certain architectures -- however they don't contain any =
blacklisting
>> or whitelisting except for om-gta01/om-gta02 which I added when I =
became
>> aware of the problem. Antonio, lets just blacklist the broken =
versions
>> for the machines you're interested in.
>>=20
>> :M:
>=20
> I can well add DEFAULT_PREFERENCE_om-a780 =3D "-1"
> in both pulseaudio_0.9.21.bb and pulseaudio_0.9.19.bb
> Is that what you mean Mickey?

Yes.

> Way better than my solution but still a bit hackish.

Not necessarily. It would be better if we could limit it for armv4(t) =
and armv5(t),
however we don't have such fine granular overrides, hence we need to =
blacklist
on machine basis.

> If that's OK for you, it'll be fine with me as well.

:)

> About fixing distro, isn't 'minimal' supposed to build all the latest
> recipes? If so a  conf/distro/include/preferred-minimal-versions.inc
> would not have much sense if we can't set preference rules per
> machines (or archs).

We can set preference rules per machine or arch, however the general
consensus is that this is being done in the distro or local conf.

Yes that codifies machine knowledge in distro and may have to be =
revisited,
but at least it has been our working style until now.

:M:=


