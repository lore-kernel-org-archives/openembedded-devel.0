Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1ObF7g-00028R-8N
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 17:52:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B1047748EFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 11:52:32 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25523-02 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 20 Jul 2010 11:52:32 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 814C8741796
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 11:52:31 -0400 (EDT)
Message-ID: <4C45C63E.70306@cbnco.com>
Date: Tue, 20 Jul 2010 11:52:30 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279290319.10837.1747.camel@rex>
	<4C44BAB3.8010703@mentor.com>	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com>	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com>
	<4C45BE9F.7000002@mentor.com>
In-Reply-To: <4C45BE9F.7000002@mentor.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 20 Jul 2010 15:52:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> It's also needed, in some cases, to lock down your changes via OVERRIDES 
> that will only match what you want to work on.  For example, we're using 
> a snapshot with an older python, so amend.inc in our python directory 
> looks like:
> 
> SRC_URI_append_pn-python-native = 
> "file://python-2.6-r73342.patch;patch=1;pnum=0"
> PARALLEL_MAKE_pn-python-native = ""
> PR_append_pn-python-native .= ".1"
> 
> So that we only change python-native and not all of the other python 
> recipes.

I think you could get the same effect by putting your amend.inc in a 
python-native subdirectory under your overlay recipes/python directory.

Maybe there's some native magic going on that would break that. (I've 
never amended a -native package but I use the same trick for other 
recipes where there are multiple .bb files are in the same OE directory.)

Mike


