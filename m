Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C86447422C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 12:30:19 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so109406722pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=zCGjXRS2oCWTFg389myDMl9yFqvrsjB9pcN3J3ZMgE0=;
	b=Axsb/wv3Exm86YymiwImpuCIYEUkEUnthW3VEX2sizOuIPcY97IfqvSvMTLON+mKSR
	Dz2+2uV/WpbirzqpQ216j15Pw5MRWW4cMk28IXgB485lcOlUAVgxypNW6v+dpUsfKq+d
	u08TxxyzCqK9fhhG25z1jJw3X7ZEjQfC7SPQNDUuZMwZ1U4A1bi/Y7vnwi9RgEBI/OfG
	Wr9hy70njC6hJG+frTlVsryrCc8/7VCWx/vGYELF0PNgt3K+RaocwAo7Yuq8ksB4WCWq
	d5bopcj9XT5mApCkBT91z0aMx57d+5EQjTjoq2NGauBt3WVL/4Mm3ONbPEb9Ixaf5uhT
	Q1yA==
X-Received: by 10.68.197.231 with SMTP id ix7mr29779042pbc.85.1440937819383;
	Sun, 30 Aug 2015 05:30:19 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	ld8sm11181218pbc.61.2015.08.30.05.30.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 05:30:18 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<63bae5e8f510c228002db87998ad031708fc69dd.1440502860.git.samuli.piippo@theqtcompany.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <55E2F755.5030003@gmail.com>
Date: Sun, 30 Aug 2015 22:30:13 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <63bae5e8f510c228002db87998ad031708fc69dd.1440502860.git.samuli.piippo@theqtcompany.com>
Subject: Re: [meta-qt5][PATCH v2 04/11] qt5: add host paths to qt.conf
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
X-List-Received-Date: Sun, 30 Aug 2015 12:30:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2015 9:43 PM, Samuli Piippo wrote:
> Add missing HostData and HostLibraries paths to qt.conf for qmake.
> Using the target sysroot for the HostData, allows us to remove the
> symbolic link for the mkspecs.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>   classes/populate_sdk_qt5.bbclass | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
> index d29ec36..3f33b23 100644
> --- a/classes/populate_sdk_qt5.bbclass
> +++ b/classes/populate_sdk_qt5.bbclass
> @@ -4,10 +4,6 @@
>   inherit qmake5_paths
>   
>   create_sdk_files_prepend () {
> -    # make a symbolic link to mkspecs for compatibility with QTCreator
> -    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
> -         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
> -
>       # Generate a qt.conf file to be deployed with the SDK
>       qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
>       touch $qtconf
> @@ -28,5 +24,7 @@ create_sdk_files_prepend () {
>       echo 'Examples = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
>       echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
>       echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
> +    echo 'HostData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
>       echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
> +    echo 'HostLibraries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_LIBS}' >> $qtconf
>   }
This works but is it logically correct to use a directory that contains 
binaries compiled for the target as the host data directory...?
The mkspecs are architecture independent but the plugins are target 
specific.

Regards,
Jonathan

