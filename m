Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NCWSR-0008Dx-Rc
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 11:47:50 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NCWR3-0006ry-Ih
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 10:46:21 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NCWR3-00055Q-6i
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 10:46:21 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
References: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
Date: Mon, 23 Nov 2009 10:46:17 +0000
Message-Id: <1258973177.23826.231.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Mon, 23 Nov 2009 10:47:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 11:44 +0530, RK Raggit wrote:
> /home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
> error: bad value (cortex-a9) for -mtune= switch
>
> [...]
>
> gcc variables in my local.conf read thus -
> 
> PREFERRED_VERSION_gcc                    = "4.2.4"
> PREFERRED_VERSION_gcc-cross              = "csl-arm-2008q1"
> PREFERRED_VERSION_gcc-cross-initial      = "csl-arm-2008q1"
> PREFERRED_VERSION_gcc-cross-intermediate = "csl-arm-2008q1"

The version you select here needs to match ${PV} from one of the
available recipes in order to have any useful effect.  It looks like the
magic string for 2008q1 (see gcc-csl-arm-2008q1.inc) would be:

PREFERRED_VERSION_gcc-cross-initial = "4.2.3+csl-arm-2008q1-126"

and likewise for the others.  As things stand, it appears that you are
getting the regular gcc 4.2.4 selected and this one doesn't understand
cortex-a9.

If you wanted to try 2008q3 then that would be 4.3.2+csl-arm-2008q3-39.

> I had also tried something funky like below but to no avail -
> 
> PREFERRED_VERSION_gcc = "4.2.4+csl-arm-2008q1-126"
> PREFERRED_VERSION_gcc-cross = "4.2.4+csl-arm-2008q1-126"
> REFERRED_VERSION_gcc-cross-initial = "4.2.4+csl-arm-2008q1-126"
> PREFERRED_VERSION_gcc-cross-intermediate = "4.2.4+csl-arm-2008q1-126"

That was close but, sadly, not quite on the button :-)

p.




