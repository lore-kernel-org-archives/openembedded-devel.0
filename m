Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F8DFEDA1F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:57:43 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85656.1773777458327859461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 12:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fATYwgia;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad019bbd4so6420988d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 12:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773777457; cv=none;
        d=google.com; s=arc-20240605;
        b=DbJIyRhzsr0bGlSsNWJrZwYG0LGSDx+1V2wxvfgOuFseTiYYEkTd8lMm7aTXs7pWbZ
         iFDtRsknuEnnQct6micYyODi0J1mGxCozyloWTlc7N9NhAm5RlspTn2XsH5FKwdxBXJU
         dM2IAI4EU4i4H3PYM/CPUrZfH0BT62frxoLP7LMeqUcPUFgci36qKuEM5k33xVCoE+dR
         1TJdB1eVWHArxTPvW0qbsHXBJyupYZplQ36OlVfGvNSR3qmYcLhGAgGYZ6+gXelPNvGR
         VhfyZyw7EJh9xmG7206/ZjHWPx4ubcFOtXJaq7S4UxkYeTy3dVRSKn5lJxyHI+Wa/9/J
         X+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xCCYRheafSWi9jIBYkuvvdHgVF/aOFZBSfSDdfZD44s=;
        fh=pdeOg0eUEeSbuFfdgh6mXmfyvsNCruy81TzftImGxD4=;
        b=AfBGgGK6VBeKJ7rYtJJfhgDrNEcEr2fT5pZtft2R1pziThUfGVb/WwPGg+eYrEOmlv
         UuAJW4hakTTUPNrIXH4OB/q9jKxZUIekJiPQyqjLgHj1BexDzFqY6EDPqUyHxOGVieOM
         SES8KhI+RCD2ZSNevj0Jt7fVCrpc++eZePd27SIU/hhECHWNOMj1w63rOwT8uqsUmvv0
         aMloKlLNMYD+hK/8R8kU3ABpgw+HxCOTNIXzvatnjFwkSelDx+PwmkCrcDS8qsPaDCng
         IgSAO4jxIL0f6h5J73F7FmjGltvJklpsjLVezpqu9o0MSvBJDJ8Srs5glcSDFZzBgfCK
         45Nw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777457; x=1774382257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCCYRheafSWi9jIBYkuvvdHgVF/aOFZBSfSDdfZD44s=;
        b=fATYwgiaUCeCWi6rzYugMIjklm9HUKfAAYjrwd2n14bEJiZM8ywA8W0dJ4hR/ePDwT
         C8QJjEBSYlVh69kCt6UwWMllyP+OWC5CzCrT9deMZQjhnVbMq0jsPePO9EcFCWpvQ6Di
         LG25yVjlmVHgwN6GeeXAL296qI+eQDX7aOJHFod+8TY9nnbmT8CNUbK0YIj6f1tMz0C+
         xMEqeiJsWQ7pj2pqsn9MxG+dYKeHGQmHlctQ6Bd5lR8z/sXLqfe7iUcoYdqopoPJJCxN
         BJ5KcPBTtAiCWEqmjGTyo83msNeZ0zuzi+Tf85bL+Ju+dDAxDIKoozW7sS7CX3yfvhc/
         m/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777457; x=1774382257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCCYRheafSWi9jIBYkuvvdHgVF/aOFZBSfSDdfZD44s=;
        b=TN4OK+473daxk0lvmNUvhdyS6kQZqNH6ZSPD/y9wyeupKQUh8Iwri3sMgIV0IhHuBQ
         KNmWJBvcSGNLXKhDSY/vJGZbS4h6x0ziSL7YgbV2SN4cu76CdC/VOHx7OF9J49f4BGst
         5Zmk5HjRyP5CVB3lw2pKaZXNyM05RQnP00uUa1fWk4MTp+/5H5Yin0Qpq/M24HjyhkTm
         uG3AXPa8gP5Bg4h0AwLTplzlY47/KX8fJ33jF/5FRxE0lV3l23E9WXg0DtSgn3SMoq1I
         aHjKPPGPWSE0hCymWEUnRPOccFMjW05sG83FRi1bxyWKRxCFI1b8A+JIIm1oAZVq3/Qe
         BS2A==
X-Gm-Message-State: AOJu0YzGSfMcHBFKRIckZrydCMQligMt2zGVXbfh502U+/eJ7Vfz4KQ5
	5jvvMIW1KZ2bnkF6+mmpyGO3CuX4gjnNcSIj6Iuv/fQ+wsSlfL+jmrotCdIBFRp2lLtyyCmmAaB
	GHN2bG9FsyFZDaJIFf7O+6XPiBeeenjT6tcqk
X-Gm-Gg: ATEYQzxl7/5JJQxAokRU6Up6iSgq34mlhfzTZFk8kMPYEgZZn1+2TY27OQPHro12GCK
	eWW+v5yDDm+FoR8tUyJ74r8/C4mU3lmFwnGCjVb/yd39HA3+3AW5C5ELQj44Rqy44ehsXlKUADO
	gIrc9g2wItfWh1tL4wezlszoySD8vZePSSuU73FWHdXmr6X4Xvp8Jqp/OtA1UxGLZWFj0yuwWIm
	MqVrsNpd4snUEl8JTkGejK07PhGiOtDTh4T+Qy4d1OsSaQYko44sZtJorc3ixf/8SU/fOJWVS3z
	Dy+7gqfOHLTfDzr6+oOKLMz0KeY06TcggDFDRlHjkTY2YVlIfWBXzDblzuJHku2tNzgddHx+azu
	Q9dk5mtaHQHxSe9m6j5CW40/GR9tUpZ4dDa8=
X-Received: by 2002:a05:690c:c513:b0:79a:4fe4:ff92 with SMTP id
 00721157ae682-79a718aa664mr8374547b3.19.1773777457301; Tue, 17 Mar 2026
 12:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260315133441.3034831-1-deeratho@cisco.com> <CAMKF1so1J8YHsCstkS1cYdDc0rTgK27abaE7BowvDdgADo-ipA@mail.gmail.com>
In-Reply-To: <CAMKF1so1J8YHsCstkS1cYdDc0rTgK27abaE7BowvDdgADo-ipA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 12:57:09 -0700
X-Gm-Features: AaiRm5217mgGQh03OhRKqYaGwMQtqMlEgrqXuGy68LwXwTl9ymi4YhSQ8b2k1Ik
Message-ID: <CAMKF1somGjD+3NwDj8ZFHGhNH9+mfAwYwjhZar7mkZv6_8rK2w@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][master][PATCH 0/24] Pull request (Cover
 letter only)
To: deeratho@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040cd90064d3dbf5b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 19:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125333

--00000000000040cd90064d3dbf5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here is what I am seeing

=E2=9D=AF ci.sh
WARNING: Duplicate inclusion for
/srv/build/yoe/sources/openembedded-core/meta/conf/distr
WARNING: Duplicate inclusion for
/srv/build/yoe/sources/openembedded-core/meta/conf/distr
WARNING: Duplicate inclusion for
/srv/build/yoe/sources/openembedded-core/meta/conf/distr
WARNING: Duplicate inclusion for
/srv/build/yoe/sources/openembedded-core/meta/conf/distr
NOTE: Started PRServer with DBfile: /srv/build/yoe/cache/prserv.sqlite3,
Address: 127.0.0
Loading cache: 100% |#####################################################|
Time: 0:00:00
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |###################################################|
Time: 0:00:21
Parsing of 3472 .bb files complete (0 cached, 3472 parsed). 5951 targets,
169 skipped, 0
NOTE: The "universe" target is only intended for testing and may produce
errors.
NOTE: Resolving any missing task queue dependencies
WARNING: Nothing PROVIDES 'nativesdk-open-isns' (but
virtual:nativesdk:/srv/build/yoe/sou
  nativesdk-openmp
  nativesdk-openssh
  nativesdk-openssl
WARNING: Nothing PROVIDES 'linux-libc-headers-native' (but
virtual:native:/srv/build/yoe/
  linux-libc-headers
  opencl-headers-native
  spirv-headers-native
WARNING: Nothing RPROVIDES 'nativesdk-iscsi-initiator-utils' (but
virtual:nativesdk:/srv/
No eligible RPROVIDERs exist for 'nativesdk-iscsi-initiator-utils'
NOTE: Runtime target 'nativesdk-iscsi-initiator-utils' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['nativesdk-iscsi-initiator-utils']
WARNING: Nothing RPROVIDES 'nativesdk-iscsi-initiator-utils-dev' (but
virtual:nativesdk:/
No eligible RPROVIDERs exist for 'nativesdk-iscsi-initiator-utils-dev'
NOTE: Runtime target 'nativesdk-iscsi-initiator-utils-dev' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['nativesdk-iscsi-initiator-utils-dev']
WARNING: Nothing RPROVIDES 'audit-dev-native' (but
virtual:native:/srv/build/yoe/sources/
No eligible RPROVIDERs exist for 'audit-dev-native'
NOTE: Runtime target 'audit-dev-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['audit-dev-native']
WARNING: Nothing RPROVIDES 'audit-native' (but
virtual:native:/srv/build/yoe/sources/meta
No eligible RPROVIDERs exist for 'audit-native'
NOTE: Runtime target 'audit-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['audit-native']

On Tue, Mar 17, 2026 at 9:58=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Please run
>
> bitbake -c fetch universe --dry-run -k
>
> With these changes and fix the fallouts.
>
> On Sun, Mar 15, 2026 at 6:35=E2=80=AFAM Deepak Rathore via lists.openembe=
dded.org
> <deeratho=3Dcisco.com@lists.openembedded.org> wrote:
>
>> From: Deepak Rathore <deeratho@cisco.com>
>>
>> This series extends a set of recipes to support native and nativesdk
>> variants.
>> These packages are needed as host or SDK artifacts in certain dependency
>> chains
>> (e.g., perf/tracing and networking toolchains), where dependency
>> resolution
>> fails when only the target variant exists.
>>
>> None of the changes alter target package behavior; they solely enable th=
e
>> required native/nativesdk build paths.
>>
>> Testing:
>>   - Built each recipe as native/nativesdk on x86-64 with no errors.
>>   - Verified existing target builds are unaffected.
>>
>> Deepak Rathore (24):
>>   libburn: extend recipe for nativesdk builds
>>   libisoburn: extend recipe for nativesdk builds
>>   libisofs: extend recipe for nativesdk builds
>>   iscsi-initiator-utils: extend recipe for native/nativesdk builds
>>   open-isns: extend recipe for native builds
>>   tcpdump: extend recipe for native/nativesdk builds
>>   nodejs: extend recipe for nativesdk builds
>>   libyang: extend recipe for native/nativesdk builds
>>   libtracefs: extend recipe for native/nativesdk builds
>>   trace-cmd: extend recipe for native/nativesdk builds
>>   audit: extend recipe for native builds
>>   cunit: extend recipe for nativesdk builds
>>   python3-arrow: extend recipe for native/nativesdk builds
>>   python3-fastnumbers: extend recipe for native/nativesdk builds
>>   python3-future: extend recipe for nativesdk builds
>>   python3-icu: extend recipe for native/nativesdk builds
>>   python3-ipy: extend recipe for nativesdk builds
>>   python3-jsonpatch: extend recipe for native/nativesdk builds
>>   python3-natsort: extend recipe for native/nativesdk builds
>>   python3-ordered-set: extend recipe for native/nativesdk builds
>>   python3-sh: extend recipe for native/nativesdk builds
>>   python3-tabulate: extend recipe for native/nativesdk builds
>>   python3-types-python-dateutil: extend recipe for native/nativesdk buil=
ds
>>   python3-websocket-client: extend recipe for native/nativesdk builds
>>
>> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>> ---
>>  meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
>>  | 2 +-
>>  meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
>> | 2 +-
>>  meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
>> | 2 +-
>>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
>>  | 1 +
>>  meta-networking/recipes-support/open-isns/open-isns_0.102.bb
>>  | 1 +
>>  meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
>> | 1 +
>>  meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> | 2 +-
>>  meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
>>  | 1 +
>>  meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
>> | 1 +
>>  meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
>> | 1 +
>>  meta-oe/recipes-security/audit/audit_4.1.3.bb
>> | 2 ++
>>  meta-oe/recipes-test/cunit/cunit_2.1-3.bb
>> | 2 +-
>>  meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
>>  | 1 +
>>  meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
>>  | 1 +
>>  meta-python/recipes-devtools/python/python3-future_1.0.0.bb
>> | 2 +-
>>  meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
>> | 2 ++
>>  meta-python/recipes-devtools/python/python3-ipy_1.01.bb
>> | 2 +-
>>  meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
>> | 1 +
>>  meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
>>  | 1 +
>>  .../recipes-devtools/python/python3-ordered-set_4.1.0.bb
>>  | 2 +-
>>  meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
>> | 1 +
>>  meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
>> | 1 +
>>  .../python/python3-types-python-dateutil_2.9.0.20241003.bb
>>  | 1 +
>>  .../recipes-devtools/python/python3-websocket-client_1.7.0.bb
>> | 1 +
>>  24 files changed, 26 insertions(+), 8 deletions(-)
>>
>> --
>> 2.35.6
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125219):
>> https://lists.openembedded.org/g/openembedded-devel/message/125219
>> Mute This Topic: https://lists.openembedded.org/mt/118327819/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000040cd90064d3dbf5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">here is what I am seeing<div><br></div><div>=E2=9D=AF ci.s=
h<br>WARNING: Duplicate inclusion for /srv/build/yoe/sources/openembedded-c=
ore/meta/conf/distr<br>WARNING: Duplicate inclusion for /srv/build/yoe/sour=
ces/openembedded-core/meta/conf/distr<br>WARNING: Duplicate inclusion for /=
srv/build/yoe/sources/openembedded-core/meta/conf/distr<br>WARNING: Duplica=
te inclusion for /srv/build/yoe/sources/openembedded-core/meta/conf/distr<b=
r>NOTE: Started PRServer with DBfile: /srv/build/yoe/cache/prserv.sqlite3, =
Address: 127.0.0<br>Loading cache: 100% |##################################=
###################| Time: 0:00:00<br>Loaded 0 entries from dependency cach=
e.<br>Parsing recipes: 100% |##############################################=
#####| Time: 0:00:21<br>Parsing of 3472 .bb files complete (0 cached, 3472 =
parsed). 5951 targets, 169 skipped, 0<br>NOTE: The &quot;universe&quot; tar=
get is only intended for testing and may produce errors.<br>NOTE: Resolving=
 any missing task queue dependencies<br>WARNING: Nothing PROVIDES &#39;nati=
vesdk-open-isns&#39; (but virtual:nativesdk:/srv/build/yoe/sou<br>=C2=A0 na=
tivesdk-openmp<br>=C2=A0 nativesdk-openssh<br>=C2=A0 nativesdk-openssl<br>W=
ARNING: Nothing PROVIDES &#39;linux-libc-headers-native&#39; (but virtual:n=
ative:/srv/build/yoe/<br>=C2=A0 linux-libc-headers<br>=C2=A0 opencl-headers=
-native<br>=C2=A0 spirv-headers-native<br>WARNING: Nothing RPROVIDES &#39;n=
ativesdk-iscsi-initiator-utils&#39; (but virtual:nativesdk:/srv/<br>No elig=
ible RPROVIDERs exist for &#39;nativesdk-iscsi-initiator-utils&#39;<br>NOTE=
: Runtime target &#39;nativesdk-iscsi-initiator-utils&#39; is unbuildable, =
removing...<br>Missing or unbuildable dependency chain was: [&#39;nativesdk=
-iscsi-initiator-utils&#39;]<br>WARNING: Nothing RPROVIDES &#39;nativesdk-i=
scsi-initiator-utils-dev&#39; (but virtual:nativesdk:/<br>No eligible RPROV=
IDERs exist for &#39;nativesdk-iscsi-initiator-utils-dev&#39;<br>NOTE: Runt=
ime target &#39;nativesdk-iscsi-initiator-utils-dev&#39; is unbuildable, re=
moving...<br>Missing or unbuildable dependency chain was: [&#39;nativesdk-i=
scsi-initiator-utils-dev&#39;]<br>WARNING: Nothing RPROVIDES &#39;audit-dev=
-native&#39; (but virtual:native:/srv/build/yoe/sources/<br>No eligible RPR=
OVIDERs exist for &#39;audit-dev-native&#39;<br>NOTE: Runtime target &#39;a=
udit-dev-native&#39; is unbuildable, removing...<br>Missing or unbuildable =
dependency chain was: [&#39;audit-dev-native&#39;]<br>WARNING: Nothing RPRO=
VIDES &#39;audit-native&#39; (but virtual:native:/srv/build/yoe/sources/met=
a<br>No eligible RPROVIDERs exist for &#39;audit-native&#39;<br>NOTE: Runti=
me target &#39;audit-native&#39; is unbuildable, removing...<br>Missing or =
unbuildable dependency chain was: [&#39;audit-native&#39;]</div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Mar 17, 2026 at 9:58=E2=80=AFAM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Please=C2=A0r=
un=C2=A0<div><br></div><div>bitbake -c fetch universe --dry-run -k<br></div=
><div><br></div><div>With these changes and fix the fallouts.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, =
Mar 15, 2026 at 6:35=E2=80=AFAM Deepak Rathore via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;deeratho=
=3D<a href=3D"mailto:cisco.com@lists.openembedded.org" target=3D"_blank">ci=
sco.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Deepak Rathore &lt;<a href=3D"mailto:de=
eratho@cisco.com" target=3D"_blank">deeratho@cisco.com</a>&gt;<br>
<br>
This series extends a set of recipes to support native and nativesdk varian=
ts.<br>
These packages are needed as host or SDK artifacts in certain dependency ch=
ains<br>
(e.g., perf/tracing and networking toolchains), where dependency resolution=
<br>
fails when only the target variant exists.<br>
<br>
None of the changes alter target package behavior; they solely enable the<b=
r>
required native/nativesdk build paths.<br>
<br>
Testing:<br>
=C2=A0 - Built each recipe as native/nativesdk on x86-64 with no errors.<br=
>
=C2=A0 - Verified existing target builds are unaffected.<br>
<br>
Deepak Rathore (24):<br>
=C2=A0 libburn: extend recipe for nativesdk builds<br>
=C2=A0 libisoburn: extend recipe for nativesdk builds<br>
=C2=A0 libisofs: extend recipe for nativesdk builds<br>
=C2=A0 iscsi-initiator-utils: extend recipe for native/nativesdk builds<br>
=C2=A0 open-isns: extend recipe for native builds<br>
=C2=A0 tcpdump: extend recipe for native/nativesdk builds<br>
=C2=A0 nodejs: extend recipe for nativesdk builds<br>
=C2=A0 libyang: extend recipe for native/nativesdk builds<br>
=C2=A0 libtracefs: extend recipe for native/nativesdk builds<br>
=C2=A0 trace-cmd: extend recipe for native/nativesdk builds<br>
=C2=A0 audit: extend recipe for native builds<br>
=C2=A0 cunit: extend recipe for nativesdk builds<br>
=C2=A0 python3-arrow: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-fastnumbers: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-future: extend recipe for nativesdk builds<br>
=C2=A0 python3-icu: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-ipy: extend recipe for nativesdk builds<br>
=C2=A0 python3-jsonpatch: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-natsort: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-ordered-set: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-sh: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-tabulate: extend recipe for native/nativesdk builds<br>
=C2=A0 python3-types-python-dateutil: extend recipe for native/nativesdk bu=
ilds<br>
=C2=A0 python3-websocket-client: extend recipe for native/nativesdk builds<=
br>
<br>
Signed-off-by: Deepak Rathore &lt;<a href=3D"mailto:deeratho@cisco.com" tar=
get=3D"_blank">deeratho@cisco.com</a>&gt;<br>
---<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libburn=
_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libburn_1.5.6.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libisob=
urn_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libisoburn_1.5.6.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-filesystems/recipes-filesystems/burnia/<a href=3D"http://libisof=
s_1.5.6.bb" rel=3D"noreferrer" target=3D"_blank">libisofs_1.5.6.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../iscsi-initiator-utils/<a href=3D"http://iscsi-initiator-utils_2.1=
.11.bb" rel=3D"noreferrer" target=3D"_blank">iscsi-initiator-utils_2.1.11.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-networking/recipes-support/open-isns/<a href=3D"http://open-isns=
_0.102.bb" rel=3D"noreferrer" target=3D"_blank">open-isns_0.102.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-networking/recipes-support/tcpdump/<a href=3D"http://tcpdump_4.9=
9.6.bb" rel=3D"noreferrer" target=3D"_blank">tcpdump_4.99.6.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-kernel/trace-cmd/<a href=3D"http://trace-cmd_3.1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">trace-cmd_3.1.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-oe/recipes-security/audit/<a href=3D"http://audit_4.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">audit_4.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
+<br>
=C2=A0meta-oe/recipes-test/cunit/<a href=3D"http://cunit_2.1-3.bb" rel=3D"n=
oreferrer" target=3D"_blank">cunit_2.1-3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-arrow_1=
.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-arrow_1.4.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-fastnum=
bers_5.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastnumbers_5.1=
.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-future_=
1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-future_1.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-icu_2.1=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-icu_2.16.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-natsort=
_8.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-natsort_8.4.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-ordered-set_4.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ordered-set_4.1.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-sh_2.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sh_2.2.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-tabulat=
e_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-tabulate_0.9.0.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-types-python-dateutil_2.9.0.2024=
1003.bb" rel=3D"noreferrer" target=3D"_blank">python3-types-python-dateutil=
_2.9.0.20241003.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +=
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-websocket-clien=
t_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-websocket-client_1=
.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A024 files changed, 26 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.35.6<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125219): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125219" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125219</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118327819/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118327819/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000040cd90064d3dbf5b--

