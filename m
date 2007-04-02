Received: from [69.17.117.6] (helo=mail4.sea5.speakeasy.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <erik@hovland.org>) id 1HYODq-00040t-SM
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 17:13:31 +0200
Received: (qmail 29323 invoked from network); 2 Apr 2007 15:13:29 -0000
Received: from dsl092-045-201.lax1.dsl.speakeasy.net (HELO speakeasy.net)
	([66.92.45.201]) (envelope-sender <erik@hovland.org>)
	by mail4.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	2 Apr 2007 15:13:29 -0000
Received: by speakeasy.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Mon,  2 Apr 2007 08:13:29 -0700 (PDT)
Date: Mon, 2 Apr 2007 08:13:28 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070402151328.GN24962@hovland.org>
References: <4610C901.2010306@openhardware.net>
MIME-Version: 1.0
In-Reply-To: <4610C901.2010306@openhardware.net>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: patch: shasum vs. sha256sum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Apr 2007 15:13:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 02, 2007 at 05:12:33AM -0400, Tom Walsh wrote:
> Just noticed that the sha256sum has been added to the 
> classes/sanity.bbclass and bitbake balked at running.   This morning I 
> had installed perl-Digest::SHA to satisfy the need for 'shasum'.
> 
> I haven't found any package on Mandriva that provides 'sha256sum',  
> however, adding '-a 256' sets the sha256 algorithm for shasum?  With 
> these two changes, bitbake seems to build the project ok, or, am I 
> missing something here?

It should be part of the coreutils package. But I don't think it was in
the coreutils 5.x series which is the verions that mandriva 2007.0 and
older have in their release. If you are feeling brave, try Spring. If
not, just get the latest coreutils from your local GNU mirror and build
it yourself.

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request



