Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E942CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:39 +0000 (UTC)
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16897.1780483203136787275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 03:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=ZEW3K4KD;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.8, mailfrom: jeroen@myspectrum.nl)
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gVkjX1d47zY76j6;
	Wed,  3 Jun 2026 12:40:00 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission6.mail.transip.nl (Postfix) with ESMTPSA id 4gVkjW5NfCz3ZVDrh;
	Wed,  3 Jun 2026 12:39:59 +0200 (CEST)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: jeroen@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id EBE0C20144;
	Wed,  3 Jun 2026 10:39:58 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=jeroen@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Message-ID: <194e3c6b-3c34-4cdb-a0dd-f168374888e9@myspectrum.nl>
Date: Wed, 3 Jun 2026 12:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20260530081837.2192126-1-f_l_k@t-online.de>
 <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
 <4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl>
 <RUR1GT.7FBB4YSJA2AH1@t-online.de>
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
In-Reply-To: <RUR1GT.7FBB4YSJA2AH1@t-online.de>
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1780483199; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=2OCG1uXxv1YWLnkEPCsPxjTuUvgMmQepEG7eWLlFX74=;
 b=ZEW3K4KDvcVitjaOTibFDTbLe2haKOUIMPRGRBRpVCPXdLUHbAF87WSqhRHmNjUSIHei0X
 VAdQ6O6tsTuP9Wv/1Qjx3PlINl5SQgsQs9CMOhxLtHhR0x/lj8P0FCUCbgMlFcWenVmmqJ
 YUHeAYkQRaARB/aBlscplDCQfmu6iP/3KMDnoqvr/kdQP69+jHYOk65doyrJgXb+KR6wiD
 wPMeEhTX0uM4Ih1lHxZ2o2Zykm9YVRzZ2ZyEbHQlpo1yCRLIUTENdKR7id3Zb6RxgpQ17P
 v7Wg2VQgX9Zab6VmHemN2o3ib+dWYcwK6h3jqyHtgMUpm+k1DXIJS5zVJzpVVQ==
X-Report-Abuse-To: abuse@transip.nl
Content-Type: multipart/alternative;
 boundary="------------KeXG6PfSig7YR7Knz9UoHp4m"
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 12:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127380

--------------KeXG6PfSig7YR7Knz9UoHp4m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Markus,

On 6/3/26 10:35, Markus Volk wrote:

> However, 'Rejected' seemed like a somewhat inappropriate upstream 
> status as well, since this was just an issue,
> not a pull request, and the solution was even suggested by the 
> maintainer himself. He just hasn't been able
> to reproduce the problem yet, so more feedback is needed to convince 
> him that people have an issue here.
>
> Who's to blame is a different story :)
>
> That's why I chose 'Pending', but if necessary I can of course make 
> this 'Rejected'.


Don't get me wrong btw, I don't really mind the patch, I mind the warning.

Since it flags there "might" be an issue there.
Maintainer looks at it, euuh no, there is now issue -> closes issue.
But that warnings is still there, so OE gets patched and marked as pending,
that is asking for that patch to pending for a long time.

That makes the "pending" state a bit doubtful. And I agree with you that
rejected is at the opposite end.

As said, I don't really mind, I just don't like a "possible" issue 
taking time
of several people.

For what it is worth btw, char a[1000] = {0}; will initialize the whole 
array.

I doubt it matters in this case, but it likely does cost you runtime 
performance,
just to get rid of a likely useless warning.

Regards,
Jeroen

--------------KeXG6PfSig7YR7Knz9UoHp4m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Markus,<br>
      <br>
      On 6/3/26 10:35, Markus Volk wrote:</p>
    <blockquote type=3D"cite" cite=3D"mid:RUR1GT.7FBB4YSJA2AH1@t-online.d=
e">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div id=3D"geary-body" dir=3D"auto">
        <div>
          <div>However, 'Rejected' seemed like a somewhat inappropriate
            upstream status as well, since this was just an issue,=C2=A0<=
/div>
          <div>not a pull request, and the solution was even suggested
            by the maintainer himself. He just hasn't been able</div>
          <div>to reproduce the problem yet, so more feedback is needed
            to convince him that people have an issue here.</div>
          <div><br>
          </div>
          <div>Who's to blame is a different story :)</div>
          <div><br>
          </div>
          <div>That's why I chose 'Pending', but if necessary I can of
            course make this 'Rejected'.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Don't get me wrong btw, I don't really mind the patch, I mind the
      warning.<br>
      <br>
      Since it flags there "might" be an issue there.<br>
      Maintainer looks at it, euuh no, there is now issue -&gt; closes
      issue.<br>
      But that warnings is still there, so OE gets patched and marked as
      pending,<br>
      that is asking for that patch to pending for a long time.</p>
    <p>That makes the "pending" state a bit doubtful. And I agree with
      you that<br>
      rejected is at the opposite end.</p>
    <p>As said, I don't really mind, I just don't like a "possible"
      issue taking time<br>
      of several people.<br>
      <br>
      For what it is worth btw, char a[1000] =3D {0}; will initialize the
      whole array.<br>
      <br>
      I doubt it matters in this case, but it likely does cost you
      runtime performance,<br>
      just to get rid of a likely useless warning.<br>
      <br>
      Regards,<br>
      Jeroen</p>
  </body>
</html>

--------------KeXG6PfSig7YR7Knz9UoHp4m--

