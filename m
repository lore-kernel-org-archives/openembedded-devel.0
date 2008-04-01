Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JgZhk-00076I-9L for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 08:10:44 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id D5281E4999
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2008 02:10:42 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute1.internal (MEProxy); Tue, 01 Apr 2008 02:10:42 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id 9E17F38C5E; Tue,  1 Apr 2008 02:10:42 -0400 (EDT)
Message-Id: <1207030242.29161.1245367579@webmail.messagingengine.com>
X-Sasl-Enc: b6nJcA+piEB/gUom43WJJ/kz3ha5ohk3vDJnxWWK6p4T 1207030242
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
Date: Tue, 01 Apr 2008 16:10:42 +1000
Subject: gcc disable-libunwind-exceptions, VFP, iWMMXt, crunch - nokia800, mx31ads, etc
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
X-List-Received-Date: Tue, 01 Apr 2008 06:10:44 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi All,

I was recently looking in gcc-cross-4.2.2.bb and 4.3.0.bb and noticed
that in our EXTRA_OECONF we have:

--disable-libunwind-exceptions

Won't this cause a problem for a VFP system (when an exception occurs),
i.e. mx31ads, nokia800?  
e.g. libunwind.S in gcc/config/arm has some specific functions to
save/restore VFP and iWMMXt registers...

Also, I couldn't build glibc-intermediate (with system-wide iwmmxt) with
the tag enabled, when building with binutils-2.18, gcc-4.3.0 and
glibc-2.6.1 ...

How does the TARGET_FPU_arm = "hard" overcome this on nokia800, mx31ads,
etc?  Are we only building with-float in certain packages, and using
softfp float-abi otherwise?

Does this mean for a MaverickCrunch system (with system-wide FPU
enabled), we should be setting TARGET_FPU_arm = "hard" too?

What about for a PXA27x system with a iWMMXt coprocessor (and
system-wide iwmmxt) ???  It should be using soft-float, but it should
have libunwind-exceptions enabled (I think) because of the code in
libunwind.S...



