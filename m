Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5A4C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 07:42:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.44502.1704526937279184285
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 23:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id A9353E71
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 08:42:15 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.51]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rM1Jt-1NnX720; Sat, 6 Jan 2024 08:42:13 +0100
Date: Sat, 06 Jan 2024 08:42:08 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] glad: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <8EXT6S.FR5NOVOW32QP@t-online.de>
In-Reply-To: <17A7B218A796A127.25044@lists.openembedded.org>
References: <17A7B218A796A127.25044@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nSWhACbmSa9sR+NkeWcZ"
X-TOI-EXPURGATEID: 150726::1704526933-32FFA937-6B3E5F07/0/0 CLEAN NORMAL
X-TOI-MSGID: 937bd598-0456-4b55-91f3-04b7dadab597
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 07:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108063

--=-nSWhACbmSa9sR+NkeWcZ
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds python3-jinja2 rdepend

On Sat, Jan 6 2024 at 08:39:50 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> glad is a required dependency for libplacebo
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-oe/recipes-graphics/glad/glad_2.0.4.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/glad/glad_2.0.4.bb
> 
> diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.4.bb 
> b/meta-oe/recipes-graphics/glad/glad_2.0.4.bb
> new file mode 100644
> index 000000000..69fe0709a
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glad/glad_2.0.4.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the 
> official specifications for multiple languages."
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=ae570f26774ac096cff8f992091a223c" 
> <file://license;md5=ae570f26774ac096cff8f992091a223c/>
> +
> +SRC_URI = 
> "git://github.com/Dav1dde/glad.git;protocol=https;branch=glad2"
> +SRCREV = "d08b1aa01f8fe57498f04d47b5fa8c48725be877"
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> +RDEPENDS:${PN} = "python3 python3-jinja2"
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108062): 
> <https://lists.openembedded.org/g/openembedded-devel/message/108062>
> Mute This Topic: <https://lists.openembedded.org/mt/103558142/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-nSWhACbmSa9sR+NkeWcZ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds python3-jinja2 rdepend</div></div><div id="geary-quote" dir="auto"><br>On Sat, Jan 6 2024 at 08:39:50 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">glad is a required dependency for libplacebo

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta-oe/recipes-graphics/glad/glad_2.0.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glad/glad_2.0.4.bb

diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.4.bb b/meta-oe/recipes-graphics/glad/glad_2.0.4.bb
new file mode 100644
index 000000000..69fe0709a
--- /dev/null
+++ b/meta-oe/recipes-graphics/glad/glad_2.0.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specifications for multiple languages."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=ae570f26774ac096cff8f992091a223c" "="">file://LICENSE;md5=ae570f26774ac096cff8f992091a223c"</a>
+
+SRC_URI = "git://github.com/Dav1dde/glad.git;protocol=https;branch=glad2"
+SRCREV = "d08b1aa01f8fe57498f04d47b5fa8c48725be877"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
+RDEPENDS:${PN} = "python3 python3-jinja2"
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#108062): <a href="https://lists.openembedded.org/g/openembedded-devel/message/108062">https://lists.openembedded.org/g/openembedded-devel/message/108062</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/103558142/3618223">https://lists.openembedded.org/mt/103558142/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-nSWhACbmSa9sR+NkeWcZ--


