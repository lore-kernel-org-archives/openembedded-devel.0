Received: from [210.54.141.245] (helo=fep01.xtra.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tkemp@klc.net.nz>) id 1K5XP1-0005ZE-CF
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jun 2008 04:46:35 +0200
Received: from mta03.xtra.co.nz ([172.23.11.31]) by fep01.xtra.co.nz with ESMTP
	id <20080609024115.KXGN11434.fep01.xtra.co.nz@mta03.xtra.co.nz>
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jun 2008 14:41:15 +1200
Received: from [10.0.0.98] (really [210.86.26.251]) by mta03.xtra.co.nz
	with SMTP id <20080609024115.YXAJ3583.mta03.xtra.co.nz@[10.0.0.98]>
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jun 2008 14:41:15 +1200
From: Terry Kemp <tkemp@klc.net.nz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1212882957.7163.12.camel@sulphur.klc>
References: <1212882957.7163.12.camel@sulphur.klc>
Date: Mon, 09 Jun 2008 14:41:14 +1200
Message-Id: <1212979274.16966.20.camel@sulphur.internal.mercers.co.nz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 (2.22.2-1.fc9) 
Subject: Re: perl native + intltool probs Fedora 9 [solved]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 09 Jun 2008 02:46:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-06-08 at 11:55 +1200, Terry Kemp wrote:
> intltool-native and others fail on...
> 
> checking for XML::Parser... configure: error: XML::Parser perl module is
> required for intltool
> 


> pointers?
> 
> Thanks
> 
> Terry
>  

arrrrrrrrrrrrgh!

export PERL5LIB=

fixes it.

for some reason my home machine i686 had a bunch of directories listed
in this env variable and my work machine x86_64 didn't have the PERL5LIB
env var at all.

Should I simply add this to the 'sourceme' script that sets up my
environment prior to building or is it something that should be added to
perl et al bbs. If so whats the correct syntax to delete env vars from a
bb recipe?

Thanks

Terry





