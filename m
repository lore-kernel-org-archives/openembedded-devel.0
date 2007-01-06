Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1H3GXU-00032k-Es
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 19:45:28 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5540901ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jan 2007 10:43:40 -0800 (PST)
Received: by 10.78.81.20 with SMTP id e20mr6981528hub.1168109020072;
	Sat, 06 Jan 2007 10:43:40 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Sat, 6 Jan 2007 10:43:40 -0800 (PST)
Message-ID: <d46153c40701061043q11b67c0u1425dd8541940206@mail.gmail.com>
Date: Sat, 6 Jan 2007 12:43:40 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0b4201c731b6$537d7bd0$6e01a8c0@twilight>
MIME-Version: 1.0
References: <0b4201c731b6$537d7bd0$6e01a8c0@twilight>
Subject: Re: [oe-commits] org.oe.dev madwifi-ng: add slugos support and bump to latest snapshot
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
X-List-Received-Date: Sat, 06 Jan 2007 18:45:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/6/07, Mike (mwester) <mwester@dls.net> wrote:
> > Is there a reason why these patches are slugos-specific? I'm
> > wondering because this new version of madwifi does not build for me
> > anymore because the xscale patches are out of date. It does work if I
> > use the slugos patches though.  The wackelf patch is handy as well.
>
> I'm glad the changes are more generally useful than I originally thought -
> they are only slugos specific to keep them from "polluting" the builds for
> other devices/toolchains.
>
> What target are you building?  Perhaps, as Koen observed, there needs to be
> a different means to select the set of patches to apply, rather than using
> "slugos".  Perhaps there's a very easy way to express such a conditional:
> "if building xscale && compiler version >= 4 && soft_float" might do it?
>
> Mike (mwester)

I am building for an pxa270 with gcc 4.  It would be nice to automate
the floating point patch as that was a bit confusing, for me at least,
to figure out manually.


