Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Mk2RM-0006NR-6c
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 23:04:56 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3D19111000B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2009 22:45:49 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6B5931100084
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2009 22:45:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (unknown [78.52.226.193])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2009 22:45:48 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7D7953C323; Sat,  5 Sep 2009 22:45:44 +0200 (CEST)
Date: Sat, 5 Sep 2009 22:45:44 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090905204542.GA6341@rhein.zuhause.netz>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
	<5f2b60909030316q43cc1b60ic8350e68bcdb2a5c@mail.gmail.com>
	<h7o6gu$fii$1@ger.gmane.org>
	<5f2b60909030552q10d3c75eq4430bf504a8578c9@mail.gmail.com>
	<5f2b60909050958s6a7ce069l748516267e5f3059@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <5f2b60909050958s6a7ce069l748516267e5f3059@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Sat, 05 Sep 2009 21:04:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2009 at 06:58:32PM +0200, Bj=F8rn Forsman wrote:
> I updated to the latest and greatest dev branch and still gstreamer-ti
> fails to build for machine dm6446-evm. It cannot find esd.h:

Yeah,

gstreamer needs a esound in the DEPENDS line.

Bye Henning


