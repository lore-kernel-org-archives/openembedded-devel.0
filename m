Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GLt3P-0004za-VJ
	for openembedded-devel@openembedded.org; Sat, 09 Sep 2006 04:58:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 59F489F43A;
	Sat,  9 Sep 2006 12:55:36 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14066-08; Sat, 9 Sep 2006 12:55:34 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 2691171D43;
	Sat,  9 Sep 2006 12:55:34 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 099A6F24367; Sat,  9 Sep 2006 12:55:34 +1000 (EST)
Date: Sat, 9 Sep 2006 12:55:34 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Christopher Lang <christopher.lang@plus.cablesurf.de>
Message-ID: <20060909025533.GA4524@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Christopher Lang <christopher.lang@plus.cablesurf.de>,
	openembedded-devel@openembedded.org
References: <200609062324.33029.christopher.lang@plus.cablesurf.de>
Mime-Version: 1.0
In-Reply-To: <200609062324.33029.christopher.lang@plus.cablesurf.de>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@openembedded.org
Subject: Re: error: #error "TLS support is required." while building glibc-initial-2.4 on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2006 02:58:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 06, 2006 at 11:24:32PM +0200, Christopher Lang wrote:
> 
> I tried to start a fully renewed oe build system today with bitbake 1.6 and up 
> to date oe checkout. I am using minimal distro/machine files. 
> While building bootstrap-image/glibc-initial-2.4 on an x86_64 (AMD X2) machine 
> for TARGET_ARCH = "i586" I get the following error:

You need to use make 3.81 to build glibc 2.4 for x86 targets on x86_64.

I've added make 3.81 to OE (by copying all the 3.80 releated make
files to 3.81 versions - no changes necessary) and then do a "bitbake
make-native" prior to building rather than update the host version of
make.

-- 
 Jamie Lenehan <lenehan@twibble.org>


