Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PlSTq-0000fk-Vb
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 21:42:11 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A518D1100291
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Feb 2011 21:41:14 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 87819110028D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Feb 2011 21:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225074149.adsl.alicedsl.de
	[92.225.74.149]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Feb 2011 21:41:13 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9AB5F3C346; Fri,  4 Feb 2011 21:41:00 +0100 (CET)
Date: Fri, 4 Feb 2011 21:41:00 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110204204100.GA18008@rhein.zuhause.netz>
References: <AANLkTinrmZzz8L=1CY9=F9Rdcc4A9+-tK07VD2fA0bRG@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinrmZzz8L=1CY9=F9Rdcc4A9+-tK07VD2fA0bRG@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Build problem when generating a squashfs image for a uclibc target
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
X-List-Received-Date: Fri, 04 Feb 2011 20:42:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 04, 2011 at 02:27:54PM -0500, Michael Poole wrote:
> org.openembedded.dev/recipes/udev/attr_2.4.44.bb contains this line:
>   LDFLAGS_append_libc-uclibc += " -lintl"
> 
> When generating a squashfs image, the build process apparently needs
> attr-native (-2.4.44-r4 on my machine).
> 
> My (Ubuntu x86_64) host machine doesn't have a libintl.so anywhere, or
> any obvious package to install it, and the line suggests that it is
> only meant to be added for uclibc builds.
> 
> What is the best way to fix or work around this?
> 
> Michael Poole
> 

Hi,

libintl is build within oe. Either provided from gettext or from libintl-proxy.

Bye Henning


