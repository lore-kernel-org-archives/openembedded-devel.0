Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NSiEd-0002V1-Rs
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 03:36:30 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6E2461B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 02:31:52 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jan 2010 03:34:15 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
	<201001060459.45399.holger+oe@freyther.de>
	<op.u543xk1rmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u543xk1rmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001070334.15349.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Thu, 07 Jan 2010 02:36:31 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 07 January 2010 03:02:05 Guo Hongruan wrote:
> =E5=9C=A8 Wed, 06 Jan 2010 11:59:45 +0800=EF=BC=8CHolger Hans Peter Freyt=
her

>=20
> Yes, I agree with you. It is not worth to make sure every combinations of
> GCC, GLIBC and BINUTILS work perfectly. For example, some versions of
> binutils is too old to work with newest glibc/gcc and there are little
> projects using these combinations.
>=20
> But, My idea is that we can maintain a table which records which version
> of package A can not work with which version of package B.
> (for example, glibc-2.6.1 can not work with binutils-2.20)
> So that, when the user chooses these combinations, the
> openembedded/bitbake can give them a warning or error to indicate that
> this combination will not work.

Well, the Angstrom, Minimal, Micro are these documentations. People sat dow=
n=20
and tested the configurations and then used it. I believe it is more valuab=
le=20
to document what is working and in the mainstream than to document which=20
exotic configurations do not work (think of the cross-tool picture where=20
everything is red)

OpenEmbedded is a tool for power users, if they really need to use a specif=
ic=20
version of glibc they should be able to deal with the errors and resolve th=
em.


I pointed out some areas where OE is really lacking in QA and it would be c=
ool=20
if you would be interested in that as well.


