Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UKOJa-0004gj-F4
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 08:29:36 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 8B26ED22E8; Tue, 26 Mar 2013 08:12:09 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B26D0D22B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 08:11:38 +0100 (CET)
Message-ID: <51514A23.3080109@linaro.org>
Date: Tue, 26 Mar 2013 08:11:31 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1364203235-2737-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
In-Reply-To: <01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] tbb: add 4.1 20130116 version (4.1 update 2)
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
X-List-Received-Date: Tue, 26 Mar 2013 07:29:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 26.03.2013 06:59, Khem Raj pisze:
> On Mar 25, 2013, at 2:20 AM, Marcin Juszkiewicz

>> +do_compile() { +    oe_runmake compiler=gcc arch=${HOST_ARCH}
>> runtime=cc4.7_libc2.17_kernel3.8 tbb tbbmalloc +}

> hmmm do you have to encode the tools versions like that, say in
> future we move to gcc 4.8 or kernel 3.9 will this need adjusting too?

If runtime is not defined it is created based on host system so can be
totally wrong. From quick look at makefiles there is only compiler part
checked for "cc3" or "cc4" - to add some arguments to flags.

New version sent.


