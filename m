Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KTbXd-0004OZ-Fc; Thu, 14 Aug 2008 14:02:57 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KTbWz-0005Rl-Js; Thu, 14 Aug 2008 13:02:17 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1KTbWz-0007sB-1y; Thu, 14 Aug 2008 13:02:17 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g815ta$ca0$1@ger.gmane.org>
References: <g7vqvs$3fi$1@ger.gmane.org>
	<1218699665.10360.25.camel@lenovo.internal.reciva.com>
	<g815ta$ca0$1@ger.gmane.org>
Date: Thu, 14 Aug 2008 13:02:16 +0100
Message-Id: <1218715336.8405.27.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 12:02:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-08-14 at 13:45 +0200, Rolf Leggewie wrote:
> Phil Blundell wrote:
> > What's the specific corruption that you're worried about?
> 
> Maybe my worries are unfounded and that would be great.  I was thinking 
> that building for a certain distribution but changing the checked out 
> repo underneath its feet back and forth could eventually result in 
> incompatible stuff getting into TMPDIR and particularly staging.  Think 
> switching between dev, stable, openmoko and some of its variant and 
> building stuff in between.  I don't think it is too far-fetched to worry 
> this might lead to some incompatabilities in what is under TMPDIR.

I guess it depends on what you mean by "incompatibilities".

If you start switching between branches like that then, obviously, the
binaries that you create are liable to contain a mismatch of things and
might not be entirely compatible with any of the branches.  For example,
if I check out the dev tree, build glibc from that, then switch to
stable and start trying to build some other packages then I will
probably end up with a dependency on a version of glibc that doesn't
exist in stable.  But this has always been the case and the answer is
simply "don't do that, then".

So, in summary, I don't think there's any new issue here and it doesn't
really seem that any particular action is required to address it.

p.




