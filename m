Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PkcWj-0008Gb-6J
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 14:13:41 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id C05D81B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 13:22:24 +0000 (UTC)
Message-ID: <4D49584D.3010502@freyther.de>
Date: Wed, 02 Feb 2011 14:12:45 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
In-Reply-To: <4D49552D.3010705@dresearch.de>
Subject: Re: profiling howto?
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
X-List-Received-Date: Wed, 02 Feb 2011 13:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/02/2011 01:59 PM, Steffen Sledz wrote:
> Am 02.02.2011 10:54, schrieb Steffen Sledz:

> 
> But is it possible to enable profiling for selected libs and/or binaries only?

yes, you can use the classic override system... just place _pn-PN to these
variables or such. But be aware that if your app will call some other library
and there are no framepointers there will be no backtrace.. same applies to
functions written in assembly, e.g. memcpy...


