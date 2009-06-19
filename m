Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHiS7-00075d-V9
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 20:04:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHiHo-0000Dx-4G
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 17:54:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 19 Jun 2009 17:54:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 19 Jun 2009 17:54:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Jun 2009 19:53:49 +0200
Message-ID: <h1gjbd$qpu$1@ger.gmane.org>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>	<h19s8q$jd7$1@ger.gmane.org>	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>	<h1dr55$nue$1@ger.gmane.org>	<be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>	<h1dusl$4lp$1@ger.gmane.org>
	<4A3A8348.8080502@balister.org>	<h1e0ot$bjn$1@ger.gmane.org>	<20090618230514.GP15477@smtp.west.cox.net>	<h1fgtp$b83$2@ger.gmane.org>
	<20090619174723.GR15477@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <20090619174723.GR15477@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Fri, 19 Jun 2009 18:04:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-06-09 19:47, Tom Rini wrote:

> I would have assumed that since changing a package without changing the
> PR can wreck havoc on public feeds you would be in favor of helping to
> keep those problems at bay.

Check contrib/angstrom/upload-packages.sh :) It won't upload any 
duplicate filenames, so angstrom public feeds don't suffer from such 
things (they did, that's why Graeme and I added that logic).
Anyway, if you aren't paying enough attention to bump PR, you shouldn't 
be pushing that commit!
There are a lot more things that warrant attention than not including PR 
= "r0" in the recipe, inheriting pkgconfig being one of them.

regards,

Koen




