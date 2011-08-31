Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qyjvu-00082x-Fu
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:30:18 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	14:25:23 +0200
Date: Wed, 31 Aug 2011 14:25:35 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110831122535.GC3273@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1314792055-26719-1-git-send-email-anders@chargestorm.se>
	<j3l8sg$kr3$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j3l8sg$kr3$2@dough.gmane.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][PATCH v2] connman: fix typo with -test package
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
X-List-Received-Date: Wed, 31 Aug 2011 12:30:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110831 14:20]:
> Op 31-08-11 14:00, Anders Darander schreef:
> > The typo prohibited the connman-tests package from being populated.
> > 
> > Signed-off-by: Anders Darander <anders@chargestorm.se> --- V2: Bumping PR, as the packaged contents of connman differs.
> > 
> > meta-oe/recipes-connectivity/connman/connman.inc |    3 ++- 1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc index eeccf50..45916d2 100644 --- a/meta-oe/recipes-connectivity/connman/connman.inc +++ b/meta-oe/recipes-connectivity/connman/connman.inc @@ -18,6 +18,7 @@ DEPENDS  = "dbus
> > glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp \ ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \ " +PR = "1"

> That should go into the .bb, not the .inc

Sure, I'll send an updated patch.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


