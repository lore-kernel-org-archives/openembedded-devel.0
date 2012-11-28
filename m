Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TdhtR-0000ff-MX
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 14:41:37 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 723F8D22C1; Wed, 28 Nov 2012 14:27:29 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 95A06D2218
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 14:26:58 +0100 (CET)
Message-ID: <50B61115.6000008@linaro.org>
Date: Wed, 28 Nov 2012 14:26:45 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1354033003-31657-1-git-send-email-eric@eukrea.com>
	<1354033003-31657-3-git-send-email-eric@eukrea.com>
In-Reply-To: <1354033003-31657-3-git-send-email-eric@eukrea.com>
Subject: Re: [meta-oe][PATCH 3/3] php: enable php-fpm
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
X-List-Received-Date: Wed, 28 Nov 2012 13:41:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 27.11.2012 17:16, Eric B=C3=A9nard pisze:
> - php-fpm is an alternative PHP FastCGI implementation which seems to
> be now prefered to php-fcgi
> - this patch enable the build of php-fpm and packages it in its own
> package
> - it's tested with hiawatha on an armv5te target

I tested with Apache 2.4.3 on AArch64 target. Works fine after extra 3
lines of configuration. I wonder what would be best place for those -
maybe "php-fpm-apache"?


