Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmtCg-0002k3-I2
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:21:52 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nmt9t-0001DO-HP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 10:18:57 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Mar 2010 10:18:57 -0800
Received: from 172.30.80.138 ([172.30.80.138]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  3 Mar 2010 18:18:49 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 Mar 2010 11:18:48 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100303180851.GC2493@xora-desktop.xora.org.uk>
References: <1267633819.4739.343.camel@trini-m4400>
	<hmm5pb$est$1@dough.gmane.org> <1267637587.4739.345.camel@trini-m4400>
	<20100303180851.GC2493@xora-desktop.xora.org.uk>
Organization: Mentor Graphics Corporation
Date: Wed, 03 Mar 2010 11:18:48 -0700
Message-ID: <1267640328.4739.351.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Mar 2010 18:18:57.0018 (UTC)
	FILETIME=[FD273DA0:01CABAFD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 18:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-03 at 18:08 +0000, Graeme Gregory wrote:
> On Wed, Mar 03, 2010 at 10:33:07AM -0700, Tom Rini wrote:
> > Note that I'm not talking about "small" things like removing legacy
> > staging stuff (which is good!) I'm talking about things with the
> > potential to leave stuff non-building until stumbled upon.  Hence the
> > idea we do merge this into dev shortly after the next stable.
> >=20
> I think you are approaching things backwards.
>=20
> Develop this to the point of working enough other people can start to tes=
t it
> in a feature branch.
>=20
> Tag org.openembedded.dev then merge this work into .dev
>=20
> Anyone in the future can use the tag to get back to a "stable" point.

Let me try and make an analogy with (how I recall anyhow) kernel
development going.  As an example, re-laying out staging/ (and probably
killing cross/) happens in a branch.  Works for me.  Then still works
for some relatively big set (think -next) of targets.  I'm using the
next stable branching point as an analogy for a release + -rc1 merge
window opening up.

If everyone thinks that's just overkill, Chris will just start on the
new pstaging in a branch somewhere pretty soon I hope then.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


