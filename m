Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMHn-0002Ar-C5
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:36:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C98AC3148486
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:35:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1HPlcSNngFtb
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:35:37 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 78271314A1E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:35:37 +0200 (CEST)
Message-ID: <4CC57998.9080204@opendreambox.org>
Date: Mon, 25 Oct 2010 14:35:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimyqP-aP=+poQSHFE=ePogb66en0BwNCYWwCkXk@mail.gmail.com>	<AANLkTimUZ9KiEdhbu2R=VV0mCVh_gWqoxHxpwrnTSJeX@mail.gmail.com>
	<AANLkTimR4TEOwVmWDsvL+WJboq+1qdRssKedS+iiVE9J@mail.gmail.com>
In-Reply-To: <AANLkTimR4TEOwVmWDsvL+WJboq+1qdRssKedS+iiVE9J@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sed dependency
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
X-List-Received-Date: Mon, 25 Oct 2010 12:36:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/24/2010 08:53 PM, Frans Meulenbroeks wrote:
> 2010/10/24 Chris Larson <clarson@kergoth.com>:
>> If something is covered by posix / SuSv3, I see no need to use a -native.
>>  We have to expect a certain amount of sanity in our build environment.  For
>> specific non-portable usages, those should certainly be fixed to not use
>> that functionality, to use some form of sanitizing wrapper, or to depend on
>> the gnu tool specifically via -native, imo.
>> --
> Seems like a good plan to me. Guess then we should reject Andreas's patch.

I've removed the patch from my queue. Because sed is listed as a
prerequisite on http://wiki.openembedded.net/index.php/OEandYourDistro
it really seems to be wrong to depend on sed-native. Maybe it should be
added to sanity.bbclass.

> for the record: this are the recipes that DEPEND on sed-native
> 
> libgc/libgc_6.5.bb:DEPENDS		= "sed-native"
> libgc/libgc_6.7.bb:DEPENDS		= "sed-native"
> meta/canadian-sdk.bb:DEPENDS = "opkg-native ipkg-utils-native
> fakeroot-native sed-native zip-native"
> meta/meta-toolchain.bb:DEPENDS = "opkg-native ipkg-utils-native
> fakeroot-native sed-native"
> opensync/libsyncml_0.4.0.bb:DEPENDS = "sed-native wbxml2 libsoup
> libxml2 bluez-libs openobex"
> opensync/libsyncml_0.4.6.bb:DEPENDS = "sed-native wbxml2 libsoup
> libxml2 bluez-libs openobex"
> opensync/libsyncml_svn.bb:DEPENDS = "sed-native wbxml2 libsoup libxml2
> bluez-libs openobex"
> rpm/rpm_4.4.2.3.bb:DEPENDS = "zlib beecrypt file popt python sed-native"
> 
> No idea if they really should depend on it.

I guess not.

Regards,
Andreas


