Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JPz0W-0003AD-Eb
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 12:45:35 +0100
Received: from andromeda (e180186145.adsl.alicedsl.de [85.180.186.145])
	by drlauer-research.com (Postfix) with ESMTP id 09CD0584BC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 12:50:24 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2008 12:45:29 +0100
User-Agent: KMail/1.9.7
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>
	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
In-Reply-To: <74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200802151245.30040.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev anki: fix parse error
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
X-List-Received-Date: Fri, 15 Feb 2008 11:45:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 14 February 2008 17:17:01 pHilipp Zabel wrote:
> On Thu, Feb 14, 2008 at 4:01 PM, hrw commit
>
> <openembedded-commits@lists.openembedded.org> wrote:
> > anki: fix parse error
> >
> >  Author: hrw@openembedded.org
> >  Branch: org.openembedded.dev
> >  Revision: a33b3d19ac330b59af9dbbb80b1410d4579bba26
> >  ViewMTN:
> > http://monotone.openembedded.org/revision/info/a33b3d19ac330b59af9dbbb80b
> >1410d4579bba26 Files:
> >  1
> >  packages/anki/anki_0.4.3.bb
> >  Diffs:
> >
> >  #
> >  # mt diff -r75f2dc6b3a783a084bf013ce7dc072992561a9bd
> > -ra33b3d19ac330b59af9dbbb80b1410d4579bba26 #
> >  #
> >  #
> >  # patch "packages/anki/anki_0.4.3.bb"
> >  #  from [bbc71d5b420649c30e0f4e7ca986a9f3516be13e]
> >  #    to [de5cc8560fa7d2401299249253867146486bcf24]
> >  #
> >  ============================================================
> >  --- packages/anki/anki_0.4.3.bb bbc71d5b420649c30e0f4e7ca986a9f3516be13e
> >  +++ packages/anki/anki_0.4.3.bb de5cc8560fa7d2401299249253867146486bcf24
> >  @@ -1,9 +1,9 @@ PR = "r0"
> >   require anki.inc
> >
> >   RDEPENDS += "libanki"
> >   PR = "r0"
> >
> >  -export PV
> >  +export PV="${PV}"
>
> ERROR: variable PV references itself!
>
> rolling that patch back fixes this bitbake parsing error for me (I
> didn't try to build anki)

export PV is valid syntax, but needs bitbake >= 1.8.8.

If you think it's too early to depend on this, then you can substitute with

export PV := "${PV}"

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


