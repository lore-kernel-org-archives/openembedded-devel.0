Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OIpKM-0005C6-EO
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 22:41:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 236E56DDEF0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 16:37:25 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21181-08 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 30 May 2010 16:37:25 -0400 (EDT)
Received: from [10.196.86.186] (unknown [74.198.12.4])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A6A956DB458;
	Sun, 30 May 2010 16:37:24 -0400 (EDT)
Date: Sun, 30 May 2010 16:37:17 -0400
From: "Michael Smith" <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: LCG ProfiMail
Message-ID: <9224472599.959704637@cbnco.com>
In-Reply-To: <A24693684029E5489D1D202277BE894455A0F301@dlee02.ent.ti.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET, RCVD_IN_SORBS_WEB, SPF_HELO_PASS,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 20:41:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed

> From: Ambrose, Martin <martin@ti.com>
> Looking at the class I see
>     ver = popen(["git", "describe", "--tags"], cwd=path)

> Normally I work on a named branch so the PV here becomes the capitalized
> branch name. My preference would be the shortened commit id which is the
> fallback option above. I guess no way to get this functionality unless I
> either don't work a branch or locally modify gitver.bbclass.

I think if you tag a commit somewhere on your branch, you'll get 
<tag>-<count>-<shortened commit ID> as your version for all future commits.

Mike 


