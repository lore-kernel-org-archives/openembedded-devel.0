Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MlBhL-0001Wh-0D
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 03:10:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 17CE01409717
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:44:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aBmKUP8EHwg
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:44:09 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id E1CB81409713
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:44:08 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fce2a370908310326i1f784f25qd4ed91d7864ef38a@mail.gmail.com>
References: <fce2a370908310326i1f784f25qd4ed91d7864ef38a@mail.gmail.com>
Date: Tue, 08 Sep 2009 21:50:56 +0200
Message-Id: <1252439456.8256.2.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Unzip missing
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
X-List-Received-Date: Wed, 09 Sep 2009 01:10:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> Hello!
> I encountered the following error when unpacking faad2 recipe on bare
> debian lenny system (stable/2009 tree):
> sh: unzip: command not found
> The problem is that there is no 'unzip' utility on the host. I tried
> to specify DEPENDS = "unzip-native" for faad2 recipe but it somehow
> doesn't wait for unzip-native to be built. Any suggestions on how to
> make faad2 unpack task wait for unzip-native staging? Or should we
> just put unzip into list of required host software in sanity.bbclass?
> Thanks for help.

Here is a fix per-package:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=d5345f88b5ffdca098e0281f42f51e42ef43e79d

There can be even more affected packages.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



