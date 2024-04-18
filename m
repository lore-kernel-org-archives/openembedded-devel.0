Return-Path: <ninette@neighbourhood.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222E1C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 09:09:12 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8323.1713431348655112912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 02:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=MlzZJT30;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4715991c32so60632766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713431347; x=1714036147; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpJ6eWS4IRtYn1VeVr58jqcC3QzmRgoMBYx69oasQaE=;
        b=MlzZJT30Hi6AIKcfoMDUYKW8nmJBEvcHNgZnM4P5MiWMr8t5X/w7MQQCyLRLVuCqBb
         /MGIeHXdOVSLBV/KdUf6N4drzmxCOVkMRIQuopHDxpNHSzu2V0DwCsecl65rQCc0v4/K
         /k6SzQqQvHJLZxMreY7yaNQTjawKfTEa/VwRHP0lkIxBSAUMP7MYISzLjr5vpM++K4fe
         uo4yoh8ZRlVX1wA2HB0hdTBeT3ySJH3UJddKrDdrfx5I3sWKu26/nfFaZnNVJCttuRJv
         fXiXqw/UoX45VRJNe8SSkiBMniiap5pPDj8sjbm1VdGXkvBm3zF4vuyr2t18Vmgb1P4e
         s6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431347; x=1714036147;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpJ6eWS4IRtYn1VeVr58jqcC3QzmRgoMBYx69oasQaE=;
        b=kbIShxSapnx3j3czEn22JaaLTiM1eahEmVSFV01dC2YlJVYr15MaGB4KQ57DKwqY+4
         QLha70eKhvNGadZtMX/pNejjE+KhzjWXD5EX39AUhC8JoZH1b7KYGemKsiP6263eh8GA
         88tuG7eFTnkov82kMfF8SvkKFYA/Th+yMz7aqKxzEgLx50loqG6NzB79S0kHMGuCjqcT
         nFdIC02f1O7Nk0gyPXr+w2S22/Xz50ci63cwpFjjH3y5O4IpgmdSYtMshR1BcZM6v15N
         YP7YISwDMmmjnderZzMld147EihX02yVWQBAoaSnb/g4+bZVc33AroIUynvX7cZEwiWi
         +XbQ==
X-Gm-Message-State: AOJu0YwRDu725IGpaDPisGrYz4F1DwvdD/EpEEsCo1CtDkev/TrrTi39
	usCNAyynd71oMXybD6wfAF0ISH2cVuJev7zc/Ol9wCSVdjrBYUk/wJ+TNxQQ1/1J9nvwDgjNgWa
	v7n/gahXZWeBoDGaw432hZqiI87O6PGI6CZy80BfRkYozW1OUuHZ8rZ0t
X-Google-Smtp-Source: AGHT+IGr/E8vBGPlg2hlMb2alSox/bnYjU5OZiHiCQt1jIqy4WWOLPocO7YI343A/TR8Mn/I4DgsvnbfLTR62Ecm2CI=
X-Received: by 2002:a17:906:ae89:b0:a52:3efe:9208 with SMTP id
 md9-20020a170906ae8900b00a523efe9208mr1278354ejb.55.1713431346635; Thu, 18
 Apr 2024 02:09:06 -0700 (PDT)
MIME-Version: 1.0
From: Ninette Adhikari <ninette@neighbourhood.ie>
Date: Thu, 18 Apr 2024 11:08:55 +0200
Message-ID: <CAG1aeW3Ciiqh-h6nQoET2rX6DdpcWOOpe=n9BK2gZAsE-mx-xQ@mail.gmail.com>
Subject: Report for review: Triage of CVEs 1-40
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie
Content-Type: multipart/alternative; boundary="000000000000c37e8306165b524a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 09:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110050

--000000000000c37e8306165b524a
Content-Type: text/plain; charset="UTF-8"

Dear OpenEmbedded contributors,

This email contains a review of 40 CVEs from the status list:
https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-master.txt
This work is done as part of "Milestone 1. Triage CVEs 1-40" as stated in
the Scope of Work with Sovereign Tech Fund (STF) (
https://www.sovereigntechfund.de/).

The report is saved as HTML file here:
https://clients.neighbourhood.ie/yocto/1-40.html
We can also provide this in any other format that might be convenient for
you. Please let us know.

The report contains a review of 40 CVEs including the following:
- Package versions affected
- Current package version on 'meta-openembedded'
- Notes on how the CVE can be addressed

Please note that for the CVEs marked as 'invalid', separate patch status
updates have been sent to this mailing-list:
openembedded-devel@lists.openembedded.org.

Thanks,
Neighbourhoodie team

--000000000000c37e8306165b524a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear OpenEmbedded contributors,<br><br>This email contains=
 a review of 40 CVEs from the status list: <a href=3D"https://autobuilder.y=
octo.io/pub/non-release/patchmetrics-meta-oe/cve-status-master.txt">https:/=
/autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-maste=
r.txt</a><br>This work is done as part of &quot;Milestone 1. Triage CVEs 1-=
40&quot; as stated in the Scope of Work with Sovereign Tech Fund (STF) (<a =
href=3D"https://www.sovereigntechfund.de/">https://www.sovereigntechfund.de=
/</a>).<br><br>The report is saved as HTML file here: <a href=3D"https://cl=
ients.neighbourhood.ie/yocto/1-40.html">https://clients.neighbourhood.ie/yo=
cto/1-40.html</a><br>We can also provide this in any other format that migh=
t be convenient for you. Please let us know.<br><br>The report contains a r=
eview of 40 CVEs including the following:<br>- Package versions affected<br=
>- Current package version on &#39;meta-openembedded&#39;<br>- Notes on how=
 the CVE can be addressed<br><br>Please note that for the CVEs marked as &#=
39;invalid&#39;, separate patch status updates have been sent to this maili=
ng-list: <a href=3D"mailto:openembedded-devel@lists.openembedded.org">opene=
mbedded-devel@lists.openembedded.org</a>.<br><br>Thanks,<br>Neighbourhoodie=
 team<br></div>

--000000000000c37e8306165b524a--

