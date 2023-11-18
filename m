Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212D7C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 21:20:36 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web10.17138.1700342432627446805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 13:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=e5zgnzhg;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700342430; x=1700947230; i=jan.claussen10@web.de;
	bh=lJS559qORaVJGnF8K7rnKcz/KGkgeFG4D+MMfg1lrzo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:In-Reply-To:References:
	 Subject;
	b=e5zgnzhgGYCCY5XoyAtkwHpEccDNs4/0CdfJ9mCTiBgkfXD/yDz1NmLuHp+zKiEf
	 ytiz/K9eYUR6bxmaFlWjxaBQzIqC2H+sGGnpWp++kXEbbPoaAXYeFkcZKhwKZlKHQ
	 vN0aQ5viJFyFZOiU95tRCcIzfVipahMLdNjbtioqhZT5bPyNROiN30cYELjn8nvfM
	 3j6XfwHonCOmUdf18fJ8SCfwtyWPhpt3nZr9MUepjTevsX+WHAoG4Y2DM+EnCeE9+
	 FalU1xZf8Kz1wKNQebtWE/KGHegRzpmRnkRp1IFA3gqQlRViQ6gv09Yy21PZda5uK
	 WUfDTddQcWlnhC5QBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from x1-yoga ([195.123.103.85]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59n6-1r5ZCU13Om-001H0y; Sat, 18
 Nov 2023 22:20:30 +0100
Date: Sat, 18 Nov 2023 22:20:29 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <DCC9B05D-9C78-4A39-A76C-C94AA8800181@getmailspring.com>
In-Reply-To: <20796306-08F9-4F85-819B-B46624BDFD7D@getmailspring.com>
References: <20796306-08F9-4F85-819B-B46624BDFD7D@getmailspring.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65592a9d_7fe7f5d9_7ca"
X-Provags-ID: V03:K1:YypGH8hYdSXIUi1FTDyDlP512aqojyABpweH9XfQu9vWz979w66
 S/VEmwEyTZDnAO/kFp8OVUKKSFK/Xyk8e9UNfJ3GgceXHMI7obomBv9XpWzfIzYyJZcAHjC
 jNb7gUbiLCKrsYA7/fSX6eppJ2oPxFrCkwu8BunYNqqB1pneKx2llZ3Fjvjqkl2L/Zz0h4S
 CrWdwxEjYyapeC7pSZ3oA==
UI-OutboundReport: notjunk:1;M01:P0:TlQaQd8qSO4=;OU6DtFI76A9eu+pQ+29fYfIdQQW
 b2l/JIhmGoqBMMUIA4CM/M9CbPHY4Y2/9yIKlaXbP99WnnSAU0RtBianvQdgD6sEGNqMLvMt7
 gdGCTYUvoTHk8cgJTh/OHG7/Gn02U/vrgsQmQzXzkAgdFkh2jJusND/BivNhhA6jDK8IMPm5O
 qdRM817zEOhGQ+ZcF+CU9DQbllfomvl4jMRdn+DlkhF1GPtz4Gxkgittg7cbGUzXIMXoOEFn+
 +Sim4/gwoNUR+N4g7VH5bH9JhAd3X4EwneNMffGmkXHNkhPVzrRoa+QCn5phC73o7d3jpNPGR
 WuqZYckvHBEAe6HX5qLBjQ+90MIpn2ob3WMYpCAbSmuQDl0Pl0286EA7gVsTC9skUezTupDc3
 Jbj1p0G4sZcr68E0rOsLXlO3rWboThNVHBx8aAIgnxcHiLWUo324eGxwI3FUhmioBoaamjO+L
 zFhzpBTd8491HPwvRt0o1pScAJOeO7b+3lctME26Fz+RRnbWniJ23KzjC6RIo7XgNf1Z/X+MW
 57bNyZ1wuoOBVRwl7VoN287fh5Ca/6c6QDSGHsRC3M3QpIABn2M+OMmDA806kzTw4fnyJhodQ
 lzA8ohWOyc5jDOVZ7WEfnTc+ncQL+uQ4Kx7VYwBLU7LRoXqyaiArM/FN/VdVWd2fGJl+wBbrv
 lks7Skd93Xh2Q17epP7diNkpuVsde4tBU6mero3kHFTHmBGknuuAm72eEH55Xc+UwfKW+lAgh
 K2ZcaTHCULIgtwuAKMcV0wMET9XJTpllo91WPsebH/GGlyYgJ20bKZx2eZUexrN+P7bg4dOdu
 jmNwuqcMz/X8WDbGKH/nx8cf+3v689JrYr7xJxP4kxvqnxAJe9USVTVmdqg1MfeiiO5sfekHQ
 IBl7oACqKwwzW1V/GD1xXkQVqcsXrYeQQy90sR/wK9WeUbaMgsk1oORFW0gDDJR8CyaWPQhxZ
 Yv3Lng==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 21:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106897

--65592a9d_7fe7f5d9_7ca
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thunderbird has a Colorized Diffs addon, but Thunderbird itself has not aged well imo. I have switched to Mailspring few years ago. Maybe I will use it just for this purpose though!

--65592a9d_7fe7f5d9_7ca
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Thunderbird has a Colorized Diffs addon, but Thunderbird itself has =
not aged well imo. I have switched to Mailspring few years ago. Maybe I w=
ill use it just for this purpose though=21</div>
--65592a9d_7fe7f5d9_7ca--


