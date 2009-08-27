Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MgcqK-0006Lg-GY
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 13:08:36 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MgcVP-0006kN-Eo
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 11:46:59 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MgcVO-0006dd-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 11:46:58 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A94E1CC.2090404@gmail.com>
References: <4A94E1CC.2090404@gmail.com>
Date: Thu, 27 Aug 2009 11:46:54 +0100
Message-Id: <1251370014.27780.13.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] enca_1.9.bb: remove unused configure test which is bound to fail.
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
X-List-Received-Date: Thu, 27 Aug 2009 11:08:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-08-26 at 16:48 +0930, Graham Gower wrote:
> Enca's configure will fail on everything not arm or ix86.
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  recipes/enca/enca_1.9.bb |    7 ++++++-
>  site/arm-linux           |    3 ---
>  site/ix86-common         |    3 ---
>  3 files changed, 6 insertions(+), 7 deletions(-)

Looks fine to me.  It does seem a bit weird that enca tests this scanf
thing and then doesn't use the information but, sure enough, I couldn't
find any reference to the result anywhere in the source code.

Do you have commit access or do you want me to check it in for you?

p.




