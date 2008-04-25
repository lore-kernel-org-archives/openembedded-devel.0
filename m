Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JpWVj-0005vU-Lj
	for openembedded-devel@openembedded.org; Sat, 26 Apr 2008 00:35:19 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JpWVU-0005eO-Cf
	for openembedded-devel@openembedded.org; Fri, 25 Apr 2008 22:35:04 +0000
Received: from ip-62-143-23-251.1411n-cud12k-01.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 22:35:04 +0000
Received: from no2spam by ip-62-143-23-251.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 22:35:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 26 Apr 2008 00:30:50 +0200
Message-ID: <futm2n$1q9$2@ger.gmane.org>
References: <f96d234e0804241325l64a85878q905dc02eb177266d@mail.gmail.com>
	<1209073881.5108.79.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
In-Reply-To: <1209073881.5108.79.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: bitbake -c rebuild not running all tasks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 22:35:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Please don't use the rebuild command for now, use -c clean and then
> rerun it. I will think about this problem but its a nasty tricky to
> solve one.

how about having "bitbake -c rebuild $target" actually be "bitbake -c
clean $target;bitbake $target" for the time being as a stop-gap measure?
 I know you are not a fan of recursive bitbake, but would it be a
problem in this case?



