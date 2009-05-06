Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M1jkX-0004b9-35
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 18:13:37 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M1jeh-0006Au-Lf
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 17:07:35 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M1jeh-0002pc-HM
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 17:07:35 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A0196B0.4010202@balister.org>
References: <4A0196B0.4010202@balister.org>
Date: Wed, 06 May 2009 17:07:35 +0100
Message-Id: <1241626055.16805.134.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: FILESPATHPKG question
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
X-List-Received-Date: Wed, 06 May 2009 16:13:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-05-06 at 09:54 -0400, Philip Balister wrote:
> +FILESPATHPKG = "u-boot-git:u-boot:files:."

> Ignore the added patch :) Should I go ahead and push the FILESPATHPKG 
> change? Otherwise all the patches will end up in the files directory ....

Wouldn't you be better off just prepending to FILESPATHPKG rather than
replacing it?  As in, FILESPATHPKG =. "u-boot-git:" or something.

p.




