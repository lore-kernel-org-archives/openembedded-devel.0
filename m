Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <thommycheck@gmx.de>) id 1JIYfa-0001h6-Q0
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2008 01:13:14 +0100
Received: (qmail invoked by alias); 26 Jan 2008 00:13:16 -0000
Received: from BAA217f.baa.pppool.de (EHLO [192.168.178.21]) [77.128.33.127]
	by mail.gmx.net (mp022) with SMTP; 26 Jan 2008 01:13:16 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19R/h8fq8JR1msgrC4bpLw3lqYcIIi7wV8FWoq4gS
	tW8qABwgGOL5vP
From: Thomas Kunze <thommycheck@gmx.de>
To: oe ml <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Jan 2008 01:13:29 +0100
Message-Id: <1201306409.6002.4.camel@HD>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Y-GMX-Trusted: 0
Subject: Hidden depenencies
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
X-List-Received-Date: Sat, 26 Jan 2008 00:13:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi everybody,

I just spend some hours to figure out why a kernel module I added to
MACHINE_EXTRA_RRECOMMENDS didn't show up in images. The solution is to
rebuild task-base. I think there should a way to handle this in oe. But
for now we should document such hidden dependencies. Where should this
be in the wiki? Do you know additional hidden dependencies?

My list so far:
MACHINE_EXTRA_RRECOMMENDS -> task-base
module_autoload_* -> virtual/kernel

Regards,
Thomas



