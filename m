Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1Szn2Q-0006nb-4u
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 13:05:54 +0200
Received: from cpc8-live22-2-0-cust106.know.cable.virginmedia.com
	([82.42.168.107] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SzmqN-0002ul-Gm
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 10:53:27 +0000
Message-ID: <5024E843.2050709@dynamicdevices.co.uk>
Date: Fri, 10 Aug 2012 11:53:55 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Best practise using .bbappend
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
X-List-Received-Date: Fri, 10 Aug 2012 11:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to create a layer, overriding certain defaults with use of 
.bbappends.

e.g. Changing a Grub configuration with a 
meta-foo/recipes-bsp/grub/grub_1.99.bbappend

I'm wondering what happens when somebody updates the grub recipe in meta 
to a
new version, e.g. 2.00 and I then do a git pull?

As I understand it the environment will automatically pick up the new 
recipe, and
presumably my .bbappend to 1.99 will no longer be pulled in?

Should I be setting a PREFERRED_VERSION_bar somewhere, say in the conf 
for my
new layer, on any recipe that I add a .bbppends to, or what's best 
practise for dealing
with this?

Thanks,

Alex



