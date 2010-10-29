Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PBqTR-00011h-II
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 17:02:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id ECB658DD1AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 11:01:48 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13674-05 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 29 Oct 2010 11:01:48 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5A5CD8D9656
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 11:01:47 -0400 (EDT)
Message-ID: <4CCAE1DB.1030504@cbnco.com>
Date: Fri, 29 Oct 2010 11:01:47 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>	<Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>	<AANLkTikbv9bF9fBvFU2_C6sK13A23wBXgRzwbX++VLhq@mail.gmail.com>	<4CC9E691.9000809@cbnco.com>
	<AANLkTimEEdaQub15asdbRzHPfatmtqXNqpTvfp2DM55o@mail.gmail.com>
In-Reply-To: <AANLkTimEEdaQub15asdbRzHPfatmtqXNqpTvfp2DM55o@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Oct 2010 15:02:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Oct 28, 2010 at 2:09 PM, Michael Smith <msmith@cbnco.com> wrote:
>> Do you have any thoughts on how to solve it? There is not much point to
>> having CURL_FEATURES as a variable if it's not configurable. I can just hack
>> over it in an amend.inc, but the recipe as it stands is broken.
> 
> yes if we had the recipe type overrides for native sdk and target
> separate then this could
> be done probably by appending to concerning override

OK, what if we get rid of CURL_FEATURES entirely, and the anon python 
that handles it. No one in-tree is using CURL_FEATURES, and it's been 
broken for a couple weeks now.

It'll be easy enough to override the depends and configure opts in a 
recipe amend for anyone who needs that control (i.e. me).

Mike


