Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HKD0P-0004Fg-MK
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 13:25:02 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1MCOuLr006316 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 13:24:56 +0100
Message-ID: <45DD8B97.1010406@dominion.kabel.utwente.nl>
Date: Thu, 22 Feb 2007 13:24:55 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <erjv1k$sm8$1@sea.gmane.org> <109483350.20070222141407@gmail.com>
In-Reply-To: <109483350.20070222141407@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: How to specify RDEPENDS properly?
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
X-List-Received-Date: Thu, 22 Feb 2007 12:25:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Rob,
> 
> Thursday, February 22, 2007, 1:32:55 PM, you wrote:
> 
>> Hi all,
> 
>> I'm trying to build my custom image after updating OE (it worked several
>> months back :). I've already converted several things to the new style, but
>> I can't get my RDEPENDS right. There are about 4 problematic packages, but
>> let's pick readline.
> 
> []
> 
>> I don't really understand when to use the package name (readline), and when
>> to use the ipk name (libreadline[4]). Several months back I had to RDEPEND
>> on libreadline, so try that again:
> 
>   First thing to understand is that OE deals with 2 distinct
> namespaces: one is for recipes, another is for packages. Each recipes
> may build one or more packages. Names of recipes and packages are
> connected, but not the same. Well, it's fair to say that recipe's name
> is usually appears as substring in package name, though bitbake really
> can build package named arbitrarily from any recipe.
> 
>   So, what you specify in DEPENDS in recipe name. What you specify in
> RDEPENDS and other R* friends in package name.
> 
>> export PACKAGE_INSTALL = "... libreadline ..."
>> RDEPENDS = "${PACKAGE_INSTALL}"
> 
>> That doesn't work either:
> 
> BB>>> build display-image
>> SHELL: This command needs to parse bbfiles...
>> NOTE: Using cache in
>> '/bulk/home/rob/oe/dev/build-epia/tmp/cache/rob-epia'
>> NOTE: Handling BitBake files: | (4243/4243) [100 %]
>> NOTE: Parsing finished. 3315 cached, 1 parsed, 196 skipped, 731 masked.
> 
>> SHELL: Building display-image
>> ERROR: Nothing provides runtime dependency libreadline
>> NOTE: no buildable providers for display-image
> 
>> Neither does 'libreadline4'.
> 
>   There's no magic, let's see together: explode
> libreadline4_4.3-r3_i586.ipk you have (it's essentiall .deb; if in
> doubt, use ar followed by tar -z). Look for DEBIAN/control file:
> ----
> Provides: libreadline4
> ----
> that's in addition to implicit provision of package name (which
> matches with explicit one here).
> 
>   So, libreadline4 must work.

Right, but you don't want RDEPENDS = "libreadline4" since not everyone is using debian
style shlib renaming.

regards,

Koen

PS: Paul, sending 1 reply to the list is enough, 2 is overkill
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3YuXMkyGM64RGpERAiM0AJ9PBu1IGezIuOxiAr7vjZxUC0GwPwCfZvWL
A20OVsfkXKvXHv4u0qlC1Bc=
=47WT
-----END PGP SIGNATURE-----


