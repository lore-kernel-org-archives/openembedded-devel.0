Return-Path: <gcho-openembedded-devel@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Mar 2018 10:08:57 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id A75C96E688
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 10:08:57 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1euEgl-0002tx-3c for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2018 10:51:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 9 Mar 2018 10:53:43 +0100
Message-ID: <p7tlf7$8f1$1@blaine.gmane.org>
References: <20180309095147.23136-1-koen.kooi@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
In-Reply-To: <20180309095147.23136-1-koen.kooi@linaro.org>
Subject: Re: [PATCH] ncurses: fix do_install failure when base_libdir has more than one level
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2018 10:08:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: nl

Wrong list, sorry

Op 09-03-18 om 10:51 schreef Koen Kooi:
> Other sections of the .inc already use mkdir -p, so use it here as well.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org> --- meta/recipes-core/ncurses/ncurses.inc | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc index 1f21cd4..106dcb0 100644 --- a/meta/recipes-core/ncurses/ncurses.inc +++
> b/meta/recipes-core/ncurses/ncurses.inc @@ -227,7 +227,7 @@ do_install() { if [ ! -d "${D}${base_libdir}" ]; then # Setting base_libdir to libdir as is done in the -native #
> case will skip this code -            mkdir ${D}${base_libdir} +            mkdir -p ${D}${base_libdir} mv ${D}${libdir}/libncurses.so.* ${D}${base_libdir} ! ${ENABLE_WIDEC}
> || \ mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
> 



