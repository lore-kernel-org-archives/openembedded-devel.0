Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P1m3n-0000h3-2T
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 22:18:30 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 3EEBC1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 20:21:37 +0000 (UTC)
Message-ID: <4CA64203.6070702@freyther.de>
Date: Sat, 02 Oct 2010 04:18:11 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285344532-25131-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1285344532-25131-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Fri, 01 Oct 2010 20:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/25/2010 12:08 AM, Chase Maupin wrote:

> 
> diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
> index 35b0289..70e24a0 100644
> --- a/recipes/autoconf/autoconf.inc
> +++ b/recipes/autoconf/autoconf.inc
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "A package of M4 macros to produce scripts to \
>  automatically configure sourcecode."
> -LICENSE = "GPL"
> +LICENSE = "GPLv3+exception"

hmm... but at your option the exception might be omitted.. and there are many
possible exception clauses... so it doesn't really say what it is.



>  HOMEPAGE = "http://www.gnu.org/software/autoconf/"
>  SECTION = "devel"
>  DEPENDS += "m4-native"
> diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/autoconf213_2.13.bb
> index d060bbd..4c855e0 100644
> --- a/recipes/autoconf/autoconf213_2.13.bb
> +++ b/recipes/autoconf/autoconf213_2.13.bb
> @@ -1,4 +1,5 @@
>  require autoconf.inc
> +LICENSE = "GPLv2"

hard to believe... sure it is not v2 and later? it should be the standard FSF
text? isn't it?


> +LICENSE = "GPLv2 AFLv2.1"

good..



> -LICENSE = "BSD"
> +LICENSE = "NewBSD"

could you point me to anyone using the term NewBSD? BSD license without
advertisement clause? common but also misleading terms are 2-clause, 3-clause
BSD...



> diff --git a/recipes/tinylogin/tinylogin_1.4.bb b/recipes/tinylogin/tinylogin_1.4.bb
> index 40171ff..730012b 100644
> --- a/recipes/tinylogin/tinylogin_1.4.bb
> +++ b/recipes/tinylogin/tinylogin_1.4.bb
> @@ -4,7 +4,7 @@ changing passwords, and otherwise maintaining users \
>  and groups on an embedded system."
>  HOMEPAGE = "http://tinylogin.busybox.net/"
>  SECTION = "base"
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2/NewBSD"

please don't use a '/'. IIRC this source will be put into a folder with that
name...


