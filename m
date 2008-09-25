Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KioDh-0003i2-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 12:37:13 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C72A98400AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 12:33:32 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C4C748400A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 12:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_20
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178074016.adsl.alicedsl.de
	[85.178.74.16]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 12:33:31 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 42B783C1D7; Thu, 25 Sep 2008 12:33:31 +0200 (CEST)
Date: Thu, 25 Sep 2008 12:33:31 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080925103330.GA19161@rhein.zuhause.netz>
References: <gbfeov$m8g$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gbfeov$m8g$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: liboil softfloat fix questions
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
X-List-Received-Date: Thu, 25 Sep 2008 10:37:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2008 at 09:31:43AM +0200, Koen Kooi wrote:
> Hi,
>
> I noticed liboil got patched:
>
> +if test x"${ENABLE_SOFTFLOAT}" = "xyes"; then
> +      VFP_CFLAGS="$VFP_CFLAGS -mfloat-abi=softfp"
> +else
> +      VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"
>
> That looks a bit wrong to me, since for EABI you'd want  
> '-mfloat-abi=softfp -mfpu=vfp' to make it use the VFP coprocessor using  
> softfloat calling conventions[1] and plain '-mfloat-abi=softfp' to do  
> softfloat, and with OABI you don't want to pass '-mfloat-abi=softfp'
> To make it even more complicated, on armv7a[2] you want to pass  
> -mfpu=neon -mfloat-abi=softfp. If you look at the output of gcc -S  
> you'll see that EABI won't use an FPU unless you pass in  
> -mfloat-abi=softfp *and* -mfpu=<FPU>.
>
> AFAICT OE passes all the needed magic already in TARGET_CCFLAGS, so it  
> seems that this entire construct can be removed.
>
> Robert, could you beat the cacao people with a cluebat so they get their  
> stuff right?

Hi,

okay seems I have to learn more about fpu stuff.

From cacao I only took the configure option. The Cflags comes from
liboil itself.

I will remove this cruft from the configure.ac and will try again.

Bye Henning


