Received: from qmta03.westchester.pa.hmc1.comcast.net ([76.96.53.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NI7mn-0005ej-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 22:40:00 +0100
Received: from omta03.westchester.pa.hmc1.comcast.net ([76.96.53.19])
	by qmta03.westchester.pa.hmc1.comcast.net with comcast
	id EidY1d0080Qry6401ld23G; Tue, 08 Dec 2009 21:37:02 +0000
Received: from [192.168.10.132] ([75.147.191.205])
	by omta03.westchester.pa.hmc1.comcast.net with bizsmtp
	id Eld01d0044SLwm301ld1aD; Tue, 08 Dec 2009 21:37:01 +0000
Message-ID: <4B1EC6FC.90207@soundmetrics.com>
Date: Tue, 08 Dec 2009 13:37:00 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15
	(Ubuntu-1.1.15+nobinonly-0ubuntu0.8.04.2)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <c1c0c07e0912081255r2bcb06c9mcf5485d478bad1dc@mail.gmail.com>
In-Reply-To: <c1c0c07e0912081255r2bcb06c9mcf5485d478bad1dc@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.96.53.20
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IC4vZ251cGxvdDogY2FuwrR0IHJlc29sdmUgc3ltYm9sICdwbmdfcGFzc195c3RhcnQn?=
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
X-List-Received-Date: Tue, 08 Dec 2009 21:40:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Niko Lau wrote:
> Hello,
>
> I have a custom board based on the at91sam9260 with a handmade linux system.
> I'm now trying to switch to a oe system.
> I went throught the getting started and made the helloworld program (with
> uclib), which worked fine on my board.
> After that I built gnuplot. When I try to start it on my board I get the
> above error.
> Sounds for me like a missing lib, but libpng and libgd is on the target.
> Has someone a idea what the problem is?
>
>   
Hi Niko,
You might try 'strace gnuplot' to see exactly what's failing at run 
time.  Even if libpng is installed , you might get a missing symbol 
error for png_pass_ystart if you've built against a different version 
than what's installed.  I'd guess just building gnuplot in oe without 
first building the libs it needs is the root cause.  You could check 
your gnuplot build log to make sure headers from outside oe are not 
leaking in somehow.

If libpng is left over from building your pre-oe target file system, you 
should rebuild everything using oe.

Good luck,
John



