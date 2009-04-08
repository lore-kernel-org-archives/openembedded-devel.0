Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrZTq-0003WZ-3d
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 17:14:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LrZQt-0004FP-5P
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 15:11:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 15:11:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 15:11:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Apr 2009 17:11:04 +0200
Message-ID: <grieq8$4cq$1@ger.gmane.org>
References: <1239201393-17243-1-git-send-email-vhdirk@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090405 Shredder/3.0b3pre
In-Reply-To: <1239201393-17243-1-git-send-email-vhdirk@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pcsc-lite: Update to version 1.5.2
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
X-List-Received-Date: Wed, 08 Apr 2009 15:14:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-04-09 16:36, Dirk 'Virk' Van Haerenborgh wrote:
> No packaging changes.

Looks good enough to go in to me.

regards,

Koen

> ---
>   conf/checksums.ini                   |   11 +++++++----
>   recipes/pcsc-lite/pcsc-lite_1.5.2.bb |   30 ++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+), 4 deletions(-)
>   create mode 100644 recipes/pcsc-lite/pcsc-lite_1.5.2.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index d08d7bc..3389321 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -18294,6 +18294,10 @@ sha256=362e4b4473f2f7a3bfa28ea73e80ec00a2fe525a1aceb5f66e1c528a900bd735
>   md5=b97d3a725ab93662adf09acfbc49efeb
>   sha256=56fc9e6324539537324b071e5b51c3388df9bfa92fb7e210b989b463122fc333
>
> +[https://alioth.debian.org/frs/download.php/2795/pcsc-lite-1.5.2.tar.bz2]
> +md5=d7d466621bec39354351f09349f6374c
> +sha256=a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e
> +
>   [http://handhelds.org/~zecke/oe_packages/pdamaze_V1.0.0.tar.gz]
>   md5=bf27dd51fe03c8b475080b74de043a13
>   sha256=99d6bc6b360baabd6044e8883d467cc6ed7955f9ab66d8f87f61e3cc757fb97a
> @@ -23462,14 +23466,13 @@ sha256=c762525fdbf5f5dd32c6c950f2a63d8c1b15ec3dc7afca5d2dc3dbd1b129a00d
>   md5=66480128b9dabcced2e4c8db3e60fa50
>   sha256=6c5bfb2edae5c289233b6cd65393bb7414a2d30ad4d1239c207a659a4232d91a
>
> -[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog_5.3.1.tar.gz]
> -md5=ba97ddce396bfccd8d409bc3141d7ef4
> -sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
> -
>   [http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog-5.6.tar.gz]
>   md5=6df285569dd1d85528b983c98c9b2b7c
>   sha256=a2c7d6726e092315dbb047211b754528e4532521678a30e16f60a31bb86a7f74
>
> +[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog_5.3.1.tar.gz]
> +md5=ba97ddce396bfccd8d409bc3141d7ef4
> +sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
>
>   [http://downloads.sourceforge.net/wbxmllib/wbxml2-0.9.0-src.tar.gz]
>   md5=3f9b5bf104ec523b8eebe69f93919ded
> diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> new file mode 100644
> index 0000000..156e463
> --- /dev/null
> +++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "PC/SC Lite smart card framework and applications"
> +HOMEPAGE = "http://pcsclite.alioth.debian.org/"
> +LICENSE = "BSD"
> +
> +DEPENDS = "hal"
> +RDEPENDS_${PN} = "hal"
> +
> +SRC_URI = "http://alioth.debian.org/download.php/2479/pcsc-lite-${PV}.tar.bz2 \
> +           file://pcscd.init "
> +
> +inherit autotools_stage update-rc.d
> +
> +INITSCRIPT_NAME = "pcscd"
> +INITSCRIPT_PARAMS = "defaults"
> +
> +EXTRA_OECONF = " \
> +	--enable-libhal \
> +	--disable-libusb \
> +	--enable-usbdropdir=${libdir}/pcsc/drivers \
> +	"
> +
> +do_install() {
> +	oe_runmake DESTDIR="${D}" install
> +	install -d "${D}/etc/init.d"
> +	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
> +}
> +
> +PACKAGES =+ "libpcsclite"
> +
> +FILES_libpcsclite = "${libdir}/libpcsclite.so.*"




