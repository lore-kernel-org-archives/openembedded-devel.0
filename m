Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H19Rr-0002Y3-Ud
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 23:46:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVMjgYm011911
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 22:45:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11203-09 for <openembedded-devel@openembedded.org>;
	Sun, 31 Dec 2006 22:45:40 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBVMjdOA011904
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 22:45:39 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <E1H19G7-0002Ph-6z@linuxtogo.org>
References: <E1H19G7-0002Ph-6z@linuxtogo.org>
Date: Sun, 31 Dec 2006 22:45:41 +0000
Message-Id: <1167605141.5592.37.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev Split STAGING_BINDIR into CROSS and	NATIVE versions. This means there is no need to rename -config scripts and	multimachine won't break with binconfig.bbclass. ***NOTE: This change will	require staging to be rebuilt***
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
X-List-Received-Date: Sun, 31 Dec 2006 22:46:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-12-31 at 23:34 +0100, rpurdie commit wrote:
> Split STAGING_BINDIR into CROSS and NATIVE versions. This means there
> is no need to rename -config scripts and multimachine won't break with
> binconfig.bbclass. ***NOTE: This change will require staging to be
> rebuilt***

Please note the above. Peoples staging are potentially broken now as all
the *-config files have moved around and been renamed.

Also, can people please be careful with STAGING_BINDIR now. To
illustrate, if building arm images on an i686 box:

An ARM binary goes into STAGING_BINDIR.
An i686 (native) binary goes into STAGING_BINDIR_NATIVE.
A cross binary (runs on i686 but provides ARM results) goes into
STAGING_BINDIR_CROSS.

STAGING_BINDIR_CROSS and STAGING_BINDIR_NATIVE are in PATH for cross
compiling (with CROSS having priority). Only STAGING_BINDIR_NATIVE is in
PATH for native packages.

This was disucssed on this list a while back, I've just finally got
around to committing it.

Happy New Year!

Richard



