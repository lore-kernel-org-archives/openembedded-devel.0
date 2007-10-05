Received: from [62.142.5.109] (helo=emh03.mail.saunalahti.fi)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philippedeswert@scarlet.be>) id 1Idq4u-0005K3-3T
	for openembedded-devel@openembedded.org; Fri, 05 Oct 2007 18:31:04 +0200
Received: from saunalahti-vams (vs3-11.mail.saunalahti.fi [62.142.5.95])
	by emh03-2.mail.saunalahti.fi (Postfix) with SMTP id 868F3EBDC1
	for <openembedded-devel@openembedded.org>;
	Fri,  5 Oct 2007 19:25:39 +0300 (EEST)
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
	by vs3-11.mail.saunalahti.fi ([62.142.5.95])
	with SMTP (gateway) id A07EFF853B2; Fri, 05 Oct 2007 19:25:39 +0300
Received: from [192.168.0.100] (a91-153-17-113.elisa-laajakaista.fi
	[91.153.17.113])
	by emh03.mail.saunalahti.fi (Postfix) with ESMTP id 7591B158B1D
	for <openembedded-devel@openembedded.org>;
	Fri,  5 Oct 2007 19:25:38 +0300 (EEST)
From: Philippe De Swert <philippedeswert@scarlet.be>
To: openembedded-devel@openembedded.org
In-Reply-To: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
References: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
Date: Fri, 05 Oct 2007 19:22:24 +0300
Message-Id: <1191601344.17230.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Antivirus: VAMS
Subject: Re: SVN fetcher behaviour
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
X-List-Received-Date: Fri, 05 Oct 2007 16:31:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello all,

On Thu, 2007-10-04 at 11:57 +0100, Martyn Welch wrote:
> It is failing to download gconf-dbus using "gconf-dbus_svn.bb". It seems
> that the script does not specify a revision and it therefore trying to
> download revision 1. This fails.
> 
> I have managed to get the script to continue buy hacking the script to
> get it to download the current revision (608), by adding "rev=608" to
> the SRC_URI.

I ran into a similar problem recently and it seems you need to edit
../org.openembedded.dev/conf/distro/include/sane-srcdates.inc or make
sure it is included in your distro.

> I've looked at
> http://www.openembedded.org/user-manual&dpage=src_uri_variable, which
> (under "SVN") describes the behaviour of the svn fetcher. This doesn't
> seem to specify what the default behaviour of the svn fetcher is when no
> revision is specified, I'd assumed it would be the "head", though I am
> now having some doubt.

I think this should be the default behaviour, unfortunately it is not.
The expected behaviour is fetch the latest revision and build it but it
dies not.  I think ib general it is a great improvement for managing svn
revisions, but it sucks at building the latest and newest.

Cheers,

Philippe




