Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnuP7-0001a2-0k
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:55:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1CEB7314D9E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:54:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id x2lybA4c9Tny
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:54:16 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 3F575314D985
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:54:16 +0100 (CET)
Message-ID: <4D554D97.2050208@opendreambox.org>
Date: Fri, 11 Feb 2011 15:54:15 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>	<1297429080-3986-5-git-send-email-obi@opendreambox.org>
	<20110211144100.GK9652@excalibur.local>
In-Reply-To: <20110211144100.GK9652@excalibur.local>
Subject: Re: [PATCH 5/5] wpa-supplicant-0.7.3: depend on openssl
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
X-List-Received-Date: Fri, 11 Feb 2011 14:55:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Stefan,

On 02/11/2011 03:41 PM, Stefan Schmidt wrote:
> On Fri, 2011-02-11 at 12:58, Andreas Oberritter wrote:
>> * let defconfig decide which crypto library to use
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
>> index f64eb79..e01d1ef 100644
>> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
>> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2 | BSD"
>>  LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>>                      file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
>>                      file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
>> -DEPENDS = "gnutls dbus libnl2 ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
>> +DEPENDS = "gnutls dbus libnl2 openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
>>  RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
> 
> Hmm, that one I don't really like. We now build gnutls _and_ openssl even if we
> only need one of it. As the config may be overriden for distros/machines I have
> no good idea how to check for it during dependency calculation though. Anyone
> else an idea?

In general, in OE we build a whole lot of packages that aren't required
by the target image. Here, we already build dbus, even though it might
be disabled by an overridden config. Since both gnutls and openssl are
likely to be used by other packages, this adds no cost at all for many
targets, especially because only the library that actually gets linked
to is going to end up in RDEPENDS_${PN}.

Regards,
Andreas


