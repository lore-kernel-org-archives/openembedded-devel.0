Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KiFOA-0008GD-6X
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 23:25:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KiFKg-00024G-KG
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 21:22:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 21:22:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 21:22:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 23:21:57 +0200
Message-ID: <gbbmll$t6i$1@ger.gmane.org>
References: <20080923211433.GA29169@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <20080923211433.GA29169@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: libxml2_native_python_dir
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
X-List-Received-Date: Tue, 23 Sep 2008 21:25:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> Hi,
>
> Since couple of days ago I'm seeing this error message when bitbake rebuilds
> its cache:
>
> ERROR: Error Method already seen: libxml2_native_python_dir in' libxml2-native_2.6.29.bb' now in 'libxml2-native_2.6.32.bb'
>
> Even though it says ERROR, it does not break the build.

OE (or bitbake, I get confused easily) has a global method scope, so you 
get warned when 2 files define the same method.
The way to fix this would either be to drop .29 or create a .inc file 
that can be shared between .29 and .32.

regards,

Koen



