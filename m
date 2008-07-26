Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KMgFS-0001Zt-Lm
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 11:39:35 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KMgE1-0006Zb-0A
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 10:38:05 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KMgDz-0005lj-6b
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 10:38:03 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4889169C.7040108@gmx.de>
References: <4889169C.7040108@gmx.de>
Date: Sat, 26 Jul 2008 10:38:02 +0100
Message-Id: <1217065082.22069.111.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 26 Jul 2008 09:39:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-07-25 at 01:56 +0200, Thomas Kunze wrote:
> +/dev/mmcblk0p1	b	6600	0	6	179	1	-	-	-

Is that "6600" really correct?

It does also seem bit odd having an mmc device in the "minimal" device
table.  I can understand why you need it on collie but I am not sure it
is all that desirable for device-table-minimal.txt to become the union
of the devices that everybody needs on their favourite platform for
booting purposes.  Since this is truly a machine specific thing I would
be inclined to use a separate file, or a collie-specific catenation onto
the installed copy.

p.




