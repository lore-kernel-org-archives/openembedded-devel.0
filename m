Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LN3e8-0001v5-91
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 12:10:53 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LN3Xe-00053r-Tw
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 11:04:11 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1LN3Xc-0000aw-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 11:04:08 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <496DC520.90601@gmx.net>
References: <496D4B33.60102@gmx.net> <gkk2ut$5m8$1@ger.gmane.org>
	<496DC520.90601@gmx.net>
Date: Wed, 14 Jan 2009 11:04:07 +0000
Message-Id: <1231931047.2952.208.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 11:10:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-01-14 at 11:57 +0100, Robert Schuster wrote:
> Is that such a controversial feature? I think this should be part of all
> distros.
> 
> Without this libffi breaks (on armv6 and arm7a) and in the future this
> means that stuff like openjdk won't be buildable on these arches. :(

Why exactly is this override required?  It seems a bit sad that these
packages need to be fed a special "-DMAKE_ME_WORK" flag by some external
intelligence in order to build on newer architectures.  Can't they
figure it out for themselves?

p.




