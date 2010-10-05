Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P32hc-0008DU-TW
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 10:16:49 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 5CEA01B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Oct 2010 08:20:13 +0000 (UTC)
Message-ID: <4CAADEDD.6070008@freyther.de>
Date: Tue, 05 Oct 2010 16:16:29 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<1286264643-6352-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1286264643-6352-2-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/6] libtool-2.4: Add recipes for libtool 2.4
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
X-List-Received-Date: Tue, 05 Oct 2010 08:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/05/2010 03:43 PM, Khem Raj wrote:

> + 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
> diff --git a/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch b/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
> new file mode 100644
> index 0000000..4728669
> --- /dev/null
> +++ b/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
> @@ -0,0 +1,19 @@
> +For cross environment, it not possible to run the generated executable.
> +nstead use the build version of libtool to generate the man pages. 


instead instead of nstead (saw this in poky too). from what I have seen, poky
does not apply this patch to 2.2.10...


