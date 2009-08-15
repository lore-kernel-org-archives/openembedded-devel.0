Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1McRvI-0003zi-Lt
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 00:40:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D25EC1417196
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:15:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YE94Aqx9kIku
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:15:13 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A69FB1417184
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 00:15:13 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A86A13E.6020402@atmel.com>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
	<4A867CCA.7060609@atmel.com>
	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
	<1250330779.4406.9.camel@utx.utx.cz>  <4A86A13E.6020402@atmel.com>
Date: Sun, 16 Aug 2009 00:23:40 +0200
Message-Id: <1250375020.5033.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Sat, 15 Aug 2009 22:40:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> Stanislav Brabec skrev:
> > Well, there may be a problem in recipes. There is xcalibrate and
> > libxcalibrate. Both provide the same library. Some recipes use
> > xcalibrate in DEPENDS, some use libxcalibrate. libxcalibrate does not
> > compile on images with xserver-kdrive.
> > 
> I have looked through the code.
> x11-image uses Xorg and libxcalibrate.
> 
> There can be several reasons for this error message:
> 
> 1) Xmalloc fails
> 2) There is no extension XCALIBRATE
> 3) There is an extension, but with different casing
>    XCALIBRATE is used by libxcalibrate.
>    if another name is used when it is added,
>    then there is a problem when queried.
>    The library is called libXcalibrate.so.

4) Both xcalibrate and libxcalibrate were populated to staging and one
overwrites the other. .la files from one could "poison" the other.
To identify this possible problem, please look at your build logs or
check your tmp/work. If both xcalibrate and libxcalibrate were staged,
you may expect problem.

If only one of the was built, it is a different problem.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



