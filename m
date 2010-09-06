Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsegC-0001Sz-Me
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 18:36:27 +0200
Received: by iwn2 with SMTP id 2so4305890iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GizNAQ3y3bY8R7DOddpAoHo9Tbp2uW8EeXrPuH2iH2E=;
	b=UuFGLZJqT9pG4HUQDegd70Slqput0+NJdXj/ZxbpXI2Y0tYMGX7TpXAYdyWG3uWrMu
	WTqJHSFwuMZmFtkliUcA/fyrCCm/Zp0MHMhJw2EFf4nHpDOBCqoPWQ4T15f2WuXito4d
	RzUMsC62uw8mLOHJzek8eUKdxaehrGUkLQ870=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Qvkc/tYLd+SA+cwgdk1Mv3NuFNR1hhgzDIsG97tvmCfDC6E9o1LQAYhC+nSrqgJRIJ
	uwMhqJdFGLz+gr0UiRVKwak4nvqMy0Bl6GdcqKcg08Hi7PqMD020bF3Ge60ieRTfB0LG
	hpUA6ol+xlStTd/eSiM/uo6UEyZj+Cdzg6M/Y=
MIME-Version: 1.0
Received: by 10.231.182.5 with SMTP id ca5mr6533296ibb.68.1283790946226; Mon,
	06 Sep 2010 09:35:46 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 09:35:46 -0700 (PDT)
In-Reply-To: <AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
	<AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
Date: Mon, 6 Sep 2010 18:35:46 +0200
Message-ID: <AANLkTimNk1mKqHBsfW6S-KuQkbVyT8f4ajz1d8adDFcc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, heinold@inf.fu-berlin.de
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 16:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Chris Larson <clarson@kergoth.com>:
> On Mon, Sep 6, 2010 at 12:41 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> 2010/9/6 Khem Raj <raj.khem@gmail.com>:
>> > On (19/08/10 21:14), Frans Meulenbroeks wrote:
>> >> 2010/8/19 Chris Larson <clarson@kergoth.com>:
>> >> > On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
>> >> > fransmeulenbroeks@gmail.com> wrote:
>> >> >
>> >> >> Hi,
>> >> >>
>> >> >> Found this in our reicpes:
>> >> >>
>> >> >> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
>> >> >>
>> >> >
>> >> > This prepends to do_install_virtclass-native, which will then repla=
ce
>> >> > do_install when the overrides are applied. =A0This is prepending to=
 a
>> variable
>> >> > which overrides, as opposed to the other, which is a conditional
>> prepend.
>> >> > =A0The two are quite different. =A0It's unlikely that this is what =
they
>> >> > intended. =A0Far more likely that it should be changed to
>> >> > _prepend_virtclass-native.
>> >>
>> >> I have no idea what is intended and I have no dbus knowledge, so can'=
t
>> fix this.
>> >> I'll leave it to someone else to resolve this.
>> >
>> > I think the correct fix is as Chris suggested. Please go ahead and fix
>> it.
>> >
>>
>> Well I am a little bit hesitating as I am by no means an expert on the
>> dbus recipe.
>>
>> The other question that immediately popped up is:
>> If the code is wrong and no-one noticed, is it actually needed?
>>
>> The code is:
>> do_install_virtclass-native_prepend() {
>> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/dbus
>> =A0 =A0 =A0 =A0install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/db=
us
>> }
>>
>> Actually if the standard do_install needs to be changed, it generally
>> raises some alarms with me.
>> Why would we need to install something that the package normally does
>> not install?
>> (of course this could be a bug in the package, but then I would prefer
>> a patch that we also try to push upstream).
>>
>
> Agreed, that is odd. =A0If it's something that dbus using things might ne=
ed,
> why is it only prepended for the native version, and as you say, why is i=
t
> not installed by the upstream install target. =A0I'd do a git blame and f=
igure
> out who added that and ask them :)
> --

Henning,
Git blame gives your name as the person who created those lines.
Care to comment?

Frans


