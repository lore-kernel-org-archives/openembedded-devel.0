Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TfsFS-00089g-Gx
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:09:18 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 256B5D22C0; Tue,  4 Dec 2012 13:55:10 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8902ED22B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2012 13:54:38 +0100 (CET)
Message-ID: <50BDF27F.2030804@linaro.org>
Date: Tue, 04 Dec 2012 13:54:23 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50BDECAC.5070805@communistcode.co.uk>
In-Reply-To: <50BDECAC.5070805@communistcode.co.uk>
Subject: Re: php-cgi cannot install package
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
X-List-Received-Date: Tue, 04 Dec 2012 13:09:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 04.12.2012 13:29, Jack Mitchell pisze:
> I tried to build the recently commited PHP changes today and received
> this error at do_rootfs, any ideas?
> 
> The only package I select is php-cgi through IMAGE_INSTALL.

Good catch. Looks like enabling FPM disabled CGI interface.

But for performance reasons I suggest switch to FPM.



