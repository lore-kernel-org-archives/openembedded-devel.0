Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jt45i-0004ju-EU
	for openembedded-devel@openembedded.org; Mon, 05 May 2008 19:03:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m45H2pcA021359
	for <openembedded-devel@openembedded.org>;
	Mon, 5 May 2008 18:02:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21288-03 for <openembedded-devel@openembedded.org>;
	Mon,  5 May 2008 18:02:46 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m45H2gOW021353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 5 May 2008 18:02:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <481AED81.9040203@openmoko.com>
References: <481AED81.9040203@openmoko.com>
Date: Mon, 05 May 2008 18:02:41 +0100
Message-Id: <1210006961.5113.25.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: qa_staging failed with recipe which inherit sdk.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 05 May 2008 17:03:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2008-05-02 at 18:31 +0800, Julian wrote:
> I found that if there is a recipe which inherit sdk.bbclass, it always
> fail in qa_staging.
> 
> for example, bitbake gdb-cross-sdk, the variables are
> 
>    STAGING_LIBDIR=${STAGING_DIR_HOST}${layout_libdir}
>    STAGING_DIR_HOST=${STAGING_DIR}/${HOST_SYS}
>    HOST_SYS=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}
> 
> in sdk.bbclass, I saw
> 
>    HOST_ARCH = "${BUILD_ARCH}"
> 
> in my case, qa_staging will test ${STAGING_DIR}/i686-linux
> However, the .pc files placed in ${STAGING_DIR}/i686-linux were made by
> another recipe which inherit native.bbclass. the .pc file contains
> ${TMPDIR} (ie.
> prefix=/home/walkingice/OpenMoko/build/tmp/staging/i686-linux/usr)
> 
> Finally, it could not pass qa_staging.
> 
> How can I solve this problem ?

This happens when your BUILD_ARCH and your TARGET_ARCH are the same and
its a known issue. Previously Poky worked around this by setting
HOST_VENDOR to TARGET_VENDOR but that causes subtle problems with the
toolchain building (it becomes a Canadian Cross).

I made a change in Poky recently to sdk.bbclass which will probably
help, I'll sync that to OE...

Regards,

Richard




