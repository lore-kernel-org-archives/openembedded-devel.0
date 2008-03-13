Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZlAl-0006xE-5a
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 12:00:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DAwGKp003067
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 10:58:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02859-02-2 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 10:58:10 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DAvx24002977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 10:57:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fraqbd$k6k$2@ger.gmane.org>
References: <47D71B8F.1030108@balister.org>  <fraqbd$k6k$2@ger.gmane.org>
Date: Thu, 13 Mar 2008 10:57:58 +0000
Message-Id: <1205405878.4547.13.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 11:00:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 09:58 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Philip Balister schreef:
> | Given the only serious contenders for possible SCM's for OE appear to be
> | git or Hg, I am curious about the expertise level available on this list.
> 
> A big problem with git:
> 
> * it cannot import a flat OE repository (e.g a mtn checkout of .dev)
> * it cannot import a OE repo with history (e.g with mtn2git)
> 
> Why? Git can't store empty dirs, and we use that in a few key places in
> OE. Holger 'solved' that in mtn2git by putting in a lot .dummy files
> into those dirs, but those will end up in your packages and rootfses.

Just for reference this is a problem already seen by people trying to
use OE metadata in things like svn. I've given this some through from
the svn PoV in the past and removing the files from the packages and
rootfses should just be a case of handling the files in do_unpack which
is what actually does the file copying.

Cheers,

Richard



