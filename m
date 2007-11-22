Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1Iv6E6-000732-Bx
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 08:11:54 +0100
Received: by wr-out-0506.google.com with SMTP id c30so2284355wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 23:09:34 -0800 (PST)
Received: by 10.142.76.4 with SMTP id y4mr2288277wfa.1195701347871;
	Wed, 21 Nov 2007 19:15:47 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Wed, 21 Nov 2007 19:15:47 -0800 (PST)
Message-ID: <b6ebd0a50711211915x5936ab36haa009ef71774798e@mail.gmail.com>
Date: Wed, 21 Nov 2007 20:15:47 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <14810200560.20071122022819@vanille-media.de>
MIME-Version: 1.0
References: <20071119120819.GA17788@lenovo>
	<C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
	<4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
	<14810200560.20071122022819@vanille-media.de>
X-Google-Sender-Auth: 808ec72b8bffcd59
Subject: Re: The truth about OE team being afraid of 'make' (was: Getting Started -Makefile)
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
X-List-Received-Date: Thu, 22 Nov 2007 07:11:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 21, 2007 6:28 PM, Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
> Mike (mwester) wrote:
> > I ask the OE team why are they are philosophically opposed to driving
> > bitbake with make?
>
> Ok, seems now's a good time to tell you. Because that's where we came
> from back in 2002 -- from a Makefile-centric buildroot called
> OpenZaurus that didn't scale at all (which is inherent to the
> buildroot approach).
>
> We are so glad that by inventing OpenEmbedded and BitBake we have left
> this stoneage of building distributions behind.
>
> Getting back to the 'make' command reminds us of the painful past before we had
> OE.
>
> Then again, it could be just a paranoia of me, Chris Larson, and
> Holger Schurig ;)

GNU Make has some features now which it did not have then, that could
have made it slightly less painful to use for our work, but naturally
it wouldn't be worth going back to a more limited base now.  Back
then, it didn't support things like dependency on a file's existance
only, avoiding rebuilds when timestamps change, and there was no
'eval' to facilitate on the fly rule generation.  To summarize, make
just wasn't suitable back then, and it would be a great deal of work
to go back to it now, and it'd still be less flexible than what we
have today, and would suffer from portability headaches with make
versions.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


