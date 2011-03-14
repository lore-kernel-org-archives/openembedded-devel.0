Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PzCtv-0006xD-OP
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 19:53:56 +0100
Received: by iyb26 with SMTP id 26so5423296iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=gNtvyDl0LjLM4IRYULydcbP8Di67mDHDYuWNMVby4lo=;
	b=i0sM6XI+LE+nN84z40CDE6Sdntob2EsMTn9HH/M48JN9XkrJ+aWoa+ZOFNwtV8Ee6z
	OAvUwqSKldWMsnxtcvtKJAb2gCPSlu72xFTWan3lO6wz0BhebCbPwy8gLXoZhyCf24Dj
	mgyPSGrOWPGWqUMTC/bgiEkNxE2vfRifmKQWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jY3MpeSg3GATSxBDS0xGqKkdBOSn5yo4TkF3RbuwsrHT1DWQJYdHkITlrDfboYf7+w
	KkRIbxOrdF+JCryehb8/oD59pW7rlVWkUfghebxP1Y6srmNYIwhXV4xbzKrQZA/xWRoi
	G4/lldGX17B43l2m8RYU2yLLGxyxn53n8iDCU=
MIME-Version: 1.0
Received: by 10.231.177.193 with SMTP id bj1mr6089774ibb.145.1300128733845;
	Mon, 14 Mar 2011 11:52:13 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Mon, 14 Mar 2011 11:52:13 -0700 (PDT)
In-Reply-To: <20110314163639.GA3375@jama.jama.net>
References: <4D7E3B34.5050100@mentor.com>
	<AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>
	<20110314163639.GA3375@jama.jama.net>
Date: Mon, 14 Mar 2011 19:52:13 +0100
Message-ID: <AANLkTi=VL3kWZwKnzEao5iDUEA_F_-fMkx=m0astpSG3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Mon, 14 Mar 2011 18:53:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/14 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Mar 14, 2011 at 09:09:52AM -0700, Chris Larson wrote:
>> On Mon, Mar 14, 2011 at 8:58 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> > The TSC has discussed this item at the request of the community and ha=
s come
>> > up with the following recommendation which we are looking for feedback
>> > (positive/negative/neutral) before putting this up on the wiki.
>> >
>> > -------- Original Message --------
>> > Subject: Re: Discussion: Version retention policy in oe-core
>> > Date: Thu, 24 Feb 2011 15:05:25 -0600
>> > From: Mark Hatle <mark.hatle@windriver.com>
>> > Reply-To: tsc@lists.openembedded.org
>> > Organization: Wind River Systems
>> > To: <tsc@lists.openembedded.org>
>> >
>> > This is a follow on to Tom's original post. =A0The attempt is to merge=
 his
>> > original thoughts with my own.
>> >
>> > ---
>> >
>> > As has been discussed in a few places, there needs to be a policy that
>> > is followed about how long to retain (or when to replace) old recipes
>> > within the oe-core repository as well as what to do with older version=
s of
>> > things.
>> >
>> > It is expected that OE will have a related meta-oe or similar layers w=
hich
>> > older components can be moved into while they are still useful and des=
irable
>> > to maintain. =A0However, these will be alternative versions and not th=
e "core"
>> > version any longer.
>> >
>> > Within the oe-core we can divide the components into two classes. Crit=
ical
>> > infrastructure components and standard components. =A0The critical com=
ponents
>> > include the toolchain, autotools, and key libraries. =A0Virtually ever=
ything
>> > else fits into the standard components bucket.
>> >
>> > We also have use cases such as:
>> > - Upstream provides provides support (new releases) and clear guidelin=
es
>> > on upgrading for version 4.0 (current), version 3.8 (previous and stab=
le)
>> > and version 3.6 (further previous, stable). =A0Upstream is also workin=
g on
>> > version 4.1.x (unstable, active development).
>> > - Upstream provides no clear policy about what's supported other than
>> > current.
>> > - Community standards indicate a specific version should be used rathe=
r then
>> > the latest for some reason
>> > - An architecture requires specific versions.
>> >
>> > We would like to propose the following:
>> >
>> > The goal of oe-core is to remain a stable, yet up-to-date set of softw=
are
>> > that forms the foundation of the Open Embedded world. =A0While not eve=
ryone
>> > will be able to agree on a broad definition of "stable, yet up-to-date=
" the
>> > following guidelines will help define the rules for the inclusion and/=
or
>> > replacement of different versions into the oe-core.
>> >
>> > First, each of the packages need to be divided into two categories: Cr=
itical
>> > Infrastructure and Core components. =A0If an item is neither of these,=
 then
>> > the oe-core is likely the wrong place for the component.
>> >
>> > By default we want to use the latest stable version of each component.=
 The
>> > latest stable version of each component is defined by the component's
>> > upstream. When there is no clear policy from upstream we simply have t=
o
>> > apply best judgment.
>> >
>> > There of course will be exceptions to the default policy. =A0However, =
when an
>> > exception occurs it must be clearly stated and documented when and why=
 we
>> > did not use the latest stable version -- or why we may have multiple
>> > versions available of a given component. =A0This will allow us to reev=
aluate
>> > the exceptions on a timely basis and decide the exception is no longer
>> > reasonable.
>> >
>> > Most of these exceptions will be located in the critical infrastructur=
e
>> > components, specifically the toolchains. =A0In many cases we will need=
 to
>> > support variants of these components either for stability or architect=
ural
>> > reasons.
>> >
>> > Another common exception is to meet specific policy or compatibility
>> > objectives within the system, such as the need to support both GPLv2 a=
nd
>> > GPLv3 versions of selected components.
>> >
>> > If multiple versions are provided, usually the latest stable version w=
ill be
>> > preferred, however best judgment will be used to determine the preferr=
ed
>> > version.
>> >
>> > As existing versions of removed, if they are still desirable, they sho=
uld be
>> > moved into meta-oe or a suitable layer.
>> >
>> > We also have the issue of upcoming development versions it is suggeste=
d that
>> > upcoming development versions of software be worked on in specific
>> > development layers until they have reach sufficient maturity to be
>> > considered stable and ready for inclusion in oe-core.
>> >
>> > Related to this are:
>> > - We want to encourage distributions that are tracking the latest to t=
ry and
>> > stay with the latest.
>> > - We want to encourage recipes which people are interested in to be
>> > maintained long term to be maintained, long term, in meta-oe.
>> > - We want to encourage distributions to work with and add to / maintai=
n the
>> > core rather than deciding we have too frequent of an unhelpful churn (=
which
>> > is to say 4.0.1 -> 4.0.2 of $whatever is good, 4.0.1 -> 4.4.3 of $what=
ever
>> > is not).
>>
>> This feedback probably won't be helpful, but this seems like a sane
>> plan all around to me.
>
> I agree
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>

Tom, TSC,

Overall this seems like a fine proposal to me. Thanks a lot for drafting it=
.

There are a few minor suggestions I would like to make.

First is to define which components are considered to be critical, as
for what is non-critical for one person might be critical for someone
else.
Leaving this open is bound to lead to discussion and disagreement
later on, perhaps better be clear about it upfront.

Second is the location of deprecated recipes.
As far as I know we haven't clearly defined what goes into meta-oe.
I have assumed that this is one layer that will (also) contain recipes
that are not part of oe-core.For example a recipe for a UPnP server or
a CD recording program.
Mixing deprecated oe-core and mainline non-core recipes in the same
tree will probably lead to confusion and perhaps even to people trying
to upgrade deprecated recipes in meta-oe.
In order to avoid that confusion is is probably better to give the
deprecated oe-core recipes their own layer (e.g. old-oe-core).

Apart from the above I feel it would be good if the TSC would discuss
the location of OE recipes that are non-core, and also draft a
retention policy for that location.
This might of course be similar or identical to the oe-core one.

Best regards, Frans


