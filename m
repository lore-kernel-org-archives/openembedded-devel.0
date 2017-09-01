Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 69C4D783E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:24:57 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r25so137217pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PoBx9NgqTM6CmK36k60MQ7iCbIhvJ27fXJsSHdypZLg=;
	b=rB6nw19/hDdA8OMIN1eWVqvjYCv5DSXCiP6cmS17TcOX6GCmYvFBZYG2ToxwAv6+3m
	vuKsR8edNrpFkZRZkqgfemqdzHGuJN4eWOfAtjUOHlblhVzVL7dyPzQLPvteldjNIxWY
	9ZFUtgZuoyjtpcL1DcQTcblmuEaF9jQBm1KiESpsYm9j0TtxELWReeJbxZsNRd3OrjKq
	OxVs88AsF6GEpfwZIjFXlMfxAzvNp+BXGcliw+xdsI3spRZydG0ea0v6JZtEBkCwe4bc
	LbOkQAdJpWxlWHaYMkhbq/4s6i6GRTnFIUppOfaLZZMGygcO0lq5ekGX9PRNQmWew8hI
	QdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PoBx9NgqTM6CmK36k60MQ7iCbIhvJ27fXJsSHdypZLg=;
	b=S4s2y0E7dcwK8uFDtTyRJtsq58QLgISTUT6r1z8vMxIXYOjo/iZi7k7Y4nncJHNJeQ
	1WcKrhDSYZD27Pu862f6UmEswVpJeOl6SidzS8AyYyHwAYRh90rSVRFVagS/KpPcPCdH
	g4i0RVXS6QenEUkQy3pxjLDYZaXuQt/I4Q7szhAjfNvZL2VTcFl0PhXID3yNewglHUa8
	ebmwbh36zFYfNbLoY2DKak+ws+7zd72TrMYexT63UChWkMjc1c/gFKpznoPKpNykDhO1
	8EOJQWP+UmPMQrWhmDtJ0ndjkMgb3/ZVgyJhMO2ve/qDvD9OQ4dFlQRJg0oto61w6T85
	5BaQ==
X-Gm-Message-State: AHPjjUjE5KFkCv+zx0zke/NsboLBgzJ717YhQehcogv1IJcdkmid6/Zv
	6i9MgAaSsED+O6eBW50kVIdt0wO4uA==
X-Google-Smtp-Source: ADKCNb4fijUyYm6yKPPiEbpk1Fpe35X0P8kp4KD1vGJkHRIPL243L48Fp5uDnsFKZdfhdrBCFxiOW9gSBZMHr6a7cOY=
X-Received: by 10.84.216.85 with SMTP id f21mr2129574plj.404.1504272299268;
	Fri, 01 Sep 2017 06:24:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 1 Sep 2017 06:24:28 -0700 (PDT)
In-Reply-To: <1504243590-86579-1-git-send-email-dengke.du@windriver.com>
References: <1504243590-86579-1-git-send-email-dengke.du@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Sep 2017 06:24:28 -0700
Message-ID: <CAMKF1somSGXJ2aVL+uVKN-xjupfz1r-68zVR+86KE1cN0ER3mg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] iscsitarget: fix few arguments for netlink_ack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 13:24:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 31, 2017 at 10:26 PM, Dengke Du <dengke.du@windriver.com> wrote:
> After kernel version 4.12, the function netlink_ack need four arguments,
> so adjust it in iscsitarget.
>

check https://patchwork.openembedded.org/patch/143411/

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  ...itarget-fix-few-arguments-for-netlink_ack.patch | 35 ++++++++++++++++++++++
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  4 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
>
> diff --git a/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
> new file mode 100644
> index 0000000..84e5853
> --- /dev/null
> +++ b/meta-networking/recipes-extended/iscsitarget/files/0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch
> @@ -0,0 +1,35 @@
> +From 878b6830cbeb912362ea4cc3497954e72df6f043 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 30 Aug 2017 06:06:49 -0400
> +Subject: [PATCH] iscsitarget: fix few arguments for netlink_ack
> +
> +After the kernel upgrade to 4.12 in OE, the netlink_ack function
> +need four arguments, so add it. we can check the commit:
> +
> +    2d4bc93368f5a0ddb57c8c885cdad9c9b7a10ed5
> +
> +in kernel.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + kernel/event.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/kernel/event.c b/kernel/event.c
> +index ef4adcb..8ba5978 100644
> +--- a/kernel/event.c
> ++++ b/kernel/event.c
> +@@ -29,7 +29,7 @@ static void event_recv_skb(struct sk_buff *skb)
> +               ietd_pid = NETLINK_CB(skb).portid;
> +               WARN_ON(ietd_pid == 0);
> +               if (nlh->nlmsg_flags & NLM_F_ACK)
> +-                      netlink_ack(skb, nlh, 0);
> ++                      netlink_ack(skb, nlh, 0, NULL);
> +               skb_pull(skb, rlen);
> +       }
> + }
> +--
> +2.8.1
> +
> diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
> index 5c1e38e..dddea10 100644
> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
> @@ -14,7 +14,9 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
>             file://access-sk_v6_daddr-iff-IPV6-defined.patch \
>             file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
>             file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch \
> -           file://fix-call-trace-of-ahash-API-calling.patch"
> +           file://fix-call-trace-of-ahash-API-calling.patch \
> +           file://0001-iscsitarget-fix-few-arguments-for-netlink_ack.patch \
> +          "
>
>  SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
>  SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

