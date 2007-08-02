Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGZPW-0006NM-5I
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 14:04:10 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGZNX-0004ba-Ie
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 14:02:07 +0200
Message-ID: <46B1C71F.2090608@klever.net>
Date: Thu, 02 Aug 2007 13:59:27 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>
	<1186053831.5972.222.camel@hammer.suse.cz>
In-Reply-To: <1186053831.5972.222.camel@hammer.suse.cz>
X-Enigmail-Version: 0.95.1
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2007 12:04:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Michael Krelin wrote:
>> I don't know much about gstreamer, but being inventor of
>> OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
>> guessing it should be:
> 
> Maybe it would be better to not break build environment and then work
> around consequent errors by hacks like OE_LT_RPATH_ALLOW,
> never-ever-do-rpath.patch etc.
> 
> gcc has --sysroot which can do required linking without any hacks.
> 

Generally, I tend to agree, but in practice I'm afraid that would amount
to rewriting the whole OE...


Love,
H


