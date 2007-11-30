Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1Ixtga-00086A-Im
	for openembedded-devel@openembedded.org; Fri, 30 Nov 2007 01:24:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAU0LlhY002183
	for <openembedded-devel@openembedded.org>; Fri, 30 Nov 2007 00:21:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01994-05 for <openembedded-devel@openembedded.org>;
	Fri, 30 Nov 2007 00:21:44 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAU0Lg3W002176
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 30 Nov 2007 00:21:42 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <bdb0025f0711291203o27cca7edsb2c823984c461c71@mail.gmail.com>
References: <474CF3AF.5010407@trolltech.com>
	<1196248199.8098.13.camel@localhost.localdomain>
	<474DCBD4.6060605@trolltech.com>
	<1196300745.8098.41.camel@localhost.localdomain>
	<bdb0025f0711291203o27cca7edsb2c823984c461c71@mail.gmail.com>
Date: Fri, 30 Nov 2007 00:21:41 +0000
Message-Id: <1196382101.6917.34.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: CROSS_DIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2007 00:24:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 2007-11-29 at 17:03 -0300, Rodrigo Vivi wrote:
> I've noticed that meta-toolchain is so dependent on ipgk.
> Is there any other good (right) way to build a relocatable toolchain?

You can enable both debs and ipks at the same time (the first class used
is the default for the rootfs generation). That should get
meta-toolchain working even though you're using debs as the primary
package. In future I'd like to see if work with debs too, its just a
question of abstracting the right functions to the package classes...

Cheers,

Richard



