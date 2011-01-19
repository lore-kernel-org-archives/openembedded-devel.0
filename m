Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfTh6-0004Q4-4z
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 09:47:08 +0100
Received: by iyj18 with SMTP id 18so575135iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 00:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=dRzx5Z9X3/aMOti3LepHIZfOh/jbomlmFVCScrWklyA=;
	b=aoFXE6xdl65rEqvStNnhpTL6fLMDypKdeF6wanRebiGVwfD+BCDhf0iuJqNmDFyKJb
	S4ykyUvbMS2HaY4VkLcPafWD57RkGNb0/tSRcKV/ACyVIybv/DFHn4hmr8RowKmUGXdy
	7qgRXa2pzorj6KuPF1AQ1iaxndgRnxiG/lhFA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kWIzXlEMBAAqnualYzx6la7Wzsb5k1JxJ3ZpjU3NOV6XidYPKshlU4ZCERvxPjVR6B
	Vgj95ihd6fJ2dQW/GnOXYyst7EEOJedQ7WhS4q7Gic4WyUJFD1qHdl9RT8SgJfxNKnZ9
	pMlZG8flNqYHJj4fnBKxID2gHgY2plQXRCD68=
MIME-Version: 1.0
Received: by 10.231.34.65 with SMTP id k1mr460444ibd.9.1295426788321; Wed, 19
	Jan 2011 00:46:28 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 00:46:28 -0800 (PST)
In-Reply-To: <AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
Date: Wed, 19 Jan 2011 09:46:28 +0100
Message-ID: <AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 08:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/18 Khem Raj <raj.khem@gmail.com>:
> On Tue, Jan 18, 2011 at 12:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> I think we also agree here. =A0But what's the rule of thumb(s) we want t=
o
>> have, to provide enough choice without too much headache? =A0As I said
>> elsewhere, .inc files should probably be used a whole lot more, to help =
with
>> the problem of recipe bugfixing and N recipes for an app with the proble=
m.
>> =A0We should probably also say that in addition to the "keep the last GP=
Lv2+
>> version around" rule of thumb we should also have a "keep the latest sta=
ble
>> release" around too. =A0But what else? =A0To use busybox as an example, =
do we
>> really need to keep 1.18.0 and 1.18.1 around when we have 1.18.2? =A0How=
 about
>> if we make the delta between the 3 be just the SRC_URI + checksums?
>
>
> Well what to keep around can not be generalized so much. It also
> depends upon the nature of releases for various packages
> some packages have a major release and then push out bug fix releases
> like busy box case you sited but there are packages
> which only do major releases which can cause compatibility hassles as
> new interfaces come and old ones are removed etc.
> so I think it has to be flexible and mostly left to package
> maintainers discretion as they know the nature of releases most but
> I like the idea of keeping one GPLv2 release around and 1 latest
> release around. If a distro pinned a version then that should
> be considered as well. It is bad to sweep underneath a distros
> pinnings. Then they have to rebuild and they get problems
> as they have to make sure that if a package bump happens then they
> should be able to define an upgrade path
>
> Sometimes newer is not always better in case of udev the size has
> increased over the time and some distro's may not like
> it and there can be many such scenarios.
>

I wholehearthy agree with the proposal that it is left to the package
maintainers discretion.
Wrt the GPLv2+ version. I suggest to reflect this in the name.
E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
samba-gplv3). Then it immediately becomes obvious why there are two
versions.
Similarly with versions that became a lot fatter over time (which imho
is a good reason to keep the old version).

Frans.


