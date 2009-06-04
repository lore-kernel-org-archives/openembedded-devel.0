Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MCKO1-0005MV-MZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 23:22:09 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MCKFB-0001cK-6D
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 22:13:01 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244136199-20093-1-git-send-email-msmith@cbnco.com>
References: <h08u4t$oui$1@ger.gmane.org>
	<1244136199-20093-1-git-send-email-msmith@cbnco.com>
Date: Thu, 04 Jun 2009 22:12:58 +0100
Message-Id: <1244149978.5049.71.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] vim: fix alternative when prefix is /usr
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
X-List-Received-Date: Thu, 04 Jun 2009 21:22:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-04 at 13:23 -0400, Michael Smith wrote:
> Fix 2d3750e3dae84c89c9c749f95cf6b3b6cca3e8ce.
> +ALTERNATIVE_PATH = "${bindir}/vim"
>  ALTERNATIVE_LINK = "${base_bindir}/vi"
>  ALTERNATIVE_PRIORITY = "100"

It seems a bit weird to have a symlink in ${base_bindir} pointing to a
target in ${bindir}, since the link will be broken if /usr isn't mounted
yet.  I wonder if it'd be better to either move vim to /bin, or
move /bin/vi to /usr/bin.

p.




