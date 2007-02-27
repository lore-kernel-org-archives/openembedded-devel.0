Received: from [64.233.184.236] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1HM5ak-0006LV-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Feb 2007 17:54:18 +0100
Received: by wr-out-0506.google.com with SMTP id i21so707618wra
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2007 08:54:17 -0800 (PST)
Received: by 10.115.78.1 with SMTP id f1mr1187468wal.1172595255617;
	Tue, 27 Feb 2007 08:54:15 -0800 (PST)
Received: by 10.114.39.6 with HTTP; Tue, 27 Feb 2007 08:54:15 -0800 (PST)
Message-ID: <d46153c40702270854k14f92b56x1c31eafdbea7b6e2@mail.gmail.com>
Date: Tue, 27 Feb 2007 10:54:15 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45D266A3.4040102@whitby.id.au>
MIME-Version: 1.0
References: <45D1574C.8090009@whitby.id.au> <20070214012158.GA906@twibble.org>
	<45D266A3.4040102@whitby.id.au>
Subject: Re: RFC: madwifi-ng patch rationalisation and version update
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
X-List-Received-Date: Tue, 27 Feb 2007 16:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/13/07, Rod Whitby <rod@whitby.id.au> wrote:
> Jamie Lenehan wrote:
> > On Tue, Feb 13, 2007 at 04:44:36PM +1030, Rod Whitby wrote:
> > [...]
> >> We also intend updating madwifi-ng to a later snapshot (e.g.
> >> r2100-20070210), cause the current version won't build against 2.6.20
> >> due to changes in the INIT_WORK kernel macro.
> >
> > I've been waiting for them to fix this for a while now so I can move
> > forward to newer kernels - so I definitely want the newer verison.
> >
> > I think it'd would be a good idea to remove all the older versions as
> > well, apart from perhaps r1844 which corrosponds to the last actual
> > madwifi release (0.9.2.1). This should help get us back to one set of
> > patches as well since in version r1844 they changed the file that arm
> > is patching, requiring different patches for r1844 and newer.
> >
> > Actually looking at it now it appears as if someone patched the
> > version in the files directory for a newer version so the older
> > versions (prior to r1844) won't build anymore anyway (patching will
> > fail). So the older versions of madwifi-ng and all the version
> > specific subdirs can all go as well.
>
> OK, I'll do this too.
>
> So the only madwifi-ng versions remaining will be
> madwifi-ng_r1844-20061208.bb and madwifi-ng_r2100-20070210.bb and they
> will use common patches from the files directory.
>
> I'll let someone else deal with madwifi-modules ...
>
> -- Rod

This cleanup appears to have been repealed.  Is there a reason for the change?


