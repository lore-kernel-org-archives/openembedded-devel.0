Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1P62IT-0005Pr-0S
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:27:16 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 5597B16608A2; Wed, 13 Oct 2010 08:26:44 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id F387F1660899;
	Wed, 13 Oct 2010 08:26:43 -0600 (MDT)
Message-ID: <4CB5C1A3.6000506@mlbassoc.com>
Date: Wed, 13 Oct 2010 08:26:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimmoNWm5fDxSBvR7MSUDBH8w0FyiRMFoR5WXuuf@mail.gmail.com>
In-Reply-To: <AANLkTimmoNWm5fDxSBvR7MSUDBH8w0FyiRMFoR5WXuuf@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: do we need patch-native ?
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
X-List-Received-Date: Wed, 13 Oct 2010 14:27:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2010 08:12 AM, Frans Meulenbroeks wrote:
> Hi,
>
> I had to do a build on OpenSuse 11.3 today, and it failed building
> quilt-native (0.46-r2)
>
> Root cause is that quilt configure tries to find whether patch is
> installed and has a version>  2.4
> It does so by calling patch --version and extract the version string from it.
>
> The patch from 11.3 identifies itself as:
> GNU patch 2.6.1.81-5b68
> However the quilt configure script expected to find output like:
> patch 2.6 (which is what I get on my ubuntu 10.4 version).
>
> I see several possible options to fix this:
> - make a package patch-native, so we can use our own patch
> - patch quilt so its configure can deal with both patch version strings
>
> Problem with the latter is that I have no idea how many other recipes
> will have a similar test (and definitely they are not all triggered by
> the images I regularly build.
> Therefore I think I have a preference to introduce patch-native, but I
> would like to hear how you guys&  gals think about this, and whether
> you see other options.

Sounds like quilt's configure script is broken.  Such behaviour
should not be catered to - it should be fixed.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


