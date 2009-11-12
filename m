Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8g14-0001wD-8u
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 21:11:41 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8fzl-00069e-Kj
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 20:10:18 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257762970.29038.40.camel@dax.rpnet.com>
References: <1257762970.29038.40.camel@dax.rpnet.com>
Date: Thu, 12 Nov 2009 20:10:10 +0000
Message-ID: <1258056610.25369.459.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Thu, 12 Nov 2009 20:11:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-09 at 10:36 +0000, Richard Purdie wrote:
> The proposals were:
> 
> a) Adopt the removal of the layout_* variables from Poky.
> b) Change the do_populate_staging/do_stage functions to use the results 
>    from the do_install step as proposed in other emails
> c) Adopt the native.bbclass changes from Poky to allow use of 
>    BBCLASSEXTEND = "native"
> d) Start removing legacy do_stage functions and convert exclusively to 
>    the new model
> e) Start converting recipes to BBCLASSEXTEND = "native"
> f) Merge the new canadian SDK classes from Poky and start a gradual 
>    conversion to them with a view to obsoleting the existing sdk and 
>    canadian recipes.
> g) Rename "do_populate_staging" to "do_populate_sysroot" and 
>    "TMPDIR/staging" to "TMPDIR/sysroots" to reflect how much this 
>    directory has changed and to truly reflect its contents. The word 
>    "staging" confuses a lot of new users in my experience.

I think there was one more:

h) Enable packaged staging as default, with a view to making it
mandatory after a suitable transition period.

p.




