Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfdDm-0003CU-TH
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 19:57:31 +0100
Received: by iwn8 with SMTP id 8so1167943iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 10:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3CaEWKZ8MhtQA3od5QGbGSh2RAMbXMAjLAuvfSgJnQo=;
	b=b6bYdEm2ebAK2X0O4ErL8ThFe/EUa9q+BERCjM00+Ul5vmEffGpLAznEaDuCNHX5FK
	aTArIlhafS23dninnb8kJXV2XKJht0gMY10Ucecjqu2iV67Z2skCOkmmLKAuBENXF6RQ
	Eici8BUMiGEKIDfhcZ74jTaX5uGBOLO7l3COc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xJgMCCigCTziTsk7T6uMRBfRmdsJfkNDHTbyaD7P1LOvt7z/HhbYlwFdtgkb5XKtAt
	KGEnQtVdVvLDfCEt2tJDJl+QxxhqlgRneokWT+B9BIz587c4sZkyYVdnJzEMmEwSAYAQ
	9RmYrTAJ2L7+53YSNyzO6ZYi0rQ+HvjpIVTqU=
MIME-Version: 1.0
Received: by 10.231.36.5 with SMTP id r5mr1292468ibd.134.1295463402785; Wed,
	19 Jan 2011 10:56:42 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 10:56:42 -0800 (PST)
In-Reply-To: <AANLkTi=sg0AdyJQgmvim794R17JZ5zyM67mD-Xy43vaP@mail.gmail.com>
References: <1295452649-28081-1-git-send-email-eric@eukrea.com>
	<AANLkTi=sg0AdyJQgmvim794R17JZ5zyM67mD-Xy43vaP@mail.gmail.com>
Date: Wed, 19 Jan 2011 19:56:42 +0100
Message-ID: <AANLkTikHRUGO7i3pVvcJ+46gVQUOXnOo3KXgkszY-AGT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox: enable CONFIG_RUN_PARTS if default.script is to be installed
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
X-List-Received-Date: Wed, 19 Jan 2011 18:57:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/19 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jan 19, 2011 at 7:57 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Looks ok.
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Would this need an INC_PR bump?
Otherwise:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/busybox/busybox_1.1x.inc | =A0 =A03 +++
>> =A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_=
1.1x.inc
>> index 4dbc3d9..1078aac 100644
>> --- a/recipes/busybox/busybox_1.1x.inc
>> +++ b/recipes/busybox/busybox_1.1x.inc
>> @@ -34,6 +34,9 @@ do_configure_prepend () {
>> =A0 =A0 =A0 =A0if [ "${TARGET_ARCH}" =3D "avr32" ] ; then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i s:CONFIG_FEATURE_OSF_LABEL=3Dy:CON=
FIG_FEATURE_OSF_LABEL=3Dn: ${WORKDIR}/defconfig
>> =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -e ${WORKDIR}/default.script ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "CONFIG_RUN_PARTS=3Dy" =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0>> ${WORKDIR}/defconfig
>> + =A0 =A0 =A0 =A0fi
>> =A0}
>>
>> =A0do_install_append() {
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


