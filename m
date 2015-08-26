Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 38CD676DC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:51:12 +0000 (UTC)
Received: by igfj19 with SMTP id j19so40404461igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5wOhESvWP2oTjwrLzVwYeRnNLYmZs7n3tPWJ0ZEi67Q=;
	b=CujgdPYfC7K0954RC52sgElUDAhJBFdjskFG1AwKUhy2OvH8O13qNAoM4SG95O0GaE
	EBGTt0O050R9RSb8JNHSrn2044oNvTwj3hVEdm92QMfzj2czWIqIfxWVUmNKMWI6x3bo
	a27uwCWGWi1sDNqhPS2lneuu7LodMxYYx8EexAO+pXU5eGJiOz2RmnJ0W4PXa7aKDB9E
	YRsLFMVocJuB+h3hIKAkX97Kj1j/zlUWKaapHSc1PYOYJZ+vc1SwqCv+fs/TKFCXcctx
	esbWXgFG192D7cxqga0eRHqPd7X1suJG7mMAr5vnw7NTGNq4rDNvutv31sTxNFD/OLEe
	dftA==
MIME-Version: 1.0
X-Received: by 10.50.143.12 with SMTP id sa12mr4539774igb.64.1440604272721;
	Wed, 26 Aug 2015 08:51:12 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 26 Aug 2015 08:51:12 -0700 (PDT)
In-Reply-To: <20150826135841.GB2449@jama>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
	<1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
	<20150826135841.GB2449@jama>
Date: Wed, 26 Aug 2015 17:51:12 +0200
Message-ID: <CALbNGRRNp6xd97NFbZvEQygVd9QQ8hy7BHeeKPNRg7sqqyeAaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/17] rodent-icon-theme: initial add 5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 15:51:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 3:58 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Aug 11, 2015 at 09:57:35AM +0200, Andreas M=C3=BCller wrote:
>> note that ${SOURCEFORGE_MIRROR} in SRC_URI did not work
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb    | 11 ++++=
+++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100644 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-=
theme_5.0.bb
>>
>> diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5=
.0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
>> new file mode 100644
>> index 0000000..130e032
>> --- /dev/null
>> +++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
>> @@ -0,0 +1,11 @@
>> +SUMMARY =3D "Rodent-icon-theme (was xfce4-icon-theme) is a svg icon the=
me"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166=
c28b"
>> +
>> +inherit allarch autotools gtk-icon-cache
>> +
>> +SRC_URI =3D "http://sourceforge.net/projects/xffm/files/${BPN}/${BPN}-$=
{PV}.tar.gz"
>> +SRC_URI[md5sum] =3D "4b097d344a160d6497c6498985c8df15"
>> +SRC_URI[sha256sum] =3D "6ed00d16faa1f55b3bb7b13862de1d7f5cfd978b93e4248=
7ded21595d0dbe208"
>> +
>> +FILES_${PN} +=3D "${datadir}/icons"
>
> Can we remove xfce4-icon-theme recipe?
>
> They conflict with each other in sysroot:
> http://errors.yoctoproject.org/Errors/Details/14749/
>
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
Hmm strange I had them in in parallel - will take care. For worst case
we remove rodent.

Andreas

