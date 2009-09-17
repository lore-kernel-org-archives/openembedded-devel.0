Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MoDbV-0000sS-Gr for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 11:48:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MoDaq-0005OR-5X
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 11:48:00 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 11:48:00 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 11:48:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 17 Sep 2009 11:46:50 +0200
Message-ID: <h8t0ia$9d9$1@ger.gmane.org>
References: <20090917054034.GB5465@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <20090917054034.GB5465@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] -dbg for static libraries?
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
X-List-Received-Date: Thu, 17 Sep 2009 09:48:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-09-09 07:40, Denys Dmytriyenko wrote:
> As target binaries and libraries are now built with extra debugging symbols,
> some of the -dbg packages are very large. Unfortunately, -dbg packages only
> contain debug versions of executable binaries and shared libraries, but not
> static libraries, which go directly into -dev packages. That increases the
> size of sdk/toolchain tarballs, which include -dev packages, depending on the
> main packages, and end up with stripped shared libs, but bloated static libs.
>
> I understand, that -dev packages are specifically for development and having
> full debugging symbols in a library might be helpful for that, but -dev
> packages don't usually depend on -dbg, and most toolchain-target tasks don't
> include them either, hence not providing debugging versions of shared libs in
> the sdk/toolchain.
>
> Would it make sense to package stripped version of a static lib into -dev and
> the full version into corresponding -dbg?

What about the stripped version in -dev and the corresponding symbols in 
-dbg?

regards,

Koen




