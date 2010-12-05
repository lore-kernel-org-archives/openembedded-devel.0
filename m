Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PPB7C-0008FF-No
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 10:42:43 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8FD2D11000B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Dec 2010 10:41:18 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 65618110009A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Dec 2010 10:41:17 +0100 (CET)
Received: from rhein.familie-heinold.de (g225074249.adsl.alicedsl.de
	[92.225.74.249]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Dec 2010 10:41:17 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 281C23C121; Sun,  5 Dec 2010 10:40:43 +0100 (CET)
Date: Sun, 5 Dec 2010 10:40:43 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101205094042.GA3572@rhein.zuhause.netz>
References: <4CD27E26.1070706@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4CD27E26.1070706@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openjdk-6 fails to translate
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
X-List-Received-Date: Sun, 05 Dec 2010 09:42:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 04, 2010 at 10:34:30AM +0100, Jaap de Jong wrote:
> Hi All,
> I've been trying to tackle this myself, but no luck so far...
> What I can make of it is that -lz is translated into a reference to
> /usr/lib/libz.so
> Any help is appreciated!
> Jaap
> 

Hi I looked a bit deeper into it.
The only fast and ugly solution is to delete libz.la from the target sysrootdir.

Bye Henning


