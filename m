Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1GghwW-000557-6K
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Nov 2006 14:21:44 +0100
Received: (qmail invoked by alias); 05 Nov 2006 13:20:32 -0000
Received: from 88-134-98-23-dynip.superkabel.de (EHLO [192.168.1.103])
	[88.134.98.23]
	by mail.gmx.net (mp019) with SMTP; 05 Nov 2006 14:20:32 +0100
X-Authenticated: #1949623
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>
References: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>
X-Gpgmail-State: !signed
Message-Id: <B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Sun, 5 Nov 2006 14:18:24 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
X-Mailman-Approved-At: Sun, 05 Nov 2006 15:45:41 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Problems creating a bitbake package
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
X-List-Received-Date: Sun, 05 Nov 2006 13:21:44 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed
Content-Transfer-Encoding: 7bit


Am 04.11.2006 um 18:31 schrieb Alan Carvalho de Assis:

> SRC_URI = "http://augusta.ece.ufrgs.br/ipatience-0.1.tar.gz"
>
> inherit gpe
>
> My first problem:
> "bitbake ipatience" command don't obey my SRC_URI tag, this tried
> download ipatience-0.1.tar.gz from openembedded server and fault.
>
> To "solve" this first problem I copied ipatience.tar.gz to my
> oeworkspace/sources and create the md5 to it, then bitbake used it
> correctly. Why bitbake don't obey the SRC_URI?

because you inherit gpe.bbclass after setting the SRC_URI and the  
SRC_URI will be overwritten. Take a look at the gpe.bbclass


h.


--
Holger 'zecke' Freyther
geek, QA monkey, OpenEmbedded Engineer

Me http://www.openembedded.org/~zecke
Blog http://zecke.blogspot.com





