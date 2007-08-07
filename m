Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IIKq1-0000W5-Sf
	for openembedded-devel@openembedded.org; Tue, 07 Aug 2007 10:54:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l778qKqf030348
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 09:52:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30156-05 for <openembedded-devel@openembedded.org>;
	Tue,  7 Aug 2007 09:52:16 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l778qBB6030341
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 09:52:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200708070822.03530.openembedded@hrw.one.pl>
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
	<200708070822.03530.openembedded@hrw.one.pl>
Date: Tue, 07 Aug 2007 09:52:10 +0100
Message-Id: <1186476730.5653.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Tue, 07 Aug 2007 08:54:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-08-07 at 08:22 +0200, Marcin Juszkiewicz wrote:
> STAGING_LIBDIR_NATIVE sounds ok for me

I'd certainly prefer STAGING_LIBDIR_NATIVE rather than paths with the
"/../" in them :). I'm wondering if we need it though?

> > Anyone have any heartburn with this approach to resolving this problem?
> 
> It should be done in classes/native.bbclass not in ncurses-native. The 
> problem is wider as there are few distributions which have host versions 
> of stuff other then OE use as native. As a result building of native 
> stuff which depend on native libraries can fail - when you will set 
> LD_LIBRARY_PATH in native.bbclass then it should work.

Just to be clear, this is a problem with ncurses-native? If so,
STAGING_LIBDIR_NATIVE == STAGING_LIBDIR due to native.bbclass anyway so
we don't need the _NATIVE version?

We'd only need a _NATIVE version if our cross compiled packages needed
to reference something there explicitly (like they do some of the
binaries). DoO we need to do that (and if so, which package and why)?

Setting LD_LIBRARY_PATH for native.bbclass sounds like a worthwhile
experiment...

Cheers,

Richard




