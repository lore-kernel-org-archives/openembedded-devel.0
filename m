Return-Path: <venkattalluri5559@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C518BECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 06:49:27 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.4663.1662965362779305595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q1TFR6Bv;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: venkattalluri5559@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id o7so1677988qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=ZKog0fm8bweVcYtHGTVXKvz+7NWIQKUbZlTEjeEq9HQ=;
        b=Q1TFR6BvNNnrngDFfptCqoIx2vVM+/vXk92upoKrBjNorUP41Ko0QO+oZzs/V9L5iS
         oeucuHpRpne1ihtm3TLxUHIUc/m9/eQkUdrL3iv1IxFg3PAyqk4bXkBG3cAa1k7MO8yQ
         aUrCuvjS015ocbmttFpvAu2SgslyhuZBOI0OR6aGa5TidnzLB+jS9sAb+Crr1z0yi1nt
         mgIabRRo5jBRTJ1ZMDwSBo9HFsIM6aqQKvPihS75g8xcniuo8Dk36o4dPy9WX+IG22DN
         nb+3T+6qoRKnQJEHxgqFa0AzTdt7hSrqcbkLzb3RhXn8ftjzX3mF2c3DIHzdxP7jxDys
         DXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ZKog0fm8bweVcYtHGTVXKvz+7NWIQKUbZlTEjeEq9HQ=;
        b=SKTaPs5XLvyeRifKpS0tmRH20t4W5/tQEIIIbgzTwQpwtwmjaBMxE0evNjK7wbbE8F
         80Hu7JzlmcAggfOWQ603P2TfR+bX5u7hZO/RDTEJDsC7zxKqH1554MEMYEqNdQO4VMVg
         PRX9/CZWeeJ1hwXpgr7lf7yXFHa+9oE4zMP9cLNTYBEli/3zjbL0S+Ou7kSF/F593K/7
         pliDQgJPiCZ1a5rfk/rTdGGVkA+IGuuo6mzalb5XxDai6u+ABiBM1uuU3IVSxhUgl26k
         qHKhCu2c013VDx7QjNsdBWErn+wc2cQtysde7cmVFC7B1X7cnERmFfg8LLltuG8RKZTR
         ZNXg==
X-Gm-Message-State: ACgBeo1xZjSOi9WkeEhn/vq/nsR8Hc2qLhR385A9GTQiNmBHi+YysmhZ
	FcT8C+RAzhhymF/Og8Xp2xhNTVteIpNOcq3vcjspfDvsb5E=
X-Google-Smtp-Source: 
 AA6agR4uTuvkm/tsMpgwibWOkblNlz5F6r715+i954m7bBEsvVWYr7tTP3XCOs7gWWHG9WDrUXukLlPiMdaVU+upG38=
X-Received: by 2002:a05:620a:4149:b0:6bc:4c8d:c4d5 with SMTP id
 k9-20020a05620a414900b006bc4c8dc4d5mr18243111qko.417.1662965361657; Sun, 11
 Sep 2022 23:49:21 -0700 (PDT)
MIME-Version: 1.0
From: venkatakoteswararao talluri <venkattalluri5559@gmail.com>
Date: Mon, 12 Sep 2022 12:19:10 +0530
Message-ID: 
 <CABbzySb9LgeM9Coy3UpFekmGBnj6JCZbyf7-L2p-0vBhJ36R4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000a8139005e8754beb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 06:49:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98749

--000000000000a8139005e8754beb
Content-Type: multipart/alternative; boundary="000000000000a8138e05e8754be9"

--000000000000a8138e05e8754be9
Content-Type: text/plain; charset="UTF-8"

Hi All,

I'm trying to build sysbench_1.0.20.bb on QCS610 codebase but I'm getting
following error so can you please help me to solve this issue.
Image:qti-multimedia-image
Target:qcs610-odk-64

Error log:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'luajit' (but
/var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes-products/images/
qti-multimedia-image.bb RDEPENDS on or otherwise requires it)
luajit was skipped: incompatible with host aarch64-oe-linux (not in
COMPATIBLE_HOST)
NOTE: Runtime target 'luajit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['luajit']
ERROR: Required build target 'qti-multimedia-image' has no buildable
providers.
Missing or unbuildable dependency chain was: ['qti-multimedia-image',
'luajit']


Please find the attached sysbench_1.0.20.bb file.


Thanks,

Venkata Talluri

--000000000000a8138e05e8754be9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>I&#39;m trying to build <a href=3D"http://s=
ysbench_1.0.20.bb">sysbench_1.0.20.bb</a> on QCS610 codebase but I&#39;m ge=
tting following error so can you please help me to solve this issue.<br>Ima=
ge:qti-multimedia-image<br>Target:qcs610-odk-64<br><br>Error log:<br><br>NO=
TE: Resolving any missing task queue dependencies<br>ERROR: Nothing RPROVID=
ES &#39;luajit&#39; (but /var/lib/jenkins/workspace/QCS610_OpenQ_Linux_1.x_=
Internal_/qcs610-le-1-0_ap_standard_oem/apps_proc/poky/meta-qti-bsp/recipes=
-products/images/<a href=3D"http://qti-multimedia-image.bb">qti-multimedia-=
image.bb</a> RDEPENDS on or otherwise requires it)<br>luajit was skipped: i=
ncompatible with host aarch64-oe-linux (not in COMPATIBLE_HOST)<br>NOTE: Ru=
ntime target &#39;luajit&#39; is unbuildable, removing...<br>Missing or unb=
uildable dependency chain was: [&#39;luajit&#39;]<br>ERROR: Required build =
target &#39;qti-multimedia-image&#39; has no buildable providers.<br>Missin=
g or unbuildable dependency chain was: [&#39;qti-multimedia-image&#39;, &#3=
9;luajit&#39;]<br><br><br>Please find the attached <a href=3D"http://sysben=
ch_1.0.20.bb">sysbench_1.0.20.bb</a> file.<br><br><br>Thanks,<br><br>Venkat=
a Talluri<br></div>

--000000000000a8138e05e8754be9--

--000000000000a8139005e8754beb
Content-Type: application/octet-stream; name="sysbench_1.0.20.bb"
Content-Disposition: attachment; filename="sysbench_1.0.20.bb"
Content-Transfer-Encoding: base64
Content-ID: <f_l7yem9ih0>
X-Attachment-Id: f_l7yem9ih0

U1VNTUFSWSA9ICJTeXN0ZW0gcGVyZm9ybWFuY2UgYmVuY2htYXJrIgpIT01FUEFHRSA9ICJodHRw
Oi8vZ2l0aHViLmNvbS9ha29weXRvdi9zeXNiZW5jaCIKU0VDVElPTiA9ICJjb25zb2xlL3Rlc3Rz
IgpMSUNFTlNFID0gIkdQTHYyIgpMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKCkRFUEVORFMgPSAibHVhaml0IgoK
IyBUaGUgcHJvamVjdCBoYXMgbW92ZWQgZnJvbSBTb3VyY2Vmb3JnZSB0byBMYXVuY2hwYWQsIHRv
IEdpdGh1Yi4gVXNlIHRoZSBzb3VyY2UgdGFyYmFsbCBmcm9tCiMgTGF1bmNocGFkIHVudGlsIHRo
ZSBuZXh0IHJlbGVhc2UgaXMgYXZhaWxhYmxlIGZyb20gR2l0aHViLgojU1JDX1VSSSA9ICJodHRw
czovL2xhdW5jaHBhZC5uZXQvdWJ1bnR1LythcmNoaXZlL3ByaW1hcnkvK2ZpbGVzLyR7QlBOfV8k
e1BWfS5vcmlnLnRhci5neiI7CmluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwoKI1NSQ19VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL2Frb3B5dG92L3N5c2JlbmNoL2FyY2hpdmUvcmVmcy90YWdz
LyR7UFZ9LnRhci5neiIKU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2Frb3B5dG92LyR7QlBO
fS5naXQiCgpTUkNSRVYgPSAiZWJmMWM5MGRhMDVkZWE5NDY0ODE2NWU0ZjE0OWFiYzIwYzk3OTU1
NyIKClMgPSAiJHtXT1JLRElSfS9naXQiCgojU1JDX1VSSVttZDVzdW1dID0gIjc1NjM4MWM2ZmM0
ZTE2YWYxZTA4MzFiNWU2YTNkY2IzIgojU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ZWU3OWIxZjM5
OWIyZDE2N2U2YTkwZGU1MmNjYzkwZTUyNDA4ZjdhZGUxYjliNzEzNTcyN2VmZTE4MTM0N2YiCgpQ
QUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAn
bGFyZ2VmaWxlJywgZCl9IgpQQUNLQUdFQ09ORklHW2xhcmdlZmlsZV0gPSAiLS1lbmFibGUtbGFy
Z2VmaWxlLC0tZGlzYWJsZS1sYXJnZWZpbGUsLCIKI1BBQ0tBR0VDT05GSUdbYWlvXSA9ICItLWVu
YWJsZS1haW8sLS1kaXNhYmxlLWFpbyxsaWJhaW8sIgpQQUNLQUdFQ09ORklHW215c3FsXSA9ICIt
LXdpdGgtbXlzcWwgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGgtbXlzcWwtbGlicz0k
e1NUQUdJTkdfTElCRElSfSwgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGhvdXQtbXlz
cWwsbXlzcWw1IgoKIyB0aGUgaW50ZXJuYWwgbHVhaml0IHdvbid0IGNyb3NzIGNvbXBpbGUKRVhU
UkFfT0VDT05GICs9ICItLXdpdGgtc3lzdGVtLWx1YWppdCIKCiMgbHVhLmggZ2VuZXJhdGVkIGZp
bGVzIGFyZSBib2d1cyB3aGVuIHVzaW5nIEIgIT0gUwpCID0gIiR7U30iCgpkb19jb25maWd1cmVf
cHJlcGVuZCgpIHsKICAgIHRvdWNoICR7U30vTkVXUyAke1N9L0FVVEhPUlMKfQo=
--000000000000a8139005e8754beb--

