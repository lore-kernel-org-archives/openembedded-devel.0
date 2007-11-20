Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Iucwk-0000fA-7g
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:56:02 +0100
Received: from [78.48.36.226] (helo=[192.168.1.6])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Iucmm-0005Eu-5T
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:45:44 +0100
Message-ID: <47436CEE.9020407@kernelconcepts.de>
Date: Wed, 21 Nov 2007 00:25:34 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com>
In-Reply-To: <4743201F.8000202@am.sony.com>
X-Enigmail-Version: 0.95.0
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 23:56:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Tim Bird schrieb:
> This is nice.  Can someone tell me why this isn't
> the default behavior of bitbake now?  (I'm honestly
> not trolling :-)   There must be some good reason
> to allow bitbake to be used outside of a build
> directory.  Make (which bitbake resembles
> in some aspects), is sensitive to it's starting
> directory.  Why not bitbake?

that's a pretty good point. In my opinion the fact that you need to set
environment variables in addition to your configuration files is a pain anyway.
I would expect bitbake to search for all configuration information in
$PWD/conf/*.conf and that's it. That would reduce the initial overhead and makes
it _much_ easier for new users to get along with OE.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


