Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id BEC0D6A5AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2013 18:34:54 +0000 (UTC)
Received: (qmail 3199 invoked by uid 1003); 1 Jul 2013 18:34:54 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@96.240.165.115)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Jul 2013 18:34:54 -0000
Message-ID: <51D1CBCD.60207@balister.org>
Date: Mon, 01 Jul 2013 14:34:53 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1372663401-12751-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1372663401-12751-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] uhd: Fix compile errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2013 18:34:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

I'll make sure the patch gets into the upstream codebase and drop the
patch ASAP.

Thanks,

Philip

On 07/01/2013 03:23 AM, Khem Raj wrote:
> uhd would fail with wrong scope for uint8_t type
> errors.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Philip Balister <philip@balister.org>
> ---
>  .../0001-use-uint8_t-from-boost-namespace.patch    |   29 ++++++++++++++++++++
>  meta-oe/recipes-connectivity/uhd/uhd_git.bb        |    3 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
> 
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch b/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
> new file mode 100644
> index 0000000..8978ddc
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/uhd/uhd/0001-use-uint8_t-from-boost-namespace.patch
> @@ -0,0 +1,29 @@
> +From 317f6f08cedf005ce1f2d6f0d04cfb2659863423 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 30 Jun 2013 22:10:50 -0700
> +Subject: [PATCH] use uint8_t from boost namespace
> +
> +Fixes errors like
> +codec_ctrl.cpp:113:10: error: 'uint8_t' was not declared in this scope
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + host/lib/usrp/e100/codec_ctrl.cpp |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/host/lib/usrp/e100/codec_ctrl.cpp b/host/lib/usrp/e100/codec_ctrl.cpp
> +index 13b3bc9..2c13176 100644
> +--- a/host/lib/usrp/e100/codec_ctrl.cpp
> ++++ b/host/lib/usrp/e100/codec_ctrl.cpp
> +@@ -110,7 +110,7 @@ e100_codec_ctrl_impl::e100_codec_ctrl_impl(spi_iface::sptr iface){
> +     //_ad9862_regs.dis2 = ad9862_regs_t::DIS2_DIS; needed for transmit
> + 
> +     //write the register settings to the codec
> +-    for (uint8_t addr = 0; addr <= 25; addr++){
> ++    for (boost::uint8_t addr = 0; addr <= 25; addr++){
> +         this->send_reg(addr);
> +     }
> + 
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
> index 06d5eff..180fd27 100644
> --- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
> +++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
> @@ -4,7 +4,8 @@ PV = "3.5.3"
>  PR = "${INC_PR}.0"
>  
>  SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
> -"
> +           file://0001-use-uint8_t-from-boost-namespace.patch;striplevel=2 \
> +          "
>  S = "${WORKDIR}/git/host"
>  
>  SRCREV = "f4c58120dc1e3674ee0228213f0f0011a0f80dcf"
> 

