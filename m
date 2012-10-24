Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TQvlA-0000gE-NF
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 09:52:17 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so172728iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 00:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=N4s85v48XKTXrsoTYcj7Hp3U3Zaw9CA6AeTIEM+uz9w=;
	b=MGVBBNjhy8aSwjM1ExsUH59EiTmxwUeZzB1hlpTsKnDY9gTxo6hbwtS7Yeg+H1rYDn
	8ZP12UO20U5A0dpovEhstYtMt8clZfSyrEUfPwPmGRNKG056wL6EXxaQqjrMvE4gkEio
	xsYc6HQikWxS+FpaRCNwz9s4AxVI42OcCMfBX18Koqhf1NPeiuPUxqjYYRMfft5Y0JeD
	hwZFEIAWwZSu4NbUwfoXtJI9jdVNOz+nMDSVrafNEdg2cbyr3Xjl644A+5fTqKFvz9gP
	sZx7p5WkqbtC9ZPQRkbvaEm100uGFrEuN314nGXndsClU3QPJJQmMKaMVB1HUmPpUg3S
	3gGQ==
MIME-Version: 1.0
Received: by 10.43.7.132 with SMTP id oo4mr13057666icb.6.1351064329116; Wed,
	24 Oct 2012 00:38:49 -0700 (PDT)
Received: by 10.64.20.113 with HTTP; Wed, 24 Oct 2012 00:38:49 -0700 (PDT)
In-Reply-To: <CALbNGRT1teBLRFakFHUxQ+LM8ACsgk4B-dNeL4yzpkgEgtcgrA@mail.gmail.com>
References: <1350131492-742-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1teBLRFakFHUxQ+LM8ACsgk4B-dNeL4yzpkgEgtcgrA@mail.gmail.com>
Date: Wed, 24 Oct 2012 09:38:49 +0200
Message-ID: <CALbNGRTBA0D8EF7690MEk_tMMJwkBy-1YZ3Hk8HEwSvYWikFjA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs: fix build
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
X-List-Received-Date: Wed, 24 Oct 2012 07:52:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2012 at 8:25 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sat, Oct 13, 2012 at 2:31 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> error message was for build from scratch and latest heads:
>>
>> | ERROR: This autoconf log indicates errors, it looked at host include a=
nd/or library paths while determining system capabilities.
>> | Rerun configure task after fixing this. The path was '/home/Superandy/=
tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gvfs-1.8.2-r=
7.0/gvfs-1.8.2'
>> | ERROR: Function failed: do_qa_configure
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-gnome/recipes-gnome/gvfs/gvfs.inc |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes=
-gnome/gvfs/gvfs.inc
>> index 903a8ba..e86c93f 100644
>> --- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
>> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd0=
02f49e7bb854063f7e7"
>>
>>  inherit gnome
>>
>> -INC_PR =3D "r7"
>> +INC_PR =3D "r8"
>>
>>  SRC_URI[archive.md5sum] =3D "402f94b187b197b403d25c85caeb9562"
>>  SRC_URI[archive.sha256sum] =3D "0895ac8f6d416e1b15433b6b6b68eb119c6e8b0=
4fdb66db665d684355ef89345"
>> @@ -14,6 +14,7 @@ EXTRA_OECONF =3D "--disable-samba \
>>                  --with-samba-includes=3D${STAGING_INCDIR} \
>>                  --with-samba-libs=3D${STAGING_LIBDIR} \
>>                  --with-archive-includes=3D${STAGING_INCDIR} \
>> +                --with-archive-libs=3D${STAGING_LIBDIR} \
>>                 "
>>
>>  FILES_${PN} +=3D "${datadir}/dbus-1/services/*"
>> --
>> 1.7.4.4
>>
> ping
please :)


