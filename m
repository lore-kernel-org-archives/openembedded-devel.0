Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KQLHh-00054Y-Vp
	for openembedded-devel@openembedded.org; Tue, 05 Aug 2008 14:05:02 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KQJt8-0002Nu-IZ
	for openembedded-devel@openembedded.org; Tue, 05 Aug 2008 10:35:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 05 Aug 2008 10:35:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 05 Aug 2008 10:35:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 05 Aug 2008 12:35:26 +0200
Message-ID: <g79ade$amq$1@ger.gmane.org>
References: <1217924342.25732.163.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008071203)
In-Reply-To: <1217924342.25732.163.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 05 Aug 2008 12:05:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> At present gcc-4.2.4.inc sets:
>
> EXTRA_OECONF_BASE = "--enable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap"
>
> There doesn't seem to be any good reason to disable libgomp, and its
> absence is breaking gettext-0.16.1 at least.  Does anybody know why it
> was disabled, and/or know a good reason why it shouldn't be re-enabled?

It broke builds for some people (but not all).

regards,

Koen




