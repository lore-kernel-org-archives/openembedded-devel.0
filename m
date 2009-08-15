Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1McGPf-0005or-O8
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 12:23:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E20881409735
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 11:57:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5TSct3sqUGL
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 11:57:49 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id BB6B71416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 11:57:49 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250329051.4215.167.camel@lenovo.internal.reciva.com>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
	<4A867CCA.7060609@atmel.com>
	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
Date: Sat, 15 Aug 2009 12:06:19 +0200
Message-Id: <1250330779.4406.9.camel@utx.utx.cz>
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
X-List-Received-Date: Sat, 15 Aug 2009 10:23:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sat, 2009-08-15 at 11:15 +0200, Ulf Samuelsson wrote:
> > Looks like xtscal in x11-image fails.
> > 
> > $ DISPLAY=":0.0" xtscal
> > XCALIBRATE extension missing
> 
> That error is fairly self-explanatory: your xserver lacks the XCALIBRATE
> extension.  Xtscal won't work if this is missing.

Well, there may be a problem in recipes. There is xcalibrate and
libxcalibrate. Both provide the same library. Some recipes use
xcalibrate in DEPENDS, some use libxcalibrate. libxcalibrate does not
compile on images with xserver-kdrive.

I think that the fix will require complete removal of xcalibrate:
- xcalibrate_20060312.bb and xcalibrate_cvs.bb seems to be no more used.
- xcalibrate_git.bb needs to be moved to libxcalibrate_git.bb using its
version.
- libxcalibrate probably needs to be moved to model specific directories
(kdrive images need different version than xorg versions).
- Update preferred versions for particular image.
- and finally libxcalibrate should use standard git PV/PR allowing
future upgrade.

Alternative solution: Fix the latest libxcalibrate to work with bothe
Xorg and kdrive.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



