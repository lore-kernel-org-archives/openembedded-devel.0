Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1MHHdv-0001K6-Nt; Thu, 18 Jun 2009 15:27:03 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MHHTj-0000kU-Rn; Thu, 18 Jun 2009 14:16:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245330335.11257.26.camel@dax.rpnet.com>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245330335.11257.26.camel@dax.rpnet.com>
Date: Thu, 18 Jun 2009 14:16:30 +0100
Message-Id: <1245330990.29153.152.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/3] Make package_update_index_ipk proper	task	with locking
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
X-List-Received-Date: Thu, 18 Jun 2009 13:27:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-18 at 14:05 +0100, Richard Purdie wrote:
> Can I suggest we actually add the ability to lock from shell scripts? A
> couple of python scripts (bitbake-lock/bitbake-unlock) which just call
> the python locking functions should be trivial to write and then mean we
> can add sane locking to specialist functions much more easily. It should
> allow us to solve the opkg.conf file issue you were seeing easily too.
> 
> Adding those shell scripts is slightly trickt - I'm happy to have them
> in bitbake but we'll need another release before OE.dev can depend on
> use them. We're overdue a bitbake release so perhaps we can get this
> done quite quickly though...

In this particular case there probably isn't any need for the locks to
be shared between the shell and python worlds since all the ipk handling
is done in shell.  So I guess it should be fine to just have the shell
code call something like flock(2) directly, and hence no need for a new
bitbake release.

If the issue is just that concurrent calls to ipkg-make-index will
collide, it's probably as simple as replacing the call to
ipkg-make-index with "flock some-path -c ipkg-make-index ...".

p.




