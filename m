Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1I93wJ-0008Bv-Hh
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2007 21:02:59 +0200
Received: from [88.134.98.145] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1I93qc-0007pe-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2007 20:57:06 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <193a0cf50707121105y703147cbr935d6a603d01e6d6@mail.gmail.com>
References: <193a0cf50707121105y703147cbr935d6a603d01e6d6@mail.gmail.com>
Message-Id: <860C48AB-BFEE-414D-9275-B20556FA10B7@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Thu, 12 Jul 2007 20:57:04 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 88.134.98.145
Subject: Re: ipkg on MacOS X (missing feature.h)
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
X-List-Received-Date: Thu, 12 Jul 2007 19:02:59 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 12.07.2007 um 20:05 schrieb Krzysztof Kajkowski:

> Hello everyone!
>
> I am trying to set up OpenMoko environment on my Macbook - you can see
> my efforts on  http://wiki.openmoko.org/wiki/ 
> OpenMoko_under_QEMU_on_MacOSX
>
> Now I'm struggling with compiling ipkg. Here's my log:
>

Check the OE wiki for building on non Linux. Go to the viewcvs of  
handhelds.org for ipkg and check my old patch which was backed out.  
Basicly features.h is a glibc (or was it gcc on linux?) thing and is  
in (lib)busybox only to detect libc5.

z.


