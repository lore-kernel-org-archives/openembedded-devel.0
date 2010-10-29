Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PByj2-0003CF-3I
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 01:51:12 +0200
Received: (qmail 13964 invoked by uid 503); 30 Oct 2010 00:19:26 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 30 Oct 2010 00:19:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Oct 2010 01:50:25 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Oct 2010 01:50:24 +0200
Message-ID: <4CCB5DC0.3030607@eukrea.com>
Date: Sat, 30 Oct 2010 01:50:24 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1288395329-10474-1-git-send-email-eric@eukrea.com>
X-Ovh-Tracer-Id: 6755399441466764617
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Fri, 29 Oct 2010 23:51:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 30/10/2010 01:35, Eric Bénard a écrit :
> keep the following versions :
> 1.2.1 (used by oplinux)
> 1.7.2 (used by nylon)
> 1.13.2 (used by angstrom, kaeilos and slugos)
> 1.17.1 (used by angstrom)
> 1.17.3 (latest one)
>
forget this one, 1.16.2 should not be removed as it's used by shr.

> --- a/recipes/busybox/busybox_1.16.2.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require busybox.inc
> -require busybox_1.1x.inc
> -PR = "${INC_PR}.3"
> -
> -DEFAULT_PREFERENCE = "-1"
> -DEFAULT_PREFERENCE_shr = "1"
> -
> -SRC_URI[md5sum] = "2ba980f720a5bdce4ec05423519acc35"
> -SRC_URI[sha256sum] = "3bf1b1a41294d25335abdd10c65cffdb01c36337ca011f1b38c6ad89590115ba"

Eric


