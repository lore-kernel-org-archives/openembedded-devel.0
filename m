Received: from woodbine.london.02.net ([87.194.255.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1OSyEv-0005qa-Kd
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 22:14:07 +0200
Received: from shodan.localnet (93.96.131.185) by woodbine.london.02.net
	(8.5.124.03)
	id 4C1F9803002350FA for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 21:06:40 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jun 2010 21:06:36 +0100
User-Agent: KMail/1.13.3 (Linux/2.6.32-22-generic; KDE/4.4.4; i686; ; )
References: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201006272106.36928.bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 87.194.255.145
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Sun, 27 Jun 2010 20:14:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Wed, 02 Jun 2010, Martin Jansa wrote:
> * there is probably very few cases when it's needed without _${PN},
>   if you find one in attached patch, please enlighten me

I've just discovered this change is what has broken the build of opie-taskbar-
images:

------------------------------ snip --------------------------------
paul@linc:~/oe/build-hx4700-dev$ bitbake opie-taskbar-images
NOTE: Handling BitBake files: / (8377/8377) [100 %]
NOTE: Parsing finished. 7570 cached, 477 parsed, 330 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/paul/oe/org.openembedded.dev/recipes/opie-taskbar/opie-
taskbar-images_1.2.4.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the 
runtime entity 'opie-taskbar-images' but it wasn't found in any PACKAGE or 
RPROVIDES variables
NOTE: Runtime target 'opie-taskbar-images' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['opie-taskbar-images']
ERROR: Required build target 'opie-taskbar-images' has no buildable providers.
Missing or unbuildable dependency chain was: ['opie-taskbar-images', 'opie-
taskbar-images']
paul@linc:~/oe/build-hx4700-dev$
------------------------------ snip --------------------------------

Can I revert the changes to any opie packages that have been broken? Or is 
there an alternative solution?

Thanks
Paul


