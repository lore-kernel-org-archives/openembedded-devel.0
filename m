Received: from p3plsmtpa01-07.prod.phx3.secureserver.net ([72.167.82.87])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NzzP6-0006lQ-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 23:36:50 +0200
Received: (qmail 23867 invoked from network); 8 Apr 2010 21:33:24 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-07.prod.phx3.secureserver.net (72.167.82.87) with ESMTP;
	08 Apr 2010 21:33:21 -0000
Message-ID: <4BBE4B91.40602@mwester.net>
Date: Thu, 08 Apr 2010 16:33:05 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100408162117.e7638f69.ospite@studenti.unina.it>
	<1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 72.167.82.87
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] glib-2.0: remove old glib-2.0-native recipes
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
X-List-Received-Date: Thu, 08 Apr 2010 21:36:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Antonio Ospite wrote:
> Having these around can cause some conflict in recipes depending on
> recent glib-2.0-native, see [1].
> 
> What can happen is that, when no preferred versions are set (like in
> DISTRO=minimal), bitbake picks up an older -native recipe even if a more
> recent one using the BBCLASSEXTEND = "native" mechanism exists.
> 
> [1] http://tinderbox.openembedded.org/packages/540390/
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
> Please check if the commit message is clear enough, I think I've figured
> out what's happening behind the scenes, but I have not that deep
> knowledge of bitbake.
> 
> Thanks,
>    Antonio Ospite
>    http://ao2.it
> 
> 
>  .../glib-gettextize-dir.patch                      |   11 --
>  recipes/glib-2.0/glib-2.0-native_2.12.4.bb         |   49 ----------
>  recipes/glib-2.0/glib-2.0-native_2.16.1.bb         |   40 --------
>  recipes/glib-2.0/glib-2.0-native_2.18.0.bb         |   40 --------
>  recipes/glib-2.0/glib-2.0-native_2.2.3.bb          |  100 --------------------
>  recipes/glib-2.0/glib-2.0-native_2.22.1.bb         |   39 --------
>  recipes/glib-2.0/glib-2.0-native_2.4.6.bb          |   49 ----------
>  recipes/glib-2.0/glib-2.0-native_2.6.5.bb          |   51 ----------
>  recipes/glib-2.0/glib-2.0-native_2.6.6.bb          |   51 ----------
>  9 files changed, 0 insertions(+), 430 deletions(-)
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native-2.12.4/glib-gettextize-dir.patch
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.12.4.bb
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.16.1.bb
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.18.0.bb
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.2.3.bb
>  delete mode 100644 recipes/glib-2.0/glib-2.0-native_2.22.1.bb

NACK.  This glib version is still in use; don't delete it:
/u/slug/slugos/tmp/work/x86_64-linux/glib-2.0-native-2.22.1-r6.2

(Surely there must a better way to fix this than removal of active recipes?)

-Mike (mwester)


