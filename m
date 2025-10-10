Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2E1CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 09:04:15 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.4805.1760087046313712683
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JmOvfhfS;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-649d35ae18dso896913eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760087045; x=1760691845; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0M1+l5HD1CG4kNMwzCmImLDNlmTgGOZ8LEc2ivzcmM=;
        b=JmOvfhfS+F++qc8ymH99B+zvNegcb/nGa95BwafmVCQcMxU4jZAGqizSsAYwbvA0Tr
         kfcasl6Znab3wnNShC0RZsxh6SE9dArMjxZN16YJ16HTAdQj+1faxE0KGjmWG23uWNht
         13MfcOOm3kVdTv8KZrPVESwB3kgPcvNXjgxrEYgUNeFUHk9g89/ZFcFnrdcNLYWskRKd
         6CA9ccg2XzUVC1nqAW3D9LCqX+jfRxwg9WgROHlicHigk483iHquHO89Tn7O86rZ/0Sh
         /Slg2YXpk2tb4h5GFoEWWCnwD9ulC6nPlRcjAgc/a1aFwTOUjcAR3pbRr+zL9lqAExOL
         c/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760087045; x=1760691845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0M1+l5HD1CG4kNMwzCmImLDNlmTgGOZ8LEc2ivzcmM=;
        b=ezKZU4hkFXSfzAtk37ElzZu507xgL7Xt3xDlkghbxzHUgCOqkqGGY/oIrhESnQr6m4
         KctQ7C5jLZ/TLgtMvHw1pYLaVcY/vqPwImUcf8AR8w4tmSuKgl5lpsfwlpvwMwkWI7aR
         9iwoqPIdlWkMgpFk3xn/6GeUb1f3U8fNpVkMU1NWY5zo7MS9q4LW+5RW7M0hWbr+va6x
         eXj2GeCHS2SzcR1MGBtVRdfETQsthO73UHcdK8dyUK0kUXopoV1btTPnEyYhridBNHPI
         zU2J255tQzVjKCDpNcIeejeuq+nLtlRGnKL80HcwjvWG5EvWSpI3WjLc01l29ISc4Uyi
         HJCA==
X-Gm-Message-State: AOJu0YySgL9ppTDPZzo/FgaAUxOHkgValO3Jd1+e1O/P2Icf3gm4NsKS
	UELoQ0iPFF7fOTC4Rbjw4F+MhQ0SGP1pFKBb7f7qjADVupvkHtHkzqyi44bNNrxbUI26HqRlPhW
	ZpPssxAUrwhiYn2IBuwHYucKHE3J/1ZU=
X-Gm-Gg: ASbGncunjcpf/657mOwStU7IG+8b0Q1Aw6CKzFVcm+LHUeK3Q1BtxHwJXaUnc0uLGvh
	NU9XgRB4OX7P4Iu12pZxuWYBKFisYz0N+B7PH59iDizJ4dHer7yFTl0jJ5kjNC+yFsTlPMRQeE+
	lzMwVIu9Tvy856g5UEoK2U213D5Fc1L1OvGRaZtPqytN7J6YWAcN6wqvLXx+/X6ugWwUvkYjjDr
	nx8CzncgapH9R6pUKSEmZBLV18X
X-Google-Smtp-Source: AGHT+IFWNO8uJ+pPAKoQSEV2hLtLcEY9msCy1NA5mC6ZtNAosBNU9xQwafjZ9ZCC084ZLLo5UWO5e6UgT6fO0w3rZKQ=
X-Received: by 2002:a05:6870:d150:b0:32e:f4de:2db3 with SMTP id
 586e51a60fabf-3c0f082b892mr5219044fac.0.1760087045194; Fri, 10 Oct 2025
 02:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251009225931.3902783-1-ankur.tyagi85@gmail.com>
 <20251009225931.3902783-4-ankur.tyagi85@gmail.com> <1ef692b1-cf4d-4e38-8993-c9792b363d28@gmail.com>
In-Reply-To: <1ef692b1-cf4d-4e38-8993-c9792b363d28@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 10 Oct 2025 22:03:53 +1300
X-Gm-Features: AS18NWC4nQ63951tFKyGEGoDqVUZWS4jpyMzb-ej3GJqlHm1Vqgpecx1HwrBWF8
Message-ID: <CADySD0FmOiKqGfBWPQe78+UFyqNLtEmj0m85HZ_zHbVKN4GmkQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 4/4] hdf5: patch CVE-2025-6269
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 09:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120473

On Fri, Oct 10, 2025 at 9:22=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> Is OSV-2023-77 a prerequisite for the mentioned CVE? Or is it just a bonu=
s?
>

H5C__decode_cache_image_header() signature was changed as part of OSV
fix which was needed to cherry-pick CVE fix.
Although I could have worked around that but decided to keep OSV fix.

> On 10/10/25 00:59, Ankur Tyagi via lists.openembedded.org wrote:
> > Details https://nvd.nist.gov/vuln/detail/CVE-2025-6269
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../0004-CVE-2025-6269-OSV-2023-77.patch      | 294 ++++++++++++++++++
> >  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
> >  2 files changed, 295 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/hdf5/files/0004-CVE-2025-62=
69-OSV-2023-77.patch
> >
> > diff --git a/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-=
2023-77.patch b/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2=
023-77.patch
> > new file mode 100644
> > index 0000000000..4f155559bc
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77=
.patch
> > @@ -0,0 +1,294 @@
> > +From dfbbcfa5e8038813c99bc8bc1aa4926335c11df1 Mon Sep 17 00:00:00 2001
> > +From: aled-ua <bugbuster.cc@gmail.com>
> > +Date: Wed, 15 Jan 2025 15:02:25 -0600
> > +Subject: [PATCH] CVE-2025-6269 OSV-2023-77
> > +
> > +The GitHub issue #5579 included several security vulnerabilities in fu=
nction
> > +H5C__reconstruct_cache_entry().
> > +
> > +This PR addressed them by:
> > +- adding buffer size argument to the function
> > +- adding buffer overflow checks
> > +- adding input validations
> > +- releasing allocated resource on failure
> > +
> > +These changes addressed the crashes reported.  However, there is a ski=
plist
> > +crash during the unwinding process that has to be investigated.
> > +
> > +CVE: CVE-2025-6269
> > +Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7f2=
7ba8c3a8483c3d7e5e2cb21fefb2c7563422d]
> > +Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/391=
4bb7f7ec7105d8bfbeb3aebd92e867cff5b70]
> > +
> > +(cherry picked from commit 7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d)
> > +(cherry picked from commit 3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/H5Cimage.c | 95 ++++++++++++++++++++++++++++++++++++++-----------=
-
> > + src/H5Ocont.c  |  5 +--
> > + 2 files changed, 76 insertions(+), 24 deletions(-)
> > +
> > +diff --git a/src/H5Cimage.c b/src/H5Cimage.c
> > +index ec1af78..b97be22 100644
> > +--- a/src/H5Cimage.c
> > ++++ b/src/H5Cimage.c
> > +@@ -118,7 +118,8 @@ do {                                              =
         \
> > + /* Helper routines */
> > + static size_t H5C__cache_image_block_entry_header_size(const H5F_t *f=
);
> > + static size_t H5C__cache_image_block_header_size(const H5F_t *f);
> > +-static herr_t H5C__decode_cache_image_header(const H5F_t *f, H5C_t *c=
ache_ptr, const uint8_t **buf);
> > ++static herr_t H5C__decode_cache_image_header(const H5F_t *f, H5C_t *c=
ache_ptr, const uint8_t **buf,
> > ++                                             size_t buf_size);
> > + #ifndef NDEBUG /* only used in assertions */
> > + static herr_t H5C__decode_cache_image_entry(const H5F_t *f, const H5C=
_t *cache_ptr, const uint8_t **buf,
> > +                                             unsigned entry_num);
> > +@@ -131,7 +132,8 @@ static void   H5C__prep_for_file_close__compute_fd=
_heights_real(H5C_cache_entry_
> > + static herr_t H5C__prep_for_file_close__setup_image_entries_array(H5C=
_t *cache_ptr);
> > + static herr_t H5C__prep_for_file_close__scan_entries(const H5F_t *f, =
H5C_t *cache_ptr);
> > + static herr_t H5C__reconstruct_cache_contents(H5F_t *f, H5C_t *cache_=
ptr);
> > +-static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f=
, H5C_t *cache_ptr, const uint8_t **buf);
> > ++static H5C_cache_entry_t *H5C__reconstruct_cache_entry(const H5F_t *f=
, H5C_t *cache_ptr, hsize_t *buf_size,
> > ++                                                       const uint8_t =
**buf);
> > + static herr_t             H5C__write_cache_image_superblock_msg(H5F_t=
 *f, bool create);
> > + static herr_t             H5C__read_cache_image(H5F_t *f, H5C_t *cach=
e_ptr);
> > + static herr_t             H5C__write_cache_image(H5F_t *f, const H5C_=
t *cache_ptr);
> > +@@ -299,7 +301,7 @@ H5C__construct_cache_image_buffer(H5F_t *f, H5C_t =
*cache_ptr)
> > +         /* needed for sanity checks */
> > +         fake_cache_ptr->image_len =3D cache_ptr->image_len;
> > +         q                         =3D (const uint8_t *)cache_ptr->ima=
ge_buffer;
> > +-        status                    =3D H5C__decode_cache_image_header(=
f, fake_cache_ptr, &q);
> > ++        status =3D H5C__decode_cache_image_header(f, fake_cache_ptr, =
&q, cache_ptr->image_len + 1);
> > +         assert(status >=3D 0);
> > +
> > +         assert(NULL !=3D p);
> > +@@ -1269,7 +1271,7 @@ H5C__cache_image_block_header_size(const H5F_t *=
f)
> > +  *-------------------------------------------------------------------=
------
> > +  */
> > + static herr_t
> > +-H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, cons=
t uint8_t **buf)
> > ++H5C__decode_cache_image_header(const H5F_t *f, H5C_t *cache_ptr, cons=
t uint8_t **buf, size_t buf_size)
> > + {
> > +     uint8_t        version;
> > +     uint8_t        flags;
> > +@@ -1289,6 +1291,10 @@ H5C__decode_cache_image_header(const H5F_t *f, =
H5C_t *cache_ptr, const uint8_t *
> > +     /* Point to buffer to decode */
> > +     p =3D *buf;
> > +
> > ++    /* Ensure buffer has enough data for signature comparison */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, H5C__MDCI_BLOCK_SIGNATURE_LEN, *buf =
+ buf_size - 1))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, FAIL, "Insufficient buff=
er size for signature");
> > ++
> > +     /* Check signature */
> > +     if (memcmp(p, H5C__MDCI_BLOCK_SIGNATURE, (size_t)H5C__MDCI_BLOCK_=
SIGNATURE_LEN) !=3D 0)
> > +         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, FAIL, "Bad metadata cach=
e image header signature");
> > +@@ -2372,6 +2378,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t =
*cache_ptr)
> > + {
> > +     H5C_cache_entry_t *pf_entry_ptr;        /* Pointer to prefetched =
entry */
> > +     H5C_cache_entry_t *parent_ptr;          /* Pointer to parent of p=
refetched entry */
> > ++    hsize_t            image_len;           /* Image length */
> > +     const uint8_t     *p;                   /* Pointer into image buf=
fer */
> > +     unsigned           u, v;                /* Local index variable *=
/
> > +     herr_t             ret_value =3D SUCCEED; /* Return value */
> > +@@ -2387,10 +2394,11 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_=
t *cache_ptr)
> > +     assert(cache_ptr->image_len > 0);
> > +
> > +     /* Decode metadata cache image header */
> > +-    p =3D (uint8_t *)cache_ptr->image_buffer;
> > +-    if (H5C__decode_cache_image_header(f, cache_ptr, &p) < 0)
> > ++    p         =3D (uint8_t *)cache_ptr->image_buffer;
> > ++    image_len =3D cache_ptr->image_len;
> > ++    if (H5C__decode_cache_image_header(f, cache_ptr, &p, image_len + =
1) < 0)
> > +         HGOTO_ERROR(H5E_CACHE, H5E_CANTDECODE, FAIL, "cache image hea=
der decode failed");
> > +-    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < cache_p=
tr->image_len);
> > ++    assert((size_t)(p - (uint8_t *)cache_ptr->image_buffer) < image_l=
en);
> > +
> > +     /* The image_data_len and # of entries should be defined now */
> > +     assert(cache_ptr->image_data_len > 0);
> > +@@ -2402,7 +2410,7 @@ H5C__reconstruct_cache_contents(H5F_t *f, H5C_t =
*cache_ptr)
> > +         /* Create the prefetched entry described by the ith
> > +          * entry in cache_ptr->image_entrise.
> > +          */
> > +-        if (NULL =3D=3D (pf_entry_ptr =3D H5C__reconstruct_cache_entr=
y(f, cache_ptr, &p)))
> > ++        if (NULL =3D=3D (pf_entry_ptr =3D H5C__reconstruct_cache_entr=
y(f, cache_ptr, &image_len, &p)))
> > +             HGOTO_ERROR(H5E_CACHE, H5E_SYSTEM, FAIL, "reconstruction =
of cache entry failed");
> > +
> > +         /* Note that we make no checks on available cache space befor=
e
> > +@@ -2558,19 +2566,21 @@ done:
> > +  *-------------------------------------------------------------------=
------
> > +  */
> > + static H5C_cache_entry_t *
> > +-H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, const =
uint8_t **buf)
> > ++H5C__reconstruct_cache_entry(const H5F_t *f, H5C_t *cache_ptr, hsize_=
t *buf_size, const uint8_t **buf)
> > + {
> > +     H5C_cache_entry_t *pf_entry_ptr =3D NULL; /* Reconstructed cache =
entry */
> > +     uint8_t            flags        =3D 0;
> > +     bool               is_dirty     =3D false;
> > ++    haddr_t            eoa;
> > ++    bool               is_fd_parent =3D false;
> > + #ifndef NDEBUG /* only used in assertions */
> > +-    bool in_lru       =3D false;
> > +-    bool is_fd_parent =3D false;
> > +-    bool is_fd_child  =3D false;
> > ++    bool in_lru      =3D false;
> > ++    bool is_fd_child =3D false;
> > + #endif
> > +-    const uint8_t     *p;
> > +     bool               file_is_rw;
> > +-    H5C_cache_entry_t *ret_value =3D NULL; /* Return value */
> > ++    const uint8_t     *p;
> > ++    const uint8_t     *p_end     =3D *buf + *buf_size - 1; /* Pointer=
 to last valid byte in buffer */
> > ++    H5C_cache_entry_t *ret_value =3D NULL;                 /* Return =
value */
> > +
> > +     FUNC_ENTER_PACKAGE
> > +
> > +@@ -2590,9 +2600,15 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5=
C_t *cache_ptr, const uint8_t **b
> > +     p =3D *buf;
> > +
> > +     /* Decode type id */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     pf_entry_ptr->prefetch_type_id =3D *p++;
> > ++    if (pf_entry_ptr->prefetch_type_id < H5AC_BT_ID || pf_entry_ptr->=
prefetch_type_id >=3D H5AC_NTYPES)
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "type id is out of=
 valid range");
> > +
> > +     /* Decode flags */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     flags =3D *p++;
> > +     if (flags & H5C__MDCI_ENTRY_DIRTY_FLAG)
> > +         is_dirty =3D true;
> > +@@ -2620,19 +2636,31 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H=
5C_t *cache_ptr, const uint8_t **b
> > +     pf_entry_ptr->is_dirty =3D (is_dirty && file_is_rw);
> > +
> > +     /* Decode ring */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     pf_entry_ptr->ring =3D *p++;
> > +-    assert(pf_entry_ptr->ring > (uint8_t)(H5C_RING_UNDEFINED));
> > +-    assert(pf_entry_ptr->ring < (uint8_t)(H5C_RING_NTYPES));
> > ++    if (pf_entry_ptr->ring >=3D (uint8_t)(H5C_RING_NTYPES))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "ring is out of va=
lid range");
> > +
> > +     /* Decode age */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 1, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     pf_entry_ptr->age =3D *p++;
> > ++    if (pf_entry_ptr->age > H5AC__CACHE_IMAGE__ENTRY_AGEOUT__MAX)
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "entry age is out =
of policy range");
> > +
> > +     /* Decode dependency child count */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     UINT16DECODE(p, pf_entry_ptr->fd_child_count);
> > +-    assert((is_fd_parent && pf_entry_ptr->fd_child_count > 0) ||
> > +-           (!is_fd_parent && pf_entry_ptr->fd_child_count =3D=3D 0));
> > ++    if (is_fd_parent && pf_entry_ptr->fd_child_count <=3D 0)
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "parent entry has =
no children");
> > ++    else if (!is_fd_parent && pf_entry_ptr->fd_child_count !=3D 0)
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "non-parent entry =
has children");
> > +
> > +     /* Decode dirty dependency child count */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     UINT16DECODE(p, pf_entry_ptr->fd_dirty_child_count);
> > +     if (!file_is_rw)
> > +         pf_entry_ptr->fd_dirty_child_count =3D 0;
> > +@@ -2640,20 +2668,32 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H=
5C_t *cache_ptr, const uint8_t **b
> > +         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid dirty flu=
sh dependency child count");
> > +
> > +     /* Decode dependency parent count */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 2, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     UINT16DECODE(p, pf_entry_ptr->fd_parent_count);
> > +     assert((is_fd_child && pf_entry_ptr->fd_parent_count > 0) ||
> > +            (!is_fd_child && pf_entry_ptr->fd_parent_count =3D=3D 0));
> > +
> > +     /* Decode index in LRU */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, 4, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     INT32DECODE(p, pf_entry_ptr->lru_rank);
> > +     assert((in_lru && pf_entry_ptr->lru_rank >=3D 0) || (!in_lru && p=
f_entry_ptr->lru_rank =3D=3D -1));
> > +
> > +     /* Decode entry offset */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_ADDR(f), p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     H5F_addr_decode(f, &p, &pf_entry_ptr->addr);
> > +-    if (!H5_addr_defined(pf_entry_ptr->addr))
> > +-        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry off=
set");
> > ++
> > ++    /* Validate address range */
> > ++    eoa =3D H5F_get_eoa(f, H5FD_MEM_DEFAULT);
> > ++    if (!H5_addr_defined(pf_entry_ptr->addr) || H5_addr_overflow(pf_e=
ntry_ptr->addr, pf_entry_ptr->size) ||
> > ++        H5_addr_ge(pf_entry_ptr->addr + pf_entry_ptr->size, eoa))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry add=
ress range");
> > +
> > +     /* Decode entry length */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_SIZE(f), p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     H5F_DECODE_LENGTH(f, p, pf_entry_ptr->size);
> > +     if (pf_entry_ptr->size =3D=3D 0)
> > +         HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid entry siz=
e");
> > +@@ -2674,6 +2714,9 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C=
_t *cache_ptr, const uint8_t **b
> > +                         "memory allocation failed for fd parent addrs=
 buffer");
> > +
> > +         for (u =3D 0; u < pf_entry_ptr->fd_parent_count; u++) {
> > ++
> > ++            if (H5_IS_BUFFER_OVERFLOW(p, H5F_SIZEOF_ADDR(f), p_end))
> > ++                HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off e=
nd of input buffer while decoding");
> > +             H5F_addr_decode(f, &p, &(pf_entry_ptr->fd_parent_addrs[u]=
));
> > +             if (!H5_addr_defined(pf_entry_ptr->fd_parent_addrs[u]))
> > +                 HGOTO_ERROR(H5E_CACHE, H5E_BADVALUE, NULL, "invalid f=
lush dependency parent offset");
> > +@@ -2689,6 +2732,8 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H5C=
_t *cache_ptr, const uint8_t **b
> > + #endif /* H5C_DO_MEMORY_SANITY_CHECKS */
> > +
> > +     /* Copy the entry image from the cache image block */
> > ++    if (H5_IS_BUFFER_OVERFLOW(p, pf_entry_ptr->size, p_end))
> > ++        HGOTO_ERROR(H5E_CACHE, H5E_OVERFLOW, NULL, "ran off end of in=
put buffer while decoding");
> > +     H5MM_memcpy(pf_entry_ptr->image_ptr, p, pf_entry_ptr->size);
> > +     p +=3D pf_entry_ptr->size;
> > +
> > +@@ -2703,14 +2748,20 @@ H5C__reconstruct_cache_entry(const H5F_t *f, H=
5C_t *cache_ptr, const uint8_t **b
> > +     /* Sanity checks */
> > +     assert(pf_entry_ptr->size > 0 && pf_entry_ptr->size < H5C_MAX_ENT=
RY_SIZE);
> > +
> > +-    /* Update buffer pointer */
> > ++    /* Update buffer pointer and buffer len */
> > ++    *buf_size -=3D (hsize_t)(p - *buf);
> > +     *buf =3D p;
> > +
> > +     ret_value =3D pf_entry_ptr;
> > +
> > + done:
> > +-    if (NULL =3D=3D ret_value && pf_entry_ptr)
> > ++    if (NULL =3D=3D ret_value && pf_entry_ptr) {
> > ++        if (pf_entry_ptr->image_ptr)
> > ++            H5MM_xfree(pf_entry_ptr->image_ptr);
> > ++        if (pf_entry_ptr->fd_parent_count > 0 && pf_entry_ptr->fd_par=
ent_addrs)
> > ++            H5MM_xfree(pf_entry_ptr->fd_parent_addrs);
> > +         pf_entry_ptr =3D H5FL_FREE(H5C_cache_entry_t, pf_entry_ptr);
> > ++    }
> > +
> > +     FUNC_LEAVE_NOAPI(ret_value)
> > + } /* H5C__reconstruct_cache_entry() */
> > +diff --git a/src/H5Ocont.c b/src/H5Ocont.c
> > +index 621095a..180b115 100644
> > +--- a/src/H5Ocont.c
> > ++++ b/src/H5Ocont.c
> > +@@ -93,6 +93,9 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *ope=
n_oh, unsigned H5_ATTR_UNUSE
> > +         HGOTO_ERROR(H5E_OHDR, H5E_NOSPACE, NULL, "memory allocation f=
ailed");
> > +
> > +     /* Decode */
> > ++
> > ++    cont->chunkno =3D 0;
> > ++
> > +     if (H5_IS_BUFFER_OVERFLOW(p, H5F_sizeof_addr(f), p_end))
> > +         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of inp=
ut buffer while decoding");
> > +     H5F_addr_decode(f, &p, &(cont->addr));
> > +@@ -101,8 +104,6 @@ H5O__cont_decode(H5F_t *f, H5O_t H5_ATTR_UNUSED *o=
pen_oh, unsigned H5_ATTR_UNUSE
> > +         HGOTO_ERROR(H5E_OHDR, H5E_OVERFLOW, NULL, "ran off end of inp=
ut buffer while decoding");
> > +     H5F_DECODE_LENGTH(f, p, cont->size);
> > +
> > +-    cont->chunkno =3D 0;
> > +-
> > +     /* Set return value */
> > +     ret_value =3D cont;
> > +
> > diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/re=
cipes-support/hdf5/hdf5_1.14.4-3.bb
> > index 540c8459ea..6d2d439460 100644
> > --- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> > +++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> > @@ -18,6 +18,7 @@ SRC_URI =3D " \
> >      file://0001-CVE-2025-2923.patch \
> >      file://0002-CVE-2025-2924.patch \
> >      file://0003-CVE-2025-2925.patch \
> > +    file://0004-CVE-2025-6269-OSV-2023-77.patch \
> >  "
> >  SRC_URI[sha256sum] =3D "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fe=
a5ef3c37724a318e03"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120458): https://lists.openembedded.org/g/openembed=
ded-devel/message/120458
> > Mute This Topic: https://lists.openembedded.org/mt/115680895/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

