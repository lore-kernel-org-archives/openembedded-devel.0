Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OMLLi-00062T-FX
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 15:29:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B36DB6EBD20
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 09:25:12 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13478-03 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  9 Jun 2010 09:25:12 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 779016563A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2010 09:25:12 -0400 (EDT)
Message-ID: <4C0F9638.8040802@cbnco.com>
Date: Wed, 09 Jun 2010 09:25:12 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0F9119.3000909@freyther.de>
In-Reply-To: <4C0F9119.3000909@freyther.de>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 13:29:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
>   c.) To ease this for existing users and to reduce the amount of
>       support org.openembedded.dev will track master and remains
>       available for a limited but long amount of time.

> The TSC is not sure on how to implement c.) and this will determine when
> we will be able to switch over and the schedule of doing so.

This should work (on the bare repo):

git branch -m org.openembedded.dev master
git symbolic-ref refs/heads/org.openembedded.dev refs/heads/master

(thanks 
http://stackoverflow.com/questions/549920/is-it-possible-to-alias-a-branch-in-git)

Mike


