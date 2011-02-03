Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1Pky65-0006eU-4H
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 13:15:37 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 535911B10C0C;
	Thu,  3 Feb 2011 12:24:24 +0000 (UTC)
Message-ID: <4D4A9C30.8010803@freyther.de>
Date: Thu, 03 Feb 2011 13:14:40 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
	<4D4A9739.6040909@freyther.de> <4D4A9A94.6030108@dresearch.de>
In-Reply-To: <4D4A9A94.6030108@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 12:15:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/03/2011 01:07 PM, Steffen Sledz wrote:

> But i've no idea what the real problem is. It looks like it's not related to the ".init_array" but to the missing `mcount' symbol.

This symbol access get added by gcc due the -pg option. Now the question is
who should provide this symbol? I would assume it is glibc (actually grepping
glibc source tree shows it is in gmon/mcount.c).

I am not sure why you want to use gprof but anyway...

a) do not use gprof on glibc...
b) change the tests to have a mcount symbol...
c) more options here.


