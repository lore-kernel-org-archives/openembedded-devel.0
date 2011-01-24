Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PhUYo-0006Cc-OU
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:06:54 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 845441B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:15:05 +0000 (UTC)
Message-ID: <4D3DF7CF.7010308@freyther.de>
Date: Mon, 24 Jan 2011 23:06:07 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D3DE56B.7020803@freyther.de>
In-Reply-To: <4D3DE56B.7020803@freyther.de>
Subject: Re: build errors in openssl-native
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
X-List-Received-Date: Mon, 24 Jan 2011 22:06:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2011 09:47 PM, Holger Freyther wrote:
> Hi,
> 
> is anyone else seeing build errors like this:
> 
> make[2]: Entering directory
> `/data/openembedded/build/arm/cortex-a8/tmp/work/x86_64-linux/openssl-native-1.0.0c-r14.0/openssl-1.0.0c/apps'
> openssl.o: In function `main':
> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'


patches/libdeps-first.patch

is causing it... no idea why yet


