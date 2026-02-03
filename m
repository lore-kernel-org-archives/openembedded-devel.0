Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9994AE8B36D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:12:31 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5792.1770156746027780492
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id 5103A383AC;
	Tue,  3 Feb 2026 23:12:13 +0100 (CET)
Received: from [192.168.178.36] ([79.219.230.20]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vnOd1-0eS75E0; Tue, 3 Feb 2026 23:12:12 +0100
Date: Tue, 03 Feb 2026 23:12:06 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 3/3] freerdp3: upgrade 3.20.2 -> 3.22.0
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6OLW9T.MSA6ATTTL1ZT1@t-online.de>
In-Reply-To: <20260202135045.1476359-3-skandigraun@gmail.com>
References: <20260202135045.1476359-1-skandigraun@gmail.com>
	<20260202135045.1476359-3-skandigraun@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-T/JkbFumoSrrbdcRZ5ep"
X-TOI-EXPURGATEID: 150726::1770156732-EEFFA830-FB536C7F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9627da29-dcef-4426-b168-f939c09e25a6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 22:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124113

--=-T/JkbFumoSrrbdcRZ5ep
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Feb 2 2026 at 14:50:45 +01:00:00, Gyorgy Sarvari via 
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> 
wrote:
> Dropped manpages PACKAGECONFIG: when it is enabled, it requires an 
> executable that
> is compiled from the project's source, but since it is 
> cross-compiled, it is not
> usable.

This fails for me with:

| CMake Error at client/common/man/CMakeLists.txt:27 
(add_custom_target):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"
|
|
| CMake Error at client/common/man/CMakeLists.txt:23 
(add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"
|
|
| CMake Error at client/common/man/CMakeLists.txt:27 
(add_custom_target):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"
|
|
| CMake Error at client/common/man/CMakeLists.txt:23 
(add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"
|
|
| CMake Error at client/common/man/CMakeLists.txt:27 
(add_custom_target):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"
|
|
| CMake Error at client/common/man/CMakeLists.txt:23 
(add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:generate_argument_manpage>
|
|   No target "generate_argument_manpage"


Explicitly adding EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF" solves the 
issue


--=-T/JkbFumoSrrbdcRZ5ep
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Feb 2 2026 at 14:50:45 +01:00:0=
0, Gyorgy Sarvari via lists.openembedded.org &lt;skandigraun=3Dgmail.com@li=
sts.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"=
plaintext" style=3D"white-space: break-spaces;">Dropped manpages PACKAGECON=
FIG: when it is enabled, it requires an executable that
is compiled from the project's source, but since it is cross-compiled, it i=
s not
usable.</div></blockquote><div><br></div><div>This fails for me with:</div>=
<div><br></div><div><div>| CMake Error at client/common/man/CMakeLists.txt:=
27 (add_custom_target):</div><div>| &nbsp; Error evaluating generator expre=
ssion:</div><div>|</div><div>| &nbsp; &nbsp; $&lt;TARGET_FILE:generate_argu=
ment_manpage&gt;</div><div>|</div><div>| &nbsp; No target "generate_argumen=
t_manpage"</div><div>|</div><div>|</div><div>| CMake Error at client/common=
/man/CMakeLists.txt:23 (add_custom_command):</div><div>| &nbsp; Error evalu=
ating generator expression:</div><div>|</div><div>| &nbsp; &nbsp; $&lt;TARG=
ET_FILE:generate_argument_manpage&gt;</div><div>|</div><div>| &nbsp; No tar=
get "generate_argument_manpage"</div><div>|</div><div>|</div><div>| CMake E=
rror at client/common/man/CMakeLists.txt:27 (add_custom_target):</div><div>=
| &nbsp; Error evaluating generator expression:</div><div>|</div><div>| &nb=
sp; &nbsp; $&lt;TARGET_FILE:generate_argument_manpage&gt;</div><div>|</div>=
<div>| &nbsp; No target "generate_argument_manpage"</div><div>|</div><div>|=
</div><div>| CMake Error at client/common/man/CMakeLists.txt:23 (add_custom=
_command):</div><div>| &nbsp; Error evaluating generator expression:</div><=
div>|</div><div>| &nbsp; &nbsp; $&lt;TARGET_FILE:generate_argument_manpage&=
gt;</div><div>|</div><div>| &nbsp; No target "generate_argument_manpage"</d=
iv><div>|</div><div>|</div><div>| CMake Error at client/common/man/CMakeLis=
ts.txt:27 (add_custom_target):</div><div>| &nbsp; Error evaluating generato=
r expression:</div><div>|</div><div>| &nbsp; &nbsp; $&lt;TARGET_FILE:genera=
te_argument_manpage&gt;</div><div>|</div><div>| &nbsp; No target "generate_=
argument_manpage"</div><div>|</div><div>|</div><div>| CMake Error at client=
/common/man/CMakeLists.txt:23 (add_custom_command):</div><div>| &nbsp; Erro=
r evaluating generator expression:</div><div>|</div><div>| &nbsp; &nbsp; $&=
lt;TARGET_FILE:generate_argument_manpage&gt;</div><div>|</div><div>| &nbsp;=
 No target "generate_argument_manpage"</div></div><div><br></div><div><br><=
/div><div>Explicitly adding EXTRA_OECMAKE +=3D "-DWITH_MANPAGES=3DOFF" solv=
es the issue</div></div>
--=-T/JkbFumoSrrbdcRZ5ep--


