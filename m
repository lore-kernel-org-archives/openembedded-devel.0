Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1N1KlR-0001tV-Sv
	for openembedded-devel@openembedded.org; Fri, 23 Oct 2009 16:05:13 +0200
Received: (qmail 29086 invoked by uid 107); 23 Oct 2009 14:04:07 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 23 Oct 2009 16:04:07 +0200
Message-ID: <4AE1B7D6.8070904@epfl.ch>
Date: Fri, 23 Oct 2009 16:04:06 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE0BEFA.4020905@mlbassoc.com>	<19c1b8a90910221735t5c91498ft9a692cd75c442db4@mail.gmail.com>
	<200910230326.13922.holger+oe@freyther.de>
In-Reply-To: <200910230326.13922.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 128.178.224.226
X-SA-Exim-Mail-From: valentin.longchamp@epfl.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 14:05:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Friday 23 October 2009 02:35:31 Khem Raj wrote:
> 
>> One reason could be that its not getting right libc to link with. You
>> could check <staging>/usr/lib/libc.so
>> and it should be a text file which points to right libc to link with.
>> On glibc it was different than in eglibc
>> eglibc one should work. I do not know about glibc as I do not have
>> working version of glibc here.
> 
> Okay,
> 
> thanks to Khem on irc and pointing me to -Wl,-verbose there is something fishy 
> with the libc_nonshared.a in the SDK. I have no idea what kind of problem but 
> the workaround is to copy libc_nonshared.a from the OE staging to
> 
> /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib.
> 

Thanks for the workaround, it works for me. Any idea/hint on how to 
correct this ?

Regards

Valentin


