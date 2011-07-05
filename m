Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qe4xZ-0004TA-Vl
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 14:42:39 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Qe4tm-00022R-V1; Tue, 05 Jul 2011 14:38:43 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 05 Jul 2011 13:38:41 +0100
In-Reply-To: <cover.1309866872.git.anders@chargestorm.se>
References: <cover.1309866872.git.anders@chargestorm.se>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1309869522.2410.0.camel@phil-desktop>
Mime-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe][PATCH 0/1] Fix external module compilations
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
X-List-Received-Date: Tue, 05 Jul 2011 12:42:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:05 +0200, Anders Darander wrote:
> When compiling an external module, the compilation errors out, when
> scripts/basic/fixdep and later on scripts/mod/modpost is being requested. The
> removal of 'make -C $kerneldir _mrproper_scripts' fixes these problems.

It is a bit sad that these sorts of changes need to be done twice.  Is
there a compelling reason why meta-oe needs to maintain its own version
of kernel.bbclass rather than sharing it with oe-core?

p.




