Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H2neF-0002ai-OA
	for openembedded-devel@openembedded.org; Fri, 05 Jan 2007 12:54:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l05Bqpa0003309
	for <openembedded-devel@openembedded.org>; Fri, 5 Jan 2007 11:52:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03108-05 for <openembedded-devel@openembedded.org>;
	Fri,  5 Jan 2007 11:52:49 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l05BqiWS003301
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 5 Jan 2007 11:52:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <76520598.20070105093334@gmail.com>
References: <76520598.20070105093334@gmail.com>
Date: Fri, 05 Jan 2007 11:52:44 +0000
Message-Id: <1167997964.5601.31.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Fixing ipkg-make-index slowness
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
X-List-Received-Date: Fri, 05 Jan 2007 11:54:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Paul,

On Fri, 2007-01-05 at 09:33 +0200, Paul Sokolovsky wrote:
> 1. md5sum thrashing
> 
> In the summer, RP introduced patch for i-m-i ironically called
> index_speedup.patch:

There is nothing ironic about it, it does speed up the process ;-).
md5suming the files was faster than actually parsing them.

> Richard, what were the reasons for such conservative file matching?
> Filename matching should be just enough, as per OE convention, any
> package source changes leading to changes in the package metadata must
> lead to bumping of package recipe's PR, and that in turn updates package
> filename. Whoever don't follow PR update convention either call for
> trouble, and no checks could really help them, or know what they do
> (like bother to rebuild Packages from scratch). In this regard,
> checking ipk size is the great convenience for adventurous, because
> it's really high probability that update of any package metadata will
> lead to change of file size due to compression. In other words, I
> propose to remove md5sum check.

See Koen's reply.

The way forward is to store more information in the index, namely the
last modified timestamp for the file. If you add that and compare
timestamp+size, you can safely skip the md5sum check.

I can't remember why I didn't do that, it could have been a time thing.
It does mean adding a new field to the Packages file and that could also
have had implications elsewhere, I can't remember...

Richard



