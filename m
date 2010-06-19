Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OPsr3-0000is-Bp
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jun 2010 09:52:42 +0200
Received: from [192.168.1.2] (e180149003.adsl.alicedsl.de [85.180.149.3])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id CD3105841A7;
	Sat, 19 Jun 2010 09:57:19 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
References: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
Organization: Vanille-Media
Date: Sat, 19 Jun 2010 09:50:07 +0200
Message-ID: <1276933807.1981.61.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: Re: [PATCH 0/3] ezx: move some _svn.bb recipes to _git.bb
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
X-List-Received-Date: Sat, 19 Jun 2010 07:52:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 18.06.2010, 21:30 +0200 schrieb Antonio Ospite:
> gen-blob and boot_usb (now moto-boot-usb) are now managed with git, this
> series replaces the svn recipes, all future development will be in the git
> repositories.
> 
> 
> Antonio Ospite (3):
>   ezx: replace ezx-gen-blob_svn.bb with ezx-gen-blob_git.bb
>   ezx: rename ezx-boot-usb recipe to moto-boot-usb, use git
>   ezx: rename references to ezx-boot-usb into moto-boot-usb
> 
>  conf/distro/include/preferred-om-2008-versions.inc |    2 +-
>  conf/machine/include/motorola-ezx-base.inc         |    2 +-
>  recipes/ezx/ezx-boot-usb-native_svn.bb             |   29 --------------
>  recipes/ezx/ezx-gen-blob_git.bb                    |   41 ++++++++++++++++++++
>  recipes/ezx/ezx-gen-blob_svn.bb                    |   41 --------------------
>  recipes/ezx/moto-boot-usb-native_git.bb            |   27 +++++++++++++
>  6 files changed, 70 insertions(+), 72 deletions(-)
>  delete mode 100644 recipes/ezx/ezx-boot-usb-native_svn.bb
>  create mode 100644 recipes/ezx/ezx-gen-blob_git.bb
>  delete mode 100644 recipes/ezx/ezx-gen-blob_svn.bb
>  create mode 100644 recipes/ezx/moto-boot-usb-native_git.bb

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

-- 
:M:



