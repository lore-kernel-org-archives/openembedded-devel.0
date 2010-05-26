Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OHDsZ-0000WB-FB
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 12:30:28 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OHDob-0002lA-Lc
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 11:26:21 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OHDob-0006mK-Cg
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 11:26:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTilPhweXZYpmrBRRlW5uHJazro_WcZ5k1C10KqXN@mail.gmail.com>
References: <1274859584-8442-1-git-send-email-raj.khem@gmail.com>
	<1274863471.6452.54.camel@lenovo.internal.reciva.com>
	<AANLkTilPhweXZYpmrBRRlW5uHJazro_WcZ5k1C10KqXN@mail.gmail.com>
Date: Wed, 26 May 2010 11:26:21 +0100
Message-ID: <1274869581.6382.27.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 10:30:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-05-26 at 02:12 -0700, Khem Raj wrote:
> Yes I thought about it but did not know where to start.
> I guess that would be bitbake which has to quickly remove the trailing
> space just after parsing
> in TMPDIR before it gets expanded into other parts of metadata. would
> it be OK for bitbake to treat TMPDIR special ? or may be bitbake
> should just get rid of more than one slashes in dir paths as a whole.
> when concatenating two paths it should merge the slashes may be.

I'm not sure that bitbake itself ought to be taking any special action.
Which piece of code is it that chokes on the extra slashes, exactly?
Can that not be fixed?  POSIX is fairly clear that multiple slashes are
allowed in pathnames so anything that doesn't work with them seems like
it must be broken.

p.




