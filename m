Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A68FEDA0B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:47:02 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83904.1773773212387032461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 11:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=c+IPjFND;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id F3DF5E98F;
	Tue, 17 Mar 2026 19:46:49 +0100 (CET)
Received: from [192.168.178.36] ([84.154.160.82]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w2ZRI-2tiYm80; Tue, 17 Mar 2026 19:46:48 +0100
Date: Tue, 17 Mar 2026 19:46:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: upgrade 4.19.9 -> 4.23.5
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <V542CT.KE4IFLMSTCWD2@t-online.de>
In-Reply-To: <20260305201754.151603-3-skandigraun@gmail.com>
References: <20260305201754.151603-1-skandigraun@gmail.com>
	<20260305201754.151603-3-skandigraun@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-YTmPOVkC1/McRdAZIuC7"
X-TOI-EXPURGATEID: 150726::1773773208-427FB830-1705BCF7/0/0 CLEAN NORMAL
X-TOI-MSGID: 2070baa0-bef1-4834-b026-46b02d9466ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1773773209; i=f_l_k@t-online.de;
	bh=kgYic52zYXsU+FkgjT+ZwaJSGDG9CRu3oU4JW9ywZBc=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=c+IPjFNDscmNSSqyTN9SYDaW7suImDBqIJrNyQms0k1t3+8nvO/ETJEShDtf0fKhw
	 li7sd/F3AtX48ElNyytqS3Bkag290GuXWUzJL1eDzrom+njRxfq/LDmJURZqZ5YwaX
	 eESW4iI4iUHyjrLOFKSTn0CUs53tmQ1SL91D8TVDE/Zsbeg0pgBcy/yh0F1r3D+7Ve
	 bHJdFQl8dzyZ9VAd2a0B78W3Qynp4yycG5REnNN8iYFpsji9M4ufVf1acUOoAGjYwK
	 ZnOCRjbT7hWNwtFcJUEDetGUd3/Uh2G7bX2lLm64OfyQsJX/GwEGYPG6tH+MOAmksq
	 REFv1Ks9RVtwQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 18:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125331

--=-YTmPOVkC1/McRdAZIuC7
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Mar 5 2026 at 21:17:51 +01:00:00, Gyorgy Sarvari via 
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> 
wrote:
> SAMBA4_IDMAP_MODULES

I see an error with this update:
ERROR: samba-4.23.6-r0 do_compile: Execution of 
'/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/run.do_compile.1254855' 
failed with exit code 1
ERROR: Logfile of failure stored in: 
/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/log.do_compile.1254855
Log data follows:
| DEBUG: Executing shell function do_compile
| Waf: Entering directory 
`/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/sources/samba-4.23.6/bin/default'
| Selected system MIT krb5 libraries, Heimdal use is disabled
| Checking project rules ...
| Project rules pass
| [3427/3555] Processing manpages/smb.conf.5: 
docs-xml/manpages/smb.conf.5.xml 
bin/default/docs-xml/smbdotconf/parameters.all.xml 
bin/default/docs-xml/build/DTD/samba.build.pathconfig 
docs-xml/build/DTD/samba.entities 
bin/default/docs-xml/build/DTD/samba.build.version -> 
bin/default/docs-xml/manpages/smb.conf.5
| runtime error: file 
<file:///home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl> 
line 58 element choose
| xsltApplySequenceConstructor: A potential infinite template recursion 
was detected.
| You can adjust xsltMaxDepth (--maxdepth) in order to raise the 
maximum number of nested template calls and variables/params (currently 
set to 3000).


--=-YTmPOVkC1/McRdAZIuC7
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Mar 5 2026 at 21:17:51 +01:00:0=
0, Gyorgy Sarvari via lists.openembedded.org &lt;skandigraun=3Dgmail.com@li=
sts.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"=
plaintext" style=3D"white-space: break-spaces;">SAMBA4_IDMAP_MODULES</div><=
/blockquote><div><br></div><div>I see an error with this update:</div><div>=
ERROR: samba-4.23.6-r0 do_compile: Execution of '/home/flk/bitbake-builds/p=
oky/build/tmp/work/corei7-64-oe-linux/samba/4.23.6/temp/run.do_compile.1254=
855' failed with exit code 1</div><div>ERROR: Logfile of failure stored in:=
 /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23=
.6/temp/log.do_compile.1254855</div><div>Log data follows:</div><div>| DEBU=
G: Executing shell function do_compile</div><div>| Waf: Entering directory =
`/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/samba/4.23=
.6/sources/samba-4.23.6/bin/default'</div><div>| 	Selected system MIT krb5 =
libraries, Heimdal use is disabled</div><div>| Checking project rules ...</=
div><div>| Project rules pass</div><div>| [3427/3555] Processing manpages/s=
mb.conf.5: docs-xml/manpages/smb.conf.5.xml bin/default/docs-xml/smbdotconf=
/parameters.all.xml bin/default/docs-xml/build/DTD/samba.build.pathconfig d=
ocs-xml/build/DTD/samba.entities bin/default/docs-xml/build/DTD/samba.build=
.version -&gt; bin/default/docs-xml/manpages/smb.conf.5</div><div>| runtime=
 error: file <a href=3D"file:///home/flk/bitbake-builds/poky/build/tmp/work=
/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/share/xml/docboo=
k/xsl-stylesheets-1.79.1/lib/lib.xsl">file:///home/flk/bitbake-builds/poky/=
build/tmp/work/corei7-64-oe-linux/samba/4.23.6/recipe-sysroot-native/usr/sh=
are/xml/docbook/xsl-stylesheets-1.79.1/lib/lib.xsl</a> line 58 element choo=
se</div><div>| xsltApplySequenceConstructor: A potential infinite template =
recursion was detected.</div><div>| You can adjust xsltMaxDepth (--maxdepth=
) in order to raise the maximum number of nested template calls and variabl=
es/params (currently set to 3000).</div></div>
--=-YTmPOVkC1/McRdAZIuC7--


