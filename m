Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1HptGl-00052i-PR
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2007 23:48:51 +0200
Received: (qmail invoked by alias); 20 May 2007 21:48:08 -0000
Received: from unknown (EHLO [192.168.10.100]) [91.64.161.147]
	by mail.gmx.net (mp042) with SMTP; 20 May 2007 23:48:08 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX19fumsh1wJfcsdtNppU3dULLnx4w3q13+0L5Btsfl
	NCYUQ4QJ4cJjT6
In-Reply-To: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
References: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Priority: 3
Message-Id: <66584307-3DAA-4B3C-8A5F-32915D6FF1EC@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Sun, 20 May 2007 23:47:58 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: OpenEmbedded insist on downloading existing package
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
X-List-Received-Date: Sun, 20 May 2007 21:48:52 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.05.2007 um 23:07 schrieb Ulf Samuelsson:

> I have defined the download location to and
> I have linux-2.6.21.1.tar.bz2 in this directory.
>
> OpenEmbedded seems to ignore this and insists on *downloading*
> linux-2.6.21.1.tar.bz2 before use.
>
> - This is no fun.
>
> Anything that can be done?

Well,

you play with the guts and hope it is working. First you need to have  
a filename.md5 in the same directory otherwise the fetcher will  
continue fetching (this is what you see) and then you might need to  
add a fetched stamp. As this stamp gets created  when the md5sum/ 
sha256sum was verified.


I don't know your reasoning but there must be a better answer to your  
problem.

z.




