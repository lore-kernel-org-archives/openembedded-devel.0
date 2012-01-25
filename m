Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rq76C-0003z2-2b
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:57:32 +0100
Received: by lags15 with SMTP id s15so3169232lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GOLnKm+NktlvMohgnGCfMyiIp9UY5roSWur2o3xAlEM=;
	b=DsZDnLDYh+WBmhniBq/BR3CwaNbcNjDtXm2HF8n7mA0UK1vMh5P2BSNbtI0jRbY4Kf
	Dx+T+4L2sd9fthGFHNByYrWhBlnC6nCoNiV0vNxP4GL3t7g3ZH0MqjcuFbDFwdvtk/SE
	VkuXfBsjF0+3pWD8Bu7AqGnJ1Y7y6sYuw7MpM=
Received: by 10.112.101.34 with SMTP id fd2mr4553725lbb.16.1327513785331; Wed,
	25 Jan 2012 09:49:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 09:49:14 -0800 (PST)
In-Reply-To: <1592899.mTy93uB97i@helios>
References: <1592899.mTy93uB97i@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 09:49:14 -0800
Message-ID: <CAMKF1spT9TgXmqQq-D+r1jnoXuv_+koPs_Rr=VhVzZkro5V1Bw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 17:57:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 4:48 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> As I see it, meta-oe is trying provide the following:
>
> =C2=A01) Additional recipes that are not in OE-Core
>
> =C2=A02) Additional functionality for OE-Core recipes that we can't enabl=
e in OE-
> Core itself (e.g. enabling postgres support in Qt) - mostly just a side-e=
ffect
> of #1
>
> =C2=A03) A place to preserve old versions of recipes that have been remov=
ed from
> OE-Core in favour of newer versions
>
> =C2=A04) Newer less-well tested versions of recipes

meta-oe was started to fill in gaps that oe-core would have for
existing oe users
since oe-core will not have all required functionality and so distros
could migrate
to using oe-core and not loose the bells and whistles they already have.
Plus its an umbrella layer which has many layers underneath.

However the problems it sees right now are that there are pieces which
could be considered
distro specific and ones, the new untested recipes should not be an
issue if they are pinned
properly. recipes that move our of oe-core I agree should be hosted in
a meta-deprecated or somesuch

I am happy to move out toolchain bits as well into a separate layer
under meta-openembedded umbrella
that will clarify it a bit and should not be a big hassle.

I think real issue people suffer from is 2 and the duplicate recipes
in meta-oe which has different configuration
in oe-core.

So meta-oe meta-toolchain meta-deprecated could be created now we need
to find maintainer for these layers.


All said if it was possible to handpick versions from layers and use
bitbake -g output pn-depends.dot
to generate some manifest so indicate which recipe is being picked
from a set of recipes from different layers would be helpful.
since there always will be some duplicate recipes no matter what.


