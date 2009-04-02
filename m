Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LpOJ6-0006Mk-F5
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 16:55:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 7702C3A00E;
	Thu,  2 Apr 2009 16:51:51 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnS3Ted6v8QJ; Thu,  2 Apr 2009 16:51:51 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F967C.dip0.t-ipconnect.de
	[217.95.150.124])
	by mx51.mymxserver.com (Postfix) with ESMTP id 15B913A00C;
	Thu,  2 Apr 2009 16:51:51 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id A79E91E004D; Thu,  2 Apr 2009 16:51:50 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id E32191E0010;
	Thu,  2 Apr 2009 16:51:41 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Apr 2009 16:50:40 +0200
User-Agent: KMail/1.9.7
References: <49D42C75.9090805@dls.net> <1238671151.5341.4.camel@dax.rpnet.com>
In-Reply-To: <1238671151.5341.4.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200904021650.40514.hs4233@mail.mn-solutions.de>
X-SA-Exim-Connect-IP: 85.199.173.110
X-SA-Exim-Mail-From: hs4233@mail.mn-solutions.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: 2.6.29 kernel bloat
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
X-List-Received-Date: Thu, 02 Apr 2009 14:55:49 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> It does this pretty much every kernel release :( Quite
> depressing.

Yes. And it get's worse when gcc 4.4 will be "mainline".

On my debian unstable box, I installed  gcc-4.4/g++-4.4 packages 
from the "experimental" repository. All (user-space) programs 
that I compiled with this new compiler gained considerably in 
size.



For the kernel: there's scripts/bload-o-meter, so you compare to 
kernel images and find out which functions are responsible for 
the bloat.


