Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJY8p-0006Ao-Sf
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 18:51:31 +0100
Received: by nf-out-0910.google.com with SMTP id h3so166006nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 09:51:38 -0800 (PST)
Received: by 10.78.170.17 with SMTP id s17mr7770274hue.35.1201542697907;
	Mon, 28 Jan 2008 09:51:37 -0800 (PST)
Received: from widy.localdomain ( [88.231.77.184])
	by mx.google.com with ESMTPS id z32sm2239123hub.25.2008.01.28.09.51.36
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 09:51:37 -0800 (PST)
Date: Mon, 28 Jan 2008 20:03:03 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080128200303.1be820a4@widy.localdomain>
In-Reply-To: <74d0deb30801280720refc4d65mef492a4a82258b98@mail.gmail.com>
References: <479D9AA9.8020704@student.utwente.nl>
	<20080128144821.1b6f2741@widy.localdomain>
	<74d0deb30801280720refc4d65mef492a4a82258b98@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 17:51:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jan 2008 16:20:34 +0100
"pHilipp Zabel" <philipp.zabel@gmail.com> wrote:

[]
> > Hm, but why that file is in .dev branch at all? What was idea of
> > removing 2007 .conf and leaving preferred-versions? Doing a grep,
> > it is referenced only by angstrom-2007-for-openmoko.inc, so
> > shouldn't it be merged there or renamed to make it clear that it
> > relates more to openmoko?
> >
> > Alternatively, maybe indeed rename it to 2008 and start using right
> > away, as there're funky downgrades happen in 2008 already (abiword).
> 
> Or maybe fix those funky downgrades? (Or do both.)

Sure, I'm all for it too ;-).

> I'm not convinced keeping DEFAULT_PREFERENCE="-1" in some recipes
> forever just because some legacy distro once used that mechanism to
> 'select' an older version, when the newer version clearly works (or at
> least is selected by angstrom-2007-preferred-versions.inc).

It would be nice that someone did some explicit confidence testing
before removing DEFAULT_PREFERENCE="-1", though in this case the fact
that Angstrom 2007.12 shipped with it should be enough ;-).

[]


