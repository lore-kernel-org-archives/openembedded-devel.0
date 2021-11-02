Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6715BC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:33:40 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.291.1635870819105304550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Lacv47Xr;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635870819;
  x=1667406819;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=iqoUZZtad+pPi6x8ocvbISiOF4DxS0k/yx7sV/c9Fhg=;
  b=Lacv47XrORLSOQqH0XLzACDGp9Js6gRd5owQdoxkNvHkfW7DQVDX8iY3
   5mMJo8k7zBq7dTCJg6anObWIKrzWIh9NWwgCDVX+9kiFl+KheiB9LInH6
   3Ch5x0I4Rshv+dXMu5yFJK/dpDGRbTLIxDj6ryEb8T8hFDvcreymVf7Er
   01lRK+x0V5/vORSORzp6X7WMRuP4+f0byLauVTG9os9FmrtpKFUmE1wPK
   ZCAgN9ctceaIUOmn+Eu5f3bfufLvxVN+7S6cxMFI5kLwc/qiM5WQolK/s
   1z/eIKfgbK+e1bFC4mYxoGGb4yHcct+2AtkzHZxujhtoJlVDLVCEpfZx1
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Development (openembedded-devel@lists.openembedded.org)"
	<openembedded-devel@lists.openembedded.org>
Subject: Is it time to remove opensaf?
Thread-Topic: Is it time to remove opensaf?
Thread-Index: AdfQBVT48u0Gx35rTT+0sp2HRYUaXw==
Date: Tue, 2 Nov 2021 16:33:35 +0000
Message-ID: <432b09f9a07b493fb9191eec798aa07a@axis.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 16:33:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93781

I am currently working on patches for OE-Core to report QA warnings=20
in case some directories that are expected to be empty have some=20
files installed into them. As part of the review process, Khem=20
reported failures for some recipes in OpenEmbedded due to this,=20
opensaf being one of them.

Now I have tried to build and run opensaf in a QEMU image, but I=20
cannot get it to work. The sysvinit initscript relies on=20
/lib/lsb/init-functions, which AFAICT has not existed since lsb=20
was removed from OE-Core two years ago, and opensaf has never=20
depended on lsb in the first place. As for systemd, the service=20
file uses the same sysvinit scripts so it has the same problem.=20
And in addition, the script is in /etc/init.d, which=20
systemd.bbclass removes unless both sysvinit and systemd are=20
enabled in DISTRO_FEATURES.

And in addition to this, if I just try to start the opensafd binary=20
it seg faults immediately.

So all in all, even if opensaf has been updated regularly, it=20
doesn't seem like anyone is actually using it. Which brings me to=20
my actual question: should I just send a patch to remove it?

Alternatively I can fix the creation of the /var/log/opensaf=20
directory, which was the error Khem saw with my patch for OE-Core=20
applied, but it seems like wasted work in case no one is actually=20
using the recipe...

//Peter


