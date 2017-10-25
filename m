Return-Path: <fffonion@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 266826060F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 01:47:51 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id j4so16753445ywb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 18:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ctUzmzEypyTIV12ScUF5iSO70Ysduv20Gq/ZABEAtLQ=;
	b=LV6UcZjdQE7P83iuvKsnZbV2VIPRxrLh1CUI80a5PLev/C8BdRhlvrlg43IO0bMxc/
	mL19t+1dWf5qKyz5dsI9yP9u8n3qnVqOBTYZg6PBb9syqhrCX0Gd5Tk4DLC12BswGo20
	O60vPURy1JfxwCFQpxPLn6406VMS6smEJKUU4evL5iXLUeRL5QfKoEMG6NnfxyNgRvPN
	PPXM9jqFN9pmCcCtTePLds8vQjnYWyJ7lb8CCx7YUBn+3w139p7lh+E7Oh1/pTTMk3pl
	0Q1Y/YSSFOr/jqMVAPfgV0rXHAuVpcWAKXPVutwY6aNGd8ji9qcJ5wv73XcesDNaqeRe
	OkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ctUzmzEypyTIV12ScUF5iSO70Ysduv20Gq/ZABEAtLQ=;
	b=auUNMtHu2uPhQmTX0IWclbzjjwnIYKuHmXJlKEiT0MdAArYwY0B7LbR/soU62yHS7V
	lK6DRH3kulHYI4GBR7R9sMO4hHw2JPT+IBxHsilC8y6SBhWYHujEJrDQZh1pZTytU1kZ
	Es7todqJUjSQO6iv/TjgzB2WuWNi4MbsJxQKbGCqwv6PKiXDOQ644+Zy/P0H1JFGRIFr
	OgFeAhE+q0vnjFUEhsmFiYFd1m1M3ceH6nKIgh6G0/JO+NCvmIwojWV2TLRVquZVYoxd
	edTYOCpFWCDR9KcTEc07eckQ4M5BUpPYW4Zpt48eNtp3JemzzolM4rq4/uRM/ZUfA5Lb
	PQ2Q==
X-Gm-Message-State: AMCzsaV4mgDjqovwAurPrv4eIQpdF8H3UyPEFmrbYfYYHkHkI3GNG9Br
	sbEXik400Blquv9MTaQyTT+mRHcYHVJ/wvkptN0=
X-Google-Smtp-Source: ABhQp+SkM6WmjNFD3DZMnTxoPD+kzS7sOZYLCGzi4py7iJ/mRScwqw1Wh8ZJSVwqiCZIZBtBlO1nCSpJQRL1oCQv0M8=
X-Received: by 10.37.73.134 with SMTP id w128mr355128yba.516.1508896072784;
	Tue, 24 Oct 2017 18:47:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.80.133 with HTTP; Tue, 24 Oct 2017 18:47:12 -0700 (PDT)
In-Reply-To: <CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
From: Wangchong Zhou <fffonion@gmail.com>
Date: Tue, 24 Oct 2017 21:47:12 -0400
Message-ID: <CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 25 Oct 2017 01:47:52 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks! This should work.

Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 4a97e2670..00ce132b3 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -41,6 +41,12 @@ do_configure () {
     else
         PTRSIZE=4
     fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'true',
'false', d)}; then
+        OFFTSIZE=8
+    else
+        OFFTSIZE=${PTRSIZE}
+    fi
+

     echo $CFLAGS
     echo $LDFLAGS
@@ -57,7 +63,7 @@ do_configure () {
     --with-ptr-size=${PTRSIZE} \
     --with-sig-atomic-t=${PTRSIZE} \
     --with-size-t=${PTRSIZE} \
-    --with-off-t=${PTRSIZE} \
+    --with-off-t=${OFFTSIZE} \
     --with-time-t=${PTRSIZE} \
     --with-sys-nerr=132 \
     --conf-path=${sysconfdir}/nginx/nginx.conf \
--
2.13.5

On Tue, Oct 24, 2017 at 8:31 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 24, 2017 at 3:27 PM, Wangchong Zhou <fffonion@gmail.com>
> wrote:
> > Resend a patch using largefile DISTRO_FEATURES.
> >
> >
> > Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > index 4a97e2670..84ce0fb4d 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -57,7 +57,7 @@ do_configure () {
> >      --with-ptr-size=${PTRSIZE} \
> >      --with-sig-atomic-t=${PTRSIZE} \
> >      --with-size-t=${PTRSIZE} \
> > -    --with-off-t=${PTRSIZE} \
> > +
> >  --with-off-t=${@bb.utils.contains('DISTRO_FEATURES','
> largefile','8','4',d)};
> > \
>
> Could you still keep using PTRSIZE in else case above ?
>
> >      --with-time-t=${PTRSIZE} \
> >      --with-sys-nerr=132 \
> >      --conf-path=${sysconfdir}/nginx/nginx.conf \
> > --
> > 2.13.5
> >
> > On Tue, Oct 24, 2017 at 2:28 PM, Wangchong Zhou <fffonion@gmail.com>
> wrote:
> >>
> >> Hi,
> >> The nginx receipt hardcoded size of off_t to be same as ptrsize, which
> > can break large files support on 32bit machines. The http range header
> will
> > fail with a code 416 on files bigger than 2G. Changing it to 8 will fix
> the
> > problem.
> >>
> >> I don't think hardcode off_t to 8 is a neat way of fixing this. Is there
> > a better way to detect large files support?
> >>
> >>
> >> Author: Wangchong Zhou <fffonion@gmail.com>
> >> Date:   Tue Oct 24 14:21:35 2017 -0400
> >>
> >>     fix large files support in nginx by setting off_t to 8 bytes
> >>
> >>     Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
> >>
> >> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> index 4a97e2670..4cdf892c7 100644
> >> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> @@ -57,7 +57,7 @@ do_configure () {
> >>      --with-ptr-size=${PTRSIZE} \
> >>      --with-sig-atomic-t=${PTRSIZE} \
> >>      --with-size-t=${PTRSIZE} \
> >> -    --with-off-t=${PTRSIZE} \
> >> +    --with-off-t=8 \
> >>      --with-time-t=${PTRSIZE} \
> >>      --with-sys-nerr=132 \
> >>      --conf-path=${sysconfdir}/nginx/nginx.conf \
> >>
> >>
> >
> >
> >
> > --
> > Regards
> > fffonion (B607 2745 84E8 D5E5)
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Regards
fffonion (B607 2745 84E8 D5E5 <https://yooooo.us/gpg.txt>)

