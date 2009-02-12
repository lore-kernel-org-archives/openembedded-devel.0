Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXfK5-0006LF-Sp
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 18:26:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXfIn-0002ro-RN
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:24:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:24:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 17:24:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 18:24:28 +0100
Message-ID: <gn1m0d$5tl$1@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/6] rt61-firmware: add 1.2
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
X-List-Received-Date: Thu, 12 Feb 2009 17:26:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 17:38, Otavio Salvador wrote:
> ---
>   packages/rt2x00/rt61-firmware_1.2.bb |   14 ++++++++++++++
>   1 files changed, 14 insertions(+), 0 deletions(-)
>   create mode 100644 packages/rt2x00/rt61-firmware_1.2.bb
>
> diff --git a/packages/rt2x00/rt61-firmware_1.2.bb b/packages/rt2x00/rt61-firmware_1.2.bb
> new file mode 100644
> index 0000000..ae683c8
> --- /dev/null
> +++ b/packages/rt2x00/rt61-firmware_1.2.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Firmware for rt61 based USB wifi adaptors"
> +LICENSE = "unknown"
> +
> +SRC_URI = "http://www.ralinktech.com.tw/data/RT61_Firmware_V${PV}.zip"
> +
> +S = "${WORKDIR}/RT61_Firmware_V${PV}"
> +
> +do_install() {
> +	install -d ${D}/${base_libdir}/firmware
> +	install -m 0644 rt61.bin ${D}/${base_libdir}/firmware/
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware/"
> +PACKAGE_ARCH = "all"

ACK



