Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GNSP7-0002Qm-Gl
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 12:55:41 +0200
Received: by py-out-1112.google.com with SMTP id i75so2841621pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 03:52:09 -0700 (PDT)
Received: by 10.35.82.4 with SMTP id j4mr12702079pyl;
	Wed, 13 Sep 2006 03:52:09 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Wed, 13 Sep 2006 03:52:09 -0700 (PDT)
Message-ID: <74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
Date: Wed, 13 Sep 2006 12:52:09 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1158139503.5540.10.camel@localhost.localdomain>
MIME-Version: 1.0
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
	<1158139503.5540.10.camel@localhost.localdomain>
Subject: Re: machine-specific udev packages
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
X-List-Received-Date: Wed, 13 Sep 2006 10:55:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/13/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2006-09-13 at 08:10 +0200, pHilipp Zabel wrote:
> > I only recently noticed that udev packages are machine specific now
> > due to the machine specific mount.blacklist file. It looks like most
> > machines blacklist the same devices, namely:
> >
> > /dev/mtdblock*
> > /dev/loop*
> > /dev/ram*
> >
> > Only spitz and slugos differ significantly.
> > (/dev/hda* on spitz, hd[a-z], sd[a-z] on slugos)
> >
> > I'd like to add /dev/mtdblock to the default mount.blacklist and
> > remove the specialization for akita, amsdelta, c7x0, h2200,
> > ipaq-pxa270 and tosa.
> >
> > Is there any good way to avoid spitz and slugos specific udev packages
> > that are only due mount.blacklist? Maybe this could be part of
> > base-files or some other package?
>
> Personally, I'd like to see several things happen. Firstly, if these
> lists are going to be machine specific, lets move them to something like
> base-files and make sure the scripts can survive without them. This
> means udev stops being machine specific. Alternatively, we create a new
> machine specific package if people don't want the extra file in
> base-files.
>
> Secondly, I'd prefer to see this change to a whitelist approach.

I agree.
It is certainly better to have udev not mount anything dynamically
unless a mount.whitelist (provided by machine specific base-files)
exists than the other way around.
I'm all for including the whitelist in base-files, are there reasons
not to do it? If so, is there perhaps another package already existing
that would fit this purpose?

> We also
> need to be more intelligent about automounting eg, not mounting /dev/hda
> when its partitioned and hda1, hda2 are present etc.

Definitely. As mount.sh grows in size and functionality, aren't we
starting to duplicate pmount?

btw,
http://www.openembedded.org/repo/org.openembedded.dev/packages/udev/files/mount.sh
returns a 403

regards
Philipp


