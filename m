Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1HljWB-0004J7-UM
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 12:35:36 +0200
Received: from pd9539108.dip0.t-ipconnect.de ([217.83.145.8])
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1HljUX-00034Y-Gi for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 12:33:53 +0200
Message-ID: <4641A311.4030907@klever.net>
Date: Wed, 09 May 2007 12:31:45 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070321)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <464130FC.7030008@gmail.com> <02827798.20070509123821@gmail.com>
In-Reply-To: <02827798.20070509123821@gmail.com>
X-Enigmail-Version: 0.94.3.0
Subject: Re: QA for intentionally unpackaged files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2007 10:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> 
>> UNSHIPPED = "${libdir}/libpython2.4.so ${bindir}/smtpd.py"  #reason why
>> not package/ship it
> 
>         Who exactly will go over all recipes and add such lines?

I take it the proposal was that package maintainers should take care of
it. Indeed, it would be better if intentionally unpackaged files invoked
no QA notice. But I think the solution is either not install them or rm
them after installation, depending on installation procedure nature.


Love,
H


