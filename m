Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PcfLH-0007bu-EZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 15:36:59 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PcfKn-0006Zn-50
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 14:36:29 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PcfKm-0005ry-RL
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 14:36:28 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1294774001-29322-1-git-send-email-sledz@dresearch.de>
References: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1294774001-29322-1-git-send-email-sledz@dresearch.de>
Date: Tue, 11 Jan 2011 14:36:28 +0000
Message-ID: <1294756588.4307.7668.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
Subject: Re: [PATCH v2] alsa-lib: fix packaging error
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
X-List-Received-Date: Tue, 11 Jan 2011 14:36:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-11 at 14:26 -0500, Steffen Sledz wrote:
> * symlink libasound.so -> libasound.so.2.0.0 in /usr/lib was missing in
>   dev package

Why doesn't the generic FILES_${PN}-dev from bitbake.conf catch this
file?  Not that I think your patch is necessarily wrong but it isn't
obvious to me why it is necessary.

p.




