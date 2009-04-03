Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LpdCu-000550-2e
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 08:48:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id DEC5E148014;
	Fri,  3 Apr 2009 08:46:22 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0I4hbr0eACw; Fri,  3 Apr 2009 08:46:22 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F989E.dip0.t-ipconnect.de
	[217.95.152.158])
	by mx51.mymxserver.com (Postfix) with ESMTP id 68E7E148006;
	Fri,  3 Apr 2009 08:46:21 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 4F8ED1E004E; Fri,  3 Apr 2009 08:46:20 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id C2BC71E0037;
	Fri,  3 Apr 2009 08:46:11 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Apr 2009 08:45:06 +0200
User-Agent: KMail/1.9.7
References: <12386320381719-git-send-email-clarson@mvista.com>
In-Reply-To: <12386320381719-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200904030845.06338.hs4233@mail.mn-solutions.de>
X-SA-Exim-Connect-IP: 85.199.173.110
X-SA-Exim-Mail-From: hs4233@mail.mn-solutions.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
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
X-List-Received-Date: Fri, 03 Apr 2009 06:48:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> +# Take a list of directories in COLLECTIONS, in priority order (highest to
> +# lowest), and use those to populate BBFILES, BBFILE_COLLECTIONS,
> +# BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
> +

I like this idea, but I think that this *.inc file
needs a larger comment block, e.g. not only stating
what it does, but also why that would be handy. A
typical use case or maybe a problem-solution section.

I think when more of the *.inc and *.bbclass files get
such in-file comments it'll be easier for people skimming
throught the code to grasp the big picture.


