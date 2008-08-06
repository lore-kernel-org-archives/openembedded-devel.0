Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KQlqA-0004RW-GR
	for openembedded-devel@openembedded.org; Wed, 06 Aug 2008 18:26:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KQlq5-0006Ak-9P
	for openembedded-devel@openembedded.org; Wed, 06 Aug 2008 16:26:17 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 06 Aug 2008 16:26:17 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 06 Aug 2008 16:26:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 06 Aug 2008 18:26:09 +0200
Message-ID: <g7cjb1$itm$1@ger.gmane.org>
References: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080100)
In-Reply-To: <20080806173647.1c51a79c@elara.dyn.totalueberwachung.de>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC deleting libpixman in favor of pixman
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
X-List-Received-Date: Wed, 06 Aug 2008 16:26:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Daniel Willmann wrote:
> Hi,
>
> I just noticed that both are the same library with different names.
> They are located in:
> packages/libpixman/libpixman*bb
> packages/xorg-lib/pixman*bb
>
> libpixman includes versions 0.1.5 and 0.1.6, but a
> find packages/ |xargs grep libpixman shows me that libpixman isn't used
> anywhere except in:
> ./packages/tasks/task-sdk-base.bb

That's a red herring, someone didn't understand debian renaming when 
adding that :)

> So I would suggest that we remove libpixman and change the one
> occurence of it in task-sdk-base to pixman instead.

+1

regards,

Koen



