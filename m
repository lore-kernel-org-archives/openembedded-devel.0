Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KQgSB-00041R-CG
	for openembedded-devel@openembedded.org; Wed, 06 Aug 2008 12:41:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KQgS6-00087O-5l
	for openembedded-devel@openembedded.org; Wed, 06 Aug 2008 10:41:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 Aug 2008 10:41:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 06 Aug 2008 10:41:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 06 Aug 2008 12:41:02 +0200
Message-ID: <g7bv3u$9d0$1@ger.gmane.org>
References: <1217924342.25732.163.camel@lenovo.internal.reciva.com>	<g79ade$amq$1@ger.gmane.org>	<1217938413.24777.148.camel@mill.internal.reciva.com>	<g79gss$vrd$1@ger.gmane.org>	<19c1b8a90808051757s7127b5eo5d289a667d732f69@mail.gmail.com>
	<1218008960.25732.178.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080100)
In-Reply-To: <1218008960.25732.178.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: openmp in gcc-cross
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
X-List-Received-Date: Wed, 06 Aug 2008 10:41:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> The error with gettext is just a straightforward "-lgomp not found" kind
> of thing.  Gettext will compile OK with older, non-OpenMP-capable
> compilers: it checks for the -fopenmp flag during configure, but it
> expects (not unreasonably) that if you have an OpenMP capable compiler
> then you will also have the right libraries available.
>
> For people who don't want OpenMP I think the right thing is to have a
> global "USE_OPENMP" variable to turn off OpenMP support at the package
> level.  For most autotools-using packages this is going to mean adding
> "--disable-openmp" to EXTRA_OECONF.
>
> You're right that OpenMP might indeed be overkill on some/most embedded
> systems, but embedded multi-threading is by no means unheard of and I
> guess it will become more popular as CPUs like the Cortex-A9 and newer
> Pentiums start to show up in these systems.

Speaking of cortex-A9 MPCore (and arm11 MPCore as well), how well does 
linux (kernel + c library) support MP on arm? I heard horror stories 
about missing memory barriers, but that was over a year ago.

> I verified that libgomp does compile OK with gcc 4.2.2, so I guess I'll
> go ahead and re-enable it for that version at least.

gcc 4.2.4 (re)built fine for me after your latest changes.

regards,

Koen



