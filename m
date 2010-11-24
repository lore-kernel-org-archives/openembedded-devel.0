Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLKrb-0007Mi-0r
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 20:18:44 +0100
Received: (qmail 2656 invoked by uid 503); 24 Nov 2010 19:41:15 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 24 Nov 2010 19:41:15 -0000
Received: (qmail 27264 invoked by uid 503); 24 Nov 2010 19:49:45 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 24 Nov 2010 19:49:45 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Nov 2010 21:17:30 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 24 Nov 2010 21:17:29 +0200
Message-ID: <4CED64C8.7060909@eukrea.com>
Date: Wed, 24 Nov 2010 20:17:28 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>	<1290620636-21238-2-git-send-email-eric@eukrea.com>
	<AANLkTi=vHic9JYNfFH0-giLnB0x929Czhj3C_BriAN9L@mail.gmail.com>
In-Reply-To: <AANLkTi=vHic9JYNfFH0-giLnB0x929Czhj3C_BriAN9L@mail.gmail.com>
X-Ovh-Tracer-Id: 7262335874675027273
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 7663719191074745673
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox: add 1.17.4 (latest stable version)
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
X-List-Received-Date: Wed, 24 Nov 2010 19:18:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2010 19:44, Khem Raj wrote:
> On Wed, Nov 24, 2010 at 9:43 AM, Eric Bénard<eric@eukrea.com>  wrote:
>> this is the latest stable version (1.17.3 + its fixes).
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
> Please install it on release branch as well. Do we still need 1.17.3 ?
>
if SHR switch to 1.17.4 we shouldn't need it anymore.
(and if Ångström 2010 also switch to 1.17.4 we won't need 1.17.1).

Martin, Koen, are you ok with the patch below ?

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc 
b/conf/distro/include/angstrom-2010-preferred-v
index 12ee900..bda21d9 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf = "2.65"
  PREFERRED_VERSION_autoconf-native = "2.65"
  PREFERRED_VERSION_automake = "1.11.1"
  PREFERRED_VERSION_automake-native = "1.11.1"
-PREFERRED_VERSION_busybox      = "1.17.1"
+PREFERRED_VERSION_busybox      = "1.17.4"
  PREFERRED_VERSION_cairo                = "1.10.0"
  PREFERRED_VERSION_dbus                 = "1.2.24"
  PREFERRED_VERSION_dropbear      = "0.51"
diff --git a/conf/distro/include/preferred-shr-versions.inc 
b/conf/distro/include/preferred-shr-versions.inc
index 22e1c82..da11164 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -13,7 +13,7 @@ PREFERRED_VERSION_emacs-x11 = "23.1"
  PREFERRED_VERSION_ncurses = "5.7"
  PREFERRED_VERSION_ncurses-native = "5.7"
  PREFERRED_VERSION_python-pycairo = "1.8.0"
-PREFERRED_VERSION_busybox = "1.17.3"
+PREFERRED_VERSION_busybox = "1.17.4"

  # we need new headers for libc, now OLDEST_KERNEL_linux-gnueabi = "2.6.24"
  # and 2.6.31 for fsodeviced

Eric


