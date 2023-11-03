Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D0AC0018C
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.63223.1699041739147715432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a13L/6MD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WQNzLP6V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96c77f73-e420c509-7b88-4ced-a2cd-bd4936136097-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FHSNGP0f3fXnejy6MrLa8IoJwXe34IjR+KSL86+qBFY=;
	b=a13L/6MDlO+vH+2E4g+FHo7HIR5Zrsk9YT50aWmwrgFemdxi0F6oX+/qI59dEUno
	lZOWi26189zw9jOE5rhlV9hIzYQ2klp4SOqNZuHfv0o4cAm5Su3BTl5UU+ZrMfXrLhM
	i7VOPhTatV0fcbRYw/k7skqbc9jXMh4Uh6qjVUOE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FHSNGP0f3fXnejy6MrLa8IoJwXe34IjR+KSL86+qBFY=;
	b=WQNzLP6V9B6bzvxzsy86uAyKLq/ufyZjS9e+2RgH9N2z+iQCUVZkFhdaewc9GU2i
	djcLTrVMzF5koBZd1t0t77z1nxCqOY1/YC9TMd4tw4nrBEPHGI+dDgDvupSvVhjJzGZ
	a9n3nbvmODGuztE8oi8tEi0kJ4RJHPqj+hiISe7A=
Content-Type: multipart/mixed; boundary="===============6359072864025720433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] opencl-headers: upgrading to 2023.04.17 SUCCEEDED
Message-ID: <0101018b96c77f73-e420c509-7b88-4ced-a2cd-bd4936136097-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106062

--===============6359072864025720433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *opencl-headers* to *2023.04.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-opencl-headers-upgrade-04.17-2023.04.17.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 0cd59c2d546257d50e4fc1dc266ae4155d5f890e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:16:22 +0000
Subject: [PATCH] opencl-headers: upgrade 04.17 -> 2023.04.17

---
 .../{opencl-headers_04.17.bb => opencl-headers_2023.04.17.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_04.17.bb => opencl-headers_2023.04.17.bb} (100%)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_04.17.bb b/meta-oe/recipes-core/opencl/opencl-headers_2023.04.17.bb
similarity index 100%
rename from meta-oe/recipes-core/opencl/opencl-headers_04.17.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2023.04.17.bb
-- 
2.39.2


--===============6359072864025720433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/opencl-headers: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-dbg: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-dbg: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-dev: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-dev: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-doc: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-doc: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-locale: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-locale: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-src: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-src: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers-staticdev: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers-staticdev: PV changed from "04.17" to "2023.04.17"
packages/core2-64-poky-linux/opencl-headers/opencl-headers: PKGV changed from 04.17 [default] to 2023.04.17 [default]
packages/core2-64-poky-linux/opencl-headers/opencl-headers: PV changed from "04.17" to "2023.04.17"

--===============6359072864025720433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-opencl-headers-upgrade-04.17-2023.04.17.patch"

RnJvbSAwY2Q1OWMyZDU0NjI1N2Q1MGU0ZmMxZGMyNjZhZTQxNTVkNWY4OTBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzoxNjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5jbC1oZWFkZXJzOiB1cGdyYWRlIDA0LjE3IC0+IDIwMjMuMDQuMTcKCi0tLQogLi4uL3tvcGVu
Y2wtaGVhZGVyc18wNC4xNy5iYiA9PiBvcGVuY2wtaGVhZGVyc18yMDIzLjA0LjE3LmJifSAgICAg
fCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEtb2UvcmVjaXBlcy1jb3JlL29wZW5jbC97b3BlbmNsLWhlYWRlcnNfMDQuMTcuYmIg
PT4gb3BlbmNsLWhlYWRlcnNfMjAyMy4wNC4xNy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS1vZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29wZW5jbC1oZWFkZXJzXzA0LjE3LmJiIGIvbWV0YS1v
ZS9yZWNpcGVzLWNvcmUvb3BlbmNsL29wZW5jbC1oZWFkZXJzXzIwMjMuMDQuMTcuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1jb3JlL29wZW5jbC9v
cGVuY2wtaGVhZGVyc18wNC4xNy5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLWNvcmUvb3Bl
bmNsL29wZW5jbC1oZWFkZXJzXzIwMjMuMDQuMTcuYmIKLS0gCjIuMzkuMgoK

--===============6359072864025720433==--

