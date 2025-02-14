Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35540C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 09:02:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16969.1739523738387157986
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 01:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OMbThfjd;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so847874f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 01:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739523737; x=1740128537; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0bXC+1IDHcveDlevu/iTx0opk/09JnuKXLKWypM85bk=;
        b=OMbThfjdt44r+KJyPYjHl/kJbMs1mneqweWKMh3cl+zOsteGNEgbB3bbBW4ztLsQH4
         tiFqiDTV6j2hx6FSJXJsAlRj/AwLD4P/P/aUrxkl82aysdMVlEXJDFKCW7IKPDaX3ESI
         5+aI1NctPhZ19ekZVUNcTtmBSEpON3DAtr3xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523737; x=1740128537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bXC+1IDHcveDlevu/iTx0opk/09JnuKXLKWypM85bk=;
        b=g2fzizPMNr1FPAQXlpKegMP+SkdiOR/jWugINwXOAFiUeK7gpcGVaGcNGWgrgnudsI
         2DhXNgwxgUR4i0Gzz4BI3ihiZIjdgOcMxLPVzi3sgTw+UnfY4TQUZscXt3651FAJRYNa
         HVrkpwrDveUDA0dI3tkb9bJxWogEVrKXsJ7WIh8V0CMPdxezJ6mA6VNEBSSgebToCZXX
         USeRfh9aHf9UTrRRk1dEDQfGlGiqGSuhek3YYsaEzkHdJha4QRCM5dtM3O48W4gIxj8C
         sjJSaSrlIpbIOv+kjfy6JlfaQjMLPX4zp2A90zUDvfS9XeKVmaEpzcc9js9o2jpi5Ec+
         BNpw==
X-Gm-Message-State: AOJu0YxizAkfHP0xzhMRQDShAl58I7nceoTa0LefAmdph6JKYaatzK2H
	/+0LjgPG5aQAmoyioJy8YDZflKmlrKnDaJiLqApLLXgZR+n8ik4i1Wxh8O30GZtfi0G2mZo1HBc
	p1FsXRy3sloer5FwokVBxwk+EGj9mG1GaJannuA==
X-Gm-Gg: ASbGncsapkEuOAc9h+G65Y9ThrMhk27KFeSwVbdgPPPocNz3/M2A+mwngckUvhJ6TbX
	sP3c/2kY05H9lKxc57geQzoHoJ+BaSY2rxoLF4Sqa54nZdcm1d6GEwn/9rIcfnZH7Ov+/eX7B8o
	MJOckeyCrNUTn6/zxVCOVtoFGHyRcl
X-Google-Smtp-Source: AGHT+IF+TrOqBgTAGcuHX7nI8i0sJV3qXPd/HwnemQKTWls48g9Y48felYvhL5395NUJuY+YZuqc4xkvoFK4BfZaNGo=
X-Received: by 2002:a05:6000:144f:b0:38d:d0ea:b04c with SMTP id
 ffacd0b85a97d-38dea2eadfamr13949278f8f.38.1739523736671; Fri, 14 Feb 2025
 01:02:16 -0800 (PST)
MIME-Version: 1.0
References: <CAMSfU+413shmiBy9cc1yep+JMfFdkLKm_xhbfuZJ0METTGkPMg@mail.gmail.com>
 <18350.1739522720980592260@lists.openembedded.org>
In-Reply-To: <18350.1739522720980592260@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 14 Feb 2025 10:01:50 +0100
X-Gm-Features: AWEUYZnENJuoxmaJ-DNPhjFfUwXQnFfGQKVXKkDUc58txMjhDyzwXdomfvSC3Os
Message-ID: <CAMSfU+6V1djUu+mt_BeCdcb=3-GuLAtZjFaqrmaPRPf7nrSBmA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] corosync: reproducibility issue
To: gavrosc@yahoo.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000674b8a062e166ef4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115483

--000000000000674b8a062e166ef4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 14 f=C3=A9vr. 2025 =C3=A0 09:45, Christos Gavros via lists.openembe=
dded.org
<gavrosc=3Dyahoo.com@lists.openembedded.org> a =C3=A9crit :

> hi
>
> the patch is merged in master-next, can I still change it and submit v3?
>
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dbb138b9f6b0ae7a77b5be468356a9ed0d7787c88
>

master-next is the branch under test. It's not too late to send a v3. That
is not a major issue anyway...


> I was thinking the same... but we ended up that the issue is coming from
> this macro NETSNMP_SYS_CONTACT by looking the diffoscope
>
> https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-=
reproducible-20250201-4tpvm0li/packages/diff-html/#reproducibleA-tmp---repr=
oducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-dep=
loy-deb-core-------reproducibleA-tmp-deploy-deb-core-----corosync-dbg_-.-.-=
-r-_amd--.deb---data.tar.xz---data.tar---.-usr-sbin-.debug-corosync-notifyd=
---readelf---wide---debug-dump-macro---
>
> NETSNMP_SYS_CONTACT is defined and used in 'net-snmp' in build directory.
> Then I checked net-snmp source code and find that this macro is defined a=
nd
> assigned there as explained in patch.
>
> Shall we wait for autobuilder to test it and take further actions from
> there?
>

Yes, I would do that.
Remember that since this reproducibility issue is host distro related, we
will have to wait some reproducibility (weekly) runs to be sure it was
tested on different host distro.


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115480):
> https://lists.openembedded.org/g/openembedded-devel/message/115480
> Mute This Topic: https://lists.openembedded.org/mt/111173431/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000674b8a062e166ef4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 14=
 f=C3=A9vr. 2025 =C3=A0=C2=A009:45, Christos Gavros via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;gavrosc=3D<a href=3D"=
mailto:yahoo.com@lists.openembedded.org">yahoo.com@lists.openembedded.org</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>hi</div>
<div>=C2=A0</div>
<div>the patch is merged in master-next, can I still change it and submit v=
3?</div>
<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3D=
master-next&amp;id=3Dbb138b9f6b0ae7a77b5be468356a9ed0d7787c88" target=3D"_b=
lank">https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-nex=
t&amp;id=3Dbb138b9f6b0ae7a77b5be468356a9ed0d7787c88</a></div></blockquote><=
div><br></div><div>master-next is the branch under test. It&#39;s not too l=
ate to send a v3. That is not a major issue anyway...</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div>I was thinking the =
same... but we ended up that the issue is coming from this macro NETSNMP_SY=
S_CONTACT by looking the diffoscope</div>
<div><a href=3D"https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-=
networking/oe-reproducible-20250201-4tpvm0li/packages/diff-html/#reproducib=
leA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reprodu=
cibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----coro=
sync-dbg_-.-.--r-_amd--.deb---data.tar.xz---data.tar---.-usr-sbin-.debug-co=
rosync-notifyd---readelf---wide---debug-dump-macro---" target=3D"_blank">ht=
tps://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-repr=
oducible-20250201-4tpvm0li/packages/diff-html/#reproducibleA-tmp---reproduc=
ibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-=
deb-core-------reproducibleA-tmp-deploy-deb-core-----corosync-dbg_-.-.--r-_=
amd--.deb---data.tar.xz---data.tar---.-usr-sbin-.debug-corosync-notifyd---r=
eadelf---wide---debug-dump-macro---</a></div>
<div>=C2=A0</div>
<div>NETSNMP_SYS_CONTACT is defined and used in &#39;net-snmp&#39; in build=
 directory. Then I checked net-snmp source code and find that this macro is=
 defined and assigned there as explained in patch.</div>
<div>=C2=A0</div>
<div>Shall we wait for autobuilder to test it and take further actions from=
 there?</div></blockquote><div><br></div><div>Yes, I would do that.</div><d=
iv>Remember that since this reproducibility issue is host distro related, w=
e will have to wait some reproducibility (weekly) runs to be sure it was te=
sted on different host distro.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115480): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115480" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115480</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111173431/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111173431/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000674b8a062e166ef4--

