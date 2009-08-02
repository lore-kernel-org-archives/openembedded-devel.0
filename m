Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <s_buschmann@gmx.de>) id 1MXYtL-0007p1-7p
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 13:06:15 +0200
Received: (qmail invoked by alias); 02 Aug 2009 10:50:54 -0000
Received: from p5481CCFE.dip.t-dialin.net (EHLO [192.168.2.107])
	[84.129.204.254]
	by mail.gmx.net (mp025) with SMTP; 02 Aug 2009 12:50:54 +0200
X-Authenticated: #1404922
X-Provags-ID: V01U2FsdGVkX19O+hsdRU9OAk5kN2MK8CxbM7oxx/SxFXNQVmkitO
	+RAx8bLy0WVpgE
Message-ID: <4A756F8F.30405@gmx.de>
Date: Sun, 02 Aug 2009 12:50:55 +0200
From: Stefan Buschmann <s_buschmann@gmx.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200908021211.14793.mok@mnet-online.de>
In-Reply-To: <200908021211.14793.mok@mnet-online.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.73
Subject: Re: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Sun, 02 Aug 2009 11:06:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm experiencing problems with current SHR images as well. In my case, 
everything gets built and the image is created successfully, but when I 
boot into the system on my device, I get a few error messages like "no 
sound device" for alsa, "no network card" etc., and the X server fails 
to start. However the fso-daemons etc. seem to be working, or at least 
starting, correctly.

I haven't been able to understand what is going wrong here, as I'm still 
starting to learn how the whole openembedded/bitbake system works. I 
turned on logging in the hope that I would find out why e.g. the 
X-server is not starting, but found no helpful error messages in the 
logs. I first thought it was a fault in my build system, but than I 
started completely from scratch with the SHR-Makefile, and got the same 
non-working image in the end. So, any tips on how to debug this?

Currently I'm working on the fso/milestone5.5 branch again, as this 
still results in a working image. But I know that this is going to be 
abandoned, soon...

Bye,

Stefan



