Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OmSlV-0000Dg-D8
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 16:40:19 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OmSlA-0003Fv-Lt
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 15:39:56 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OmSlA-00034K-DV
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 15:39:56 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1282313977-31805-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 20 Aug 2010 15:39:56 +0100
Message-ID: <1282315196.13038.44.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] native.bbclass: add (re)definitions for TARGET_SYS and HOST_SYS
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
X-List-Received-Date: Fri, 20 Aug 2010 14:40:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-08-20 at 16:19 +0200, Frans Meulenbroeks wrote:
> @@ -23,6 +23,7 @@ TARGET_VENDOR = "${BUILD_VENDOR}"
>  TARGET_PREFIX = "${BUILD_PREFIX}"
>  TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
>  TARGET_EXEEXT = "${BUILD_EXEEXT}"
> +TARGET_SYS = "${BUILD_SYS}"

I don't think this is the right thing; native.bbclass already assigns
TARGET_OS = "${BUILD_OS}".

Do you really need to use a _local override for TARGET_OS?  If so then I
guess you need to find a way to stop it applying for virtclass-native.

p.




