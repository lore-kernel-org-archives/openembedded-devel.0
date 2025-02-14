Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CCC02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:45:28 +0000 (UTC)
Subject: Re: [meta-networking][PATCH v2] corosync: reproducibility issue
To: openembedded-devel@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.3
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 00:45:20 -0800
References: <CAMSfU+413shmiBy9cc1yep+JMfFdkLKm_xhbfuZJ0METTGkPMg@mail.gmail.com>
In-Reply-To: <CAMSfU+413shmiBy9cc1yep+JMfFdkLKm_xhbfuZJ0METTGkPMg@mail.gmail.com>
Message-ID: <18350.1739522720980592260@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zz3eXYTMCtxFKVgpOyB7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115480

--zz3eXYTMCtxFKVgpOyB7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi

the patch is merged in master-next, can I still change it and submit v3?
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dbb138b9f6b0ae7a77b5be468356a9ed0d7787c88

I was thinking the same... but we ended up that the issue is coming from th=
is macro NETSNMP_SYS_CONTACT by looking the diffoscope
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-re=
producible-20250201-4tpvm0li/packages/diff-html/#reproducibleA-tmp---reprod=
ucibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deplo=
y-deb-core-------reproducibleA-tmp-deploy-deb-core-----corosync-dbg_-.-.--r=
-_amd--.deb---data.tar.xz---data.tar---.-usr-sbin-.debug-corosync-notifyd--=
-readelf---wide---debug-dump-macro---

NETSNMP_SYS_CONTACT is defined and used in 'net-snmp' in build directory. T=
hen I checked net-snmp source code and find that this macro is defined and =
assigned there as explained in patch.

Shall we wait for autobuilder to test it and take further actions from ther=
e?

--zz3eXYTMCtxFKVgpOyB7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi</div>
<div>&nbsp;</div>
<div>the patch is merged in master-next, can I still change it and submit v=
3?</div>
<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3D=
master-next&amp;id=3Dbb138b9f6b0ae7a77b5be468356a9ed0d7787c88">https://git.=
openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3Dbb138b9=
f6b0ae7a77b5be468356a9ed0d7787c88</a></div>
<div>&nbsp;</div>
<div>I was thinking the same... but we ended up that the issue is coming fr=
om this macro NETSNMP_SYS_CONTACT by looking the diffoscope</div>
<div><a href=3D"https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-=
networking/oe-reproducible-20250201-4tpvm0li/packages/diff-html/#reproducib=
leA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reprodu=
cibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----coro=
sync-dbg_-.-.--r-_amd--.deb---data.tar.xz---data.tar---.-usr-sbin-.debug-co=
rosync-notifyd---readelf---wide---debug-dump-macro---">https://valkyrie.yoc=
to.io/pub/repro-fail-openembedded/meta-networking/oe-reproducible-20250201-=
4tpvm0li/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy--=
-reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------rep=
roducibleA-tmp-deploy-deb-core-----corosync-dbg_-.-.--r-_amd--.deb---data.t=
ar.xz---data.tar---.-usr-sbin-.debug-corosync-notifyd---readelf---wide---de=
bug-dump-macro---</a></div>
<div>&nbsp;</div>
<div>NETSNMP_SYS_CONTACT is defined and used in 'net-snmp' in build directo=
ry. Then I checked net-snmp source code and find that this macro is defined=
 and assigned there as explained in patch.</div>
<div>&nbsp;</div>
<div>Shall we wait for autobuilder to test it and take further actions from=
 there?</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--zz3eXYTMCtxFKVgpOyB7--

