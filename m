Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RyWOo-00077X-6J
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:35:30 +0100
Received: by lahc1 with SMTP id c1so4514095lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:27:15 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.25.70 as permitted sender)
	client-ip=10.112.25.70; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.25.70 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.25.70])
	by 10.112.25.70 with SMTP id a6mr3885038lbg.47.1329517635515 (num_hops
	= 1); Fri, 17 Feb 2012 14:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=T6akdIr1K38ICFAcKF/moT/I0EL4w/fKVld4HTDEJ+8=;
	b=VKSQeEosGuqyAF7fs54wsBlG9qhUIPchBB3uziBEdVh//LNAFqbf9O/NXzrQa63k7d
	NJOnB+FPGybbbdiOrrRQVPHdzSzYB4rlKmN5aWDCTLzWL0kW9psAyDwzS45dpZN0IDpc
	+xKhFHWxZrcq/anZzXTC+UnODBg2kUDH1W1Z4=
MIME-Version: 1.0
Received: by 10.112.25.70 with SMTP id a6mr3220085lbg.47.1329517630561; Fri,
	17 Feb 2012 14:27:10 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Fri, 17 Feb 2012 14:27:10 -0800 (PST)
In-Reply-To: <CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120216125339.GC5822@jama.jama.net>
	<CALbNGRQyyn2Pr5_pcLk4hGfh+y65o2V93sy49KLTv8801dniNA@mail.gmail.com>
Date: Fri, 17 Feb 2012 23:27:10 +0100
Message-ID: <CALbNGRQMQwGUiQRJGzF82qpBa8j3YyeFJAbi3fGkFMVMS_ZQdQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2012 22:35:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 7:53 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Feb 16, 2012 at 1:53 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
>>> V1 -> V2:
>>> [2] =A0do not check configuration variables for cross and nativesdk
>>> [3] =A0rename systemd_package to systemd_generate_package_scripts
>>> [6] =A0parse unit files to determine the files to pack
>>> [7] =A0create warning if *-systemd package already rdepends
>>> =A0 =A0 =A0it's base package
>>> added in V2:
>>> [8]-[20] remove obsolet systemd code from recipes (these were used as
>>> =A0 =A0 =A0test cases)
>>> [21] dhcp-(relay) test case for multiple systemd packages
>>> [22] modified to start service
>>
>> Whole series looks good to me sofar.
>>
>> I'm not sure what's meant by this warning:
>> WARNING:
>> /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/gate=
one_git.bb:
>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>> WARNING:
>> /OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.=
5.1.bb:
>> it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>>
>> I guess we should
>> -SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
>> with this patchset too and add ${PN}-systemd to task which pulls gateone=
/cloud9.
>>
>> And I'm not sure if this change is intentional:
>> http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D=
3d27d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18
>>
>> as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
>> probably won't harm if xserver-nodm-init is used only to pull
>> xinit+xserver-common dependency.
>>
> The only 'clean' way out here I see is an additional variable
> overriding automatic rdepending. How about
>
> SYSTEMD_RDEPENDS: If this variable is set with a list of packages, its
> contents are used for redepending (systemd is still added). It should
> be possible to set packages outside of recipe and of course the
> contents should be checked during parse. What do you think?
>
How about this: If systemd.bbclass detects, that
RDEPENDS_${systemd-base-package} is not empty, it will only append
'systemd'. So the recipe can override the automatism easily and there
is no need for another variable.

Andreas


