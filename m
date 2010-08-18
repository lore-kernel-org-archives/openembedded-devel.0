Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OllFI-00020f-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 18:12:09 +0200
Received: by eyb7 with SMTP id 7so331401eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 09:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.59.148 with SMTP id s20mr2228957wec.41.1282147903014; Wed,
	18 Aug 2010 09:11:43 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Wed, 18 Aug 2010 09:11:42 -0700 (PDT)
In-Reply-To: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
Date: Wed, 18 Aug 2010 12:11:42 -0400
Message-ID: <AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Wed, 18 Aug 2010 16:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2010 at 11:07 AM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> On Wed, Aug 18, 2010 at 4:30 AM, Martyn Welch <martyn.welch@ge.com> wrote=
:
>> On 17/08/10 16:02, Cliff Brake wrote:
>>>
>>> I think it would be very useful to have a "stable" branch that is only
>>> synchronised with dev when X number of targets build from a clean
>>> build. =A0It seems like this would be high value, with little effort.
>>> Of course there will be corner things that break, but at least a new
>>> beagleboard user can check out something and have reasonable
>>> confidence that it will build images.
>>>
>>> Does anyone have suggestions for the branch name and a reasonable
>>> subset of machines and build targets? =A0Perhaps someone is already
>>> running these clean builds? =A0At one point we had a machine at OSUOSL
>>> dedicated to this purpose, but no one ever set it up.
>>>
>>
>> So something like Debian's stable, testing and unstable[1]?
>
> That sounds good to me -- so how about org.openembedded.dev and
> org.openembedded.testing branches?
>
> I'll plan to start doing a clean build of dev every Monday for the
> Beagleboard, and then merge to testing once it builds. =A0Initial
> targets:
>
> Angstrom Distro
> beagleboard/beagleboard-linuxtag2010-demo-image
> x86/minimal-image
>
> My workstation runs a 64-bit OS, so that is probably worst case
> (compared to i686).
>
> Getting started
> (http://wiki.openembedded.net/index.php/Getting_started) points to a
> tarball for bitbake 1.8.18. =A0Is this still the recommended
> version/mechanism for new users? =A0I much prefer simply pulling bitbake
> from git.

Koen pointed me to
http://gitorious.org/angstrom/angstrom-setup-scripts/blobs/master/oebb.sh
for setting up my environment.  I also prefer pulling bitbake from
git.  Koen seems to be pulling bitbake 1.10, instead of 1.8.18.

>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


