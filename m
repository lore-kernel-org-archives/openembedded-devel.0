Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MpHye-0006mT-D1
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 10:41:03 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MpHy5-000091-N6
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 09:40:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253428380-27587-1-git-send-email-denis@denix.org>
References: <1253428380-27587-1-git-send-email-denis@denix.org>
Date: Sun, 20 Sep 2009 09:40:22 +0100
Message-Id: <1253436022.4490.1517.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] package.bbclass: export subpackage individual version, if different from main
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
X-List-Received-Date: Sun, 20 Sep 2009 08:41:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-09-20 at 02:33 -0400, Denys Dmytriyenko wrote:
> Fixes the wrong versioned runtime dependency for shlib subpackages with
> own versions. Consider this:
> 
> PACKAGES = "libfoo libbar"
> PV_libfoo = "1"
> PV_libbar = "2"
> PV = "3"

Is this even legitimate usage?  I had always thought that PV applied to
the recipe, not to the output subpackages.

What's the typical use-case for this kind of thing?

p.




