Received: from smtplq-out5.aruba.it ([62.149.158.25] helo=smtplq01.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1P94rM-0002eJ-L0 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 01:47:49 +0200
Received: (qmail 18939 invoked by uid 89); 21 Oct 2010 23:20:30 -0000
Received: from unknown (HELO smtp5.aruba.it) (62.149.128.201)
	by smtplq01.aruba.it with SMTP; 21 Oct 2010 23:20:30 -0000
Received: (qmail 16097 invoked by uid 89); 21 Oct 2010 23:20:29 -0000
Received: from unknown (HELO ?192.168.8.32?)
	(pierluigi.passaro@phoenixsoftware.it@78.12.139.28)
	by smtp5.ad.aruba.it with SMTP; 21 Oct 2010 23:20:29 -0000
Message-ID: <4CC0CABE.70005@phoenixsoftware.it>
Date: Fri, 22 Oct 2010 01:20:30 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 62.149.158.25
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: LINGUAS_INSTALL and external-toolchain-csl
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
X-List-Received-Date: Thu, 21 Oct 2010 23:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

commit 4271024e26551da70e710cef6d2dcbfa8740b007 dated 2010-10-10 01:28:01 (GMT) introduced locale-base-* packages in the build list.
However CodeSourcery toolchain does not provide them, and using CSL cause bitbake choosing eglibc.
This is causing messages like:

ERROR: Multiple .bb files are due to be built which each provide virtual/arm-none-linux-gnueabi-libc-for-gcc (/home/gigi/code/import/openembedded/recipes/meta/external-toolchain-csl.bb /home/gigi/code/import/openembedded/recipes/eglibc/eglibc_2.9.bb).

The ERRORs disappears commenting out line the following line in classes/image.bbclass:
LINGUAS_INSTALL_linux += "${@' '.join(map(lambda s: 'locale-base-%s' % s, '${IMAGE_LINGUAS}'.split()))}"

I do not think this is the right solution :(
Any suggestion will be appreciated.

Regards
Gigi

--
Ing. Pierluigi Passaro
Viale Don Luigi Sturzo 34
30174 Venezia Mestre
Cel: +39 348 355 4119
Tel: +39 041 862 3373
Fax: +39 041 862 3173
Web: www.phoenixsoftware.it
P.IVA 03884060272



