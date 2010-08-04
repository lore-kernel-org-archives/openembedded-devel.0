Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OgcSj-0002Wc-O0
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 13:48:49 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OgcSd-0005c4-8U
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 12:48:39 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OgcSd-0001K5-1S
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 12:48:39 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280920678.26249.33.camel@saphir>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org>  <20100804052042.GB7085@gmail.com>
	<1280920678.26249.33.camel@saphir>
Date: Wed, 04 Aug 2010 12:48:38 +0100
Message-ID: <1280922518.2692.377.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 11:48:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-08-04 at 13:17 +0200, Michael 'Mickey' Lauer wrote:
> FWIW, minimal is using MACHINE_CLASS since quite a while to
> reduce the need for adding the same files over and over again,
> this is being used e.g. for HTC msm7 series and OpenEZX series
> (see conf/machine/include).
> 
> Perhaps it's time to standardize something like that.

Yeah.  I certainly don't think we want a proliferation of such
mechanisms.  If minimal is already using MACHINE_CLASS then there would
be some sense in trying to make use of the same thing.

My preference would be to make the MACHINEs in question be, for example,
"motorola-ezx-a1200", "motorola-ezx-a780" and so on.  This would then
allow you to set COMPATIBLE_MACHINE = "motorola-ezx-.*" which I think
would solve the SOC_FAMILY problem, although it wouldn't replace
MACHINE_CLASS in OVERRIDES.

Failing that though, testing COMPATIBLE_MACHINE against MACHINE_CLASS
probably is more desirable than adding a completely new variable (i.e.
SOC_FAMILY) for that purpose.

p.




