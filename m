Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>)
	id 1PrUxH-0001Bj-0X; Mon, 21 Feb 2011 13:33:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1LCW8vY016119;
	Mon, 21 Feb 2011 12:32:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15692-07; Mon, 21 Feb 2011 12:32:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1LCW1YV016113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Feb 2011 12:32:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Steffen Sledz <sledz@dresearch.de>
In-Reply-To: <4D60DA13.5070806@dresearch.de>
References: <1298049536.11289.3126.camel@rex> <4D60DA13.5070806@dresearch.de>
Date: Mon, 21 Feb 2011 12:31:59 +0000
Message-ID: <1298291519.11289.3167.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake 1.12.0 released! - ImportError: No module named ply
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
X-List-Received-Date: Mon, 21 Feb 2011 12:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-02-20 at 10:08 +0100, Steffen Sledz wrote:
> Trying bitbake 1.12.0 together with the testscript from contrib
> results in an error for me (openSUSE 11.3 32bit, bitbake 1.10.2 works
> fine):
> 
> sledz@mobil-400-586:~/tmp/xy> MACHINE=hipox TARGET_RECIPE=minimal-image DISTRO=angstrom-2008.1 TESTING_BRANCH=testing-release-2011.03 BB_MIN_VERSION=1.12.0 ~/work/openembedded/contrib/testing/testscript.sh
> Branch testing-release-2011.03 set up to track remote branch testing-release-2011.03 from origin.
> Already on 'testing-release-2011.03'
> Already up-to-date.
> hipox angstrom-2008.1 minimal-image testing-release-2011.03 72a088f7e1cf2eb0b50f285301478278c616c1cd
> Traceback (most recent call last):
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/bin/bitbake", line 35, in <module>
>     import bb
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 138, in <module>
>     deprecate_import(__name__, "bb.fetch", ("MalformedUrl", "encodeurl", "decodeurl"))
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/__init__.py", line 126, in deprecate_import
>     module = __import__(modulename, fromlist = fromlist)
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/fetch/__init__.py", line 32, in <module>
>     from   bb import data
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data.py", line 48, in <module>
>     from bb import data_smart
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/data_smart.py", line 34, in <module>
>     import bb, bb.codeparser
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/codeparser.py", line 7, in <module>
>     from pysh import pyshyacc, pyshlex
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshyacc.py", line 13, in <module>
>     import pyshlex
>   File "/home/sledz/tmp/xy/bitbake-1.12.0/lib/bb/pysh/pyshlex.py", line 22, in <module>
>     from ply import lex
> ImportError: No module named ply

Did you try installing python-ply or whatever the name of the ply module
for python is on openSUSE?

Cheers,

Richard



