Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMRIh-0006KT-Vo
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 20:46:28 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MMR72-0000QX-Bu
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 19:34:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200907021504.13248.holger+oe@freyther.de>
References: <200907021504.13248.holger+oe@freyther.de>
Date: Thu, 02 Jul 2009 19:34:22 +0100
Message-Id: <1246559662.8887.287.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Questions regarding DISTRO = "minimal"
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
X-List-Received-Date: Thu, 02 Jul 2009 18:46:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-07-02 at 15:04 +0200, Holger Hans Peter Freyther wrote:
> I have some questions to help me building a opinion regarding "minimal". What 
> is the differentiation between minimal and micro, minimal and angstrom. What 
> niche is minimal trying to solve? And is minimal the right name for it?

I think the old name of "generic" was probably a better reflection on
what I understood as the intended purpose of this distro.  That is, a
fairly plain system which imposes the minimum amount of policy
consistent with getting a working image.  As a result, what you'd get
would be more or less a vanilla Unix system, albeit a small one.  I
think this is still a worthy goal.

This is fairly different from the policy goals of "micro", which are
basically to produce an embedded system that's as small as possible,
with few concessions to providing a comfortable shell experience.  As a
result, the system that you get is less of a traditionally Unix-like
thing: it doesn't, for example, have the distinction between /usr/bin
and /bin since this is fairly meaningless if you just have a single
filesystem image.  Nor does it install a lot of the traditional
Unix-type utilities that are mostly or only used for interactive shell
sessions, things like "w", "mesg" and the like.

p.




