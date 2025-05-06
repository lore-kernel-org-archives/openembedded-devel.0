Return-Path: <jasper@fancydomain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5135EC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 11:10:04 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
To: openembedded-devel@lists.openembedded.org
From: "Jasper Orschulko" <jasper@fancydomain.eu>
X-Originating-Location: Berlin, State of Berlin, DE (84.147.247.12)
X-Originating-Platform: Linux Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 May 2025 04:10:01 -0700
References: <AS1PR10MB569738A15FBFD3B281F3C14DFD832@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569738A15FBFD3B281F3C14DFD832@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <7063.1746529801979084877@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ToxcyQvUo9SPbF4DM1ZV"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 11:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117344

--ToxcyQvUo9SPbF4DM1ZV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> And add tag to SRC_URI.

AFAIK this is not possible / bad practise, unless there were some recent ch=
anges to OE that I am unaware of. You can either specify "rev" directly in =
the SRC_URI or SRCREV, not both. So if you set rev to a git tag in SRC_URI,=
 you cannot set a git commit hash within SRCREV, thus you lose reproducibil=
ity since you are now only referencing a floating rev. See also: https://st=
ackoverflow.com/questions/78127309/how-to-set-srcrev-for-git-tag-in-yocto/7=
8127354#78127354.

So setting the git commit hash in SRC_URI as rev or directly in SRCREV is t=
he way to go.

--ToxcyQvUo9SPbF4DM1ZV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>&gt; And add tag to SRC_URI.</div>
<div>&nbsp;</div>
<div>AFAIK this is not possible / bad practise, unless there were some rece=
nt changes to OE that I am unaware of. You can either specify "rev" directl=
y in the SRC_URI or SRCREV, not both. So if you set rev to a git tag in SRC=
_URI, you cannot set a git commit hash within SRCREV, thus you lose reprodu=
cibility since you are now only referencing a floating rev. See also: <a hr=
ef=3D"https://stackoverflow.com/questions/78127309/how-to-set-srcrev-for-gi=
t-tag-in-yocto/78127354#78127354" target=3D"_blank" rel=3D"noopener">https:=
//stackoverflow.com/questions/78127309/how-to-set-srcrev-for-git-tag-in-yoc=
to/78127354#78127354</a>.</div>
<div>&nbsp;</div>
<div>So setting the git commit hash in SRC_URI as rev or directly in SRCREV=
 is the way to go.</div>

--ToxcyQvUo9SPbF4DM1ZV--

