Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LoYsu-0000B9-Jn
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 09:59:50 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 19355DB15BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 09:57:38 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 27A22DB1232
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 09:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178116121.adsl.alicedsl.de
	[85.178.116.121]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 09:57:37 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A63643C218; Tue, 31 Mar 2009 09:57:36 +0200 (CEST)
Date: Tue, 31 Mar 2009 09:57:36 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090331075734.GB6971@rhein.zuhause.netz>
References: <49D1B395.7050004@gmail.com>
MIME-Version: 1.0
In-Reply-To: <49D1B395.7050004@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: problem with qt-embedded
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
X-List-Received-Date: Tue, 31 Mar 2009 07:59:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2009 at 08:09:25AM +0200, Enrico Castro wrote:
> I installed OE [1] and I build a console-image successful.
> After I tried to build my image:
>
> IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
>
> ANGSTROM_EXTRA_INSTALL ?= ""
>
> DEPENDS = "task-base-extended \
>            ${@base_contains("MACHINE_FEATURES", "screen", "psplash-
> zap", "",d)} \
>            mplayer omapfbplay \
>            qt-embedded \
>            gdb \
>            rt73-firmware wireless-tools zd1211-firmware \
>            "
>
> IMAGE_INSTALL = "task-base-extended \
>             ${ANGSTROM_EXTRA_INSTALL} \
>             ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap",
> "",d)} \
>             mplayer omapfbplay \
>             qt-embedded \
>             qt-embedded-plugin-imageformat-gif \
>             qt-embedded-plugin-imageformat-ico \
>             qt-embedded-plugin-imageformat-jpeg \
>             qt-embedded-plugin-imageformat-mng \
>             qt-embedded-plugin-imageformat-svg \
>             qt-embedded-plugin-imageformat-tiff \
>             gdb \
>             rt73-firmware wireless-tools zd1211-firmware \
>            "
>
> export IMAGE_BASENAME = "my-image"
> IMAGE_LINGUAS = ""
>
> inherit image
>
> But I had the next error:
>
> ERROR: Required build target 'my-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['my-image', 'qt-
> embedded']
>
> Maybe do I made any mistake? Then, I tried to build a neuros-osd-base-
> image but I had such error:
>
> ERROR: '['/home/****/oe/openembedded/recipes/images/neuros-osd-base-
> image.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
> entity 'qt-embedded' but it wasn't found in any PACKAGE or RPROVIDES
> variables
> NOTE: Runtime target 'qt-embedded' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['qt-embedded']
> ERROR: Required build target 'neuros-osd-base-image' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['neuros-osd-base-image',
> 'qt-embedded']
>
> [1] http://elinux.org/BeagleBoardAndOpenEmbeddedGit

Hi,

which qt-embedded Version do you want qt2 or qt4? For qt2 you have to choose qte-mt
for qt4 you have to choose qt4-embedded.

Bye Henning


