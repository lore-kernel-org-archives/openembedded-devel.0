Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RG3LL-00059B-Az
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 08:40:08 +0200
Received: by vwe42 with SMTP id 42so87543vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=H32dxzAXtHt309xok+vjcCbT0VbyjNy6EbpIbS8R2eo=;
	b=aqTDe7ZfdefCDnocRstticJubCOQynKH1zCZkZ/YMlfs/C5qLFsfMnHOU4L5lmMN9D
	QyWemeNcaox3eE8/jTfL8F8yRsGFAtFcp9PowKTitx6yb/zA28gV3ytwxqzy2Yp8+jVL
	QCJZghY3wbNMqMq41H94XG61gUmAwWyBm8CrQ=
MIME-Version: 1.0
Received: by 10.52.184.106 with SMTP id et10mr931189vdc.107.1318919657006;
	Mon, 17 Oct 2011 23:34:17 -0700 (PDT)
Received: by 10.52.186.162 with HTTP; Mon, 17 Oct 2011 23:34:16 -0700 (PDT)
In-Reply-To: <4E9CA2D1.2000304@gmail.com>
References: <20111015185155.DA982101FE@opal>
	<CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
	<CAMKF1sqEQtqCMi+p6yEArDWpiGGS2Du1ca34ROtkFAzdc-X3MA@mail.gmail.com>
	<CACW_hTYw8eSDh6z_Q+v6aK9CoF-9D5Ba0+fp4beuLuA9oi7NAw@mail.gmail.com>
	<4E9CA2D1.2000304@gmail.com>
Date: Tue, 18 Oct 2011 08:34:16 +0200
Message-ID: <CACW_hTaYnTDQOvhVzGUbN7ag6+ge=nr328LHnxLJutLUvphdkw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Khem Raj : binutils-cross: Sync with oe-core
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
X-List-Received-Date: Tue, 18 Oct 2011 06:40:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/10/17 Khem Raj <raj.khem@gmail.com>

> On 10/16/2011 11:35 PM, Frans Meulenbroeks wrote:
>
>>
>>
>> I feel if a distro or bsp needs a version of a package that is older than
>> the oe-core one, it should be stored in the distro or bsp layer.
>> Or is meta-oe also wanting to keep binutils 18.50? In oe classic this is
>> used by the nios2 hw (and afaik there is no newer binutils supporting
>> nios2)? I'd say if some layer needs older versions it is up to them.
>>
>>
> This is a bit different when a version is retired from oe-core there might
> be more than one bsp using it therefore it would be more beneficial to keep
> it in a common layer
>

The risk is that over time this common layer ends up being a repo with
several versions of a recipe, and for some of these we end up having no idea
whether or not they are used.
We've seen in oe classic to what that leads. Here, with layers being
distributed it becomes even more vague what is used and what not.
I'd say if oe core moves forward then a layer that is not ready to move to
that new version should either keep a local copy or pin at a hash of oe-core
before the recipe was removed.
BTW if I recall correctly it was discussed to have an overlap period after
introducing a new version before the old one is deprecated. Not 100% sure if
that was indeed decided that way.

>
>  What we are lacking here is a policy on purpose/goal of meta-oe and what
>> goes in (and what not).
>>
>
> This has been discussed quite a bit when we decided to move to layered
> structure. meta-oe infact is an umbrella of layers and each layer can have
> it own development policies.
>

Guess your are mixing up meta-openembedded (
http://git.openembedded.org/meta-openembedded/tree/) and meta-oe  (
http://git.openembedded.org/meta-openembedded/tree/meta-oe)
(and as far as I know the policys on the common stuff (assuming we see
meta-oe or meta-openembedded as common stuff) is not really documented
afaik).

Btw I feel it does not really help to have some gnome stuff in
meta-oe/recipes-gnome and other in meta-gnome.

Frans

