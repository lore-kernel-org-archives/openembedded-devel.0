Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TgCzR-0006pv-6u
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 12:18:09 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id CC906D22C0; Wed,  5 Dec 2012 12:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3D3CCD22B4;
	Wed,  5 Dec 2012 12:03:17 +0100 (CET)
Message-ID: <50BF29E7.5080203@linaro.org>
Date: Wed, 05 Dec 2012 12:03:03 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: linaro-dev@lists.linaro.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Riku Voipio <riku.voipio@linaro.org>,
	Hope Michael <michael.hope@linaro.org>,
	Matthew Gretton-Dann <matthew.gretton-dann@linaro.org>
Subject: New layout for OpenEmbedded layers
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
X-List-Received-Date: Wed, 05 Dec 2012 11:18:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello

Now at Linaro we have two layers for our OpenEmbedded work:

- meta-aarch64
- meta-linaro

First one contains everything we need to get AArch64 booted in
fastmodels: toolchain, kernel and few recipes which needed changes to
build for AArch64. I am working on merging those changes into main
OpenEmbedded layers.

Second one is gcc-linaro from Toolchain WG and some recipes and changes
from Platform team.

Those who do OE builds with our toolchain have some components changed
due to our metadata (like Busybox with dpkg-deb) and I decided to fix it.

Today I pushed "new-layout" branch of meta-linaro repository. It
contains all Linaro layers:

- meta-aarch64
- meta-linaro
- meta-linaro-toolchain

First one was merged from meta-aarch64 repository and moved to own
directory. Third one contains only toolchain bits. Second one has all
that left.

I have to do some test builds with this layout and once they will
confirm that it works I will change all CI builds. This will also
deprecate meta-aarch64 repository - it will not have any updates and
will be dropped in ~month.

Opinions?


