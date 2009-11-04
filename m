Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N5nxb-00007A-JW
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 23:04:14 +0100
Received: from 88-109-143-180.dynamic.dsl.as9105.com ([88.109.143.180]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N5nwI-0006wb-00
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 22:02:53 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E3533945A88B80@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>
	, <hcsola$kqd$1@ger.gmane.org>
	<B44D4D5BF344094DABB900C4E0F6E3533945A88B80@srv02.nortechonline.net>
Date: Wed, 04 Nov 2009 22:02:23 +0000
Message-ID: <1257372143.4897.242.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Wed, 04 Nov 2009 22:04:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> -            file://mono-cross-compilation-for-amd64.patch;patch=1 \
> +#            file://mono-cross-compilation-for-amd64.patch;patch=1 \

That patch (mono-cross-compilation-for-amd64) does look pretty bogus.
The file header says:

        "This is a workaround for bug 515050 
        https://bugzilla.novell.com/show_bug.cgi?id=515050#c2 
         
        Real fix is something else which did not make into 2.4.2 
        http://lists.ximian.com/pipermail/mono-patches/2009-June/151386.html 
        http://lists.ximian.com/pipermail/mono-patches/2009-June/151387.html 
         
        but we are ok with workaround its safe."
        
... but it's hard to see how forcing MONO_ARCH_SUPPORT_SIMD_INTRINSICS
unconditionally really counts as "safe": this seems almost certain to
break on any target that doesn't actually have that support.  If this
patch were moved to SRC_URI_append_amd64 then it'd probably be ok, but
the patches from those other two URLs look like a better solution.

p.




