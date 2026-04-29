Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C81EFF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:25:14 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5625.1777443908734668091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HSJ5BeUX;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so131267741fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 23:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777443907; x=1778048707; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TRzDqD9P+kNHEz7sHw9OybICIK8RJmBjBmac+l3w9zs=;
        b=HSJ5BeUXNml6IIPkna1OJ5280CqDKCvXmNNPdhCY3N0+HuDkwldWniF2no3VtS7Q2g
         nqJ5gEhJYmYIhNWfplHySzkBHThRLo5qYck/+FOTTNL/PGbwSZkL6Icy3P8pZTAlpcgx
         BpVb/0NbVFCy6lgY0eDfRzy1OGa7qeBFmxVYuqcc3RldMDqF9mNwG4Fi3W8ZUGRdr0BS
         lAAkTW2w0Bvqe53Gu2M/D4azBIFgnqdZomPX6T5QJbIRZENS6lO1SFqTmK4fDgdw7mZj
         xG3wynj52na7WtzWNlMs5iZRTwEygZre1fOwzQU3JYV/gsGvmTapuNdxitRg0YDZrOj/
         kcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777443907; x=1778048707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRzDqD9P+kNHEz7sHw9OybICIK8RJmBjBmac+l3w9zs=;
        b=jr4UMLbcVCZtNX4/+VK/K+S2IL2tVUf8785vynDCjwW1aBWaOXIjsrUOkzp3YWsWyx
         EewxaZoFbGrpaiI6doBTSRCp/NN2FALyztKCsIjVKRaSGktSx0fvoeVMm0W911t80d7C
         QPaBi4HNzPSu4IaQ9VPZyo9mFlInlTU7zkVKluehO48FXr9G8AWV2eXfimq/JVzbGVga
         +0ZyqeL5aLI9aOCe/y3nfQbpd5fTj3mXTfFr8GnqvmgTrUgs3jHcBbDC5Fs6RHSYEvHu
         VSlFNdL+XfMGZo+s/VZnTVnzwXcmpwl/bqxq7kvLIIR2hhTTmjpfvNxRw45Vth6EqF2R
         YAHg==
X-Gm-Message-State: AOJu0Yxv+f0SISRGBo0OcHTwwkQkySTip34IMWm0RBYOHo2Psa5OSN8v
	KjtvBj/qEf2m8Cq5t4W/I09tOyJOoe9Cm9AXzCj1s0TJCx1lJBR9SipwplyU3lzpYDQ=
X-Gm-Gg: AeBDievAOVpMpCt+dN2MlRTo1JAqCjMgUtmhj9sI1zqd2GxBARL5fBiJPwVfQOIEwq+
	haqDBxEMbDWg86eCA5daEe8R5Q3BkDfoV5OeYEQBfGlleAD7/r2Lng0CdWyLIfFCQIkBm++TEfZ
	YyPx5jBexy7rDJg7L4VHCQmlJVa1mgtCNcEk+xcXXBY2u+NqBWRjDwzW/G1z/3lYvslg6pNcVhH
	9RatqgPYwfrTAYQx/ny4dY0XAaY8X4/Gv/3G+1xUNJJrUpK7Tj+rGh7cGd5FdYVONIvnd+Zeg87
	COsCyBMoiLPXSCEk8uAOEPQjknm6jTZWUCDa+3ch3T9d27zmHJlHiGJGNzqp4h3RTY8Inu4VMxn
	4XjBgLQpOsymnffiPr7nlXiytViMybSthZ83q3X0lKLwdhlgeqc37AmPH/oBEV23B1V/JxyVVTZ
	0JTW88LAyUo4I59+UvjdU9iwZsc/RKiRhjU7QiVj50NdfuhYIeqftdeRAAhW2pVw==
X-Received: by 2002:a05:651c:2126:b0:38f:e999:6a5a with SMTP id 38308e7fff4ca-3924bc0e546mr9923691fa.11.1777443906354;
        Tue, 28 Apr 2026 23:25:06 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924ed604dasm2602191fa.0.2026.04.28.23.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:25:05 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:24:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 1/2] onig: fix gcc 15 build
Message-ID: <afGkOJHzKIOXnCzc@nuoska>
References: <20260428090053.3401574-1-mikko.rapeli@linaro.org>
 <CA+s=J=xW4-4Os8Y=nkvAX9SjuSmzuebd-=SKhdT_RrMBZcx4=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+s=J=xW4-4Os8Y=nkvAX9SjuSmzuebd-=SKhdT_RrMBZcx4=Q@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2026 06:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126662

Hi,

On Wed, Apr 29, 2026 at 11:17:55AM +0800, Anuj Mittal wrote:
> Hi,
> 
> On Tue, Apr 28, 2026 at 5:01 PM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > With backport from upstream 6.9.10.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ...08dee4a01dee60c4cd67f2e2e46484ef50a5.patch | 138 ++++++++++++++++++
> >  meta-oe/recipes-support/onig/onig_6.9.9.bb    |   1 +
> >  2 files changed, 139 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
> >
> > diff --git a/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
> > new file mode 100644
> > index 0000000000..f0683c2ebd
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/onig/onig/5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch
> > @@ -0,0 +1,138 @@
> > +From 5f1408dee4a01dee60c4cd67f2e2e46484ef50a5 Mon Sep 17 00:00:00 2001
> > +From: "K.Kosako" <kkosako0@gmail.com>
> > +Date: Mon, 18 Nov 2024 00:18:12 +0900
> > +Subject: [PATCH] fix #312: Build failure with GCC 15 (C23)
> > +
> 
> This is missing Upstream-Status and Signed-off.

They are...

> > +---
> > + src/regparse.c | 44 ++++++++++++++++++++++++++++++++++++--------
> > + src/st.h       |  9 +--------
> > + 2 files changed, 37 insertions(+), 16 deletions(-)
> > +
> > +Upstream-Status: Backport [5f1408dee4a01dee60c4cd67f2e2e46484ef50a5]
> > +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

... right here.

Cheers,

-Mikko

> > +diff --git a/src/regparse.c b/src/regparse.c
> > +index 24bcbaac..9acdd6e2 100644
> > +--- a/src/regparse.c
> > ++++ b/src/regparse.c
> > +@@ -793,8 +793,13 @@ onig_print_names(FILE* fp, regex_t* reg)
> > + #endif /* ONIG_DEBUG */
> > +
> > + static int
> > +-i_free_name_entry(UChar* key, NameEntry* e, void* arg ARG_UNUSED)
> > ++i_free_name_entry(st_data_t akey, st_data_t ae, st_data_t arg ARG_UNUSED)
> > + {
> > ++  UChar* key;
> > ++  NameEntry* e;
> > ++
> > ++  key = (UChar* )akey;
> > ++  e = (NameEntry* )ae;
> > +   xfree(e->name);
> > +   if (IS_NOT_NULL(e->back_refs)) xfree(e->back_refs);
> > +   xfree(key);
> > +@@ -850,8 +855,14 @@ typedef struct {
> > + } INamesArg;
> > +
> > + static int
> > +-i_names(UChar* key ARG_UNUSED, NameEntry* e, INamesArg* arg)
> > ++i_names(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t aarg)
> > + {
> > ++  NameEntry* e;
> > ++  INamesArg* arg;
> > ++
> > ++  e = (NameEntry* )ae;
> > ++  arg = (INamesArg* )aarg;
> > ++
> > +   int r = (*(arg->func))(e->name,
> > +                          e->name + e->name_len,
> > +                          e->back_num,
> > +@@ -883,9 +894,14 @@ onig_foreach_name(regex_t* reg,
> > + }
> > +
> > + static int
> > +-i_renumber_name(UChar* key ARG_UNUSED, NameEntry* e, GroupNumMap* map)
> > ++i_renumber_name(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t amap)
> > + {
> > +   int i;
> > ++  NameEntry* e;
> > ++  GroupNumMap* map;
> > ++
> > ++  e = (NameEntry* )ae;
> > ++  map = (GroupNumMap* )amap;
> > +
> > +   if (e->back_num > 1) {
> > +     for (i = 0; i < e->back_num; i++) {
> > +@@ -1374,9 +1390,14 @@ static int CalloutNameIDCounter;
> > + #ifdef USE_ST_LIBRARY
> > +
> > + static int
> > +-i_free_callout_name_entry(st_callout_name_key* key, CalloutNameEntry* e,
> > +-                          void* arg ARG_UNUSED)
> > ++i_free_callout_name_entry(st_data_t akey, st_data_t ae, st_data_t arg ARG_UNUSED)
> > + {
> > ++  st_callout_name_key* key;
> > ++  CalloutNameEntry* e;
> > ++
> > ++  key = (st_callout_name_key* )akey;
> > ++  e = (CalloutNameEntry* )ae;
> > ++
> > +   if (IS_NOT_NULL(e)) {
> > +     xfree(e->name);
> > +   }
> > +@@ -1870,10 +1891,14 @@ typedef intptr_t   CalloutTagVal;
> > + #define CALLOUT_TAG_LIST_FLAG_TAG_EXIST     (1<<0)
> > +
> > + static int
> > +-i_callout_callout_list_set(UChar* key, CalloutTagVal e, void* arg)
> > ++i_callout_callout_list_set(st_data_t key ARG_UNUSED, st_data_t ae, st_data_t arg)
> > + {
> > +   int num;
> > +-  RegexExt* ext = (RegexExt* )arg;
> > ++  CalloutTagVal e;
> > ++  RegexExt* ext;
> > ++
> > ++  e   = (CalloutTagVal )ae;
> > ++  ext = (RegexExt* )arg;
> > +
> > +   num = (int )e - 1;
> > +   ext->callout_list[num].flag |= CALLOUT_TAG_LIST_FLAG_TAG_EXIST;
> > +@@ -1926,8 +1951,11 @@ onig_callout_tag_is_exist_at_callout_num(regex_t* reg, int callout_num)
> > + }
> > +
> > + static int
> > +-i_free_callout_tag_entry(UChar* key, CalloutTagVal e, void* arg ARG_UNUSED)
> > ++i_free_callout_tag_entry(st_data_t akey, st_data_t e ARG_UNUSED, st_data_t arg ARG_UNUSED)
> > + {
> > ++  UChar* key;
> > ++
> > ++  key = (UChar* )akey;
> > +   xfree(key);
> > +   return ST_DELETE;
> > + }
> > +diff --git a/src/st.h b/src/st.h
> > +index 5efee8bb..70798dc5 100644
> > +--- a/src/st.h
> > ++++ b/src/st.h
> > +@@ -34,13 +34,6 @@ enum st_retval {ST_CONTINUE, ST_STOP, ST_DELETE, ST_CHECK};
> > + #ifndef _
> > + # define _(args) args
> > + #endif
> > +-#ifndef ANYARGS
> > +-# ifdef __cplusplus
> > +-#   define ANYARGS ...
> > +-# else
> > +-#   define ANYARGS
> > +-# endif
> > +-#endif
> > +
> > + st_table *st_init_table _((struct st_hash_type *));
> > + st_table *st_init_table_with_size _((struct st_hash_type *, int));
> > +@@ -52,7 +45,7 @@ int st_delete _((st_table *, st_data_t *, st_data_t *));
> > + int st_delete_safe _((st_table *, st_data_t *, st_data_t *, st_data_t));
> > + int st_insert _((st_table *, st_data_t, st_data_t));
> > + int st_lookup _((st_table *, st_data_t, st_data_t *));
> > +-int st_foreach _((st_table *, int (*)(ANYARGS), st_data_t));
> > ++int st_foreach _((st_table *, int (*)(st_data_t, st_data_t, st_data_t), st_data_t));
> > + void st_add_direct _((st_table *, st_data_t, st_data_t));
> > + void st_free_table _((st_table *));
> > + void st_cleanup_safe _((st_table *, st_data_t));
> > diff --git a/meta-oe/recipes-support/onig/onig_6.9.9.bb b/meta-oe/recipes-support/onig/onig_6.9.9.bb
> > index b29437db1e..b545fc7596 100644
> > --- a/meta-oe/recipes-support/onig/onig_6.9.9.bb
> > +++ b/meta-oe/recipes-support/onig/onig_6.9.9.bb
> > @@ -11,6 +11,7 @@ SRC_URI = "\
> >      https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
> >      file://0001-build-don-t-link-against-host-system-libraries.patch \
> >      file://0002-build-enable-serial-tests-automake-option-for-ptest.patch \
> > +    file://5f1408dee4a01dee60c4cd67f2e2e46484ef50a5.patch \
> >      file://run-ptest \
> >  "
> >
> > --
> > 2.51.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126649): https://lists.openembedded.org/g/openembedded-devel/message/126649
> > Mute This Topic: https://lists.openembedded.org/mt/119045170/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [anuj.mittal@oss.qualcomm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

