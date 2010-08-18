Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OlkEe-0002rx-Rz
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 17:07:25 +0200
Received: by fxm6 with SMTP id 6so344039fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=LN6iahyoD7PACjQRDc+pzdpK5b3q08xPieZwz3X+CkI=;
	b=WlSFOGEVBXuy5tP7Tx8kAwbgbZ8WvtdtOYOhTF4KV9ENIrLgf/g40usJxb18MhXfIA
	sXpDB/9HPWpBwgrdFm9916JXKkeHAUTbB7XY+UyAoyzXfOmC9mgvyWGVN03IrTeNggBF
	437nntCSDe0FSig69y9pUvyS06Du9C3NDSWH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gOkGz2R/XrK3UN5azUHF1v1gQRKjGJKc92w401+CSHzKlAci0q0D17gOcO0vx4SA5V
	RnE6AN0mImsKMM71ahaRjp3e9B1dH67moJaBGA4KMMNWxvYC3WI9JYdbmiMYgsTb8JhI
	kS66ui4Upcl2Hv3/l5M/8u4q/YBTcI7+YKj8c=
MIME-Version: 1.0
Received: by 10.216.74.82 with SMTP id w60mr2087068wed.106.1282144025132; Wed,
	18 Aug 2010 08:07:05 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Wed, 18 Aug 2010 08:07:03 -0700 (PDT)
Date: Wed, 18 Aug 2010 11:07:03 -0400
Message-ID: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Wed, 18 Aug 2010 15:07:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2010 at 4:30 AM, Martyn Welch <martyn.welch@ge.com> wrote:
> On 17/08/10 16:02, Cliff Brake wrote:
>>
>> I think it would be very useful to have a "stable" branch that is only
>> synchronised with dev when X number of targets build from a clean
>> build. =A0It seems like this would be high value, with little effort.
>> Of course there will be corner things that break, but at least a new
>> beagleboard user can check out something and have reasonable
>> confidence that it will build images.
>>
>> Does anyone have suggestions for the branch name and a reasonable
>> subset of machines and build targets? =A0Perhaps someone is already
>> running these clean builds? =A0At one point we had a machine at OSUOSL
>> dedicated to this purpose, but no one ever set it up.
>>
>
> So something like Debian's stable, testing and unstable[1]?

That sounds good to me -- so how about org.openembedded.dev and
org.openembedded.testing branches?

I'll plan to start doing a clean build of dev every Monday for the
Beagleboard, and then merge to testing once it builds.  Initial
targets:

Angstrom Distro
beagleboard/beagleboard-linuxtag2010-demo-image
x86/minimal-image

My workstation runs a 64-bit OS, so that is probably worst case
(compared to i686).

Getting started
(http://wiki.openembedded.net/index.php/Getting_started) points to a
tarball for bitbake 1.8.18.  Is this still the recommended
version/mechanism for new users?  I much prefer simply pulling bitbake
from git.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


