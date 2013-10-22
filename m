Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9F51A6D303
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 15:50:43 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l20so6723999oag.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2013 08:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=z7JqpJJSJatAnoRI6jvLZ+G2ltY7vlZBcvejMaCqgJs=;
	b=jrQewAh9OGUDSzu1svDtpUlCdCZ+WYR+9L9igaqQBSYAAndQOr7WqE/UElUWYBlt/C
	GxMBva30rofjZuud96r6+9Vy4/CYJU5Bt9nklcpnXQT8cZ3zNHY49KVBzx0QbdpFaGHK
	X6eBJziSQEvyAmui8mLHSHweni/Lu40JBjlW3mXYEMrTztYH6sD+Ft56qG+I2oSHoXZj
	mSe+rN9zwvMFepfGEa4mj0R4DrDkGlctXnCg0GtBnTNzvqz6w9bcLlpa0Dk2pvcyqQl0
	ZDqvK2txOlkx2QCdJFIkBJPzM3pE9M03rmsASTAgr0OEfUDSepG6PcDnj0K1OOaVKvmv
	xhiw==
X-Gm-Message-State: ALoCoQl2ZPcHHGUz8mIn3g9Ul9p0ugonXAmS4XY69TBVsXWC+OJqo7JY1tTMoUdGsXjTW4r91W1f
X-Received: by 10.182.71.82 with SMTP id s18mr26248923obu.9.1382457045415;
	Tue, 22 Oct 2013 08:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Tue, 22 Oct 2013 08:50:25 -0700 (PDT)
In-Reply-To: <1382456281-16216-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1382456281-16216-1-git-send-email-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 22 Oct 2013 17:50:25 +0200
Message-ID: <CAP71WjzvGpG3mNf5dEQd1HuBgTc+41iJ6915EDQydUxaX7aoeQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH] qtwebkit-examples: add missing RDEPENDS for qmlplugins
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
X-List-Received-Date: Tue, 22 Oct 2013 15:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 22, 2013 at 5:38 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Some examples require qtwebkit-qmlplugins (flickerview, youtubeview),
> and this dependency is not automatically added. Without this patch,
> and without manually adding qtwekbit-qmlplugins, we get errors like
> this:
>
> qrc:///flickrview.qml:42:1: module "QtWebKit" is not installed
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---

hmm. sorry, i messed up with my git alias and with --subject-prefix...
the subject i meant to have for this email is

[meta-qt5 master&dora][PATCH] qtwebkit-examples: add missing RDEPENDS
for qmlplugins

let me know if i need to resend. the key thing here is that I'd like
this patch to be applied on master and dora branch.

thanks

