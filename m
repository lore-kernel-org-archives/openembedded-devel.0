Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LoCfj-00007D-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 10:16:43 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id BFEF1547D5; Mon, 30 Mar 2009 10:14:36 +0200 (CEST)
Date: Mon, 30 Mar 2009 10:14:36 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090330081436.GA30222@fh-wedel.de>
References: <20090327095751.GA8994@fh-wedel.de>
	<200903272030.23571.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <200903272030.23571.raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Link error: host instead of target libc
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
X-List-Received-Date: Mon, 30 Mar 2009 08:16:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, March 27, 2009, Khem Raj wrote:

> One reason could be that you linker is not aware of sysroot properly. As
> a result it does not append correct sysroot path and ends up looking
> at /lib which ofcourse it your host libc (x86) and hence the error. you
> might need to backport sysroot related patches to binutils 2.14

Thank you for this hint, this solved it. There was a
distro-specific override of EXTRA_OECONF which broke the
EXTRA_OECONF_append defined elsewhere, thus the sysroot property
was never applied while configuring binutils. 

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Amongst our weaponry are such diverse elements as: fear, surprise, 
ruthless efficiency, an almost fanatical devotion to the Pope, and 
nice red uniforms - Oh damn!


