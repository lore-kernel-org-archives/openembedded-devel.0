Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NrnV8-0002dh-QQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 08:17:17 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3F8DE1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 07:17:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 08:13:19 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
In-Reply-To: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
MIME-Version: 1.0
Message-Id: <201003170813.19559.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grip: Upgrade to 3.3.1
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
X-List-Received-Date: Wed, 17 Mar 2010 07:17:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 17 March 2010 07:51:01 Scott Garman wrote:
> * Addresses CVE-2005-0706
> 
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>

I was upgrading grip to the latest stable version yesterday, I have no issue 
if you want to upgrade to the latest devel version, even debian is shipping 
that... I have some comments in line.


>  create mode 100644 recipes/grip/grip-3.3.1/no-host-includes.patch
>  create mode 100644 recipes/grip/grip_3.3.1.bb

Please git mv from grip_3.2.0 to grip_3.3.1


> +[http://downloads.sourceforge.net/grip/3.3.1/grip-3.3.1.tar.gz]
> +md5=4b4233999b9f2bc85c711092553ea9aa
> +sha256=d46394a1062ed066f9c633b010fd1059e63d9ed791bbb7a85bc6567cf0fd66fd

that is deprecated, please see grip_3.2.0.bb on how to put the checksums into 
the recipe.


I'm happy to review and push your updated recipe.

thanks for helping out.
	z.


