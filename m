Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OtlFo-0004LI-4a
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 19:49:44 +0200
Received: (qmail 13582 invoked by uid 503); 9 Sep 2010 18:11:47 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 9 Sep 2010 18:11:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 19:49:02 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 9 Sep 2010 19:49:01 +0200
Message-ID: <4C891E0C.1050400@eukrea.com>
Date: Thu, 09 Sep 2010 19:49:00 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100825 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<AANLkTike7kmRPU9iw8wyC3v5=rLrr+DqiyskkoGC5H30@mail.gmail.com>
In-Reply-To: <AANLkTike7kmRPU9iw8wyC3v5=rLrr+DqiyskkoGC5H30@mail.gmail.com>
X-Ovh-Tracer-Id: 2165386997310664009
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] generate-manifest-2.6.py: tune python-modules' RDEPENDS
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
X-List-Received-Date: Thu, 09 Sep 2010 17:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/09/2010 19:34, J. L. a écrit :
> Dumb comment time: Wouldnt it be better to make maybe a few different
> python module packages installs instead of thining out the
> python-module? I know I personally use all the modules for python
> available here plus some other modules as well. I know not everyone is
> concerned with making their images as small as possible. Probably just
> not getting the reasoning or point but just thought I would make the
> statement there are those that use python-dev as is
>
this change doesn't prevent you from using python-dev, you will just 
have to install it manually. This change only allow to install 
python-modules without installing all the dev files they actually pull.

Eric


