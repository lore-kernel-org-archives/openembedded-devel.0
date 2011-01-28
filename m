Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pigcy-0001bS-OW
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 06:12:08 +0100
Received: by gxk20 with SMTP id 20so953083gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 21:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=SrnZqIThfPDKgv/arbYPLBYhli4jyePiN+/pv/K/Wl4=;
	b=UYHEewy+IteyMY7bAhs5fTvlVnjonXWuxX1buIuCLxdOijpRmJHSXPddcBl60X3gt+
	8j7ugDcxAXinU+s77+0PZl+6B1A8FhszT0BwUrs22Lzgawk4IeN8kk1L1b1rjhLpXrSO
	bUldQu8qEHuvJTd9jldftkNMPz0G50549p9w0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=p8nFHhGl5YqWTxSgSdBnrIzNnVmr1nCU2NNQfPmeOUde3avtVqQYUIeFMgAc2lDkGn
	Npdc6r/4aTH0NaNSBWzse92OeLr9RGw1xLKsHazxg5WHJPTF+eOxLbhHzWm3rlMW1gRF
	9/vWGbikbMvr8hnT89jFuqh53yVBJRPYq6mKQ=
Received: by 10.90.51.20 with SMTP id y20mr4247431agy.115.1296191142941; Thu,
	27 Jan 2011 21:05:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 21:05:22 -0800 (PST)
In-Reply-To: <AANLkTinKQ1Gkn2D+ppB1E9pKSe1xxS0jcd3TU6T82zTt@mail.gmail.com>
References: <1295983479-15511-1-git-send-email-coolaj86@gmail.com>
	<ihn8ra$scb$1@dough.gmane.org>
	<AANLkTinKQ1Gkn2D+ppB1E9pKSe1xxS0jcd3TU6T82zTt@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 21:05:22 -0800
Message-ID: <AANLkTi=r1V=uLH2mYES9eLSicage0QSrgTiXfjftzpGo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Fri, 28 Jan 2011 05:12:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2011 at 6:00 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>>
>> > =C2=A0recipes/nodejs/files/libev-cross-cc.patch | =C2=A0 17 +++++-----=
----
>> > =C2=A0recipes/nodejs/files/node-cross-cc.patch =C2=A0| =C2=A0 19 +++++=
+++++------
>> > =C2=A0recipes/nodejs/nodejs_0.2.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 34
>> +++++++++++++++++++++++++++++
>>
>> You're changing the patches, but don't remove the old version, do they
>> still work?
>
>
> I copied the new patches over the old patches.
> Should I have done `git rm this.patch; edit this.patch; git add this.patc=
h`
> instead?
>
>
>>
>
>> +PR =3D "r4"
>>
>> New recipes start at r0
>>
>
> But it wasn't until the 4th time that I bumped the PR to re-bitbake and t=
est
> it that I got it right. :D
>
> Would you like me to resubmit the patch without the +PR =3D "r4"?

whenever there are changes requested to patches revised patch with
changes should be submitted and versioned as v2,v3.. as appropriate
so patchwork catches it

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


