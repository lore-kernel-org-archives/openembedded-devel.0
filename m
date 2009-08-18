Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MdMA9-0002qK-0P
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:43:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 249481409713
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:18:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqbk4uOFXRze
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:18:12 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id E83B41416BAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:18:11 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250551346.5083.3@zaurus>
References: <1250551346.5083.3@zaurus>
Date: Tue, 18 Aug 2009 12:26:28 +0200
Message-Id: <1250591188.3555.5.camel@utx.utx.cz>
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
X-List-Received-Date: Tue, 18 Aug 2009 10:43:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:

> There are two recipes for the calibrate library: libxcalibrate and 
> xcalibrate
> 
> There are two recipes that provide prototypes: calibrateproto 
> and xcalibrabrateext
> 
> Only some of these combinations result in a working environment.
> 
> I'll test, whether latest library version works with xserver-
> kdrive-1300.

Yes, xtscal works with xserver-kdrive-1300 and latest libxcalibrate and
calibrateproto.

It didn't work for kdrive based builds, because kdrive recipe wants
libxcalibrate, but xtscal wants xcalibrate. One dependency chain
overwrites the another with undefined result depending on the build
order.

That is why I would like to propose:
- remove all xcalibrate and xcalibrabrateext recipes
- find recipes and images that need them and migrate them to
libxcalibrate and calibrateproto.
- fix git versioning of libxcalibrate and calibrateproto, maybe
increment PE.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



