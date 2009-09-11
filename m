Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Mm5aK-00052I-0o
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 14:50:43 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 73F8611000AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 14:50:11 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 807831100088
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 14:50:08 +0200 (CEST)
Received: from rhein.familie-heinold.de (unknown [78.52.226.29])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 14:50:08 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DEFD73C08B; Fri, 11 Sep 2009 14:50:05 +0200 (CEST)
Date: Fri, 11 Sep 2009 14:50:05 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090911125005.GC8711@rhein.zuhause.netz>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
	<200908251609.25008.holger+oe@freyther.de>
	<91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
	<20090911081303.GA18964@localhost.minsk.epam.com>
	<91283b620909110351r2d9758b4n20f0f02dfed4b058@mail.gmail.com>
	<20090911112612.GB19399@localhost.minsk.epam.com>
	<91283b620909110506p5768a960o6bf4abab421cb1b3@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <91283b620909110506p5768a960o6bf4abab421cb1b3@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt problems
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
X-List-Received-Date: Fri, 11 Sep 2009 12:50:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2009 at 01:06:13PM +0100, Stuart Gray wrote:
> How do I do this?
> 
> Do I use the names as below and add them to my image file under SIMPLE_AUDIO
> or are they RDEPENDS????
> 
> Thanks,
> Stuart

If oe cant figure out if the plugins are needed make them RDEPENDS in your recipe.
Now the error occurs at installing the package rather than execution.

If you want something in an image look at the many images recipes. Probably you will
set up a task too.

Bye Henning


