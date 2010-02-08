Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NeXd4-0001dp-Su
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 18:42:37 +0100
Received: by ey-out-1920.google.com with SMTP id 13so1169471eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 09:40:05 -0800 (PST)
Received: by 10.213.97.28 with SMTP id j28mr4123932ebn.82.1265650804813;
	Mon, 08 Feb 2010 09:40:04 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 5sm12135530eyh.24.2010.02.08.09.40.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 09:40:02 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id 8B0D84013A; Mon,  8 Feb 2010 17:40:00 +0000 (GMT)
Date: Mon, 8 Feb 2010 17:40:00 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100208173959.GI26844@xora-build.xora.org.uk>
References: <hkm5j4$fib$2@ger.gmane.org>
	<ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>
	<hkmqif$i2t$1@ger.gmane.org>
	<ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
	<hkp46v$tv8$1@ger.gmane.org>
	<18e217241002080927h1a4009acodd66ec735a64d31a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <18e217241002080927h1a4009acodd66ec735a64d31a@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC meeting minutes 20100204
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
X-List-Received-Date: Mon, 08 Feb 2010 17:42:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 09:27:34AM -0800, C Michael Sundius wrote:
> I, too, am still a little unclear  regarding how the new style staging
> works. Are you saying that we are able now to simply remove the do_stage()
> function and bitbake will somehow just know which files are intended to be
> staged from the install.. what if a [say header] file that was not
> previously "installed" is required by a dependent recipe?
> 
Your do_install should already be doing everything to make sure all needed
headers are installed. Otherwise builds on your target device wont work.

This change means that package-dev packages and staging should effetively
be identical to build against. If there is a missing header library or
anything else then improve the do_install()

Graeme



