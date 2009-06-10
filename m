Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MEC9k-0004CC-Vg
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 02:59:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEC0R-0000aJ-Hl
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 00:49:31 +0000
Received: from h24-207-4-118.primesignal.com ([24.207.4.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 00:49:31 +0000
Received: from quickx by h24-207-4-118.primesignal.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 00:49:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: NBeing <quickx@hotmail.com>
Date: Wed, 10 Jun 2009 00:49:20 +0000 (UTC)
Message-ID: <loom.20090610T001710-529@post.gmane.org>
References: <loom.20090604T233316-304@post.gmane.org>
	<20090605014437.GA3406@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.207.4.118 (Mozilla/5.0 (Windows; U; Windows NT 5.1;
	en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.30
	Safari/530.5)
Sender: news <news@ger.gmane.org>
Subject: Re: GPE Application Development Questions
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
X-List-Received-Date: Wed, 10 Jun 2009 00:59:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko <denis <at> denix.org> writes:

>
> The whole point of the toolchain/SDK is to be able to build apps 
> like "gpe-hello" w/o having OE around, i.e. w/o cross, staging or rootfs.
> 

Ahh I see.  I was able to make a simple bitbake recipe to compile the gpe-hello 
app and it works on the board.  I'm still interested in compiling manually 
though.

I ran the "bitbake meta-toolchain" recipe and it completed with no errors.  It 
generates two files "angstrom-2009.X-test-20090609-armv5te-linux-gnueabi-
toolchain.tar.bz2" and "angstrom-2009.X-test-20090609-armv5te-linux-gnueabi-
toolchain-extras.tar.bz2".  The -extras file seems to be empty.

I extract the non-empty *.tar.bz2 into my "/usr" directory and sourced the 
environment-setup file.  All the paths seems to get set correctly, except one.  
The "$PKG_CONFIG_PATH" variable gets set to the below:
/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/pkgconfig

However, the "pkgconfig" directory in "...gnueabi/usr/lib/" doesn't exists.  In 
fact there isn't any relevant *.pc in *.tar.bz2...  Would anyone have run into 
this problem before?  I checked the toolchain online and it does have this 
folder.

Is there any log files I can supply that would help, or something someone can 
suggest I try.  If you issue the following commands you'll probably see the 
problem yourself:

Edit local.conf to set "at91sam9261ek", use latest dev branch + set env vars.
bitbake x11-image
bitbake meta-toolchain
Look in the resulting .../sdk/*.tar.bz2 package for the above folder.

Thanks




