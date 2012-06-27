Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SjtN9-0000Dv-K3
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 16:37:35 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 15496D2380; Wed, 27 Jun 2012 16:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 46675D232A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 16:26:25 +0200 (CEST)
Message-ID: <4FEB180C.6060600@linaro.org>
Date: Wed, 27 Jun 2012 16:26:20 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120614 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20317992.tBZ1YY1I5v@helios>
In-Reply-To: <20317992.tBZ1YY1I5v@helios>
Subject: Re: LAMP layer
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
X-List-Received-Date: Wed, 27 Jun 2012 14:37:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 27.06.2012 16:05, Paul Eggleton pisze:

> In conjunction with the folks at Wind River I'm currently in the 
> process of putting together a layer to support the traditional LAMP 
> stack, and wanted to solicit some opinions on how this might be 
> structured/named/etc.

Great to hear ;)

> I think we have the "L" pretty much covered ;) and we have MySQL in 
> meta-oe (I'm not convinced that's where it should stay, although 
> perhaps it need not be tied to this layer either).

MySQL is at 5.1 version - update to 5.5 would be nice to have.

> So the layer would at the very least be adding Apache and PHP, with 
> the possibility of web-related python and perl recipes being added
> at a later date.
> 
> Some of the other things I'm looking at adding more immediately:

Please add 'php-fpm' into PHP. This gives huge speed improvement
compared to classic FastCGI way.


