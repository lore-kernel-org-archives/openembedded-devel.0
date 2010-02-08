Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NeXkA-0007ea-9w
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 18:49:57 +0100
Received: by qw-out-1920.google.com with SMTP id 5so527116qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 09:47:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.118.6 with SMTP id q6mr514812wfc.27.1265651241536; Mon, 08 
	Feb 2010 09:47:21 -0800 (PST)
In-Reply-To: <20100208173959.GI26844@xora-build.xora.org.uk>
References: <hkm5j4$fib$2@ger.gmane.org>
	<ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>
	<hkmqif$i2t$1@ger.gmane.org>
	<ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
	<hkp46v$tv8$1@ger.gmane.org>
	<18e217241002080927h1a4009acodd66ec735a64d31a@mail.gmail.com>
	<20100208173959.GI26844@xora-build.xora.org.uk>
Date: Mon, 8 Feb 2010 09:47:21 -0800
Message-ID: <18e217241002080947t10149749q5a40117c2f051470@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 08 Feb 2010 17:49:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 8, 2010 at 9:40 AM, Graeme Gregory <dp@xora.org.uk> wrote:

> On Mon, Feb 08, 2010 at 09:27:34AM -0800, C Michael Sundius wrote:
> > I, too, am still a little unclear  regarding how the new style staging
> > works. Are you saying that we are able now to simply remove the
> do_stage()
> > function and bitbake will somehow just know which files are intended to
> be
> > staged from the install.. what if a [say header] file that was not
> > previously "installed" is required by a dependent recipe?
> >
> Your do_install should already be doing everything to make sure all needed
> headers are installed. Otherwise builds on your target device wont work.
>
> This change means that package-dev packages and staging should effetively
> be identical to build against. If there is a missing header library or
> anything else then improve the do_install()
>
> Graeme
>
> OK, yea, that makes sense.. thank you.

mike

