Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q2OxA-00055x-RL
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 15:22:29 +0100
Received: by iyb26 with SMTP id 26so8978235iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1d/c7BViDy64LDqiSdgoSYrE/iPTFq6Uue8MgTuZivQ=;
	b=F51WWliYjgoy2DPHrPRVzbDuRAXjSpyUHspb+EmhWMd0uC8kcEi4hEa7VL4qKl0Pfk
	e6qx5b4B1fZ5TeEJ7mzAGcd1djARQy2Wy8wJ3dqIvAfqp+4zP5IiYHD69NiJE4gV4URJ
	PI5NAWscHQqjD6ejlWxcl0pKP+WCD290XqzrA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VNkpEIKjS7/OBx2M4fhPOk/SQVWMo30YagFwkpFD9z3RcTqDnRqnPsGRTBM66elzay
	QIHrBG/h4NtId0eTHkvFbmHDW1ONAL6MjQLRpUFUJw5tkEYiTufljerbxuDtZnPRL+tB
	glspvEg5dwax2/Uq4Wrg+29sh0s7FTlKXGaMQ=
MIME-Version: 1.0
Received: by 10.231.61.65 with SMTP id s1mr6691186ibh.120.1300890036680; Wed,
	23 Mar 2011 07:20:36 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Wed, 23 Mar 2011 07:20:36 -0700 (PDT)
In-Reply-To: <AANLkTikhnHdQGGh-bkAs3si4PNg5NqGCJ1c2iQOkuwL-@mail.gmail.com>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
	<1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
	<1300834528.3825.3.camel@mattotaupa>
	<AANLkTim8KdVzogFp2hh5bTLxWnXvLzDOK8eb5E+-k+P1@mail.gmail.com>
	<1300881388.4101.23.camel@mattotaupa>
	<AANLkTikhnHdQGGh-bkAs3si4PNg5NqGCJ1c2iQOkuwL-@mail.gmail.com>
Date: Wed, 23 Mar 2011 15:20:36 +0100
Message-ID: <AANLkTi=kT3DNMuC_+6LQGE6usL=ryExHiWm_hKQdu32x@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Wed, 23 Mar 2011 14:22:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/23 Sylvain Par=E9 <sylvain.pare@gmail.com>:
> Hello
> I was going to fill a bugrepport on OE's bugzilla but as you are already
> speaking of vlc building issue..
> It does not build for me neither : http://pastebin.com/raw.php?i=3DwK4Sxb=
v9
> Thanks by advance.
>
> Regards,
>
> Sylvain (aka GarthPS)
>

We did discuss this on irc, and the issue seems to be that
libliveMedia.a is probably a host lib.

Another issue that was noted was that OE_CONF says --enable-live555
(or something like that) but live555 is not in the DEPENDS.
A quick glance over the recipe showed that there seem to be more
things missing in DEPENDS (freetype, apache, png, ...)

Frans

>
> 2011/3/23 Paul Menzel <paulepanter@users.sourceforge.net>
>
>> Am Mittwoch, den 23.03.2011, 08:51 -0300 schrieb Otavio Salvador:
>> > On Tue, Mar 22, 2011 at 19:55, Paul Menzel
>> > <paulepanter@users.sourceforge.net> wrote:
>> > > What kind of error do you get? The recipe build fine for me using
>> > > `angstrom-2010.x` for `MACHINE =3D "beagleboard"`.
>> >
>> > It fails to find lua.h so probably you had it built due other dependen=
cy.
>>
>> No, I made a clean build, i. e. `rm -rf angstrom-dev`. Please post your
>> build configuration.
>>
>>
>> Thanks,
>>
>> Paul
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


