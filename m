Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nc53d-0003VC-34
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 23:47:52 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nc51F-0001Hq-Dx from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 14:45:21 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Feb 2010 14:45:21 -0800
Received: from 134.86.101.223 ([134.86.101.223]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Feb 2010 22:45:06 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Feb 2010 16:45:06 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001312345k7cbf864fte67fce2c5b8fcdba@mail.gmail.com>
References: <ac9c93b11001312345k7cbf864fte67fce2c5b8fcdba@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Feb 2010 16:45:05 -0600
Message-Id: <1265064305.4255.28.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 01 Feb 2010 22:45:21.0196 (UTC)
	FILETIME=[3C12BEC0:01CAA390]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kernel build: modules.order and modules.builtin
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
X-List-Received-Date: Mon, 01 Feb 2010 22:47:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-01 at 08:45 +0100, Frans Meulenbroeks wrote:
> Should modules.order and modules.builtin be shipped in a package when
> a kernel is build? currently I get a note that they are installed but
> not shipped.
> I've seen this both for beagleboard and openrd.

Personally I think that modules.* should be globbed into the
kernel-modules meta package (since that will bring in all of the modules
anyhow).

-- 
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


