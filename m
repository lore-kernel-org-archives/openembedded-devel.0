Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8981760232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:38:51 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so188109433wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MFulKcjT7QprLcoCYS+Bky6dj3IzKsU18iIPi8xKIcw=;
	b=QGq290QaFKUdToOkGGo1ZMMaEQmuLQiZwSgaaoCzcv9P8UXMVLGOxFZCaV1kSrbn0l
	9mfNRwRBRAc+FNkF0XECKTO/P4VxykEv43Ysw4F12GuCZWBWjDOyWZU6hAcyGsCCIA0+
	kgiDyIhFqkmOTEQSIbdpb/94su/WRParyOBOApgHc52WAP6KnsgqZ+4yGY2RfD5lfxIU
	aXmrcAJKraVbCdUML9bAgoMPOsOMp8XIzC2VdjaTTyxgrNekeEAQ3RZQJR7w9jrnDvPu
	vyDdrIsgfENaJJ5RG1kzqNTRjkbZtYHgB268gqlc2Y1w3+GIc8MFmADQeYqtTSRlZyV9
	oxpA==
MIME-Version: 1.0
X-Received: by 10.180.198.109 with SMTP id jb13mr3638861wic.17.1443605931508; 
	Wed, 30 Sep 2015 02:38:51 -0700 (PDT)
Received: by 10.194.159.102 with HTTP; Wed, 30 Sep 2015 02:38:51 -0700 (PDT)
In-Reply-To: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
References: <1443605598-1445-1-git-send-email-adrian.ratiu@ni.com>
Date: Wed, 30 Sep 2015 11:38:51 +0200
Message-ID: <CA+chaQdHyhFqLDALSJ+90PEM0Z5a0fKn5vk4jApoJ_jWnW-WdA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] meta-oe: recipes-connectivity: add relayd recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 09:38:56 -0000
Content-Type: text/plain; charset=UTF-8

Why not meta-networking? Don't use INSANE_SKIP, this should be fixed, drop
PR, is RDEPENDS really needed? Drop protocol and branch from the SRC_URI
(default values).

On Wed, Sep 30, 2015 at 11:33 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> relayd is a daemon to relay and dynamically redirect incoming
> connections to a target host.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-oe/recipes-connectivity/relayd/relayd_git.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/relayd/relayd_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/relayd/relayd_git.bb
> b/meta-oe/recipes-connectivity/relayd/relayd_git.bb
> new file mode 100644
> index 0000000..15fba0c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/relayd/relayd_git.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Layer 3 relay daemon"
> +SECTION = "console/network"
> +LICENSE = "relayd-custom-license"
> +LIC_FILES_CHKSUM =
> "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab2"
> +PR = "r0"
> +
> +DEPENDS = "libubox"
> +RDEPENDS_${PN} = "libubox"
> +
> +SRC_URI = "git://nbd.name/relayd.git;protocol=git;branch=master"
> +
> +SRCREV = "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +INSANE_SKIP_relayd += "dev-deps"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

