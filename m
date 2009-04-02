Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpRKQ-0001dC-20
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 20:08:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpRI3-0000Nq-3Z
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 18:05:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:05:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:05:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 20:05:07 +0200
Message-ID: <gr2uoj$hj4$1@ger.gmane.org>
References: <1238687846-26851-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238687846-26851-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] watchdog: Update to version 5.6
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
X-List-Received-Date: Thu, 02 Apr 2009 18:08:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-04-09 17:57, Mark Brown wrote:
> No packaging changes, just the new upstream.

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   conf/checksums.ini               |    5 +++++
>   recipes/watchdog/watchdog_5.6.bb |   16 ++++++++++++++++
>   2 files changed, 21 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/watchdog/watchdog_5.6.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2a119dd..5caccd1 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -23358,6 +23358,11 @@ sha256=6c5bfb2edae5c289233b6cd65393bb7414a2d30ad4d1239c207a659a4232d91a
>   md5=ba97ddce396bfccd8d409bc3141d7ef4
>   sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
>
> +[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog-5.6.tar.gz]
> +md5=6df285569dd1d85528b983c98c9b2b7c
> +sha256=a2c7d6726e092315dbb047211b754528e4532521678a30e16f60a31bb86a7f74
> +
> +
>   [http://downloads.sourceforge.net/wbxmllib/wbxml2-0.9.0-src.tar.gz]
>   md5=3f9b5bf104ec523b8eebe69f93919ded
>   sha256=acd218148d7f92ee7bd0539d6aabd0b42cca8ae4ffe241bfa8760d30605b28c9
> diff --git a/recipes/watchdog/watchdog_5.6.bb b/recipes/watchdog/watchdog_5.6.bb
> new file mode 100644
> index 0000000..6c8bd56
> --- /dev/null
> +++ b/recipes/watchdog/watchdog_5.6.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "System watchdog daemon"
> +LICENSE = "GPL"
> +
> +SRC_URI = "http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/${PN}-${PV}.tar.gz \
> +	file://init"
> +
> +inherit autotools update-rc.d
> +
> +INITSCRIPT_NAME = "watchdog"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/watchdog
> +}
> +




