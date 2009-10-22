Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N0t1B-0003xK-D7
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 10:27:37 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N0t03-0001ev-As
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 09:26:24 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90910212206s1e64c71jd8a168149e39421@mail.gmail.com>
References: <19c1b8a90910212206s1e64c71jd8a168149e39421@mail.gmail.com>
Date: Thu, 22 Oct 2009 09:26:12 +0100
Message-Id: <1256199972.23372.144.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Moving gcc 4.4.1 to 4.4.2
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
X-List-Received-Date: Thu, 22 Oct 2009 08:27:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-10-21 at 22:06 -0700, Khem Raj wrote:
> Hi
> 
> I have tested a patch which essentially moves gcc 4.4.1 recipes to gcc
> 4.4.2. There are no changes other than PR
> The patch is too big and some lines are larger than 998 chars which
> violates the RFC2822 and hence git send-email
> will not send it.
> 
> There are 25 bug fixes from 4.4.1 to 4.4.2 (per gcc bugzilla) and
> essentially its a bug fix release we could have backported
> these to 4.4.1 too but then I thought using the release conveys better
> message about the release we are using.

You might as well just go ahead and add new recipes for the 4.4.2
release.  Patching 4.4.1 up to 4.4.2-equivalent but still calling it
4.4.1 would just be confusing; also, that would remove the ability for
any folks who might want to use 4.4.1 specifically to do so.

p.




