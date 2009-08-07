Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1MZOLb-0005Si-PE
	for openembedded-devel@openembedded.org; Fri, 07 Aug 2009 14:14:59 +0200
Received: (qmail 27635 invoked from network); 7 Aug 2009 13:59:07 +0200
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 7 Aug 2009 13:59:07 +0200
Received: (qmail 6461 invoked by uid 9804); 7 Aug 2009 13:59:07 +0200
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 7 Aug 2009 13:59:01 +0200
Received: (qmail 6453 invoked by uid 9804); 7 Aug 2009 13:59:01 +0200
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 7 Aug 2009 13:59:01 +0200
Received: (qmail 27626 invoked from network); 7 Aug 2009 13:59:01 +0200
Received: from leningrad.mi.fu-berlin.de (160.45.45.206)
	by leibniz.math.fu-berlin.de with (AES256-SHA encrypted) SMTP;
	7 Aug 2009 11:59:01 -0000
Received: from heinold by leningrad.mi.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1MZO68-0006P7-Uw
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2009 13:59:00 +0200
Date: Fri, 7 Aug 2009 13:59:00 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090807115900.GA24582@mi.fu-berlin.de>
References: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[6456](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.206
MIME-Version: 1.0
In-Reply-To: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: [PATCH] Added rcc (resource compiler) utility setup for	QTE toolchain environment.
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
X-List-Received-Date: Fri, 07 Aug 2009 12:14:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2009 at 02:42:00PM +0300, Ihar Hrachyshka wrote:
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
>  recipes/meta/meta-toolchain-qte.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/meta/meta-toolchain-qte.bb b/recipes/meta/meta-toolchain-qte.bb
> index 70c4087..699f053 100644
> --- a/recipes/meta/meta-toolchain-qte.bb
> +++ b/recipes/meta/meta-toolchain-qte.bb
> @@ -19,6 +19,7 @@ do_populate_sdk_append() {
>         echo 'export OE_QMAKE_INCDIR_QT=${prefix}/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
>         echo 'export OE_QMAKE_MOC=${prefix}/${layout_bindir}/moc4' >> $script
>         echo 'export OE_QMAKE_UIC=${prefix}/${layout_bindir}/uic4' >> $script
> +       echo 'export OE_QMAKE_RCC=${prefix}/${layout_bindir}/rcc4' >> $script
>  
>         # Repack SDK with new environment-setup
>         cd ${SDK_OUTPUT}
> -- 
> 1.6.3.3
> 
ACK

Bye Henning


