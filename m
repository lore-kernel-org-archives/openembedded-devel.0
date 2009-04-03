Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LpfE7-0002zP-Eg
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 10:58:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id A25C53A016;
	Fri,  3 Apr 2009 10:55:45 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4JGxaUODqp5; Fri,  3 Apr 2009 10:55:45 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F989E.dip0.t-ipconnect.de
	[217.95.152.158])
	by mx51.mymxserver.com (Postfix) with ESMTP id B1E6E3A010;
	Fri,  3 Apr 2009 10:55:44 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id DE9281E004E; Fri,  3 Apr 2009 10:55:43 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id EF1D71E0037;
	Fri,  3 Apr 2009 10:55:34 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Apr 2009 10:54:28 +0200
User-Agent: KMail/1.9.7
References: <12386320381719-git-send-email-clarson@mvista.com>
In-Reply-To: <12386320381719-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200904031054.28977.hs4233@mail.mn-solutions.de>
X-SA-Exim-Connect-IP: 85.199.173.110
X-SA-Exim-Mail-From: hs4233@mail.mn-solutions.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/2] bitbake.conf, collections.inc: Add COLLECTIONS mechanism w/ a sane default.
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
X-List-Received-Date: Fri, 03 Apr 2009 08:59:06 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 02 April 2009 02:27:17 Chris Larson wrote:
> COLLECTIONS = "${@' '.join(d.getVar('BBPATH', 1).split(':'))}"

Why do we need a new variable here?  Can't we just use the 
equivalent BBPATH.split()  ??  Or is there a use-case where it 
makes sense to have BBPATH != COLLECTIONS ?



