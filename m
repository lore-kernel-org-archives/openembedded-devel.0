Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HbHum-0007TY-2w
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 17:05:48 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HbIE3-0002ii-8K
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 17:25:43 +0200
Message-ID: <461BA7BA.6020403@kernelconcepts.de>
Date: Tue, 10 Apr 2007 17:05:30 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HZn60-0007Lc-L6@linuxtogo.org>
In-Reply-To: <E1HZn60-0007Lc-L6@linuxtogo.org>
X-Enigmail-Version: 0.94.0.0
Subject: Re: [oe-commits] org.oe.dev task-sdk-sbox, task-sdk: clean out base sdk packages, they should only contain a toolchain
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
X-List-Received-Date: Tue, 10 Apr 2007 15:05:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

koen commit schrieb:
> task-sdk-sbox, task-sdk: clean out base sdk packages, they should only contain a toolchain

I disagree about this as well - if you want a single toolchain please create a
toolchain package. These ones are intended to provide a full SDK.
I see the need for what you intended to do but don't do it in this way.
What we should do is to have a set of SDKs that provide both toolchain and
libraries and packages with only a basic toolchain.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


