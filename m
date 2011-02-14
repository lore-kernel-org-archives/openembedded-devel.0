Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1Pp0zj-0003oz-BB
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 17:09:47 +0100
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p1EFov6I019535; Mon, 14 Feb 2011 16:50:57 +0100
Message-ID: <4D594F61.4010700@vollmann.ch>
Date: Mon, 14 Feb 2011 16:50:57 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>	<AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com>	<09D9BE2AC4AA764DABAA8C91E48D819ED682ECBB@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E011A8B5ACA@DEMCHP99E35MSX.ww902.siemens.net>
Subject: Re: libpcre not compiling
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
X-List-Received-Date: Mon, 14 Feb 2011 16:09:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/11 11:43, Aeschbacher, Fabrice wrote:
> I already reported that libpcre (7.6-r8) does not compile in released version 2010.12 :
>
> | /bin/grep: /usr/lib/libstdc++.la: No such file or directory
> | /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can't read /usr/lib/libstdc++.la: No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is not a valid libtool archive
>
> Now I just figured out that neither does gnutls-2.10.2-r10.1 :
>
> | /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin/sed: can't read /usr/lib/libstdc++.la: No such file or directory
> | arm-angstrom-linux-gnueabi-libtool: link: `/usr/lib/libstdc++.la' is not a valid libtool archive
>
> This seems to be pretty much the same issue.
> Any idea?
These are not -native packages, correct?
Then libtool shouldn't look for /usr/lib/libstdc++.la.
I have the feeling that something in the libtool setup is wrong.

Regards,
   Detlef


