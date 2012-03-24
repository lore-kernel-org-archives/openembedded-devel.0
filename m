Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SBOvi-0002LW-Pw
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 12:14:42 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D1775223263A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 12:05:47 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4A20D2232639
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 12:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225005117.adsl.alicedsl.de
	[92.225.5.117]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 12:05:47 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 85A183C4C0; Sat, 24 Mar 2012 12:05:46 +0100 (CET)
Date: Sat, 24 Mar 2012 12:05:46 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120324110546.GB19971@rhein.zuhause.netz>
References: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
	<20120323214210.GJ9551@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20120323214210.GJ9551@bill-the-cat>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Sat, 24 Mar 2012 11:14:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 23, 2012 at 02:42:10PM -0700, Tom Rini wrote:
> On Fri, Mar 23, 2012 at 10:10:57PM +0100, Henning Heinold wrote:
> 
> > Hi,
> > 
> > while building openjdk I discovered that relocatable.bbclass strips
> > all PATHS with ORIGIN, that is problematic, when binaries like an jdk
> > is installed not in the standard paths /lib or /usr/lib.
> > 
> > This patch let all exisiting ORIGIN stay in the binary. So
> > far I only saw problems with some perl-native libs, where chrpath fails
> > now, because the path is to long. But it seems they work anyway.
> 
> Perhaps my memory is hazy, but this feels like an openjdk problem.  Why
> is openjdk putting things other than were our $ORIGIN mangle expects
> them to have been placed?
> 
> -- 
> Tom
> 

Hi Tom,

we install openjdk to /usr/lib/jvm/icedteaX-native  where it has bin jre lib under jre you have
lib/server/$ARCH/lib1 lib2 .. . Openjdk links from /usr/lib/jvm/icedteaX-native/bin to $ORIGIN/../jre/lib/$ARCH/lib1 .
So relocatable.bbclass strips this path from rpath.

Bye Henning


