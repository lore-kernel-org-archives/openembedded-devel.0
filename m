Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KrVFW-0004hV-SK; Sun, 19 Oct 2008 12:11:03 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KrVFD-0007oR-Qf; Sun, 19 Oct 2008 11:10:44 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1224322064.5215.17.camel@dax.rpnet.com>
References: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
	<1224322064.5215.17.camel@dax.rpnet.com>
Date: Sun, 19 Oct 2008 11:10:34 +0100
Message-Id: <1224411034.4235.210.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: remove ld.so.conf from glibc?
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
X-List-Received-Date: Sun, 19 Oct 2008 10:11:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 10:27 +0100, Richard Purdie wrote:
> I agree with this. Poky already removed cruft from this file and has a
> modified version so splitting it into a separate package would be good
> which distros can deal with as needed.

Righto; I've removed /etc/ld.so.conf from the glibc package now.  Any
DISTROs which want to ship their own version in a separate package
should feel free to do so.

(There didn't seem to be any value in creating a package for the
previous contents of ld.so.conf since, as I mentioned in my previous,
the old file was apparently devoid of any value.  But it would be easy
enough to do that if it does turn out to have been useful after all.)

p.




