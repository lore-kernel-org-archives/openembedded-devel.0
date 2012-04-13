Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SIgY4-0001Kd-Cy
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 15:28:24 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 2D2A6F811E5; Fri, 13 Apr 2012 07:19:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id EB04DF811E2;
	Fri, 13 Apr 2012 07:19:02 -0600 (MDT)
Message-ID: <4F8827C6.2040601@mlbassoc.com>
Date: Fri, 13 Apr 2012 07:19:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1334322354.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1334322354.git.Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH 0/1] Possible fix for missing -native support for gtk+-native
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
X-List-Received-Date: Fri, 13 Apr 2012 13:28:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-13 07:09, Martin Jansa wrote:
> Please note that this patch is old and not tested with current HEAD,
> because I'm using different solution in SHR branches - BBCLASSEXTENDs in oe-core
> recipes instead of small bbappends which makes recipe upgrades harder because of
> inter-layer dependencies, see:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019624.html
> from this patchset
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019619.html
>
> But because fix for PACKAGECONFIG added DEPENDS is now in you can find this patch usefull
> and maybe we'll be allowed to move at least some BBCLASSEXTENDs to oe-core later - after release.
>
> The following changes since commit 118734e096fda6c47172025969f3df4cfb0b33c3:
>
>    qte-toolchain: add qwte support (2012-04-13 10:50:40 +0200)
>
> are available in the git repository at:
>    git://git.openembedded.org/meta-openembedded-contrib jansa/xorg
>    http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/xorg
>
> Martin Jansa (1):
>    xorg: add more native BBCLASSEXTENDs for gtk+-native
>
>   .../xorg-lib/libxcomposite_0.4.3.bbappend          |    1 +
>   .../xorg-lib/libxcursor_1.1.12.bbappend            |    1 +
>   .../xorg-lib/libxdamage_1.1.3.bbappend             |    1 +
>   .../xorg-lib/libxfixes_5.0.bbappend                |    1 +
>   .../xorg-lib/libxrandr_1.3.2.bbappend              |    1 +
>   .../xorg-proto/compositeproto_0.4.2.bbappend       |    1 +
>   .../xorg-proto/damageproto_1.2.1.bbappend          |    1 +
>   .../xorg-proto/fixesproto_5.0.bbappend             |    1 +
>   .../xorg-proto/randrproto_1.3.2.bbappend           |    1 +
>   9 files changed, 9 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
>   create mode 100644 meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend

Why can't these changes just go in the main recipes?  Surely adding
   BBCLASSEXTEND = "native"
to a recipe has no effect unless you need to build the -native version?

Note: I too have been carrying such .bbappend files in my own layers for
a long time.  It would be good to just admit that sometimes the -native
form is needed and fix the primary recipes.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


