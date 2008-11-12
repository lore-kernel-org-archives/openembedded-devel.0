Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L0CY8-0007u3-DK
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 11:02:13 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L0CWA-00029q-1H
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 10:00:10 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1L0CW7-000171-TX
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 10:00:08 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226483313.7474.5.camel@aquilonia>
References: <1226483313.7474.5.camel@aquilonia>
Date: Wed, 12 Nov 2008 10:00:07 +0000
Message-Id: <1226484007.17085.150.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Moving xorg.conf to seperate .bb file/package
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
X-List-Received-Date: Wed, 12 Nov 2008 10:02:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-12 at 09:48 +0000, Graeme Gregory wrote:
> At the moment xorg.conf is handled within the xserver-xorg .bb file.
> 
> As xorg.conf varies per machine this will effectively make xserver-xorg
> machine specific which sort of defeats the purpose of a module xorg.
> 
> My suggestion is to move xorg.conf out of xserver-xorg. Then add a
> RRECOMMEND_${PN} = "xserver-xorg-conf" to xserver-xorg.
> 
> Is this a sane plan?

Yes, that sounds like a splendid plan.  I would even hope that some
(maybe most) machines can cope without having an xorg.conf at all
nowadays.

p.




