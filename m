Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P75tT-0003iX-UK
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 14:29:49 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 9D9311B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:30:06 +0000 (UTC)
Message-ID: <4CB99A9C.2060507@freyther.de>
Date: Sat, 16 Oct 2010 14:29:16 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1287230170-20745-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gnutols_2.10.1: remove the libtool-m4-macros
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
X-List-Received-Date: Sat, 16 Oct 2010 12:29:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/16/2010 01:56 PM, Frans Meulenbroeks wrote:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  recipes/gnutls/gnutls-2.10.1/libtool-update.patch |10965 ---------------------
>  recipes/gnutls/gnutls_2.10.1.bb                   |   15 +-
>  2 files changed, 13 insertions(+), 10967 deletions(-)
>  delete mode 100644 recipes/gnutls/gnutls-2.10.1/libtool-update.patch

No,

I think that appraoch is wrong. autoreconf --install --force should call
libtoolize which will copy over new files. So we should delete the libtool m4
files, run libtoolize and hope that it works. Did you try this?


