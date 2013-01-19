Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TwVn8-0002Xn-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2013 11:36:50 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 13577D22E9; Sat, 19 Jan 2013 11:21:25 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6AA0ED22CD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2013 11:21:02 +0100 (CET)
Message-ID: <50FA7388.7080208@linaro.org>
Date: Sat, 19 Jan 2013 11:20:56 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<20130119100356.GG29386@jama.palm1.palmone.com>
In-Reply-To: <20130119100356.GG29386@jama.palm1.palmone.com>
Subject: Re: [meta-oe][PATCH] php: cleanup QA warnings
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
X-List-Received-Date: Sat, 19 Jan 2013 10:36:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 19.01.2013 11:03, Martin Jansa pisze:
> I think this /home is still there:
> php-5.3.19: php: Files/directories were installed but not shipped
>   /home
>   /home/jenkins
>   /home/jenkins/oe
>   /home/jenkins/oe/shr-core-branches
>   /home/jenkins/oe/shr-core-branches/shr-core

It is ${TMPDIR} not /home/ - if you have idea how to find out where it
is and how to safely remove it...


