Return-Path: <fffonion@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id F22D96FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 22:28:10 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id w2so16466494ywa.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 15:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jYYBL6Zznj8QVF/BeyJ4EhD6Hnh8DLIDMJYwHEQtue8=;
	b=J17/NKfkAiF9m5Rvj6njHX8rRd8QwQMlw8mLLByn7GGDXcy1eyz8zI8mU3JjAKxo+w
	nWFKu6AMVsRKHYuEn6SfPbFOyCo+GwoZD8ZpQaZWvWd/4eGguSbWcBym/xq2rrwCi3Kd
	XxlLQQKeeFQHrGAklVlWC4u3wmYBmJewJSaUPBqu6iqJ58mQ1h3GMz2EV3oJeJqEx/FM
	u84MoprcGkrLQFwXlWkajBaEvwiS6mhsiSHl4pkYvQJnVoQWpef6uQCQvI8q94QPY84y
	Hi4B750eQ92ugt/Z8Bvudmp2VR/g68RnbrRToMvc3ypWTEPU0ifhaaqqzqCOa2wi2vIj
	fXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jYYBL6Zznj8QVF/BeyJ4EhD6Hnh8DLIDMJYwHEQtue8=;
	b=p58u7xtoltUWzM0vouzQoJu3jNE63AS/iCjJzYuTsupA6ZQutmXAQDY9XI4vfctA/G
	ww+0/Mg1YEBg75STYUeHBw+ALfonIXUXOSm7DLzjZW6BCz+ksuaBEP6xjb8lrf4uDTU8
	ZMqK4hFOs3lTIpjYnIGDRWQs0k7OabdjTgCSQqYcc8zlXyFm1iGZxj1dylFH8D4SL0SD
	3/flwz/9WVg+cUVxcM0eIFUrxVBOjX49u4Xxi0jpItNgKmB8ob7YZl2yfFg/2QhvCBPv
	nCP9ykTNWJMiCFToiFOUiJTh2c3cF1/CocC95gSw3n6U9RHK3BS72O5OnntDIxvVKh6g
	BS2Q==
X-Gm-Message-State: AMCzsaUcCI7mAY89zxUfxQAcwqxe8vBLsjbK1W987niJjrZ3rmX6VgGS
	ABuRjiAUNtPmN//IZFdqenxZ93nxF4YpLK3dKrf34w==
X-Google-Smtp-Source: ABhQp+SuRE9uw1hCCf7HvxgPwqHZOQMKa417akf7KKbTUJ9kcUI5xzjF4Gxj5V++BqZO7DyUg/MCqPHxXtf0GoVSJPg=
X-Received: by 10.129.4.77 with SMTP id 74mr11965837ywe.137.1508884091855;
	Tue, 24 Oct 2017 15:28:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.80.133 with HTTP; Tue, 24 Oct 2017 15:27:31 -0700 (PDT)
From: Wangchong Zhou <fffonion@gmail.com>
Date: Tue, 24 Oct 2017 18:27:31 -0400
Message-ID: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Tue, 24 Oct 2017 22:28:11 -0000
Content-Type: text/plain; charset="UTF-8"

Resend a patch using largefile DISTRO_FEATURES.


Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 4a97e2670..84ce0fb4d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -57,7 +57,7 @@ do_configure () {
     --with-ptr-size=${PTRSIZE} \
     --with-sig-atomic-t=${PTRSIZE} \
     --with-size-t=${PTRSIZE} \
-    --with-off-t=${PTRSIZE} \
+
 --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','largefile','8','4',d)};
\
     --with-time-t=${PTRSIZE} \
     --with-sys-nerr=132 \
     --conf-path=${sysconfdir}/nginx/nginx.conf \
--
2.13.5

On Tue, Oct 24, 2017 at 2:28 PM, Wangchong Zhou <fffonion@gmail.com> wrote:
>
> Hi,
> The nginx receipt hardcoded size of off_t to be same as ptrsize, which
can break large files support on 32bit machines. The http range header will
fail with a code 416 on files bigger than 2G. Changing it to 8 will fix the
problem.
>
> I don't think hardcode off_t to 8 is a neat way of fixing this. Is there
a better way to detect large files support?
>
>
> Author: Wangchong Zhou <fffonion@gmail.com>
> Date:   Tue Oct 24 14:21:35 2017 -0400
>
>     fix large files support in nginx by setting off_t to 8 bytes
>
>     Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index 4a97e2670..4cdf892c7 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -57,7 +57,7 @@ do_configure () {
>      --with-ptr-size=${PTRSIZE} \
>      --with-sig-atomic-t=${PTRSIZE} \
>      --with-size-t=${PTRSIZE} \
> -    --with-off-t=${PTRSIZE} \
> +    --with-off-t=8 \
>      --with-time-t=${PTRSIZE} \
>      --with-sys-nerr=132 \
>      --conf-path=${sysconfdir}/nginx/nginx.conf \
>
>



-- 
Regards
fffonion (B607 2745 84E8 D5E5)

