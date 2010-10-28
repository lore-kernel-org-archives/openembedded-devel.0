Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PBXY5-00078l-C3
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 20:50:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 517858DC240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 14:49:22 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17943-04 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 28 Oct 2010 14:49:22 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C3BA88DC170
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 14:49:21 -0400 (EDT)
Date: Thu, 28 Oct 2010 14:49:21 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 28 Oct 2010 18:50:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 28 Oct 2010, Khem Raj wrote:

> -CURL_FEATURES = ${@['zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp','zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp']["${BPN}" == "${PN}"]}
> +CURL_FEATURES ?= "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
> +CURL_FEATURES_virtclass-native = "zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"

> this change was done for a reason. this will not set correct override 
> for native recipes and we dont want gnutls on native recipe but if you 
> look closely the output then it will enable gnutls because 
> CURL_FEATURES_virtclass-native is ineffective in this case as you 
> already have a weak assignment.

It seems to do the right thing here - CURL_FEATURES_virtclass-native is 
not weak, so in my curl-native config.log, I see --disable-gnutls.

(btw: why do we not want gnutls in curl-native?)

Mike


