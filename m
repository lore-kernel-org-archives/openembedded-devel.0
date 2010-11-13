Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PHIy2-0007CV-Ea
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 17:29:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A9823314AB2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:27:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id cRt0noklwtAf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:27:36 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id DAD13314AB2C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:27:36 +0100 (CET)
Message-ID: <4CDEBC78.2020305@opendreambox.org>
Date: Sat, 13 Nov 2010 17:27:36 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288016459-30546-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1288016459-30546-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pkgconfig.bbclass: don't blindly install every .pc file
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
X-List-Received-Date: Sat, 13 Nov 2010 16:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping

On 10/25/2010 04:20 PM, Andreas Oberritter wrote:
> * Instead of installing the file, print a log message. Later,
>   this function could be removed.
> * .pc files must be installed explicitly to avoid causing
>   build problems. E.g. libsoup-2.4-gnome.pc must not be
>   installed if libsoup-2.4 is built without gnome support,
>   because gstreamer would try to link against libsoup-2.4-gnome.
> * Fixes for lua5.1 and libid3tag, which install their own .pc
>   files from OE, have been submitted.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  classes/pkgconfig.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
> index 23ab453..d96b708 100644
> --- a/classes/pkgconfig.bbclass
> +++ b/classes/pkgconfig.bbclass
> @@ -16,6 +16,8 @@ pkgconfig_sysroot_preprocess () {
>  	install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
>  	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
>  		pcname=`basename $pc`
> -		cat $pc > ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname
> +		if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname ]; then
> +			oenote "$pcname was not installed."
> +		fi
>  	done
>  }



