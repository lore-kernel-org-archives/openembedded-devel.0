Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U7Mxp-0001Ln-Hw
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 10:24:59 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id F3F32D22E8; Mon, 18 Feb 2013 10:08:41 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 347C4D22B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 10:08:09 +0100 (CET)
Message-ID: <5121EF74.1030802@linaro.org>
Date: Mon, 18 Feb 2013 10:08:04 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1360234263-18278-6-git-send-email-marcin.juszkiewicz@linaro.org>
	<20130216052110.GV3300@jama>
In-Reply-To: <20130216052110.GV3300@jama>
Subject: Re: [meta-oe][PATCH 5/8] libunwind: add 1.1 with preliminary aarch64 patch
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
X-List-Received-Date: Mon, 18 Feb 2013 09:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 16.02.2013 06:21, Martin Jansa pisze:
> On Thu, Feb 07, 2013 at 11:51:00AM +0100, Marcin Juszkiewicz wrote:
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>  meta-oe/recipes-support/libunwind/files/aarch64.patch | 19 +++++++++++++++++++
>>  meta-oe/recipes-support/libunwind/libunwind.inc       | 12 ++++++++++++
>>  meta-oe/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
>>  3 files changed, 37 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/libunwind/files/aarch64.patch
>>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind.inc
>>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> 
> Does not build for qemuarm:

10:07 hrw@puchatek:build$ find tmp-eglibc/deploy/ipk/ -name libunwind_1.1*
tmp-eglibc/deploy/ipk/armv5te/libunwind_1.1-r0_armv5te.ipk
tmp-eglibc/deploy/ipk/armv7ahf-vfp-neon/libunwind_1.1-r0_armv7ahf-vfp-neon.ipk

Built fine for qemuarm and genericarmv7a here.


