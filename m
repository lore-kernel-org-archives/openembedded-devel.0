Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J5XuO-0001pG-Ia
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 03:46:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J5Xp6-0008Aq-Oz
	for openembedded-devel@openembedded.org; Fri, 21 Dec 2007 02:41:16 +0000
Received: from grante.dsl.visi.com ([208.42.141.248])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Dec 2007 02:41:16 +0000
Received: from grante by grante.dsl.visi.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Dec 2007 02:41:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Grant Edwards <grante@visi.com>
Date: Fri, 21 Dec 2007 02:40:48 +0000 (UTC)
Message-ID: <fkf93g$pe8$1@ger.gmane.org>
References: <fk9u44$rgn$1@ger.gmane.org> <fkerm2$nnf$1@ger.gmane.org>
	<1344229699.20071221024715@gmail.com>
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: grante.dsl.visi.com
User-Agent: slrn/0.9.8.1 (Linux)
Sender: news <news@ger.gmane.org>
Subject: Re: How do you find a rev of OE that will build?
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
X-List-Received-Date: Fri, 21 Dec 2007 02:46:44 -0000

On 2007-12-21, Paul Sokolovsky <pmiscml@gmail.com> wrote:

>   No, anything on critical path to build a common embedded system
> image can't be broken and unnoticed for long. I rebuilt python-native
> for you:
>
> NOTE: package python-native-2.5.1-ml1: task do_patch: started
> NOTE: Applying patch 'bindir-libdir.patch'
> NOTE: Applying patch 'cross-distutils.patch'
> NOTE: Applying patch 'dont-modify-shebang-line.patch'
> NOTE: Applying patch 'default-is-optimized.patch'
> NOTE: package python-native-2.5.1-ml1: task do_patch: completed
>
> Anyway, as you see, it's not some dark magic failing, but
> merely a patch application. So, why don't you look closer and
> see what corrupts the data - your tar, a quilt built on your
> system, or your kernel? ;-)

OK.  It just seems odd that 100+ other packages would build
fine, but when one particular package fails it's not the
package that's suspect but the tools that work fine for 100+
other OE packages and and entire Gentoo system build.

> And the best place to continue this is the bugtracker.

Thanks.

-- 
Grant Edwards                   grante             Yow!  Why is it that when
                                  at               you DIE, you can't take
                               visi.com            your HOME ENTERTAINMENT
                                                   CENTER with you??



