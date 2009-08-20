Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Mdzvq-0004u4-6x
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 07:11:26 +0200
Received: by qyk35 with SMTP id 35so3817015qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 21:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=JmMieHWh9u2c6OnvGS2ixsnIME0ZKrDfBASUb2A8g80=;
	b=e/gg2SuiLnZz9G/QHLktY+u0xwYQQXpI579KgdN3JN8wlNyAdMRUc3Z9htOWuCELaB
	Is4O8/Go1lVDMZBDEw47ksERHu+bzQcv1I11JF/qvjGmsHWIxhae4soPxs1k51K6Sprh
	IjGQe3KtxXWvBmZqiWgna/IZT69Vb8L3hU+6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=voOZ2Qnd+JcQjm61Yb0jUaQbdkyW9eF5n/zfEPfPfl0R/M/rNkVFQFP2pXRo47Rrp3
	5mUMqGcVRptN7nLR2Sqi6+9Cm3sUa9h9cj9cJYSEHf3vm0FZCDaGmpMtqzOQimtgOxhz
	e9x9ht3XKPYsYc8reqMqTFRDfsv0tzbHK2izk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.9.130 with SMTP id l2mr3142190qcl.41.1250744049177; Wed, 
	19 Aug 2009 21:54:09 -0700 (PDT)
In-Reply-To: <20090820041833.GG32010@denix.org>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com> 
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com> 
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com> 
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com> 
	<1250738680-20274-8-git-send-email-clarson@mvista.com>
	<20090820041833.GG32010@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 19 Aug 2009 21:53:49 -0700
X-Google-Sender-Auth: 6fd9de5b19f3a1dd
Message-ID: <b6ebd0a50908192153i2dbd6a74ve0e4337d76e9a474@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: BUILD_LDFLAGS: use $ORIGIN in the -rpath rather than a full path.
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
X-List-Received-Date: Thu, 20 Aug 2009 05:11:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yeah, its one of many changes needed to get things relocatable enough
to be able to use prebuilt binaries / packaged staging packages
amongst a group of developers, for example.  This is just one piece of
the puzzle, of course.  Ideally, more open source projects would be
properly relocatable, and we wouldn't need so many hacks.  We ended up
doing a lot of things to work around reloc issues in native/cross
recipes, for MVL6.  Everything from exporting a pile of new env vars
to writing wrapper scripts and the like.. yech.  Still, it's a worthy
goal, and the benefits would be worthwhile, so I think we should start
taking the steps in that direction.

On Wed, Aug 19, 2009 at 9:18 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Wed, Aug 19, 2009 at 08:24:39PM -0700, Chris Larson wrote:
>> Signed-off-by: Chris Larson <clarson@mvista.com>
>
> Hmm, interesting. I didn't know about $ORIGIN...
> But what is the benefit here? To be able to move $TMPDIR?
>
>> ---
>> =C2=A0conf/bitbake.conf | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 371bf8e..9cb6039 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -447,7 +447,7 @@ export SDK_CXXFLAGS =3D "${SDK_CFLAGS} -fpermissive"
>>
>> =C2=A0export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-Wl,-rpath,\\\$\$ORIGIN/${@base_path_relative(d.getVar('STAGIN=
G_BINDIR_NATIVE', 1), d.getVar('STAGING_LIBDIR_NATIVE', 1))} -Wl,-O1"
>>
>> =C2=A0export LDFLAGS =3D "${TARGET_LDFLAGS}"
>> =C2=A0export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${layout_libdir}=
 \
>> --
>> 1.6.0
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


