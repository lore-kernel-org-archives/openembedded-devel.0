Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QBSZD-0004a3-Nf
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 16:03:11 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C72CB16601B3; Sun, 17 Apr 2011 08:00:51 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 17ED316601B2;
	Sun, 17 Apr 2011 08:00:51 -0600 (MDT)
Message-ID: <4DAAF293.7080705@mlbassoc.com>
Date: Sun, 17 Apr 2011 08:00:51 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DUB107-w168531FE95ECFF71F7C03098AE0@phx.gbl>
In-Reply-To: <DUB107-w168531FE95ECFF71F7C03098AE0@phx.gbl>
Subject: Re: an ipk package depending on its corresponding -dev
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
X-List-Received-Date: Sun, 17 Apr 2011 14:03:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2011 07:43 AM, Luca Bolognini wrote:
>
> A strange thing happended to me last time I created libgles-omap3 ipk packages.I had justed patched /usr/bin/cputype (a file contained in one of the SRC_URIs) and libgles-omap3.inc to add some INSANE_SKIPs , then I gave the commands:MACHINE=beagleboard bitbake -v -c clean libgles-omap3MACHINE=beagleboard bitbake -v libgles-omap3
> At least, it happened that I had the dependency:libgles_omap3 ->  libgles_omap3_dev
> It's quite strange and it's the first time I see a package depending on its corresponding -dev.Obviously this dependency is false, there can't be any dependency between these two packages.The same action, with MACHINE=c6a816x-evm (in a different development machine) doesn't lead to this behaviour.However I don't think that MACHINE=beagleboard is involved, probably I corrupted something in the 1st development machine, I don't know.Have you any idea how to remove this ugly (and useless) dependency? How could it originate?

I've seen this happen when something in the package depends on a
library named *.so, instead of a more qualified library such as *.so.1
The *.so files are only packaged in the -dev subpackages by default.

An easy workaround (which might not be perfectly correct) is to just
list the .so files in the main package, e.g.
   FILES_${PN} += "/usr/lib/lib*.so"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


