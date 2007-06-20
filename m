Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1I0xXP-0001pN-Hf
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 12:35:47 +0200
Received: (qmail invoked by alias); 20 Jun 2007 10:32:05 -0000
Received: from dsl-62-220-14-162.berlikomm.net (EHLO [192.168.1.23])
	[62.220.14.162]
	by mail.gmx.net (mp043) with SMTP; 20 Jun 2007 12:32:05 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX182yLBcCNg25A2KLMFHa3Sv5eRlXpRws0ogrM7y3F
	InwQjT85QAZPpH
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <BAY143-F26F6CAE5A52DDDF6A67FC9B9110@phx.gbl>
References: <BAY143-F26F6CAE5A52DDDF6A67FC9B9110@phx.gbl>
Message-Id: <7D14BDC7-243B-41E5-A193-02DC289F6398@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Wed, 20 Jun 2007 12:31:20 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: Question - How dose bitbake select a kernel
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
X-List-Received-Date: Wed, 20 Jun 2007 10:35:47 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 20.06.2007 um 11:40 schrieb Pelle Svensson:

> 1. How did bitbake come up with this list? Is done by bb-file's  
> name or a
> tag inside?

This should be in the BitBake manual


> 2. Should I add 'PREFERRED_PROVIDER_kernel=my-target-kernel.bb'  if so
> where?

grep -rn PREFERRED_PROVIDER * | grep kernel in your  
org.openembedded.dev/conf directory to get an idea :)

z.






