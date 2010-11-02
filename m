Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PDHG5-0001cF-29
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 14:50:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 97C6C8E37DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Nov 2010 09:49:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17139-02 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  2 Nov 2010 09:49:52 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 51C2F8E37D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Nov 2010 09:49:52 -0400 (EDT)
Message-ID: <4CD016FF.6020103@cbnco.com>
Date: Tue, 02 Nov 2010 09:49:51 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>	<Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>	<AANLkTikbv9bF9fBvFU2_C6sK13A23wBXgRzwbX++VLhq@mail.gmail.com>	<4CC9E691.9000809@cbnco.com>	<AANLkTimEEdaQub15asdbRzHPfatmtqXNqpTvfp2DM55o@mail.gmail.com>	<4CCAE1DB.1030504@cbnco.com>
	<20101030101545.GB21651@denix.org>
In-Reply-To: <20101030101545.GB21651@denix.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Tue, 02 Nov 2010 13:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> It has been discussed before (check irc logs 7-10 days ago) and Khem made a 
> change to introduce new override called "target", which can be used in this 
> case. Anyway, I ended up fixing it by amend in my overlay:
> 
> http://arago-project.org/git/?p=arago.git;a=commitdiff;h=37979c41a04f7712dbf9c325871fea7c01cc737a

Yes - the target override patch didn't go in, but I agree it would make 
this easier.

Anon python seems to be going out of style so the v2 curl patch uses 
variable settings with a native override to ensure gnutls isn't in the 
feature list.

Mike


