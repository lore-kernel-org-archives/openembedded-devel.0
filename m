Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HbKVY-0004ke-7d
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 19:51:56 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50)
	id 1HbKoq-0002xv-LT; Tue, 10 Apr 2007 20:11:52 +0200
Message-ID: <461BCEA9.2050206@kernelconcepts.de>
Date: Tue, 10 Apr 2007 19:51:37 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HZn60-0007Lc-L6@linuxtogo.org>	<461BA7BA.6020403@kernelconcepts.de>	<1176220267.461bb26b4be0d@dominion.kabel.utwente.nl>
	<461BB953.7020302@kernelconcepts.de>
In-Reply-To: <461BB953.7020302@kernelconcepts.de>
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
X-List-Received-Date: Tue, 10 Apr 2007 17:51:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi again,

Florian Boor schrieb:

> I'll try to sort things in a way that we get separate SDK packages for each
> purpose and without removing things from existing SDK packages blindly. Maybe we
> can move all the magic to the SDK class anyway.

I just pushed these changes. Please take a look and test if it does what it is
expected to do. So far it is just a draft that definitely wants some further
improvement. My major focus so far was to get a better base for flexible SDK
targets without loosing the existing functional targets.
This involved some changes:
task-sdk-base was split out from task-sdk.bb into a separate task-sdk-base
package. The former meta-sdk is mostly provided by meta-sdk-gpe now, the Opie
SDK might want a similar one in future. The same happened for the sbox SDK
packages likewise.
meta-sdk is now a quite raw toolchain like Koen intended to get.

I just hope i didn't mix up too much :-)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


