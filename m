Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id A619360EA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 08:17:20 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQv90-002mv7-4y>; Tue, 01 Oct 2013 10:17:22 +0200
Received: from g225007222.adsl.alicedsl.de ([92.225.7.222]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1) with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQv8z-002fL2-Qq>; Tue, 01 Oct 2013 10:17:22 +0200
Date: Tue, 1 Oct 2013 10:17:16 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Riku Voipio <riku.voipio@linaro.org>
Message-ID: <20131001081715.GA25557@mail.zedat.fu-berlin.de>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
	<20130930155838.08e5f9d4@e6520eb>
	<20130930193046.GB22970@mail.zedat.fu-berlin.de>
	<CAAqcGH=MgJOj_f08u8LA1NMJd6-bT2xC=uLQvee2sKtbh+1pOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAqcGH=MgJOj_f08u8LA1NMJd6-bT2xC=uLQvee2sKtbh+1pOw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 92.225.7.222
Cc: openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 08:17:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 01, 2013 at 10:44:56AM +0300, Riku Voipio wrote:
> On 30 September 2013 22:30, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
> > On Mon, Sep 30, 2013 at 03:58:38PM +0200, Eric Bénard wrote:
> >> Hi Riku,
> >>
> >> Le Mon, 30 Sep 2013 16:46:11 +0300,
> >> Riku Voipio <riku.voipio@linaro.org> a écrit :
> >>
> >> > Current IFS mangling blows up on the face:
> >> >
> >> >     | configure:2341: javac  -classpath .: Test.java
> >> >     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
> >> >
> >
> > Which shell blows it up? With dash on ubuntu its working fine.
> 
> I'm using bash (oe handbook tells to switch /bin/sh from dash to bash.
> 
> $ cat test.sh
> #!/bin/sh
> IFS=""
> 
> exec echo jamvm ${1+"$@"}
> $ dash test.sh foo bar bar bar
> jamvm foo bar bar bar
> $ bash test.sh foo bar bar bar
> jamvm foobarbarbar
> $ vi test.sh
> 
> While the simpler version:
> $ cat test.sh
> #!/bin/sh
> 
> exec echo jamvm "$@"
> $ dash test.sh foo bar bar bar
> jamvm foo bar bar bar
> $ bash test.sh foo bar bar bar
> jamvm foo bar bar bar
> 
> seems to run fine (echo added in both for clarity)
> 
> Riku

Okay thanks,

patch is now applied.

Bye Henning

