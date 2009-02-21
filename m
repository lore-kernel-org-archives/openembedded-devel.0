Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LapMb-00089J-C2
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Feb 2009 11:45:41 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 53A56DB1B34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2009 11:43:07 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 06C1EDB1238
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2009 11:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178112105.adsl.alicedsl.de
	[85.178.112.105]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2009 11:43:05 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4AF6E3C05B; Sat, 21 Feb 2009 11:43:05 +0100 (CET)
Date: Sat, 21 Feb 2009 11:43:05 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090221104304.GA18336@rhein.zuhause.netz>
References: <bug-5031-13@http.bugs.openembedded.net/>
	<20090221091912.0B977189360@amethyst.openembedded.net>
MIME-Version: 1.0
In-Reply-To: <20090221091912.0B977189360@amethyst.openembedded.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [Bug 5031] hal: create_cache.c:487: error: `XML_ERROR_ABORTED'	undeclared (first use in this function)
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
X-List-Received-Date: Sat, 21 Feb 2009 10:45:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 21, 2009 at 10:19:12AM +0100, bugzilla-daemon@amethyst.openembedded.net wrote:
> http://bugs.openembedded.net/show_bug.cgi?id=5031
> 
> 
> 
> 
> 
> --- Comment #2 from udo <udovdh@xs4all.nl>  2009-02-21 10:19:11 ---
> +++ b/conf/distro/chinook-compat.conf
> @@ -91,7 +91,8 @@ PREFERRED_VERSION_pango            = "1.16.4"
>  PREFERRED_VERSION_atk              = "1.18.0"
>  PREFERRED_VERSION_gtk+             = "2.10.14"
>  PREFERRED_VERSION_libpng           = "1.2.8"
> -PREFERRED_VERSION_expat            = "1.95.7"
> +#PREFERRED_VERSION_expat            = "1.95.7"
> +PREFERRED_VERSION_expat            = "2.0.0"
> 
>  # only dbus-glib 0.74 works with older dbus 1.0.x
>  PREFERRED_VERSION_dbus             = "1.0.3"
> 
> fixes hal compilation.

Hm,

but expat 2.0 ist not in the chinook repos, so there might be problems
when running it on the device. Even on diablo expat is at 1.95.8.

Bye Henning

PS: I will be looking into this problem and even provide diablo-compat.conf


