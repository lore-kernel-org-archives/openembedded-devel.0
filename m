Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RE5qy-0004qD-1X
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 22:56:40 +0200
Received: by qadc1 with SMTP id c1so960259qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vHRuwGmztHVFRoSD3dRqDI2tZzZdnZaV4okBIpeRE48=;
	b=XUJ5F4H+9UCbAQXfp7I2ZtR4TP7b5xMyiEhy8LqmCMJfAK2iCSvrcuT1parF6G+h4p
	jzHGNexcq6ytcWDtqpNMbTsSqTZWIQbpDM2wthFssnBLYzH+wvvCEOm/Xhx4X2JMmjSI
	nqOaVT6J3ttnmAtSj1ro3RcTo2FXRzWdRm9+8=
Received: by 10.68.44.134 with SMTP id e6mr3655590pbm.5.1318452651064; Wed, 12
	Oct 2011 13:50:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.58.168 with HTTP; Wed, 12 Oct 2011 13:50:21 -0700 (PDT)
In-Reply-To: <CADWjqk598H9nE+StShm26eyWYOU-=W3ko-Nkgw1CAuxpjtdDWw@mail.gmail.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
	<CADWjqk598H9nE+StShm26eyWYOU-=W3ko-Nkgw1CAuxpjtdDWw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2011 13:50:21 -0700
Message-ID: <CAMKF1srLEO=1s-56H=fbhYEUtA+qU4fR-u6qXVhF+dj+oau+Hw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 20:56:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 1:46 PM, dashesy <dashesy@gmail.com> wrote:
> On Wed, Oct 12, 2011 at 6:22 AM, mgundes <mgcse@hotmail.com> wrote:
>> =C2=A0 Hi,
>>
>> =C2=A0 I think one of the big issue with OE is build time. It does every=
thing
>> for you, so that it takes too much times. I want to minimize build time =
and
>> realized that OE creates ipkgs for almost every package. If there is a w=
ay
>> to prevent creation of ipkgs it would be really good for me. In my opini=
on,
>> it would be fine for other people too since usually rootfs directory is
>> enough and ipkgs are not frequently used directly by developers.
>>
> Just as a suggestion:
> 1- You can start with a bare minimum rootfs then run it under qemu, or
> even on the board itself
> =C2=A0 =C2=A0Then you can use opkg to download/upgrade from the repositor=
ies,
> or remove what you do not need. I guess this is the fastest method.
> =C2=A0 =C2=A0I am thinking of putting together a build environment based =
on
> user-mode qemu and opkg.
> =C2=A0 =C2=A0I use fedora's kickstart files to build my desktop rootfs. T=
hat
> would be great to have a similar approach using qemu and opkg.

have look at aboriginal linux before you start.
http://landley.net/aboriginal/

> =C2=A0 =C2=A0Specially for most people they do not need to compile the pa=
ckages
> themselves and the repositories are enough, they only need to compile
> a few packages of their own.
> 2- You can only bitbake meta-toolchain to get a gcc with cross
> compilation capability, then use that to build any package that you
> want directly from sources without relying on OE.
> =C2=A0 =C2=A0This is what I do myself right now, but you need to make sur=
e the
> dependencies are met.
>
> If the dependencies of packages are correct and to the bare minimum
> required (which should becase or it should be filed as a bug), OE will
> be a better approach, it takes care of dependencies for you.
> The only problem I have is that OE is hugely customizable, and takes
> time to learn all different tricks to get exactly what I want in my
> rootfs.
> I am learning OE, for me I try to follow the mailing lists to learn
> non-out-dated information as the first thing I learned was to that
> most wikis are way outdated :)
>
> For example, is there a way not to compile any -dbg packages?
> I intuitively guess I need to set "release" in my local.conf but there
> is no easier way than trying it and check if -dbg packages are created
> or not.
>
>> =C2=A0 I have asked in freenode oe room but friends said there no way to=
 do that
>> in OE system. If there is no way to do that in current OE, do you plan t=
o
>> add as a feature?
>>
>> =C2=A0 Thanks,
>>
>> Regards
>>
>> --
>> MahmutG
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> dashesy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


