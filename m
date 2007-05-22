Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1HqR4g-00032o-Uk
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 May 2007 11:54:39 +0200
Received: (qmail invoked by alias); 22 May 2007 09:53:46 -0000
Received: from dsl-62-220-14-162.berlikomm.net (EHLO [192.168.1.23])
	[62.220.14.162]
	by mail.gmx.net (mp058) with SMTP; 22 May 2007 11:53:46 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX1/P4g0oERnPvmrgbOW1sVn01T1EoMVuwIfRKgeLqZ
	1Q2dsK4x8OMmy0
In-Reply-To: <003a01c79c29$1985a690$26031a0a@atmel.com>
References: <4651EFEE.50907@atmel.com>
	<189F751D-9A54-4A17-84FD-82CD2BF62403@gmx.net>
	<003a01c79c29$1985a690$26031a0a@atmel.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
X-Priority: 3
Message-Id: <75DD721B-B0C4-46EF-A8F2-838E8DB5CF85@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Tue, 22 May 2007 11:53:37 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: ERROR: Task 2246 ( ...org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
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
X-List-Received-Date: Tue, 22 May 2007 09:54:39 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

>
>
> Been trying to fetch all packages in advance by
>
> $ bitbake -c fetch gpe-image

Hi,

even with that you will have the issue from before.

Q: What is the issue?
A: I'm not a XML geek but I think xsltproc and xmllint will download  
doctype and schemata during the generation of the documentation. I  
don't know if one can make xstlproc not to do it, this would be  
something for you to find out (xstlproc --help). What you can do/try  
is to add EXTRA_OECONF += " --disable-doc" in the offending recipes.


z.



