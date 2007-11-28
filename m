Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1IxKqu-0005mR-Ct
	for openembedded-devel@openembedded.org; Wed, 28 Nov 2007 12:13:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASBA5nq008888
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:10:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08443-08 for <openembedded-devel@openembedded.org>;
	Wed, 28 Nov 2007 11:10:01 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lASB9x2E008880
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 28 Nov 2007 11:09:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <474CF3AF.5010407@trolltech.com>
References: <474CF3AF.5010407@trolltech.com>
Date: Wed, 28 Nov 2007 11:09:59 +0000
Message-Id: <1196248199.8098.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: CROSS_DIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2007 11:13:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-11-28 at 14:50 +1000, Lorn Potter wrote:
> Was CROSS_DIR changed somewhat recently (last 2 months or so) to link 
> the includes and lib dirs to staging?
> 
> If so, why? This means I cannot distribute this toolchain to other 
> machines, and makes the entries in the pkgconfig files wrong.

It was changed, yes. The reason was to remove duplication of files
between staging and cross. There are various reasons for doing that
including faster builds, less error prone builds (file duplication means
both copies have to be kept the same) and that cleaning this up assists
some future planned developments (e.g. sysroot and packaged staging).

The symlink is intended as a transition fix and ultimately we can switch
to the sysroot option of the toolchain for everything but gcc 3.3 and
earlier. Poky already has done so and it is *much* cleaner.

I have seen the pkgconfig problem and its unfortunate, I didn't realise
until it was too late. Its not more wrong than pointing at staging
really though. The good news is that it goes away entirely when we
switch to using sysroot options for pkgconfig.

> CROSS_DIR should mean just that - this is where I want the toolchain to 
> be - like it used to do.

Well, the cross toolchain components are still there. The target system
header/libraries (glibc and libc-headers-linux) only get installed to
the target system staging directory now though.

CROSS_DIR is not meant to be a toolchain you can transfer between
machines, its meant to be the cross components of the builds. If you
want a toolchain to transfer between machines you can build one with
meta-toolchain.

Cheers,

Richard




