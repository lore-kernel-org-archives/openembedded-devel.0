Return-Path: <philb@gnu.org>
X-Greylist: delayed 512 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 Oct 2015 22:43:15 UTC
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1C410770D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 22:43:15 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <philb@gnu.org>) id 1ZiVO7-0007kz-D7
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2015 00:34:43 +0200
Message-ID: <1443911675.32723.0.camel@gnu.org>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 03 Oct 2015 23:34:35 +0100
In-Reply-To: <1443902125-30247-2-git-send-email-raj.khem@gmail.com>
References: <1443902125-30247-1-git-send-email-raj.khem@gmail.com>
	<1443902125-30247-2-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH 2/2] libnetfilter: Avoid using VLAs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Oct 2015 22:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-10-03 at 12:55 -0700, Khem Raj wrote:
> VLAs in non POD data types like structures and unions
> are not a standard feature of C language and gcc has specific
> implementation which other compilers dont have specifically clang, and
> they refuse to implement it since its non standard.

The reference to "POD" here is a bit confusing.  By the generally
accepted meaning of the term, structs and unions would in fact be POD
just like any other C type.  But you seem to be using the term here to
mean something along the lines of "non-aggregate type", which isn't a
usage I've previously encountered.

This is particularly confusing in this context because there is a
different clang limitation which applies to VLAs where the
variable-length element is not POD, irrespective of whether it is inside
an aggregate or not, and someone reading your comment might be misled
into thinking that this was the issue here.

p.




