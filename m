Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MEMYC-0000dT-Oj
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 14:05:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8D8A839F81E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 07:55:23 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32186-06 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 10 Jun 2009 07:55:23 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5AEF937C6CE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 07:55:23 -0400 (EDT)
Date: Wed, 10 Jun 2009 07:55:23 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h0nft3$jso$1@ger.gmane.org>
Message-ID: <Pine.LNX.4.64.0906100752570.27204@juice.ott.cti.com>
References: <h0nft3$jso$1@ger.gmane.org>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: deduce git revision from mtn revision
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
X-List-Received-Date: Wed, 10 Jun 2009 12:05:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 10 Jun 2009, Rolf Leggewie wrote:

> is there any way to know which git revision corresponds to mtn commit
> 53dccbcb3344fa9a96f7f2c544d3dfec1b100fca?  I guess googling for the revision
> and then using git log can eventually yield that info. Anything simpler and
> more straight-forward?

It ended up in a log message by chance:

git log --grep=53dccbcb3344fa9a96f7f2c544d3dfec1b100fca
commit d7d081c7ea40ea61365ca51b892cf7af8a802298
Merge: 06c89ee c3e353c
Author: Henning Heinold <heinold@inf.fu-berlin.de>
Date:   Wed May 7 20:07:39 2008 +0000

    merge of '53dccbcb3344fa9a96f7f2c544d3dfec1b100fca'
         and 'fea7dedc0a856ea56969779e97c888a16ffc63de'

I guess it's probably this one:

commit 06c89ee737a0f595efee34ea1a250c190825db7c
Author: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Date:   Wed May 7 19:27:30 2008 +0000

    pointercal: backpush pointercal files for qemuarm and htcuniversal 
from poky
.  Closes 3742 (it at least masks the superficial problem).

Mike


