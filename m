Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3921C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 08:36:03 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.15905.1661157356284724298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fMFDijjd;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661157356;
  x=1692693356;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=hryLh8oGmed6fDawDkAZIx0upk69Rk5q5hf4V4c7+E4=;
  b=fMFDijjdZNW9x4+DMtKX3HTRsvslBxSYNcXi3GT+vDcZq+VJaOa1bqqc
   hH+Cvlx3z4xhrjzBG1r1YUvJS5wGJZ3G0FwDnqb0lmRjMeJhkoZDw4USD
   r/FpUeYzj0hi9RNLn2rC0LtECdO5BtjzFB2D+Nq/BS3RMw+Ycs8qM2iY/
   whtZDy/dTavBSb0Ut2WDkvMl2jhP+8+7We+hV9eTNqYbKCMS+SdBJ88dJ
   o+5a5Nq/Tu8xWHa31quFfS+bMDrAQ4dfmJt+7sXTH3IMMtBE5+/G8+ud9
   4NTT7p1ZNwr/DjbPm0FZACB0vM+hIGvWIUUJ/8RkymL/YZ81nDCvuVZ58
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
Thread-Topic: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
Thread-Index: AQHYtMi/yjgmzJ1YBkyhpXp9hjuVfa25SRFQ///41oCAAVZmYA==
Date: Mon, 22 Aug 2022 08:35:53 +0000
Message-ID: <301d7b0dabda40eba9b037c87a8fbd4e@axis.com>
References: <20220820191150.5699-1-f_l_k@t-online.de>
	<52f6ee030dbf4e88a86e3702a5303d57@axis.com>
 <DMXYGR.GU3KE5WIU42D1@t-online.de>
In-Reply-To: <DMXYGR.GU3KE5WIU42D1@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/alternative;
	boundary="_000_301d7b0dabda40eba9b037c87a8fbd4eaxiscom_"
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 08:36:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98361

--_000_301d7b0dabda40eba9b037c87a8fbd4eaxiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I still don't understand how you intend for a "gstreamer" distro feature to=
 work. You use it in the pipewire recipe to decide whether to use the "gstr=
eamer" or "ffmpeg" PACKAGECONFIG by default. However, that seems very speci=
fic to pipewire. We use both GStreamer and FFmpeg in our products, so using=
 a distro feature to distinguish between them is not something universal.

//Peter

From: Markus Volk <f_l_k@t-online.de>
Sent: den 21 augusti 2022 16:01
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56


i tried to follow your suggestions,
Thanks

Am So, 21. Aug 2022 um 12:49:24 +0000 schrieb Peter Kjellerstedt <peter.kje=
llerstedt@axis.com<mailto:peter.kjellerstedt@axis.com>>:

AFAIK, there are no current examples of "gstreamer" being used a distro fea=
ture. What is it supposed to mean? When is it supposed to be used? Why is i=
t needed?


I found an example of this, but I must confess that this was in an old thir=
d-party layer. What I want this DISTRO_FEATURE for is the ability to use it=
 to enable/disable gstreamer support in recipes. Not just here in pipewire.=
 The same goes for Jack. Is this already used as a DISTRO_FEATURE? If so, m=
aybe we could use it to make the Jack server depend on it instead of always=
 building it as it currently does?

--_000_301d7b0dabda40eba9b037c87a8fbd4eaxiscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">I still don&#8217;t understand how you intend for a &#8=
220;gstreamer&#8221; distro feature to work. You use it in the pipewire rec=
ipe to decide whether to use the &#8220;gstreamer&#8221; or &#8220;ffmpeg&#=
8221;
 PACKAGECONFIG by default. However, that seems very specific to pipewire. W=
e use both GStreamer and FFmpeg in our products, so using a distro feature =
to distinguish between them is not something universal.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Markus Volk &lt;f_l_k@t-online.de&gt;
<br>
<b>Sent:</b> den 21 augusti 2022 16:01<br>
<b>To:</b> Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;<br>
<b>Cc:</b> openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.=
3.56<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"geary-body">
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">i tried to follow your suggestions,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">Am So, 21. Aug 2022 um 12:49:24 &#43;0000 schrieb Pe=
ter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.k=
jellerstedt@axis.com</a>&gt;:<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">AFAIK, there are no current examples of &quot;gstrea=
mer&quot; being used a distro feature. What is it supposed to mean? When is=
 it supposed to be used? Why is it needed?<o:p></o:p></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I found an example of this, but I must confess that =
this was in an old third-party layer. What I want this DISTRO_FEATURE for i=
s the ability to use it to enable/disable gstreamer support in recipes. Not=
 just here in pipewire. The same goes
 for Jack. Is this already used as a DISTRO_FEATURE? If so, maybe we could =
use it to make the Jack server depend on it instead of always building it a=
s it currently does?<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_301d7b0dabda40eba9b037c87a8fbd4eaxiscom_--

