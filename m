Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3rzP-0005Je-53
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 18:44:15 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 31422D22E8; Fri,  8 Feb 2013 18:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3E7FFD22B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2013 18:27:26 +0100 (CET)
Message-ID: <5115357B.2090201@linaro.org>
Date: Fri, 08 Feb 2013 18:27:23 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360343179-29346-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1546157.0f1Vqehhn5@helios>
In-Reply-To: <1546157.0f1Vqehhn5@helios>
Subject: Re: [meta-oe][PATCH] cyrus-sasl2: add 2.1.26
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
X-List-Received-Date: Fri, 08 Feb 2013 17:44:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 08.02.2013 18:13, Paul Eggleton pisze:
> On Friday 08 February 2013 18:06:19 Marcin Juszkiewicz wrote:
>> I took recipe from OE classic, updated, cleaned and got it build. I use
>> it only as build dependency - did not checked binaries from ${PN}-bin.
> 
> FYI there is a cyrus-sasl 2.1.19 recipe in meta-kde; not sure how that 
> compares with this one (and clearly we would prefer to have it in a more 
> appropriate layer than meta-kde).

Thanks for info.

2.1.19 from meta-kde does not generate packages (-dev and -dbg are done
but empty). They keep patches from OE classic and add new one but those
are not needed in 2.1.26 cause upstream supports db5 now.



