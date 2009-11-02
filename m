Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1N54fo-00019A-K9
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 22:42:51 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C2CC911001EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2009 22:41:38 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 538251100468
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2009 14:59:19 +0100 (CET)
Received: from rhein.familie-heinold.de (unknown [78.52.238.196])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2009 14:59:19 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id CF5C73C108; Mon,  2 Nov 2009 14:59:16 +0100 (CET)
Date: Mon, 2 Nov 2009 14:59:16 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091102135916.GB7423@rhein.zuhause.netz>
References: <1257169407.11338.71.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1257169407.11338.71.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 21:42:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2009 at 01:43:27PM +0000, Richard Purdie wrote:
> [...]
> do_compile - up to here all as usual
> do_install - Everything installs into a DESTDIR (including -native)
> do_package - Takes a copy of the DESTDIR, applies any .la/.pc mangling
>              then splits into packages as usual
> do_populate_staging - Takes a copy of the DESTDIR, mangles, installs 
>              into staging and creates staging packages from this
> 
> Firstly, does any disagree with this approach or can we all agree its a
> nice objective?

Yeah thats nice. I will help for instance with pkgconfig-class which now "sed's" the
.pc files in builddir before installing it.

Bye Henning


