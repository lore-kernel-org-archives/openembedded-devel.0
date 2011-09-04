Received: from mailrelay04.sunrise.ch ([194.158.229.47]
	helo=smtp-be-02.be08.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@vollmann.ch>) id 1R0COk-0004gH-8R
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 15:06:06 +0200
Received: from [192.168.26.14] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by smtp-be-02.be08.sunrise.ch (8.13.1/8.12.10) with ESMTP id
	p84D1Khf009764; Sun, 4 Sep 2011 15:01:23 +0200
Message-ID: <4E637692.2080402@vollmann.ch>
Date: Sun, 04 Sep 2011 15:01:06 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.20) Gecko/20110805 Thunderbird/3.1.12
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: filename restrictions for packaged staging
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
X-List-Received-Date: Sun, 04 Sep 2011 13:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Some of my recipes fail with
ERROR: Function 'staging_packager' failed (see /dev/null for further 
information)

Unfortunately /dev/null didn't give much information ;-(

But eventually (with -vvvvv -D -D -D -D) I got a real error message:
*** Error: Package name  contains illegal characters, (other than 
[a-z0-9.+-])

While the '' between 'name' and 'contains' isn't of much help
either (it's a bug in stage-manager-ipkg-build, I'll file a patch
for that later), it turned out that my machine name contained
upper case letters, which stage-manager-ipkg-build doesn't like.

Now without packaged staging everything runs fine, i.e. packages
in deploy are created with those upper case letters in it.
So is there a reason why packaged staging is more picky about
filenames than normal opkg packaging?

   Detlef


