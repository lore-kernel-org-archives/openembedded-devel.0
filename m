Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ka7JT-00087q-89
	for openembedded-devel@openembedded.org; Mon, 01 Sep 2008 13:11:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ka7Ha-0000oP-Kx
	for openembedded-devel@openembedded.org; Mon, 01 Sep 2008 11:09:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Sep 2008 11:09:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Sep 2008 11:09:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Sep 2008 13:09:11 +0200
Message-ID: <g9gign$j27$1@ger.gmane.org>
References: <20080901105009.GC24372@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <20080901105009.GC24372@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: bitbake 1.8 badness in using same git for different bb
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
X-List-Received-Date: Mon, 01 Sep 2008 11:11:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

John Lee wrote:
> hi,
>
> in bitbake 1.8 git.py, _revision_key returns ud.host + ud.path, that
> means if two bb share the same git dir, the _revision_key will be the
> same.  that will cause problem if you use AUTOREV.  the local count
> will keep increasing everytime you call bitbake.

Related to this: You can't do something like:

SRC_URI = "git://ffmpeg;protocol=git \
            git://mplayer/swscale;protocol=git"

since both checkouts will use the 'git' dir in ${WORKDIR}.

regards,

Koen



