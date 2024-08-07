Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CFC52D7B
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 18:02:21 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.40123.1723053735741466188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 11:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id F1BDA2BA50;
	Wed,  7 Aug 2024 20:02:13 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.32.204]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbkzF-45S8rQ0; Wed, 7 Aug 2024 20:02:13 +0200
Date: Wed, 07 Aug 2024 20:03:38 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-networking][PATCH] blueman: skip buildpath error
To: ChenQi <Qi.Chen@windriver.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <2U0VHS.ECO92WQ25WHG2@t-online.de>
In-Reply-To: <2c1328fb-9fc6-6d9b-dbc5-eef93a874037@windriver.com>
References: <20240806203423.993216-1-f_l_k@t-online.de>
	<2c1328fb-9fc6-6d9b-dbc5-eef93a874037@windriver.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GhXyW5EaYmUu4NkbLIEO"
X-TOI-EXPURGATEID: 150726::1723053733-D77EE06B-FFB562AB/0/0 CLEAN NORMAL
X-TOI-MSGID: 4fd30ece-481a-45f0-91f9-996f65e349fe
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 18:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111637

--=-GhXyW5EaYmUu4NkbLIEO
Content-Type: text/plain; charset=us-ascii; format=flowed

I'm not absolutely sure either. But what happens is what is described 
here:
<https://github.com/cython/cython/issues/5949>

cython creates a variable in _blueman.c that stores the path where the 
blueman module was built:
static const char __pyx_k_home_flk_poky_build_hypr_tmp_wo[] = 
"/home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/blueman/2.4.3/git/module/_blueman.pyx";

So to me it looked like quite a similar issue. Infirit from blueman 
team also has no idea, why this is happening
<https://github.com/blueman-project/blueman/pull/2435>


On Wed, Aug 7 2024 at 04:28:34 PM +08:00:00, ChenQi 
<Qi.Chen@windriver.com> wrote:
> INSANE_SKIP is usually set on a per-package basis.
> e.g.,
> meta/recipes-support/vim/vim.inc:INSANE_SKIP:${PN}-tools = 
> "file-rdeps"
> 
> And following the link you provide, it does look like a blueman 
> issue, because otherwise all projects using cython will have the same 
> problem. I'm not sure about it though.
> 
> Regards,
> Qi
> 
> 
> On 8/7/24 04:34, Markus Volk wrote:
>> Blueman has compiled the buildpath into _blueman.so.
>> The underlying issue is related to the cython compiler, so theres 
>> nothing
>> that can be done from the blueman side.
>> [<https://github.com/cython/cython/issues/5949>]
>> 
>> Disable the buildpath error to keep blueman usable until the problem 
>> is fixed.
>> ---
>>   meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb | 2 
>> ++
>>   1 file changed, 2 insertions(+)
>> 
>> diff --git 
>> a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb 
>> b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
>> index 0374d23f0..afb97ee28 100644
>> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
>> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
>> @@ -86,3 +86,5 @@ do_install:append() {
>>           chmod 700 ${D}/${datadir}/polkit-1/rules.d
>>           chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
>>   }
>> +
>> +INSANE_SKIP = "buildpaths"
>> 
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111598): 
>> <https://lists.openembedded.org/g/openembedded-devel/message/111598>
>> Mute This Topic: 
>> <https://lists.openembedded.org/mt/107758090/7304865>
>> Group Owner: openembedded-devel+owner@lists.openembedded.org 
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>> Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
>> [Qi.Chen@eng.windriver.com <mailto:Qi.Chen@eng.windriver.com>]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 


--=-GhXyW5EaYmUu4NkbLIEO
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>I'm not absolutely sure eithe=
r. But what happens is what is described here:</div><div><a href=3D"https:/=
/github.com/cython/cython/issues/5949">https://github.com/cython/cython/iss=
ues/5949</a></div><div><br></div><div>cython creates a variable in _blueman=
.c that stores the path where the blueman module was built:</div><div>stati=
c const char __pyx_k_home_flk_poky_build_hypr_tmp_wo[] =3D "/home/flk/poky/=
build-hypr/tmp/work/corei7-64-poky-linux/blueman/2.4.3/git/module/_blueman.=
pyx";</div><div><br></div><div>So to me it looked like quite a similar issu=
e. Infirit from blueman team also has no idea, why this is happening</div><=
div><a href=3D"https://github.com/blueman-project/blueman/pull/2435">https:=
//github.com/blueman-project/blueman/pull/2435</a></div></div><div><br></di=
v></div><div id=3D"geary-quote" dir=3D"auto"><br>On Wed, Aug 7 2024 at 04:2=
8:34 PM +08:00:00, ChenQi &lt;Qi.Chen@windriver.com&gt; wrote:<br><blockquo=
te type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-space=
s;">INSANE_SKIP is usually set on a per-package basis.
e.g.,
meta/recipes-support/vim/vim.inc:INSANE_SKIP:${PN}-tools =3D "file-rdeps"

And following the link you provide, it does look like a blueman issue, beca=
use otherwise all projects using cython will have the same problem. I'm not=
 sure about it though.

Regards,
Qi


On 8/7/24 04:34, Markus Volk wrote:
<blockquote>Blueman has compiled the buildpath into _blueman.so.
The underlying issue is related to the cython compiler, so theres nothing
that can be done from the blueman side.
[<a href=3D"https://github.com/cython/cython/issues/5949">https://github.co=
m/cython/cython/issues/5949</a>]

Disable the buildpath error to keep blueman usable until the problem is fix=
ed.
---
  meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb =
b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index 0374d23f0..afb97ee28 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -86,3 +86,5 @@ do_install:append() {
          chmod 700 ${D}/${datadir}/polkit-1/rules.d
          chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
  }
+
+INSANE_SKIP =3D "buildpaths"

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111598): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111598">https://lists.openembedded.org/g/openembed=
ded-devel/message/111598</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107758090/730=
4865">https://lists.openembedded.org/mt/107758090/7304865</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote>
</div></blockquote></div>
--=-GhXyW5EaYmUu4NkbLIEO--


