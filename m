Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M2Qp4-0000DQ-0u
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 16:13:10 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M2Qj3-0001JF-ED
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 15:06:57 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1M2Qj3-0008Ni-5q
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 15:06:57 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905081536.58988.g.eismann@gmx.net>
References: <200905081536.58988.g.eismann@gmx.net>
Date: Fri, 08 May 2009 15:06:56 +0100
Message-Id: <1241791617.9080.25.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: micro image with ssh server
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
X-List-Received-Date: Fri, 08 May 2009 14:13:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-05-08 at 15:36 +0200, G. Eismann wrote:
> I have created an image for the micro dist adding dropbear to the image.
> When I try to connect with ssh, I have this error:
> PTY allocation request failed on channel 0
> shell request failed on channel 0
> 
> With the minimal distro it woks OK. Do I need to add some more software or is 
> a problem of the micro distribution?

Sounds like you need to mount /dev/pts, and/or create the /dev/ptmx
node.  I guess minimal is doing this for you but micro isn't.

p.




