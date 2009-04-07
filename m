Received: from [128.2.201.117] (helo=chokecherry.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LrEqI-0000kC-2Q
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:13:12 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by chokecherry.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n37H9Bnn009716; Tue, 7 Apr 2009 13:09:11 -0400 (EDT)
Message-ID: <49DB88B9.6000605@cs.cmu.edu>
Date: Tue, 07 Apr 2009 13:09:13 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <mailman.57713.1239046662.4692.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.57713.1239046662.4692.openembedded-devel@lists.openembedded.org>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.117
X-SA-Exim-Connect-IP: 128.2.201.117
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Openembedded-devel Digest, Vol 33, Issue 41
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
X-List-Received-Date: Tue, 07 Apr 2009 17:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>
> please try with gcc 4.3.3, the fix is just a workaround to get past this error.
> Looks like fix is not sufficient for all gcc versions
Yes, gcc 4.3.3 fixes the problem.

In fact, although I was able to get everything to build with 4.2.4 by 
building ldso as ARM, the resulting image had a lot of problems.  Most 
binaries, including ipkg and dropbear, would just segfault.

Therefore I think 4.3.3 should be required if you are building things as 
Thumb.  Using 4.3.3, things all seem to work properly.



