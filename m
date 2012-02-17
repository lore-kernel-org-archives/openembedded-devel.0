Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RyT4F-0005cg-Gv
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 20:02:03 +0100
Received: by lahc1 with SMTP id c1so4270208lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mG8WTfOzTT4VAWZj2NkELzwCqwagtay3KdaO6VBHMSk=;
	b=oBut/ymC7BuZu4jLsEaOWVHFBkbgg+T+IboONOvjfG8rW3NtOv65C4HDp/JsZvIyAQ
	WU2r3I5TGrJhIrSoVP86rhjfxlOvGIk96+WqFo37jgfhNfLFFNUT8yuqj1H1DdurI9KA
	qU6rymqzblE86BBoTqh0WzTcElQWqBxGcLXE8=
MIME-Version: 1.0
Received: by 10.112.38.37 with SMTP id d5mr2992940lbk.5.1329504829048; Fri, 17
	Feb 2012 10:53:49 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Fri, 17 Feb 2012 10:53:49 -0800 (PST)
In-Reply-To: <20120216125339.GC5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
Date: Fri, 17 Feb 2012 19:53:49 +0100
Message-ID: <CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2012 19:02:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>> V1 -> V2:
>> [2] =A0do not check configuration variables for cross and nativesdk
>> [3] =A0rename systemd_package to systemd_generate_package_scripts
>> [6] =A0parse unit files to determine the files to pack
>> [7] =A0create warning if *-systemd package already rdepends
>> =A0 =A0 =A0it's base package
>> added in V2:
>> [8]-[20] remove obsolet systemd code from recipes (these were used as
>> =A0 =A0 =A0test cases)
>> [21] dhcp-(relay) test case for multiple systemd packages
>> [22] modified to start service
>
> Whole series looks good to me sofar.
>
> I'm not sure what's meant by this warning:
> WARNING:
> /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/gateo=
ne_git.bb:
> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING:
> /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.5=
.1.bb:
> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>
> I guess we should
> -SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> with this patchset too and add ${PN}-systemd to task which pulls gateone/=
cloud9.
>
> And I'm not sure if this change is intentional:
> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D3=
d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
>
> as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
> probably won't harm if xserver-nodm-init is used only to pull
> xinit+xserver-common dependency.
>
The only 'clean' way out here I see is an additional variable
overriding automatic rdepending. How about

SYSTEMD_RDEPENDS: If this variable is set with a list of packages, its
contents are used for redepending (systemd is still added). It should
be possible to set packages outside of recipe and of course the
contents should be checked during parse. What do you think?

Andreas


