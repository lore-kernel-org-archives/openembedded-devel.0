Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KLGUz-0005dw-5D
	for openembedded-devel@openembedded.org; Tue, 22 Jul 2008 13:57:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KLGTt-0007vu-N4
	for openembedded-devel@openembedded.org; Tue, 22 Jul 2008 11:56:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 22 Jul 2008 11:56:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 22 Jul 2008 11:56:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Jul 2008 13:56:22 +0200
Message-ID: <g64ht6$h2u$1@ger.gmane.org>
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 11:57:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Esben Haabendal wrote:
> Hi
>
> For some reason, some OSS projects does not offer persistent access to
> old releases,
> which continously give problems for OE and other similar distributions.

Angstrom already provides a sourcemirror for exactly this reason.

>
> With the org.openembedded.stable branch, this problem is considerably worse.
> The usual fix in .dev is to upgrade the recipes to a current release,
> which of-course
> is not what we want for a stable branch.
>
> Take for example
> http://bugs.openembedded.net/show_bug.cgi?id=4227

Fakeroot is present on the angstrom sourcemirror.

> I think it is worth considering a permanent solution to this kind of problems.
> We should have a download server which carries all sources referred to
> by http and ftp URI's in org.openembedded.stable recipes.
> Why not setup ftp://downloads.openembedded.org/org.openmbedded.stable
> to mirror a copy of all sources referred to by current .stable recipes, and
> when a bug is filed with a missing source, the solution is simply to change
> the SRC_URI to use the ftp://downloads.openembedded.org URI instead.
>
> Of-course, unless continous manual labor is to be required, we need to
> write a script or something like that to maintain the mirror repository.

The angstrom autobuilder updates the sourcemirror already with 
distributable sources.

> And we need a server with enough storage and a big fat pipe to the
> Internet.
>
> What do you think?

If you use a sane distro like angstrom, you will automagically have a 
source mirror.

regards,

Koen



