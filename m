Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GYlMx-0004t4-Af
	for openembedded-devel@openembedded.org; Sat, 14 Oct 2006 17:24:11 +0200
Received: by nf-out-0910.google.com with SMTP id o25so1889712nfa
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Oct 2006 08:17:37 -0700 (PDT)
Received: by 10.78.188.19 with SMTP id l19mr5289911huf;
	Sat, 14 Oct 2006 08:17:36 -0700 (PDT)
Received: by 10.78.196.12 with HTTP; Sat, 14 Oct 2006 08:17:36 -0700 (PDT)
Message-ID: <74d0deb30610140817w417b787dpa80f702436bf136a@mail.gmail.com>
Date: Sat, 14 Oct 2006 17:17:36 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20061014151143.GA15562@hovland.org>
MIME-Version: 1.0
References: <698474498.20061013195107@gmail.com>
	<20061013173454.GA25324@mage.jpl.nasa.gov>
	<137495124.20061014162300@gmail.com>
	<20061014151143.GA15562@hovland.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 15:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/14/06, Erik Hovland <erik@hovland.org> wrote:
> On Sat, Oct 14, 2006 at 04:23:00PM +0300, Paul Sokolovsky wrote:
> > > On Fri, Oct 13, 2006 at 07:51:07PM +0300, Paul Sokolovsky wrote:
> > >> 2. "pxa" there is misleading, as 2.6 tree supports different
> > >> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
> > >> (Samsung) devices. To the various degrees, but that's improving.
> >
> > > Technically, the pxa is not misleading per se. That recipe only builds a
> > > kernel for pxa devices.
> >
> >   Well that's why I brought this to discussion. By "only builds" do
> > you mean the current state of affairs or some inherent constraint on
> > that recipe?
>
> An inherent constraint of the recipe is that it will build a kernel
> which will only run on h3900 and h5400, which are pxa devices, h3600
> cannot run a kernel built with the recipe. That is traditionally why we
> named the recipes -pxa and -sa.

How is this an inherent constraint? Looking at a diff between
handhelds-pxa-2.6_cvs.bb and handhelds-sa-2.6_cvs.bb I don't see
anything architecture specific?

regards
Philipp


