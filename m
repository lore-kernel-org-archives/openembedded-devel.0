Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mu1x4-0000ZH-Ga
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 12:35:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 14D581417194
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 12:29:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CNlT2OvPbVr
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 12:29:09 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id DEC771416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2009 12:29:08 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fd72b8f50910020831u16227c45wdca6fc9ed4bf8cb4@mail.gmail.com>
References: <fd72b8f50910020831u16227c45wdca6fc9ed4bf8cb4@mail.gmail.com>
Date: Sat, 03 Oct 2009 12:34:12 +0200
Message-Id: <1254566052.3849.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Multiple .bb files are due to be built which each provide	bluez-libs
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
X-List-Received-Date: Sat, 03 Oct 2009 10:35:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

mail mail wrote:
> Hi,
> I got "Multiple .bb files" problms, but it seems not affects building. Could
> some one give me some information about this multiple .bb files problems?
> This is the log:

You are trying to build recipes dependent on both bluez3 and bluez4. It
cannot work. You must remove one or another from the recipes list or use
version compatible with selected version of bluez.

Log does not show, which recipes caused this clash. bluez4 is not
preferred technology (but it requires dbus). gpe-bluetooth is an example
of application incompatible with bluez4.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



