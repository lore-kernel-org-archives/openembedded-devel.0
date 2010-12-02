Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1POBRx-0001YJ-T0
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 16:52:02 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1POBQc-0006ZU-Mb by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 16:50:41 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1POBQa-0002ko-D6
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 16:50:36 +0100
Date: Thu, 2 Dec 2010 16:50:36 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101202155036.GD20482@excalibur.local>
References: <4CF6FF0A.6090505@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4CF6FF0A.6090505@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] util-linux-ng.inc, e2fsprogs.inc: Use update-alternatives for uuidd.
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
X-List-Received-Date: Thu, 02 Dec 2010 15:52:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-12-02 at 12:36, Graham Gower wrote:
> Util-linux-ng put uuidd in ${sbindir}, e2fsprogs put it in ${base_sbindir}.
> This change puts both in ${base_sbindir}.
> 
> Fixes a conflict when DISTRO=micro.
> 
> | Collected errors:
> |  * check_data_file_clashes: Package util-linux-ng wants to install file /mnt/oe/tmp/rootfs/native-sdk-image/sbin/uuidd
> |       But that file is already provided by package  * e2fsprogs
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

I took all of your patches but the two automake and the one bind patch. Khem
reviewed and acked them all.

If I missed one please let me know. Patchwork is down right now and keeping the
overview is a bit of a hassle. :)

regards
Stefan Schmidt


