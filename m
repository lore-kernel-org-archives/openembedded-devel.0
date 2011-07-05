Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe56a-0004fO-60
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 14:51:56 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	14:48:06 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jul 2011 14:48:10 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <cover.1309866872.git.anders@chargestorm.se>
	<1309869522.2410.0.camel@phil-desktop>
In-Reply-To: <1309869522.2410.0.camel@phil-desktop>
MIME-Version: 1.0
Message-ID: <201107051448.10772.anders@chargestorm.se>
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Tue, 05 Jul 2011 12:51:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


* Phil Blundell Phil Blundell <philb@gnu.org> [07/05/11 02:38 PM]:
> On Tue, 2011-07-05 at 14:05 +0200, Anders Darander wrote:
> > When compiling an external module, the compilation errors out, when
> > scripts/basic/fixdep and later on scripts/mod/modpost is being requested.
> > The removal of 'make -C $kerneldir _mrproper_scripts' fixes these
> > problems.
> 
> It is a bit sad that these sorts of changes need to be done twice.  Is
> there a compelling reason why meta-oe needs to maintain its own version
> of kernel.bbclass rather than sharing it with oe-core?

Yes, it is certainly a sad state.

The primary difference seems to be some changes in the uImage-related code, and 
that meta-oe has some initramfs-support in its kernel.bbclass.

Can someone with deeper knowledge comment on this? I guess that it shouldn't 
be any real problems in getting the initramfs support code merged into oe-
core. 

What about the differences in the uImage code? (I haven't really looked into 
the differences).

Cheers,
Anders


