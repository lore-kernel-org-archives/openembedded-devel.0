Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N64di-0005ja-4A for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:52:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N64FH-0003zv-FT
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:27:31 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 16:27:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 16:27:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Nov 2009 16:27:03 +0100
Message-ID: <hcuqs7$elg$1@ger.gmane.org>
References: <afb7987a0911040032g2bebec62j70a81dd409561c17@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <afb7987a0911040032g2bebec62j70a81dd409561c17@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [patch] ti-cs1-omap3530 upgrade
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
X-List-Received-Date: Thu, 05 Nov 2009 15:52:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andrea,

Thank you for you patch! Could you send it in git-format-patch format so 
we can properly attribute it to you?

regards,

Koen

On 04-11-09 09:32, Andrea wrote:
> Is possible upgrade cs1-omap3530?
> thank you
> Andrea Seraghiti
>
> diff --git a/recipes/ti/ti-cs1-omap3530_1.0.1.bb
> b/recipes/ti/ti-cs1-omap3530_1.0.1.bb
> index 9779c33..039aa92 100644
> --- a/recipes/ti/ti-cs1-omap3530_1.0.1.bb
> +++ b/recipes/ti/ti-cs1-omap3530_1.0.1.bb
> @@ -1,12 +1,12 @@
>   require ti-codec.inc
>   require ti-cs1-omap3530.inc
>
> -SRC_URI        =
> "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin"
> +SRC_URI        =
> "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-44.bin"
>
>   # Specify names of the InstallJammer binary file and the tarball it extracts
> -BINFILE = "cs1omap3530_setuplinux_1_00_01-42.bin"
> +BINFILE = "cs1omap3530_setuplinux_1_00_01-44.bin"
>
> -S = "${WORKDIR}/dvsdk_3_00_01_42/cs1omap3530_1_00_01"
> +S = "${WORKDIR}/dvsdk_3_00_02_44/cs1omap3530_1_00_01"
>
>   DEPENDS="ti-codec-engine ti-dsplink-module"
>
>
>
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index a2d7bda..d5a9944 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -4486,6 +4486,10 @@
> sha256=8b718c344cf19417447cbc16867d2e04434654c13b330598b96720ead146b961
>   md5=0aa2f94c39123f1a0352983e5366179c
>   sha256=4bab529afa00cafde3bc5df2769578c88438f80c5152d4257cd0e86986f95bc4
>
> +[http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-44.bin]
> +md5=4db567252e6c43119e1c0aafe401a679
> +sha256=e042e1aad42a6728adf5c955dc38e4f8331fc0eacd833f1cd75d9cbb4faff0b5
> +
>   [http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports/cs1omap3530_setuplinux_1_00_01-42.bin]
>   md5=a1e19ef37638e977d059fd22af666301
>   sha256=fc7ac2829df8d394635aa1cc704b78e93ca287111df1001e5738ae2282691219




