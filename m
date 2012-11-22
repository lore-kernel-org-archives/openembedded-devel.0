Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TbWGr-00049L-Dw
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 13:52:45 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 3F231D22C1; Thu, 22 Nov 2012 13:38:48 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 35472D224F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 13:38:16 +0100 (CET)
Message-ID: <50AE1CAB.7060003@linaro.org>
Date: Thu, 22 Nov 2012 13:38:03 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20121122123447.GB12637@jama.jama.net>
In-Reply-To: <20121122123447.GB12637@jama.jama.net>
Subject: Re: evolution-data-server and php-native broken by libxml2 upgrade in oe-core
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
X-List-Received-Date: Thu, 22 Nov 2012 12:52:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 22.11.2012 13:34, Martin Jansa pisze:
> Just FYI:
> 
> meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> virtual:native:meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.6.bb
> 
> are broken after lixml2 upgrade from 2.8.0 to 2.9.0 (oe-core rev
> a65ea43e26866ddc60051c52b2eb226507fae346)
> 
> They are pretty low priority for me right now, so I'm just sending this
> e-mail instead of patches :). 
> 
> Hrw is already working on php.

I was working on php 5.4.8 which builds with this libxml2 version for
native but fails for my armv8 target.



