Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NWUKW-0001H6-Hq
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 13:34:11 +0100
Received: from 88-110-78-150.dynamic.dsl.as9105.com ([88.110.78.150]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NWUIO-0002FG-2U
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:31:56 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u6oempf0mn1qzu@guohr-laptop-ubuntu>
References: <> <1263698541-9726-1-git-send-email-camelguo@gmail.com>
	<1263726023.457.897.camel@lenovo.internal.reciva.com>
	<op.u6ob5ohzmn1qzu@guohr-laptop-ubuntu>
	<1263729318.457.901.camel@lenovo.internal.reciva.com>
	<op.u6oempf0mn1qzu@guohr-laptop-ubuntu>
Date: Sun, 17 Jan 2010 12:31:50 +0000
Message-ID: <1263731511.457.907.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Change the prefer binutils of micro.conf from 2.19.51 to 2.18
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
X-List-Received-Date: Sun, 17 Jan 2010 12:34:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-01-17 at 20:07 +0800, Guo Hongruan wrote:
> I set LIBC=glibc in shell environment.

Okay.  In that case, you are going off-piste to some extent and there is
certainly no guarantee that the default DISTRO config will be suitable.
The settings within micro.conf are designed to be internally consistent,
i.e. the toolchain is intended to work with the selected version of
eglibc but there are no promises about other C libraries.

So, to that extent, I don't really consider it a bug in micro that glibc
2.6.1 is unbuildable.  If we can fix the glibc build without breaking
anything else then that would be fine, but this has to take second place
to ensuring that the default configuration goes on working correctly.

> Yes, I think so. Several days ago, I submitted a patch to update glibc to  
> 2.10 in conf/distro/include/sane-toolchain.inc, but was rejected and the  
> reason was that it may break other buildings and had not full tested.

If you would like to make a patch to set the glibc version to 2.10 for
micro only (i.e. put a suitable PREFERRED_VERSION in micro.conf) then I
will happily apply it.

p.



