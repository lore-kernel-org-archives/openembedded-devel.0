Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Gl00y-0001Dc-6O
	for openembedded-devel@openembedded.org; Fri, 17 Nov 2006 10:28:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAH9Ph9o030970
	for <openembedded-devel@openembedded.org>; Fri, 17 Nov 2006 09:25:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30470-10 for <openembedded-devel@openembedded.org>;
	Fri, 17 Nov 2006 09:25:41 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kAH9PeH2030963
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 17 Nov 2006 09:25:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200611170101.06186.openembedded@hrw.one.pl>
References: <200610291528.40663.openembedded@hrw.one.pl>
	<200611170101.06186.openembedded@hrw.one.pl>
Date: Fri, 17 Nov 2006 09:25:39 +0000
Message-Id: <1163755540.5551.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	kAH9Ph9o030970
Subject: Re: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Fri, 17 Nov 2006 09:28:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-11-17 at 01:01 +0100, Marcin Juszkiewicz wrote:
> Dnia niedziela, 29 pa=C5=BAdziernika 2006 15:28, Marcin Juszkiewicz nap=
isa=C5=82:
> > Currently OpenEmbedded use overrides based on DISTRO, MACHINE,
> > TARGET_ARCH and few others. I want to suggest start of using also
> > {MACHINE,DISTRO}_FEATURES because we have some stuff in metadata whic=
h
> > make sense only on some targets only - for example madwifi is limited
> > to PCI devices only.
>=20
> Holger 'zecke' Freyther pointed me to MacPorts and their 'variants'. Af=
ter=20
> looking at them I think that those are other kind of our overrides.
>=20
> Which points me to this idea: how about adding COMBINED_FEATURES into=20
> overrides? I do not know will it slow down BitBake or make metadata bit=
=20
> more ugly but it is kind of solution.

Personally, I think its a bad idea as we have too many variables in this
field and it could end up with too much namespace pollution. We need to
keep our overrides lean :)

Also, this would automatically make any package machine specific and
make multimachine pointless (anything using COMBINED_FEATURES is machine
specific).

Richard



