Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1L9HOI-00040N-HW
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 12:01:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB7Avmmp011794
	for <openembedded-devel@openembedded.org>; Sun, 7 Dec 2008 10:57:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11563-06 for <openembedded-devel@openembedded.org>;
	Sun,  7 Dec 2008 10:57:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id mB7AvbFZ011784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 7 Dec 2008 10:57:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20081207021144.GL16628@smtp.west.cox.net>
References: <20081207021144.GL16628@smtp.west.cox.net>
Date: Sun, 07 Dec 2008 10:57:35 +0000
Message-Id: <1228647455.5427.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken kernel recipes
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
X-List-Received-Date: Sun, 07 Dec 2008 11:01:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-12-06 at 19:11 -0700, Tom Rini wrote:
> As part of testing meta-toolchain-sbox builds on different arches, I
> found that sbrsh, on ARM, brings in both the 2.6 kernel for the MACHINE
> in question, as well as a 2.4 kernel.  In the case of the 2.4 kernel, it
> first picks up poodle-kernel-2.4-embedix.bb on nokia800, which doesn't
> work as it wants gcc-2.95, which doesn't exist.  Can I move the
> following support to packages/obsolete/linux/ ?
> corgi-kernel-2.4-embedix.bb
> husky-kernel-2.4-embedix.bb
> openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb
> poodle255-kernel-2.4-embedix.bb
> poodle-kernel-2.4-embedix.bb
> shepherd-kernel-2.4-embedix.bb
> openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb
> openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb

These are needed for sharprom-compat. The more interesting question is
why they were being brought in - the 2.6 version should provide
everything they do and have preference?

Cheers,

Richard



