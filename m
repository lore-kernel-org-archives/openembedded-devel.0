Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDAEE7BD8A
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:00:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17293.1771239638553463201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 03:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=o9P8FNbv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Vt27TL64;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FLDKiC1582941
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AT6OeoGr1KHwu4cSf/CVx8Oevv40FpQZl6Ba9ZANEk=; b=o9P8FNbvYeDYDckP
	ysaC6xYRbyuBTOxfG3RnMPMu9TIcQhL+hbQBjoL69TjoXuTpkCLFL1b+pAeeIsft
	q4wYofA5xhFU8BUJaD7KF8eZ54GiRKpkE3dVmxEyWSFlUIZAevB0HRTEUT7Z7pZC
	aG/mkfzkAYDO/SJ6nz/BscPet1bxyhhXIOjjoAjcgVbExktXBE5PV0oqmLHqUQjB
	/1bgU69hz/tpNW5MrEdedUeQmBsqUM51CtSzW2HUccchu3Fk9nrp3avujr4Am0wI
	GNqlrQ8ZGygJ1z7NkbjEi8loP9xx0ubpx4fnV7BzhUyzN8hf+lnrK7zoM11AYzrN
	VtpSvQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hd04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 11:00:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8947d47793fso446877136d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 03:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771239636; cv=none;
        d=google.com; s=arc-20240605;
        b=U3jeqwd3mFve0NwbDDngaJBhmBE/PgxTjMohOY+gGiJSQFPSIfJATsI77StBdgpsnD
         AblRYMJSEiCOheF3Dhuo5hZKgWnn2usCCLTL96hvsUEOy3K3veb6zZSL/sKW9QO0Qz21
         H+coPk49yfDWizTN9keFxmeNMwlxIfQ9XHEKD6RWOTHXvqjEVbyak6qyPH/ohcEVv9og
         SpRimB2f8iJQMV+cGzTXkMkfzqrc/5K0GBK6tVDsTVVCwnpIOsPpB3iEjl76M11O9g/3
         iXseo/Agqo22dZF1LAsK3mvbUU4AN1i4rDov5LOSHs2Rwv8COr2n3vuWXFWRtXdZVnvV
         WqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7AT6OeoGr1KHwu4cSf/CVx8Oevv40FpQZl6Ba9ZANEk=;
        fh=TFaYYQhti2gL/O1SvckrUik1KlU0zlJoAIcFbfedGks=;
        b=T3xWxOed9LblYmTf1O1YlPVFbHM0UNPwN7Pkgdbvb8hFWyUPe+OGg22EhOejQzAoHz
         dZHrvv84wBXnpkM6cQWApAppFKP6vYMysqXkDeJpRULVjM0yT6R0AynskGBV1xqtjw6J
         DQGmDhhEmIYuxVFKpQ79eAm+8gVWuJcweMDS/Rs52foJgP5AJtLWVsD9IW4sS5CwPB/6
         9oZvu6I6Y+W3mR2Ox8cpszSAphQvazV+Kj8yU4hwu/r9suIU88YPHflme8+gO9OAkeMv
         EiuNu1s6q5ITOv5e8GcpVFw1HILq1Oi2ReaRg2HJduXxVWGHCee3uuq/EWRyvqu2ytQi
         kSuQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239636; x=1771844436; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AT6OeoGr1KHwu4cSf/CVx8Oevv40FpQZl6Ba9ZANEk=;
        b=Vt27TL64o8KAkOiAu62so8hKT01F2uTuozFjGdKDKJK8pDSHlMJdB/m3Do8oDdq6x/
         Uh9QD4cl9bnzbAk61n8qhCfltvR0g3Bl8L2dJDY7f6rVkvtINXHz88aSjcV9VptL7/vK
         C+A9TVrUVj9cZWThuILt7ty05RWC5NIjEGXxGiG3vHBM/c8Sk8m2nkZcUv48XW9P6lLZ
         cXu68LIGjencHIfkFaGuTS4CSHhh0bCxD69pm1q8dYFQOwKXT25CF6zqDYWhWozfC/Fw
         77v/6a4EUVM1uCGjnZL9BW2b0C8yuOjpKQlBwq2YvTtUnVfucc5hXGQYmYhpCeZYYDWG
         uAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239636; x=1771844436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AT6OeoGr1KHwu4cSf/CVx8Oevv40FpQZl6Ba9ZANEk=;
        b=pcUFlH87KR9GQhYujzNK56OBEf6ReIb00AX70CE2vWsOkxdklcrUp7Ovn8T7/RXo3P
         A2OfVdYY8sHEFpqp4x1OO5BjklZEONJKy9P9Sexi9t8FpF/X7vIAfgiXBegln/3jBP4X
         mJwhisZoL1tVtuM1AtZMpFqUwH56+jaHZxTnevrE0w76s94cn2ITrV8rtJLHfuY/bl3U
         ToUO88CCfwWZCN7kQbv7N97zu+d5oLZHLvaSFRIcrstG99KFHZgla51dvn5SU9tvcx3+
         m380Js35NBU4PVmgPHNNHCjuke5cJzqldsyiVLeVDzA/NhpT2SLvaWb55/El3TcimbR0
         uTWQ==
X-Gm-Message-State: AOJu0Yz1vI/JEDNgmTqjevYI/DWqIoEr1VSmJcZ8H5jRQqKL1oyGUWaH
	iw9fhjqif81HuRReAN4V/2z8V9R3yvP51rStml8vkHt9sYwQXZp6JzK1IrrE9pg89Vy7NVDMmqc
	XNdL3Q50v2SIRMBHRgWBQIQs72I3dLC+1jOebWizg8Uwt6I0LvWPnNkrFZOkz4g9QSSmvVV+LCG
	Ag1licXaRj2/7PdignA8AcVDBDCcK/mGOAu68f/ZnY0nhIveGG0i96olsURzk=
X-Gm-Gg: AZuq6aLRHIo1RlRO485Cg8/2HFwFv3VaxYxoVLtr7UATZj8H1Gqqowngyu+KorzNRB1
	qklDueI5556uoEh7/+C+urum/pjGuFvI8jPWx7V162uAD8H0c5WQnZZ3hKGNxLEgl2phUwsAYVe
	xPpcVFEFpERvCvYVfMtNxWYkncJtTKIwuAAp923x29tCPobtiafg54Fj7dGI5iXCPFxfcUhV/5Y
	+9E
X-Received: by 2002:a05:6214:cc9:b0:896:fd01:1304 with SMTP id 6a1803df08f44-897402eb9dcmr111106936d6.22.1771239636179;
        Mon, 16 Feb 2026 03:00:36 -0800 (PST)
X-Received: by 2002:a05:6214:cc9:b0:896:fd01:1304 with SMTP id
 6a1803df08f44-897402eb9dcmr111106126d6.22.1771239635567; Mon, 16 Feb 2026
 03:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20260212052114.3215220-1-adongare@cisco.com>
In-Reply-To: <20260212052114.3215220-1-adongare@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 19:00:22 +0800
X-Gm-Features: AaiRm53mJ1nCDjsI69WeHVO3zTGTUeDYpfPVj9hs2zsJe4jip7yC6IxC81Hf0O8
Message-ID: <CA+s=J=z6a2s4+VR9sqbJ84uo6wqmqQcnBMZdD9CyM2o=uisJLw@mail.gmail.com>
Subject: Re: [oe] [meta-OE] [scarthgap] [PATCH 1/5] Nodejs 20.18.2: Fix CVE-2025-55132
To: adongare@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com,
        to@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nAv4Hyy9E3k8JlYVnKfdRbfgorpI9XrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX2g0FZFpxqN91
 m9Tn8Y15QO+t1B+OWpDlH6OK6mcCTyMbEnwI/7AcJJIqoOvWimUyQEu4AwaIxI8p0BeLiEfKDsN
 ZVVL9J/ghunhAWokoaayi9XIvh3+3AtMUTESbXC8WWeOo6WmIkKvJAgjqWlo0vwT6vuC/wGwwQM
 DwBa1z0xQS/0oeq1FrH4nvfeoa3xQBHi+eYNYnw2Mn2z+p25CZ5Kng+WxznKGazdLTj7rlcE7j2
 XyUsyWuPIurrquY5WMAtZqJIZg45WcXwtAO8+3DKZrLGKO17e63nT7m+F+djqtWyDB9IrFPn+BS
 yIDJS9Wz6i7mN/0bSQebUt2rwHk4yD0R/PjoqKOQoW7fuIGcm1ltpx71czeTxbXR7GMEB40RWjB
 bKoe9CvgU95lp04PI7P58DyYPVqsMcBjEF43DoIzU+IiRcAtZnv8oC/uUc1b2fImbCLfzax9kPF
 +dc+/n+znYeILDAzKaQ==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992f8d5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8
 a=-fKjk79AAAAA:8 a=-LCu6K_DAAAA:8 a=AUd_NHdVAAAA:8 a=69EAbJreAAAA:8
 a=pGLkceISAAAA:8 a=ZD-YaqJSAAAA:8 a=EUspDBNiAAAA:8 a=XaOHhEicUnqRoL4-xPsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=yfRUlTaMxgxjPDvNZr5O:22 a=0rDuyIo-Ak-iA9LRPrYx:22
X-Proofpoint-GUID: nAv4Hyy9E3k8JlYVnKfdRbfgorpI9XrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 11:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124414

Can you please check if these are still needed after the changes in:

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scart=
hgap

On Thu, Feb 12, 2026 at 6:32=E2=80=AFPM Anil Dongare -X (adongare - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
<adongare=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Anil Dongare <adongare@cisco.com>
>
> Upstream Repository: https://github.com/nodejs/node.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55132
> Type: Security Fix
> CVE: CVE-2025-55132
> Score: 5.3
> Patch: https://github.com/nodejs/node/commit/ebbf942a83bc
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../nodejs/nodejs/CVE-2025-55132.patch        | 178 ++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_20.18.2.bb |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132=
.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch =
b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch
> new file mode 100644
> index 0000000000..08c885473c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55132.patch
> @@ -0,0 +1,178 @@
> +From b89fc3633ec12b6d1da5b9978e6bb1c5fbacf021 Mon Sep 17 00:00:00 2001
> +From: RafaelGSS <rafael.nunu@hotmail.com>
> +Date: Tue, 21 Oct 2025 18:25:31 -0300
> +Subject: [PATCH 1/5] lib: disable futimes when permission model is enabl=
ed
> +
> +Refs: https://hackerone.com/reports/3390084
> +PR-URL: https://github.com/nodejs-private/node-private/pull/748
> +Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
> +Reviewed-By: Anna Henningsen <anna@addaleax.net>
> +CVE-ID: CVE-2025-55132
> +
> +CVE: CVE-2025-55132
> +Upstream-Status: Backport [https://github.com/nodejs/node/commit/ebbf942=
a83bc]
> +
> +(cherry picked from commit ebbf942a83bc70d90a3bcb6712c7b67bc479fdf5)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + lib/fs.js                                     | 24 ++++++++++
> + test/fixtures/permission/fs-write.js          | 47 ++++++++++++++++++-
> + test/parallel/test-permission-fs-supported.js | 17 ++++++-
> + 3 files changed, 86 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/fs.js b/lib/fs.js
> +index 64f0b5e88ed..9206a18663c 100644
> +--- a/lib/fs.js
> ++++ b/lib/fs.js
> +@@ -1274,6 +1274,11 @@ function rmSync(path, options) {
> + function fdatasync(fd, callback) {
> +   const req =3D new FSReqCallback();
> +   req.oncomplete =3D makeCallback(callback);
> ++
> ++  if (permission.isEnabled()) {
> ++    callback(new ERR_ACCESS_DENIED('fdatasync API is disabled when Perm=
ission Model is enabled.'));
> ++    return;
> ++  }
> +   binding.fdatasync(fd, req);
> + }
> +
> +@@ -1285,6 +1290,9 @@ function fdatasync(fd, callback) {
> +  * @returns {void}
> +  */
> + function fdatasyncSync(fd) {
> ++  if (permission.isEnabled()) {
> ++    throw new ERR_ACCESS_DENIED('fdatasync API is disabled when Permiss=
ion Model is enabled.');
> ++  }
> +   binding.fdatasync(fd);
> + }
> +
> +@@ -1298,6 +1306,10 @@ function fdatasyncSync(fd) {
> + function fsync(fd, callback) {
> +   const req =3D new FSReqCallback();
> +   req.oncomplete =3D makeCallback(callback);
> ++  if (permission.isEnabled()) {
> ++    callback(new ERR_ACCESS_DENIED('fsync API is disabled when Permissi=
on Model is enabled.'));
> ++    return;
> ++  }
> +   binding.fsync(fd, req);
> + }
> +
> +@@ -1308,6 +1320,9 @@ function fsync(fd, callback) {
> +  * @returns {void}
> +  */
> + function fsyncSync(fd) {
> ++  if (permission.isEnabled()) {
> ++    throw new ERR_ACCESS_DENIED('fsync API is disabled when Permission =
Model is enabled.');
> ++  }
> +   binding.fsync(fd);
> + }
> +
> +@@ -2164,6 +2179,11 @@ function futimes(fd, atime, mtime, callback) {
> +   mtime =3D toUnixTimestamp(mtime, 'mtime');
> +   callback =3D makeCallback(callback);
> +
> ++  if (permission.isEnabled()) {
> ++    callback(new ERR_ACCESS_DENIED('futimes API is disabled when Permis=
sion Model is enabled.'));
> ++    return;
> ++  }
> ++
> +   const req =3D new FSReqCallback();
> +   req.oncomplete =3D callback;
> +   binding.futimes(fd, atime, mtime, req);
> +@@ -2179,6 +2199,10 @@ function futimes(fd, atime, mtime, callback) {
> +  * @returns {void}
> +  */
> + function futimesSync(fd, atime, mtime) {
> ++  if (permission.isEnabled()) {
> ++    throw new ERR_ACCESS_DENIED('futimes API is disabled when Permissio=
n Model is enabled.');
> ++  }
> ++
> +   binding.futimes(
> +     fd,
> +     toUnixTimestamp(atime, 'atime'),
> +diff --git a/test/fixtures/permission/fs-write.js b/test/fixtures/permis=
sion/fs-write.js
> +index 31e96860972..4b98b6d2b78 100644
> +--- a/test/fixtures/permission/fs-write.js
> ++++ b/test/fixtures/permission/fs-write.js
> +@@ -490,4 +490,49 @@ const relativeProtectedFolder =3D process.env.RELAT=
IVEBLOCKEDFOLDER;
> +   }, {
> +     code: 'ERR_ACCESS_DENIED',
> +   });
> +-}
> +\ No newline at end of file
> ++}
> ++
> ++// fs.utimes with read-only fd
> ++{
> ++  assert.throws(() =3D> {
> ++    // blocked file is allowed to read
> ++    const fd =3D fs.openSync(blockedFile, 'r');
> ++    const date =3D new Date();
> ++    date.setFullYear(2100,0,1);
> ++
> ++    fs.futimes(fd, date, date, common.expectsError({
> ++      code: 'ERR_ACCESS_DENIED',
> ++    }));
> ++    fs.futimesSync(fd, date, date);
> ++  }, {
> ++    code: 'ERR_ACCESS_DENIED',
> ++  });
> ++}
> ++
> ++// fs.fdatasync with read-only fd
> ++{
> ++  assert.throws(() =3D> {
> ++    // blocked file is allowed to read
> ++    const fd =3D fs.openSync(blockedFile, 'r');
> ++    fs.fdatasync(fd, common.expectsError({
> ++      code: 'ERR_ACCESS_DENIED',
> ++    }));
> ++    fs.fdatasyncSync(fd);
> ++  }, {
> ++    code: 'ERR_ACCESS_DENIED',
> ++  });
> ++}
> ++
> ++// fs.fsync with read-only fd
> ++{
> ++  assert.throws(() =3D> {
> ++    // blocked file is allowed to read
> ++    const fd =3D fs.openSync(blockedFile, 'r');
> ++    fs.fsync(fd, common.expectsError({
> ++      code: 'ERR_ACCESS_DENIED',
> ++    }));
> ++    fs.fsyncSync(fd);
> ++  }, {
> ++    code: 'ERR_ACCESS_DENIED',
> ++  });
> ++}
> +diff --git a/test/parallel/test-permission-fs-supported.js b/test/parall=
el/test-permission-fs-supported.js
> +index 1062117798b..805365f28b3 100644
> +--- a/test/parallel/test-permission-fs-supported.js
> ++++ b/test/parallel/test-permission-fs-supported.js
> +@@ -77,7 +77,22 @@ const ignoreList =3D [
> +   'unwatchFile',
> +   ...syncAndAsyncAPI('lstat'),
> +   ...syncAndAsyncAPI('realpath'),
> +-  // fd required methods
> ++  // File descriptor=E2=80=93based metadata operations
> ++  //
> ++  // The kernel does not allow opening a file descriptor for an inode
> ++  // with write access if the inode itself is read-only. However, it st=
ill
> ++  // permits modifying the inode=E2=80=99s metadata (e.g., permission b=
its, ownership,
> ++  // timestamps) because you own the file. These changes can be made ei=
ther
> ++  // by referring to the file by name (e.g., chmod) or through any exis=
ting
> ++  // file descriptor that identifies the same inode (e.g., fchmod).
> ++  //
> ++  // If the kernel required write access to change metadata, it would b=
e
> ++  // impossible to modify the permissions of a file once it was made re=
ad-only.
> ++  // For that reason, syscalls such as fchmod, fchown, and futimes bypa=
ss
> ++  // the file descriptor=E2=80=99s access mode. Even a read-only ('r') =
descriptor
> ++  // can still update metadata. To prevent unintended modifications,
> ++  // these APIs are therefore blocked by default when permission model =
is
> ++  // enabled.
> +   ...syncAndAsyncAPI('close'),
> +   ...syncAndAsyncAPI('fchown'),
> +   ...syncAndAsyncAPI('fchmod'),
> +--
> +2.43.7
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_20.18.2.bb
> index d757a7395c..67574a2ec1 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
> @@ -29,6 +29,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://zlib-fix-pointer-alignment.patch \
>             file://0001-src-fix-build-with-GCC-15.patch \
>             file://run-ptest \
> +           file://CVE-2025-55132.patch \
>             "
>  SRC_URI:append:class-target =3D " \
>             file://0001-Using-native-binaries.patch \
> --
> 2.44.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124348): https://lists.openembedded.org/g/openembedde=
d-devel/message/124348
> Mute This Topic: https://lists.openembedded.org/mt/117772145/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

