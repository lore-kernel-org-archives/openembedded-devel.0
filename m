Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PzAa6-0000ik-KJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 17:25:19 +0100
Received: by iwn10 with SMTP id 10so5296898iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=Tn6JG0yoKNI/T9hOxpIPvGxQymR7iLuW38QxMW/wc8U=;
	b=n8axB41+WHhgpnxTtK977JPtdWhuwTJB4R8+JxaUSAHMQz43KP5MHUHcEqJFrmFmpt
	aD/+hfB4RpL0ani98z0WpNEANeoZngtC6Tye80cVp2TYX/Zn4HlpEJXiqFjohDBAl7xb
	H2AKfL9qRK7BXi/JMWD7nO5az+sidGr06jbcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=khpEIX6FGG/rOR2pb7wXtYXBb7P2GBx6SmcW5PL8EPHoZqapYX1Ze7u7KmWCjP9idA
	cKwkQi8Rkza+yxvIr1Izzdj/X+ZQEvkme4xDjRo3ej39NjQyiE9nFkb1HTXx+mLfkA1/
	mCYJxKUGHSGvTY+R7aINEMwmlIjfQPbe+QM1s=
Received: by 10.42.243.130 with SMTP id lm2mr9198224icb.401.1300119334296;
	Mon, 14 Mar 2011 09:15:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Mon, 14 Mar 2011 09:09:52 -0700 (PDT)
In-Reply-To: <4D7E3B34.5050100@mentor.com>
References: <4D7E3B34.5050100@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 14 Mar 2011 09:09:52 -0700
X-Google-Sender-Auth: 5abIECx-f9htzwqI9G9dbIymeOw
Message-ID: <AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Mar 2011 16:25:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2011 at 8:58 AM, Tom Rini <tom_rini@mentor.com> wrote:
> The TSC has discussed this item at the request of the community and has c=
ome
> up with the following recommendation which we are looking for feedback
> (positive/negative/neutral) before putting this up on the wiki.
>
> -------- Original Message --------
> Subject: Re: Discussion: Version retention policy in oe-core
> Date: Thu, 24 Feb 2011 15:05:25 -0600
> From: Mark Hatle <mark.hatle@windriver.com>
> Reply-To: tsc@lists.openembedded.org
> Organization: Wind River Systems
> To: <tsc@lists.openembedded.org>
>
> This is a follow on to Tom's original post. =C2=A0The attempt is to merge=
 his
> original thoughts with my own.
>
> ---
>
> As has been discussed in a few places, there needs to be a policy that
> is followed about how long to retain (or when to replace) old recipes
> within the oe-core repository as well as what to do with older versions o=
f
> things.
>
> It is expected that OE will have a related meta-oe or similar layers whic=
h
> older components can be moved into while they are still useful and desira=
ble
> to maintain. =C2=A0However, these will be alternative versions and not th=
e "core"
> version any longer.
>
> Within the oe-core we can divide the components into two classes. Critica=
l
> infrastructure components and standard components. =C2=A0The critical com=
ponents
> include the toolchain, autotools, and key libraries. =C2=A0Virtually ever=
ything
> else fits into the standard components bucket.
>
> We also have use cases such as:
> - Upstream provides provides support (new releases) and clear guidelines
> on upgrading for version 4.0 (current), version 3.8 (previous and stable)
> and version 3.6 (further previous, stable). =C2=A0Upstream is also workin=
g on
> version 4.1.x (unstable, active development).
> - Upstream provides no clear policy about what's supported other than
> current.
> - Community standards indicate a specific version should be used rather t=
hen
> the latest for some reason
> - An architecture requires specific versions.
>
> We would like to propose the following:
>
> The goal of oe-core is to remain a stable, yet up-to-date set of software
> that forms the foundation of the Open Embedded world. =C2=A0While not eve=
ryone
> will be able to agree on a broad definition of "stable, yet up-to-date" t=
he
> following guidelines will help define the rules for the inclusion and/or
> replacement of different versions into the oe-core.
>
> First, each of the packages need to be divided into two categories: Criti=
cal
> Infrastructure and Core components. =C2=A0If an item is neither of these,=
 then
> the oe-core is likely the wrong place for the component.
>
> By default we want to use the latest stable version of each component. Th=
e
> latest stable version of each component is defined by the component's
> upstream. When there is no clear policy from upstream we simply have to
> apply best judgment.
>
> There of course will be exceptions to the default policy. =C2=A0However, =
when an
> exception occurs it must be clearly stated and documented when and why we
> did not use the latest stable version -- or why we may have multiple
> versions available of a given component. =C2=A0This will allow us to reev=
aluate
> the exceptions on a timely basis and decide the exception is no longer
> reasonable.
>
> Most of these exceptions will be located in the critical infrastructure
> components, specifically the toolchains. =C2=A0In many cases we will need=
 to
> support variants of these components either for stability or architectura=
l
> reasons.
>
> Another common exception is to meet specific policy or compatibility
> objectives within the system, such as the need to support both GPLv2 and
> GPLv3 versions of selected components.
>
> If multiple versions are provided, usually the latest stable version will=
 be
> preferred, however best judgment will be used to determine the preferred
> version.
>
> As existing versions of removed, if they are still desirable, they should=
 be
> moved into meta-oe or a suitable layer.
>
> We also have the issue of upcoming development versions it is suggested t=
hat
> upcoming development versions of software be worked on in specific
> development layers until they have reach sufficient maturity to be
> considered stable and ready for inclusion in oe-core.
>
> Related to this are:
> - We want to encourage distributions that are tracking the latest to try =
and
> stay with the latest.
> - We want to encourage recipes which people are interested in to be
> maintained long term to be maintained, long term, in meta-oe.
> - We want to encourage distributions to work with and add to / maintain t=
he
> core rather than deciding we have too frequent of an unhelpful churn (whi=
ch
> is to say 4.0.1 -> 4.0.2 of $whatever is good, 4.0.1 -> 4.4.3 of $whateve=
r
> is not).

This feedback probably won't be helpful, but this seems like a sane
plan all around to me.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


