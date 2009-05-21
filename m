Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M7Acq-0000B2-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 17:56:09 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M7AVS-0002uc-Vo
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:48:33 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M7AVS-0006WQ-RI
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 16:48:30 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242920823.9080.330.camel@mill.internal.reciva.com>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242920823.9080.330.camel@mill.internal.reciva.com>
Date: Thu, 21 May 2009 16:48:30 +0100
Message-Id: <1242920910.9080.332.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package	dependencies.
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
X-List-Received-Date: Thu, 21 May 2009 15:56:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-21 at 16:47 +0100, Phil Blundell wrote:
> This kind of matching on the package name is a bit unwholesome in
> general.  It would be better to handle these excluded packages by
> maintaining them in the blacklist at the point where they're actually
> created, rather than trying to recreate that information again after the
> fact.

Or, actually, in this specific case, just maintain a positive list of
the plugin packages that you _do_ want the metapackage to depend on, and
make it depend on those packages alone rather than starting from
${PACKAGES} and filtering things out.

p.




