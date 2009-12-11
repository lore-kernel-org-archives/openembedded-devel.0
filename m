Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NJ7jm-00006n-2Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 16:49:01 +0100
Received: by gxk27 with SMTP id 27so915226gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 07:47:14 -0800 (PST)
Received: by 10.101.179.23 with SMTP id g23mr2241802anp.171.1260546434611;
	Fri, 11 Dec 2009 07:47:14 -0800 (PST)
Received: from xora-eee.xora.org.uk (elphelut.fttp.xmission.com
	[166.70.233.217])
	by mx.google.com with ESMTPS id 8sm898441yxg.24.2009.12.11.07.47.12
	(version=SSLv3 cipher=RC4-MD5); Fri, 11 Dec 2009 07:47:13 -0800 (PST)
Date: Fri, 11 Dec 2009 08:47:16 -0700
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091211154716.GB12304@xora-eee.xora.org.uk>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 15:49:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2009 at 09:39:21AM +0100, Frans Meulenbroeks wrote:
> I bumped upon the following issue.
> 
> Normally I use angstrom as distro, but this time I needed a small
> image to be used in an initramfs.
> In order to achieve that I changed DISTRO in my local.conf to minimal
> (tried minimal-uclibc first, but that would complain before generating
> packages, probably due to a mismatch between my target (powerpc) and
> uclibc (I refrained from sidetracking to dig into it)).
> 
minimal being an Angstrom clone will not actually produce smaller
images. I would suggest for an initramfs you just switch Angstrom
to uclibc mode.

The only real advantage micro has in size is that it creates less
directories. The images are not as far as I can see physically any
smaller.

Graeme



