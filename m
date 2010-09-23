Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oypsg-0002lc-Hm
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 19:46:53 +0200
Received: (qmail 28294 invoked by uid 503); 23 Sep 2010 17:59:10 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 23 Sep 2010 17:59:10 -0000
Received: (qmail 31468 invoked by uid 503); 23 Sep 2010 17:28:02 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 23 Sep 2010 17:28:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 19:45:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Sep 2010 19:45:25 +0200
Message-ID: <4C9B9234.60008@eukrea.com>
Date: Thu, 23 Sep 2010 19:45:24 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285263757-14049-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1285263757-14049-1-git-send-email-eric@eukrea.com>
X-Ovh-Tracer-Id: 10535326904553483593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox's mdev: add script to populate /dev/bus/usb
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
X-List-Received-Date: Thu, 23 Sep 2010 17:46:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/09/2010 19:42, Eric Bénard a écrit :
> * needed for libusb on kernel without CONFIG_USB_DEVICEFS
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
.../...
> --- /dev/null
> +++ b/recipes/busybox/files/usb.sh
.../...
> +        echo $dev $DEVNUM $bus $BUSNUM>>  /tmp/rem.txt

this line should not be here ;-)
If the principle of this patch is ok, I'll remove that and resubmit.

Eric


