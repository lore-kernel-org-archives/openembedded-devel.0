Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LiB1v-0005iu-Ey
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 18:18:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHIM4E014241
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:18:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14111-03 for <openembedded-devel@openembedded.org>;
	Fri, 13 Mar 2009 17:18:18 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2DHIEJs014235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 13 Mar 2009 17:18:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
	<ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
Date: Fri, 13 Mar 2009 17:18:16 +0000
Message-Id: <1236964696.8433.24.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 17:18:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2009-03-13 at 17:20 +0100, Frans Meulenbroeks wrote:
> I'm not sure how PARALLEL_MAKE is supposed to work, but I noticed that
> often there is a problem because with it a package on which there is a
> dependency is build in parallel. Since there is a dependency in a lot
> of cases the underlying package fails.
> 
> A typical scenario:
> a package X depends on perl-native, typically they start to build in
> parallel but perl-native does take much longer than X. X requires
> perl-native to complete and fails.
> 
> Parallelism within a task (e.g. running two compiles in parallel would work).
> Parallelism between tasks is tricky although some of them can always
> be parallelized (e.g. downloading, unpacking and patching).

Bitbake is aware of dependencies and will not build a task until all the
dependent tasks are complete. If something breaks due to something being
missing, its most likely a bug in the metadata and DEPENDS are probably
missing from a recipe.

Regards,

Richard



