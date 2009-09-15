Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnTEm-0007ob-Cg
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 10:18:11 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MnTEI-0001Gd-85
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 09:17:38 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252996876-782-3-git-send-email-raj.khem@gmail.com>
References: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
	<1252996876-782-2-git-send-email-raj.khem@gmail.com>
	<1252996876-782-3-git-send-email-raj.khem@gmail.com>
Date: Tue, 15 Sep 2009 09:17:36 +0100
Message-Id: <1253002656.4490.1108.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/3] minimal.conf: Set PREFERRED_VERSION of glib to 2.21.4
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
X-List-Received-Date: Tue, 15 Sep 2009 08:18:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-14 at 23:41 -0700, Khem Raj wrote:
> +PREFERRED_VERSION_glib-2.0-native ?= "2.21.4"
> +PREFERRED_VERSION_glib-2.0 ?= "2.21.4"

I wonder why that version is DEFAULT_PREFERENCE -1 in the first place.
Maybe it'd be better just to change that rather than setting it for
minimal specifically.

p.




