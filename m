Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lob6i-0004WQ-TX
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 12:22:12 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lob4c-0001oF-AJ
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 10:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 10:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 10:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Mar 2009 12:17:15 +0200
Message-ID: <gqsqjb$iur$2@ger.gmane.org>
References: <20090331092101.GB10532@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <20090331092101.GB10532@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
Subject: Re: xine update
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
X-List-Received-Date: Tue, 31 Mar 2009 10:22:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-03-09 11:21, Henning Heinold wrote:
> Hi again,
>
> I reworked hard the whole libxine stuff there would be now only
> the latest version and only one package xine can handle x11 and fb
> at the same time via plugins. This will break all packages which rely
> on either libxine-fb and libxine-x11. Should I leave it to the other
> package maintainer to fix this situation, should I fix myself with
> a huge push which covers all packages or should I fix the recipes
> step for step. Attached the patch for review.

Do it in one big push, makes it less tedious to bisect.

regards,

Koen



