Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MQoU6-0004Cq-D3
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 22:20:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6EK657g006494 for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 21:06:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DLf0ZCnI5cPm for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 21:06:05 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6EK60nR006475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 21:06:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4A5CD81F.4090304@kernelconcepts.de>
References: <20090714170415.GA24919@rhein.zuhause.netz>
	<4A5CD81F.4090304@kernelconcepts.de>
Date: Tue, 14 Jul 2009 21:04:53 +0100
Message-Id: <1247601894.29960.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Broken git-native in dev
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
X-List-Received-Date: Tue, 14 Jul 2009 20:20:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-14 at 21:10 +0200, Florian Boor wrote:
> Hi,
> 
> Henning Heinold schrieb:
> > Maybee we should put a test in the native class which checks if the executables are striped.
> 
> +1

We should be stripping native binaries and the optimisation flags sound
wrong for native builds. That should be straightforward to fix.

Sanity checks should go into insane.bbclass though.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



