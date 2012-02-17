Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RyWch-0008TT-Bw
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:49:55 +0100
Received: by lahc1 with SMTP id c1so4526698lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.38.37 as permitted sender)
	client-ip=10.112.38.37; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.38.37 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.38.37])
	by 10.112.38.37 with SMTP id d5mr3954460lbk.5.1329518496771 (num_hops =
	1); Fri, 17 Feb 2012 14:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AXbbhwRM9Omvj4AQszvczlFYHriepTRH0qElUOdxARw=;
	b=aV9awImhYCiIBx3wiR8nY0HL6hse+crGjQ70c01y8zZ0A2JSTNDljwuvcY7KYYsfwV
	/fnmCuv/efnlMW5uuNYnrc0+Q2zzYYJCva+ZPlxbv4TgYeNLFdKi//E6PUKufCNvNV2P
	KWNRvPXh8Un+HxG3v6S1PTbGQanJLWJlOU2XQ=
MIME-Version: 1.0
Received: by 10.112.38.37 with SMTP id d5mr3257783lbk.5.1329518496687; Fri, 17
	Feb 2012 14:41:36 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Fri, 17 Feb 2012 14:41:36 -0800 (PST)
In-Reply-To: <20120217223604.GM5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
	<CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
	<CALbNGRQMQwGUiQRJGzF82qpBa8j3YyeFJAbi3fGkFMVMS_ZQdQ@mail.gmail.com>
	<CALbNGRREd9yBF2FkbsoBT1mJL8OBDraz-QB4=NHfp4=qCj+qWw@mail.gmail.com>
	<20120217223604.GM5822@jama.jama.net>
Date: Fri, 17 Feb 2012 23:41:36 +0100
Message-ID: <CALbNGRSLxfuh0xan_aGtROh2UFKTnKfGwify7Tk0CZq4d0yi-w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Fri, 17 Feb 2012 22:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 11:36 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Feb 17, 2012 at 11:30:38PM +0100, Andreas M=FCller wrote:
>> On Fri, Feb 17, 2012 at 11:27 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Fri, Feb 17, 2012 at 7:53 PM, Andreas M=FCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >> On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> >>> On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>> >>>> V1 -> V2:
>> >>>> [2] =A0do not check configuration variables for cross and nativesdk
>> >>>> [3] =A0rename systemd_package to systemd_generate_package_scripts
>> >>>> [6] =A0parse unit files to determine the files to pack
>> >>>> [7] =A0create warning if *-systemd package already rdepends
>> >>>> =A0 =A0 =A0it's base package
>> >>>> added in V2:
>> >>>> [8]-[20] remove obsolet systemd code from recipes (these were used =
as
>> >>>> =A0 =A0 =A0test cases)
>> >>>> [21] dhcp-(relay) test case for multiple systemd packages
>> >>>> [22] modified to start service
>> >>>
>> >>> Whole series looks good to me sofar.
>> >>>
>> >>> I'm not sure what's meant by this warning:
>> >>> WARNING:
>> >>> /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/=
gateone_git.bb:
>> >>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-syst=
emd
>> >>> WARNING:
>> >>> /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud=
9_0.5.1.bb:
>> >>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-syst=
emd
>> >>>
>> >>> I guess we should
>> >>> -SYSTEMD_PACKAGES =3D "${PN}"
>> >>> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
>> >>> with this patchset too and add ${PN}-systemd to task which pulls gat=
eone/cloud9.
>> >>>
>> >>> And I'm not sure if this change is intentional:
>> >>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;=
h=3D3d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
>> >>>
>> >>> as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, =
but
>> >>> probably won't harm if xserver-nodm-init is used only to pull
>> >>> xinit+xserver-common dependency.
>> >>>
>> >> The only 'clean' way out here I see is an additional variable
>> >> overriding automatic rdepending. How about
>> >>
>> >> SYSTEMD_RDEPENDS: If this variable is set with a list of packages, it=
s
>> >> contents are used for redepending (systemd is still added). It should
>> >> be possible to set packages outside of recipe and of course the
>> >> contents should be checked during parse. What do you think?
>> >>
>> > How about this: If systemd.bbclass detects, that
>> > RDEPENDS_${systemd-base-package} is not empty, it will only append
>> sorry I meant RDEPENDS_${SYSTEMD_PACKAGES[]}
>> > 'systemd'. So the recipe can override the automatism easily and there
>> > is no need for another variable.
>
> If it works even when RDEPENDS_${SYSTEMD_PACKAGES[]} is in recipe after
> inherit systemd then also OK.
>
Should be no problem since automatic rdepending is done in
populate_packages_prepend - but I will test different positions.

Andreas


