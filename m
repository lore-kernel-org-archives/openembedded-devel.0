Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773B0C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 22:03:53 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.16516.1684879429778097914
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 15:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GyJlavPd;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561c1ae21e7so3671217b3.0
        for <Openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 15:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684879429; x=1687471429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MaG2PlSZddVcC6qN4by8O2REpKBnd8lmeW8JzrbH924=;
        b=GyJlavPdYSlrYySEsnTIqdrEJ/mc1x7C3fnIWDIa97mPBDm0tTZTa+K8SD2SiVYTVh
         wXPQfxHzeUYUKC5MSiKckp+aKGPcDGeNIN0b2FvtyUTWVioQbW7hc9moF7exgGaz+EfN
         ioesAi0RsXOT84Zz3qeOyyRanXRfQeO3wR75SH8PnNJx1DCyWYhDckc/yU/fz41jVxJh
         mgarzrD4lR2XQOEe7//0qB3JUuYEpQFeSafYH7JM1h9TwfFt3j0yyUnGcT4hwYn7mxJH
         lCUcz4jC7UWR1S3OrpRqTfjdNImPNcDmCKATFE0uHm7GGIFNQdcHPuT2qkX/btOfsvaN
         UA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684879429; x=1687471429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaG2PlSZddVcC6qN4by8O2REpKBnd8lmeW8JzrbH924=;
        b=U0NihcNevbnhwzEZuJfbl2HNFENh08CSrnAqQZ1ADbhOadQOymR9DrQ7oE2J7BSRh7
         zRtHOVg9aa1uDCZO53RftqvHzNBjQnB6yKms0+hPBfP7E4qp0YZaNEo2vHXnVgdcPI2+
         DgsaA1M4BceB1d+28PkmhLifa3bNW7Iur0NITy0OdNL7UcXd5/CM1TXB6Srci4Rd3147
         kRdsNgBOGOncinpycm4mJ3VHDk68hqQcrH6GQPCXLUrxNidQRvswxgzKgbN8xJfNvjiD
         EP80foZjtM5ziWiDa7zfZja+d8HBDEXBGkh0rdcGKQuys93zjzmKuhcxTjL8vsEv/7TS
         eVdg==
X-Gm-Message-State: AC+VfDzTAzz7A8FnbO69g6Wng3W9GlEd4lK77UJpeZQhrxARSmVfdXY+
	cp+T5v/s/PwyFLK9V8bRfa0UES4tVWMS30u43U8=
X-Google-Smtp-Source: ACHHUZ5mfTSS/G6gwKMiaTl9s/DxagNVvCC8sMDhtcTutV+zXMwDQdKZ2uNdpRyGLx7R1Cj2oP/Ny9GGz5a4KreF6Qc=
X-Received: by 2002:a81:4803:0:b0:55a:382b:5e0f with SMTP id
 v3-20020a814803000000b0055a382b5e0fmr15427275ywa.12.1684879428374; Tue, 23
 May 2023 15:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173332.16576-1-trevor.gamblin@windriver.com>
 <20220323173332.16576-2-trevor.gamblin@windriver.com> <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
In-Reply-To: <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 23 May 2023 15:03:37 -0700
Message-ID: <CANx9H-DQdjxAbVWQ4a8BiT21MsZ1ML-LUg1o+Vcm6YTbFubUCw@mail.gmail.com>
Subject: Re: [oe] [meta-python][hardknott][PATCH 2/2] python3-django: upgrade
 3.2.5 -> 3.2.12
To: randy.macleod@windriver.com
Cc: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	"Mali, Narpat" <narpat.mali@windriver.com>, Openembedded-devel@lists.openembedded.org, 
	"Reyna, David" <david.reyna@windriver.com>, Trevor Gamblin <Trevor.Gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000d1565e05fc638fae"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 22:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102745

--000000000000d1565e05fc638fae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 2:59 PM Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:

> On 2022-03-23 13:33, Trevor Gamblin wrote:
>
> The delta between 3.2.5 and 3.2.12 contain numerous CVE and other
> bugfixes. git log --oneline 3.2.5..3.2.12 shows:
>
> Narpat is working on a patch for: CVE-2023-31047
>
> He'll start with the default version of django : 2.2*
>
> Which if any of the other versions should be fixed?
>
> Can we remove version 3.2?
>

Originally we were trying to keep the Django LTS version, which was 3.2.
Meta-python master has now lost that through a few changes.

>
> Can we update django 4.0 to 4.1 rather than backport the fix?
>
The latest Django LTS version is 4.2.
I assume major breaking changes have happened between major and to a lesser
extent minor releases.

>
> meta-oe.git on =EE=82=A0 kirkstone [$]
> =E2=9D=AF fd django_
> meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> meta-python/recipes-devtools/python/python3-django_4.0.2.bb
>
> Can we add a check to ensure that we never have 3 versions of a single
> recipe at branch time again? It's rare I think but worth discussing the
> idea.
>
> ../Randy
>
>
>
> fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
> d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file u=
ploads.
> 1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debu=
g %} template tag.
> a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
> 027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-454=
52 to security archive.
> 0a9a46a1d7 [3.2.x] Post-release version bump.
> 6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
> 8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal=
 in storage subsystem.
> c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information di=
sclosure in dictsort template filter.
> a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAt=
tributeSimilarityValidator.
> b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releas=
es.
> ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior c=
hange in Django 2.2.25, 3.1.14, and 3.2.10.
> ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
> 1cea03ab00 [3.2.x] Post-release version bump.
> 0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
> 333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass=
 of an upstream access control based on URL paths.
> 6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_annota=
tion_with_callable_default() crash on Oracle.
> cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with model=
s.BinaryField on PostgreSQL.
> 0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx buil=
ds.
> 487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10, =
3.1.14 and 2.2.25.
> 742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
> 99532fdadf [3.2.x] Corrected isort example in coding style docs.
> 31539a63f2 [3.2.x] Corrected "pip install" call in coding style docs.
> 76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
> 04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
> dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
> 9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The Do=
cs.
> 327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Docs.
> bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
> 3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
> 34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
> 21a56d596a [3.2.x] Post-release version bump.
> 1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
> e299cc2d2c [3.2.x] Added release date for 3.2.9.
> 947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB b=
ackends.
> 128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example t=
o use correct template block.
> f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a field=
 with functional indexes on SQLite.
> fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length docs.
> dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore an=
d smtpd modules.
> 137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_lo=
gin().
> 1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
> 82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in Djan=
go 3.2.x.
> 1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and to=
x.ini.
> 53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() instead=
 of get_event_loop() on Python 3.7+.
> f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() warni=
ngs on Python 3.10+.
> d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.setD=
aemon().
> 8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's deprecated di=
stutils.version package.
> faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is not=
 installed.
> 329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
> 85e4af6a22 [3.2.x] Post-release version bump.
> 4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
> 65367b0500 [3.2.x] Added release date for 3.2.7.
> 51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained with =
HStoreField key transforms.
> 031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
> 7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
> 6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the admin=
 changelist when actions are both top and bottom.
> e235c7815a [3.2.x] Fixed broken links and redirects in docs.
> 51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-proces=
sing.txt.
> d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for admi=
n's readonly fields in custom admin site.
> 561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
> 454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjango=
 tutorial.
> b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
> a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and order_by=
 arguments.
> 54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of check fun=
ctions.
> 1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
> b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_inva=
lid_option on Python 3.9.7+.
> 707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
> d5710f405a [3.2.x] Post-release version bump.
> 45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
> 4b80a40272 [3.2.x] Added release date for 3.2.7.
> 4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options are =
supported by every management command.
> fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed o=
ffset timezones.
> 382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signature=
 in docs.
> 11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
> 69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cache=
d result by QuerySet.count().
> d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
> 358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
> d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
> eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django Forum=
.
> 6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
> f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools doc=
s.
> 2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
> 87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
> e1cad66dca [3.2.x] Post-release version bump.
> eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
> 70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
> d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description in =
organization docs.
> 99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organiza=
tion docs.
> ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization doc=
s.
> 55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
> 5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
> aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as prefe=
rred over Form.get_initial_for_field().
> bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments secti=
ons in Model.save() docs.
> b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M rela=
tion when through_fields is a list.
> de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in admi=
n docs where appropriate.
> f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
> 1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in De=
cimalField.validate().
> 05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
> 9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
> 0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
> b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
> 6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing-c=
ode.txt.
> f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing =
list references in docs.
> 527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
> 1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list i=
tems.
> 9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
> 92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
> 3ab942f10a [3.2.x] Post-release version bump.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com> <trevor.gamb=
lin@windriver.com>
> ---
>  .../{python3-django_3.2.5.bb =3D> python3-django_3.2.12.bb}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb =3D>=
 python3-django_3.2.12.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb =
b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> index 5890c8541..ee71f953b 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> @@ -1,7 +1,7 @@
>  require python-django.inc
>  inherit setuptools3
>
> -SRC_URI[sha256sum] =3D "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841=
dda35019c01855cd"
> +SRC_URI[sha256sum] =3D "9772e6935703e59e993960832d66a614cf0233a1c5123bc6=
224ecc6ad69e41e2"
>
>  RDEPENDS_${PN} +=3D "\
>      ${PYTHON_PN}-sqlparse \
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102744):
> https://lists.openembedded.org/g/openembedded-devel/message/102744
> Mute This Topic: https://lists.openembedded.org/mt/89981302/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d1565e05fc638fae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 23, 2023 at 2:59 PM Randy MacLeod via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;randy.mac=
leod=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">

 =20
  <div>
    <div>On 2022-03-23 13:33, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>The delta between 3.2.5 and 3.2.12 contain numerous CVE and othe=
r
bugfixes. git log --oneline 3.2.5..3.2.12 shows:</pre>
    </blockquote>
    <p>Narpat is working on a patch for: CVE-2023-31047</p>
    <p>He&#39;ll start with the default version of django : 2.2*<br>
      <br>
      Which if any of the other versions should be fixed?</p>
    <p>Can we remove version 3.2?</p></div></blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">Originally we were trying to keep the Django LTS=
 version, which was 3.2. Meta-python master has now lost that through a few=
 changes.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><p dir=3D"auto"><br>
      Can we update django 4.0 to 4.1 rather than backport the fix?</p></di=
v></blockquote><div dir=3D"auto">The latest Django LTS version is 4.2.</div=
><div dir=3D"auto">I assume major breaking changes have happened between ma=
jor and to a lesser extent minor releases.</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div><p dir=3D"auto"><br>
    </p>
    <p>meta-oe.git on =EE=82=A0 kirkstone [$] <br>
      =E2=9D=AF fd django_<br>
      meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
2.2.28.bb" target=3D"_blank">python3-django_2.2.28.bb</a><br>
      meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
3.2.12.bb" target=3D"_blank">python3-django_3.2.12.bb</a><br>
      meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
4.0.2.bb" target=3D"_blank">python3-django_4.0.2.bb</a></p>
    <p>Can we add a check to ensure that we never have 3 versions of a
      single<br>
      recipe at branch time again? It&#39;s rare I think but worth
      discussing the idea.<br>
      <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre>
fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file upl=
oads.
1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debug =
%} template tag.
a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-45452=
 to security archive.
0a9a46a1d7 [3.2.x] Post-release version bump.
6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal i=
n storage subsystem.
c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information disc=
losure in dictsort template filter.
a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAttr=
ibuteSimilarityValidator.
b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releases=
.
ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc&#39;d re_path() behavior=
 change in Django 2.2.25, 3.1.14, and 3.2.10.
ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
1cea03ab00 [3.2.x] Post-release version bump.
0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass o=
f an upstream access control based on URL paths.
6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_annotati=
on_with_callable_default() crash on Oracle.
cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with models.=
BinaryField on PostgreSQL.
0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx builds=
.
487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10, 3.=
1.14 and 2.2.25.
742d6bc8db [3.2.x] Corrected signatures of QuerySet&#39;s methods.
99532fdadf [3.2.x] Corrected isort example in coding style docs.
31539a63f2 [3.2.x] Corrected &quot;pip install&quot; call in coding style d=
ocs.
76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The Docs=
.
327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Docs.
bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
21a56d596a [3.2.x] Post-release version bump.
1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
e299cc2d2c [3.2.x] Added release date for 3.2.9.
947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB bac=
kends.
128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example to =
use correct template block.
f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a field w=
ith functional indexes on SQLite.
fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length docs.
dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore and =
smtpd modules.
137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_logi=
n().
1128291650 [3.2.x] Added &#39;formatter&#39; to spelling wordlist.
82fee0446d [3.2.x] Refs #32074 -- Doc&#39;d Python 3.10 compatibility in Dj=
ango 3.2.x.
1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and tox.=
ini.
53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() instead o=
f get_event_loop() on Python 3.7+.
f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() warning=
s on Python 3.10+.
d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.setDae=
mon().
8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python&#39;s deprecated =
distutils.version package.
faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is not i=
nstalled.
329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
85e4af6a22 [3.2.x] Post-release version bump.
4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
65367b0500 [3.2.x] Added release date for 3.2.7.
51e4dbfeb2 [3.2.x] Refs #27694 -- Doc&#39;d lookups that can be chained wit=
h HStoreField key transforms.
031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the admin c=
hangelist when actions are both top and bottom.
e235c7815a [3.2.x] Fixed broken links and redirects in docs.
51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-processi=
ng.txt.
d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for admin&=
#39;s readonly fields in custom admin site.
561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjango t=
utorial.
b51e0a37cf [3.2.x] Doc&#39;d Jinja2 form renderer.
a7be74d017 [3.2.x] Clarified type of Window()&#39;s partition_by and order_=
by arguments.
54684a3ec0 [3.2.x] Refs #31055 -- Doc&#39;d &#39;databases&#39; argument of=
 check functions.
1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_invali=
d_option on Python 3.9.7+.
707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
d5710f405a [3.2.x] Post-release version bump.
45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
4b80a40272 [3.2.x] Added release date for 3.2.7.
4e55806720 [3.2.x] Refs #25264 -- Doc&#39;s that not all default options ar=
e supported by every management command.
fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed off=
set timezones.
382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signature i=
n docs.
11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cached =
result by QuerySet.count().
d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django Forum.
6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools docs.
2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
e1cad66dca [3.2.x] Post-release version bump.
eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description in or=
ganization docs.
99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organizati=
on docs.
ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization docs.
55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as preferr=
ed over Form.get_initial_for_field().
bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments section=
s in Model.save() docs.
b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M relati=
on when through_fields is a list.
de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in admin =
docs where appropriate.
f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in Deci=
malField.validate().
05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing-cod=
e.txt.
f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing li=
st references in docs.
527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list ite=
ms.
9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
3ab942f10a [3.2.x] Post-release version bump.

Signed-off-by: Trevor Gamblin <a href=3D"mailto:trevor.gamblin@windriver.co=
m" target=3D"_blank">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 .../{<a href=3D"http://python3-django_3.2.5.bb" target=3D"_blank">python3-=
django_3.2.5.bb</a> =3D&gt; <a href=3D"http://python3-django_3.2.12.bb" tar=
get=3D"_blank">python3-django_3.2.12.bb</a>}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-djan=
go_3.2.5.bb" target=3D"_blank">python3-django_3.2.5.bb</a> =3D&gt; <a href=
=3D"http://python3-django_3.2.12.bb" target=3D"_blank">python3-django_3.2.1=
2.bb</a>} (77%)

diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
django_3.2.5.bb" target=3D"_blank">python3-django_3.2.5.bb</a> b/meta-pytho=
n/recipes-devtools/python/<a href=3D"http://python3-django_3.2.12.bb" targe=
t=3D"_blank">python3-django_3.2.12.bb</a>
similarity index 77%
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-d=
jango_3.2.5.bb" target=3D"_blank">python3-django_3.2.5.bb</a>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-dja=
ngo_3.2.12.bb" target=3D"_blank">python3-django_3.2.12.bb</a>
index 5890c8541..ee71f953b 100644
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
3.2.5.bb" target=3D"_blank">python3-django_3.2.5.bb</a>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
3.2.12.bb" target=3D"_blank">python3-django_3.2.12.bb</a>
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
=20
-SRC_URI[sha256sum] =3D &quot;3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5=
841dda35019c01855cd&quot;
+SRC_URI[sha256sum] =3D &quot;9772e6935703e59e993960832d66a614cf0233a1c5123=
bc6224ecc6ad69e41e2&quot;
=20
 RDEPENDS_${PN} +=3D &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
      <br>
      <fieldset></fieldset>
      <pre>
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102744): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102744" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102744</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89981302/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89981302/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d1565e05fc638fae--

