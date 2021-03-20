Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.5944.1616258497150209837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 09:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d8uww0FY;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id w3so14532842ejc.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NCNJpjYs3EwBMRqZgM58chXCp1zBLX9mcTSaBvTkTks=;
        b=d8uww0FYyiVQGwdSDCI1sNB0GgjnA6fcFQ7/6i7sflIBuyrhplZDjJpOySOU0r2/PS
         Amk4RSu6usUemS7YVxGjrqYyOKJpn7i1/7r7UovuTZkYWI9ou60F1o4EUNnytSfbOeJ8
         sRgEoti0aNLRnaZuVsV3FSafCrYGVe1LzI30q8gcmgRYb8jrZbakjx6oRMpymBA3EJpp
         o6NxB9DdcmuwJlyKb1Uh1IecExYErpDmr4ZxVcvzIVDlRGY0FFPEdvwkq8ajG6cJE+LW
         vxnt2bwkNWTyY5C+/WU7j6XAWopmcfpjS/Rt2USqwhWOnwlmM2Y3nClg8wc6svt6udmF
         tiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NCNJpjYs3EwBMRqZgM58chXCp1zBLX9mcTSaBvTkTks=;
        b=HTAhZX4Zc/RpGFG7IKgIueCmk7vHlqXp/dBkStFl/F0BfbADtmYDbm8j+o2de/stl+
         OiFxIGb8adl5kyFlWpueuD8ML5nB1iprGyeURrJp6uQFsH7K0fDzo93Il5aqYHZxc/uu
         T4UvJKgr4LME71ogqRrPnbv/HTQV23x7zzPqknzLLtRVaZi8/I4+12Jk1wJTSW0rqE2J
         ebyzGPrKCGaTUdlqayqiBwmZQyG844es8Ozew1cWks4+EfUSqDyaEZbkOtgVeimWxgrA
         tltTXNymCbCl5A/Tl1mQVMCQcIPPCQoUzB6B+dhTHLrC+vaHQb8+PKwMMy44OwUgyTR0
         Vbkg==
X-Gm-Message-State: AOAM533HnKv9au63sETJ3RbGjB2vnGb3hoIS3Ea2lEOho22rGikFtBJj
	fHKIXqx/e0x3H+Lfvs/j2DEAzEbI/H4f9OJssik=
X-Google-Smtp-Source: ABdhPJwAR2HE/tY58IUd59NkwOHnNDZ4L05rcHA7fBPCjlZ58cgY+ArEqoGK7BVWkBBwP3mf4BNHMo6qnPBKM324UEk=
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr10581306ejo.471.1616258495487;
 Sat, 20 Mar 2021 09:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <1615288905-26382-1-git-send-email-Neetika.Singh@kpit.com>
In-Reply-To: <1615288905-26382-1-git-send-email-Neetika.Singh@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 20 Mar 2021 17:41:24 +0100
Message-ID: <CA+chaQfeUWodSbVTHQm36p5aohyj=DgefirdSRjSYdo5pESD_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][sumo][PATCH] opencv: Security fixes
To: "Neetika.Singh" <Neetika.Singh@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>, Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000007d232105bdfa81dc"

--0000000000007d232105bdfa81dc
Content-Type: text/plain; charset="UTF-8"

This was now merged to dunfell branch and it doesn't apply cleanly:

WARNING: opencv-4.1.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2019-14491.patch
patching file modules/objdetect/src/cascadedetect.cpp
Hunk #1 succeeded at 46 with fuzz 1 (offset -1 lines).
Hunk #2 succeeded at 540 (offset -1 lines).
Hunk #3 succeeded at 552 (offset -1 lines).
Hunk #4 succeeded at 613 (offset -1 lines).
Hunk #5 succeeded at 774 (offset -1 lines).
Hunk #6 succeeded at 825 (offset -1 lines).
Hunk #7 succeeded at 1470 (offset -36 lines).
patching file modules/objdetect/src/cascadedetect.hpp

The context lines in the patches can be updated with devtool:

    devtool modify opencv
    devtool finish --force-patch-refresh opencv <layer_path>

Don't forget to review changes done by devtool!

WARNING: opencv-4.1.0-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

Can you please update the patches to apply cleanly?

On Tue, Mar 9, 2021 at 5:40 PM Neetika.Singh <Neetika.Singh@kpit.com> wrote:

> From: Neetika Singh <Neetika.Singh@kpit.com>
>
> Added patches to fix below CVE's:
>
> 1. CVE-2019-14491, CVE-2019-14492
> Link:
> https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed
>
> 2. CVE-2019-14493
> Link:
> https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023
>
> 3. CVE-2019-15939
> Link:
> https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29
>
> 4. CVE-2019-19624
> Link:
> https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418
>
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>  .../opencv/opencv/CVE-2019-14491.patch             | 148 +++++++++++++
>  .../opencv/opencv/CVE-2019-14493.patch             | 237
> +++++++++++++++++++++
>  .../opencv/opencv/CVE-2019-15939.patch             |  73 +++++++
>  .../opencv/opencv/CVE-2019-19624.patch             | 157 ++++++++++++++
>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |   4 +
>  5 files changed, 619 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
> b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
> new file mode 100644
> index 0000000..b82bea5
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch
> @@ -0,0 +1,148 @@
> +From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Thu, 25 Jul 2019 17:15:59 +0300
> +Subject: [PATCH] objdetect: validate feature rectangle on reading
> +
> +CVE: CVE-2019-14491
> +CVE: CVE-2019-14492
> +Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed.patch
> ]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----
> + modules/objdetect/src/cascadedetect.hpp |  6 ++--
> + 2 files changed, 40 insertions(+), 9 deletions(-)
> +
> +diff --git a/modules/objdetect/src/cascadedetect.cpp
> b/modules/objdetect/src/cascadedetect.cpp
> +index 4b2078306fe..bd62cd21a1b 100644
> +--- a/modules/objdetect/src/cascadedetect.cpp
> ++++ b/modules/objdetect/src/cascadedetect.cpp
> +@@ -47,6 +47,10 @@
> + #include "opencv2/objdetect/objdetect_c.h"
> + #include "opencl_kernels_objdetect.hpp"
> +
> ++#if defined(_MSC_VER)
> ++#  pragma warning(disable:4458)  // declaration of 'origWinSize' hides
> class member
> ++#endif
> ++
> + namespace cv
> + {
> +
> +@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image,
> const std::vector<float>& _s
> +
> + //----------------------------------------------  HaarEvaluator
> ---------------------------------------
> +
> +-bool HaarEvaluator::Feature :: read( const FileNode& node )
> ++bool HaarEvaluator::Feature::read(const FileNode& node, const Size&
> origWinSize)
> + {
> +     FileNode rnode = node[CC_RECTS];
> +     FileNodeIterator it = rnode.begin(), it_end = rnode.end();
> +@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const
> FileNode& node )
> +         rect[ri].weight = 0.f;
> +     }
> +
> ++    const int W = origWinSize.width;
> ++    const int H = origWinSize.height;
> ++
> +     for(ri = 0; it != it_end; ++it, ri++)
> +     {
> +         FileNodeIterator it2 = (*it).begin();
> +-        it2 >> rect[ri].r.x >> rect[ri].r.y >>
> +-            rect[ri].r.width >> rect[ri].r.height >> rect[ri].weight;
> ++        Feature::RectWeigth& rw = rect[ri];
> ++        it2 >> rw.r.x >> rw.r.y >> rw.r.width >> rw.r.height >>
> rw.weight;
> ++        // input validation
> ++        {
> ++            CV_CheckGE(rw.r.x, 0, "Invalid HAAR feature");
> ++            CV_CheckGE(rw.r.y, 0, "Invalid HAAR feature");
> ++            CV_CheckLT(rw.r.x, W, "Invalid HAAR feature");  // necessary
> for overflow checks
> ++            CV_CheckLT(rw.r.y, H, "Invalid HAAR feature");  // necessary
> for overflow checks
> ++            CV_CheckLE(rw.r.x + rw.r.width, W, "Invalid HAAR feature");
> ++            CV_CheckLE(rw.r.y + rw.r.height, H, "Invalid HAAR feature");
> ++        }
> +     }
> +
> +     tilted = (int)node[CC_TILTED] != 0;
> +@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode& node, Size
> _origWinSize)
> +
> +     for(i = 0; i < n; i++, ++it)
> +     {
> +-        if(!ff[i].read(*it))
> ++        if(!ff[i].read(*it, _origWinSize))
> +             return false;
> +         if( ff[i].tilted )
> +             hasTiltedFeatures = true;
> +@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const
> + }
> +
> + //----------------------------------------------  LBPEvaluator
> -------------------------------------
> +-bool LBPEvaluator::Feature :: read(const FileNode& node )
> ++bool LBPEvaluator::Feature::read(const FileNode& node, const Size&
> origWinSize)
> + {
> +     FileNode rnode = node[CC_RECT];
> +     FileNodeIterator it = rnode.begin();
> +     it >> rect.x >> rect.y >> rect.width >> rect.height;
> ++
> ++    const int W = origWinSize.width;
> ++    const int H = origWinSize.height;
> ++    // input validation
> ++    {
> ++        CV_CheckGE(rect.x, 0, "Invalid LBP feature");
> ++        CV_CheckGE(rect.y, 0, "Invalid LBP feature");
> ++        CV_CheckLT(rect.x, W, "Invalid LBP feature");
> ++        CV_CheckLT(rect.y, H, "Invalid LBP feature");
> ++        CV_CheckLE(rect.x + rect.width, W, "Invalid LBP feature");
> ++        CV_CheckLE(rect.y + rect.height, H, "Invalid LBP feature");
> ++    }
> ++
> +     return true;
> + }
> +
> +@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode& node, Size
> _origWinSize )
> +     std::vector<Feature>& ff = *features;
> +     for(int i = 0; it != it_end; ++it, i++)
> +     {
> +-        if(!ff[i].read(*it))
> ++        if(!ff[i].read(*it, _origWinSize))
> +             return false;
> +     }
> +     nchannels = 1;
> +@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const
> FileNode &root)
> +     origWinSize.width = (int)root[CC_WIDTH];
> +     origWinSize.height = (int)root[CC_HEIGHT];
> +     CV_Assert( origWinSize.height > 0 && origWinSize.width > 0 );
> ++    CV_CheckLE(origWinSize.width, 1000000, "Invalid window size (too
> large)");
> ++    CV_CheckLE(origWinSize.height, 1000000, "Invalid window size (too
> large)");
> +
> +     // load feature params
> +     FileNode fn = root[CC_FEATURE_PARAMS];
> +diff --git a/modules/objdetect/src/cascadedetect.hpp
> b/modules/objdetect/src/cascadedetect.hpp
> +index f9910530b94..d9a288fcdda 100644
> +--- a/modules/objdetect/src/cascadedetect.hpp
> ++++ b/modules/objdetect/src/cascadedetect.hpp
> +@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public
> FeatureEvaluator
> +     struct Feature
> +     {
> +         Feature();
> +-        bool read( const FileNode& node );
> ++        bool read(const FileNode& node, const Size& origWinSize);
> +
> +         bool tilted;
> +
> +         enum { RECT_NUM = 3 };
> +-        struct
> ++        struct RectWeigth
> +         {
> +             Rect r;
> +             float weight;
> +@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator
> +         Feature( int x, int y, int _block_w, int _block_h  ) :
> +                  rect(x, y, _block_w, _block_h) {}
> +
> +-        bool read(const FileNode& node );
> ++        bool read(const FileNode& node, const Size& origWinSize);
> +
> +         Rect rect; // weight and height for block
> +     };
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
> b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
> new file mode 100644
> index 0000000..88d6a7f
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch
> @@ -0,0 +1,237 @@
> +From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Thu, 25 Jul 2019 15:14:22 +0300
> +Subject: [PATCH] core(persistence): added null ptr checks
> +
> +CVE: CVE-2019-14493
> +Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023.patch
> ]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/core/src/persistence_json.cpp | 12 ++++++++++++
> + modules/core/src/persistence_xml.cpp  | 21 +++++++++++++++++++++
> + modules/core/src/persistence_yml.cpp  | 21 +++++++++++++++++++++
> + 3 files changed, 54 insertions(+)
> +
> +diff --git a/modules/core/src/persistence_json.cpp
> b/modules/core/src/persistence_json.cpp
> +index ae678e1b8b1..89914e6534f 100644
> +--- a/modules/core/src/persistence_json.cpp
> ++++ b/modules/core/src/persistence_json.cpp
> +@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser
> +
> +         while ( is_eof == false && is_completed == false )
> +         {
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +             switch ( *ptr )
> +             {
> +                 /* comment */
> +@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser
> +         if ( is_eof || !is_completed )
> +         {
> +             ptr = fs->bufferStart();
> ++            CV_Assert(ptr);
> +             *ptr = '\0';
> +             fs->setEof();
> +             if( !is_completed )
> +@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser
> +
> +     char* parseKey( char* ptr, FileNode& collection, FileNode&
> value_placeholder )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         if( *ptr != '"' )
> +             CV_PARSE_ERROR_CPP( "Key must start with \'\"\'" );
> +
> +@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid value input");
> ++
> +         ptr = skipSpaces( ptr );
> +         if( !ptr || !*ptr )
> +             CV_PARSE_ERROR_CPP( "Unexpected End-Of-File" );
> +@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser
> +
> +     bool parse( char* ptr )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         ptr = skipSpaces( ptr );
> +         if ( !ptr || !*ptr )
> +             return false;
> +diff --git a/modules/core/src/persistence_xml.cpp
> b/modules/core/src/persistence_xml.cpp
> +index fb30d90896e..89876dd3da8 100644
> +--- a/modules/core/src/persistence_xml.cpp
> ++++ b/modules/core/src/persistence_xml.cpp
> +@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser
> +
> +     char* skipSpaces( char* ptr, int mode )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         int level = 0;
> +
> +         for(;;)
> +@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         FileNode new_elem;
> +         bool have_space = true;
> +         int value_type = node.type();
> +@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser
> +                 (c == '<' && ptr[1] == '!' && ptr[2] == '-') )
> +             {
> +                 ptr = skipSpaces( ptr, 0 );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 have_space = true;
> +                 c = *ptr;
> +             }
> +@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser
> +                 {
> +                     ptr = fs->parseBase64( ptr, 0, new_elem);
> +                     ptr = skipSpaces( ptr, 0 );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid input");
> +                 }
> +
> +                 ptr = parseTag( ptr, key2, type_name, tag_type );
> +@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser
> +     char* parseTag( char* ptr, std::string& tag_name,
> +                     std::string& type_name, int& tag_type )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid tag input");
> ++
> +         if( *ptr == '\0' )
> +             CV_PARSE_ERROR_CPP( "Unexpected end of the stream" );
> +
> +@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser
> +                 if( *ptr != '=' )
> +                 {
> +                     ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid attribute");
> +                     if( *ptr != '=' )
> +                         CV_PARSE_ERROR_CPP( "Attribute name should be
> followed by \'=\'" );
> +                 }
> +@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser
> +             if( c != '>' )
> +             {
> +                 ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 c = *ptr;
> +             }
> +
> +@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser
> +
> +         // CV_XML_INSIDE_TAG is used to prohibit leading comments
> +         ptr = skipSpaces( ptr, CV_XML_INSIDE_TAG );
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> +
> +         if( memcmp( ptr, "<?xml", 5 ) != 0 )  // FIXIT ptr[1..] - out of
> bounds read without check
> +             CV_PARSE_ERROR_CPP( "Valid XML should start with \'<?xml
> ...?>\'" );
> +@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser
> +         while( ptr && *ptr != '\0' )
> +         {
> +             ptr = skipSpaces( ptr, 0 );
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +
> +             if( *ptr != '\0' )
> +             {
> +diff --git a/modules/core/src/persistence_yml.cpp
> b/modules/core/src/persistence_yml.cpp
> +index 4129ca1dc57..7742e827701 100644
> +--- a/modules/core/src/persistence_yml.cpp
> ++++ b/modules/core/src/persistence_yml.cpp
> +@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* skipSpaces( char* ptr, int min_indent, int max_comment_indent )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         for(;;)
> +         {
> +             while( *ptr == ' ' )
> +@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser
> +
> +     bool getBase64Row(char* ptr, int indent, char* &beg, char* &end)
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         beg = end = ptr = skipSpaces(ptr, 0, INT_MAX);
> +         if (!ptr || !*ptr)
> +             return false; // end of file
> +@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* parseKey( char* ptr, FileNode& map_node, FileNode&
> value_placeholder )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         char c;
> +         char *endptr = ptr - 1, *saveptr;
> +
> +@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser
> +
> +     char* parseValue( char* ptr, FileNode& node, int min_indent, bool
> is_parent_flow )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         char* endptr = 0;
> +         char c = ptr[0], d = ptr[1];
> +         int value_type = FileNode::NONE;
> +@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser
> +
> +             *endptr = d;
> +             ptr = skipSpaces( endptr, min_indent, INT_MAX );
> ++            if (!ptr)
> ++                CV_PARSE_ERROR_CPP("Invalid input");
> +
> +             c = *ptr;
> +
> +@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser
> +                 FileNode elem;
> +
> +                 ptr = skipSpaces( ptr, new_min_indent, INT_MAX );
> ++                if (!ptr)
> ++                    CV_PARSE_ERROR_CPP("Invalid input");
> +                 if( *ptr == '}' || *ptr == ']' )
> +                 {
> +                     if( *ptr != d )
> +@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser
> +                     if( *ptr != ',' )
> +                         CV_PARSE_ERROR_CPP( "Missing , between the
> elements" );
> +                     ptr = skipSpaces( ptr + 1, new_min_indent, INT_MAX );
> ++                    if (!ptr)
> ++                        CV_PARSE_ERROR_CPP("Invalid input");
> +                 }
> +
> +                 if( struct_type == FileNode::MAP )
> +@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser
> +
> +     bool parse( char* ptr )
> +     {
> ++        if (!ptr)
> ++            CV_PARSE_ERROR_CPP("Invalid input");
> ++
> +         bool first = true;
> +         bool ok = true;
> +         FileNode root_collection(fs->getFS(), 0, 0);
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
> b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
> new file mode 100644
> index 0000000..35d62cf
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
> @@ -0,0 +1,73 @@
> +From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
> +From: Alexander Alekhin <alexander.alekhin@intel.com>
> +Date: Fri, 23 Aug 2019 16:14:53 +0300
> +Subject: [PATCH] objdetect: add input check in HOG detector
> +
> +CVE: CVE-2019-15939
> +Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29.patch
> ]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
> + 1 file changed, 12 insertions(+), 7 deletions(-)
> +
> +diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
> +index 9524851eebb..378bab30876 100644
> +--- a/modules/objdetect/src/hog.cpp
> ++++ b/modules/objdetect/src/hog.cpp
> +@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
> +
> + static int numPartsWithin(int size, int part_size, int stride)
> + {
> ++    CV_Assert(stride != 0);
> +     return (size - part_size + stride) / stride;
> + }
> +
> +@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size
> part_size,
> +
> + static size_t getBlockHistogramSize(Size block_size, Size cell_size, int
> nbins)
> + {
> ++    CV_Assert(!cell_size.empty());
> +     Size cells_per_block = Size(block_size.width / cell_size.width,
> +-        block_size.height / cell_size.height);
> ++                                block_size.height / cell_size.height);
> +     return (size_t)(nbins * cells_per_block.area());
> + }
> +
> + size_t HOGDescriptor::getDescriptorSize() const
> + {
> ++    CV_Assert(!cellSize.empty());
> ++    CV_Assert(!blockStride.empty());
> ++
> +     CV_Assert(blockSize.width % cellSize.width == 0 &&
> +         blockSize.height % cellSize.height == 0);
> +     CV_Assert((winSize.width - blockSize.width) % blockStride.width == 0
> &&
> +@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
> +     if( !obj.isMap() )
> +         return false;
> +     FileNodeIterator it = obj["winSize"].begin();
> +-    it >> winSize.width >> winSize.height;
> ++    it >> winSize.width >> winSize.height; CV_Assert(!winSize.empty());
> +     it = obj["blockSize"].begin();
> +-    it >> blockSize.width >> blockSize.height;
> ++    it >> blockSize.width >> blockSize.height;
> CV_Assert(!blockSize.empty());
> +     it = obj["blockStride"].begin();
> +-    it >> blockStride.width >> blockStride.height;
> ++    it >> blockStride.width >> blockStride.height;
> CV_Assert(!blockStride.empty());
> +     it = obj["cellSize"].begin();
> +-    it >> cellSize.width >> cellSize.height;
> +-    obj["nbins"] >> nbins;
> ++    it >> cellSize.width >> cellSize.height;
> CV_Assert(!cellSize.empty());
> ++    obj["nbins"] >> nbins; CV_Assert(nbins > 0);
> +     obj["derivAperture"] >> derivAperture;
> +     obj["winSigma"] >> winSigma;
> +     obj["histogramNormType"] >> histogramNormType;
> +     obj["L2HysThreshold"] >> L2HysThreshold;
> +     obj["gammaCorrection"] >> gammaCorrection;
> +-    obj["nlevels"] >> nlevels;
> ++    obj["nlevels"] >> nlevels; CV_Assert(nlevels > 0);
> +     if (obj["signedGradient"].empty())
> +         signedGradient = false;
> +     else
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> new file mode 100644
> index 0000000..923ca2a
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch
> @@ -0,0 +1,157 @@
> +From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001
> +From: Thang Tran <TranKimThang279@gmail.com>
> +Date: Mon, 27 May 2019 08:18:26 +0200
> +Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img
> +
> +CVE: CVE-2019-19624
> +Upstream-Status: Backport [
> https://github.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418.patch
> ]
> +Comment: No changes in any hunk
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + modules/video/src/dis_flow.cpp          | 67 ++++++++++++++++++++++++-
> + modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++
> + 2 files changed, 93 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/video/src/dis_flow.cpp
> b/modules/video/src/dis_flow.cpp
> +index a453d8b2b51..806d6f1ddaf 100644
> +--- a/modules/video/src/dis_flow.cpp
> ++++ b/modules/video/src/dis_flow.cpp
> +@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public
> DISOpticalFlow
> +     void prepareBuffers(Mat &I0, Mat &I1, Mat &flow, bool use_flow);
> +     void precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy, Mat
> &dst_I0xy, Mat &dst_I0x, Mat &dst_I0y, Mat &I0x,
> +                                    Mat &I0y);
> ++    int autoSelectCoarsestScale(int img_width);
> ++    void autoSelectPatchSizeAndScales(int img_width);
> +
> +     struct PatchInverseSearch_ParBody : public ParallelLoopBody
> +     {
> +@@ -435,6 +437,44 @@ void
> DISOpticalFlowImpl::precomputeStructureTensor(Mat &dst_I0xx, Mat &dst_I0yy,
> +     }
> + }
> +
> ++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)
> ++{
> ++    const int fratio = 5;
> ++    return std::max(0, (int)std::floor(log2((2.0f*(float)img_width) /
> ((float)fratio * (float)patch_size))));
> ++}
> ++
> ++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)
> ++{
> ++    switch (finest_scale)
> ++    {
> ++    case 1:
> ++        patch_size = 8;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-2, 0);
> ++        break;
> ++
> ++    case 3:
> ++        patch_size = 12;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-4, 0);
> ++        break;
> ++
> ++    case 4:
> ++        patch_size = 12;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-5, 0);
> ++        break;
> ++
> ++    // default case, fall-through.
> ++    case 2:
> ++    default:
> ++        patch_size = 8;
> ++        coarsest_scale = autoSelectCoarsestScale(img_width);
> ++        finest_scale = std::max(coarsest_scale-2, 0);
> ++        break;
> ++    }
> ++}
> ++
> +
> DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBody(DISOpticalFlowImpl
> &_dis, int _nstripes,
> +
>   int _hs, Mat &dst_Sx, Mat &dst_Sy,
> +
>   Mat &src_Ux, Mat &src_Uy, Mat &_I0, Mat &_I1,
> +@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0,
> InputArray I1, InputOutputArray
> +     else
> +         flow.create(I1Mat.size(), CV_32FC2);
> +     UMat &u_flowMat = flow.getUMatRef();
> +-    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *
> patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal
> movement of width/4 */
> ++    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *
> patch_size)) / log(2.0) + 0.5), /* Original code search for maximal
> movement of width/4 */
> +                          (int)(log(min(I0Mat.cols, I0Mat.rows) /
> patch_size) / log(2.0)));              /* Deepest pyramid level greater or
> equal than patch*/
> +
> ++    if (coarsest_scale<0)
> ++        CV_Error(cv::Error::StsBadSize, "The input image must have
> either width or height >= 12");
> ++
> ++    if (coarsest_scale<finest_scale)
> ++    {
> ++        // choose the finest level based on coarsest level.
> ++        // Refs:
> https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
> ++        int original_img_width = I0.size().width;
> ++        autoSelectPatchSizeAndScales(original_img_width);
> ++    }
> ++
> +     ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input_flow);
> +     u_Ux[coarsest_scale].setTo(0.0f);
> +     u_Uy[coarsest_scale].setTo(0.0f);
> +@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0,
> InputArray I1, InputOutputArray flo
> +     else
> +         flow.create(I1Mat.size(), CV_32FC2);
> +     Mat flowMat = flow.getMat();
> +-    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *
> patch_size)) / log(2.0) + 0.5), /* Original code serach for maximal
> movement of width/4 */
> ++    coarsest_scale = min((int)(log(max(I0Mat.cols, I0Mat.rows) / (4.0 *
> patch_size)) / log(2.0) + 0.5), /* Original code search for maximal
> movement of width/4 */
> +                          (int)(log(min(I0Mat.cols, I0Mat.rows) /
> patch_size) / log(2.0)));              /* Deepest pyramid level greater or
> equal than patch*/
> ++
> ++    if (coarsest_scale<0)
> ++        CV_Error(cv::Error::StsBadSize, "The input image must have
> either width or height >= 12");
> ++
> ++    if (coarsest_scale<finest_scale)
> ++    {
> ++        // choose the finest level based on coarsest level.
> ++        // Refs:
> https://github.com/tikroeger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239
> ++        int original_img_width = I0.size().width;
> ++        autoSelectPatchSizeAndScales(original_img_width);
> ++    }
> ++
> +     int num_stripes = getNumThreads();
> +
> +     prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow);
> +diff --git a/modules/video/test/test_OF_accuracy.cpp
> b/modules/video/test/test_OF_accuracy.cpp
> +index affbab65866..b99ffce2a8b 100644
> +--- a/modules/video/test/test_OF_accuracy.cpp
> ++++ b/modules/video/test/test_OF_accuracy.cpp
> +@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)
> +     }
> + }
> +
> ++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)
> ++{
> ++    cv::Ptr<cv::DISOpticalFlow> of = cv::DISOpticalFlow::create();
> ++    const int mat_size = 10;
> ++
> ++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat flow;
> ++
> ++    ASSERT_THROW(of->calc(x, y, flow), cv::Exception);
> ++}
> ++
> ++// make sure that autoSelectPatchSizeAndScales() works properly.
> ++TEST(DenseOpticalFlow_DIS,
> InvalidImgSize_CoarsestLevelLessThanFinestLevel)
> ++{
> ++    cv::Ptr<cv::DISOpticalFlow> of = cv::DISOpticalFlow::create();
> ++    const int mat_size = 80;
> ++
> ++    cv::Mat x(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat y(mat_size, mat_size, CV_8UC1, 42);
> ++    cv::Mat flow;
> ++
> ++    of->calc(x, y, flow);
> ++
> ++    ASSERT_EQ(flow.rows, mat_size);
> ++    ASSERT_EQ(flow.cols, mat_size);
> ++}
> ++
> + TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)
> + {
> +     Mat frame1, frame2, GT;
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> index d781da6..de708fd 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> @@ -50,6 +50,10 @@ SRC_URI = "git://
> github.com/opencv/opencv.git;name=opencv \
>             file://0001-Dont-use-isystem.patch \
>
> file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
>             file://download.patch \
> +           file://CVE-2019-14491.patch \
> +           file://CVE-2019-14493.patch \
> +           file://CVE-2019-15939.patch \
> +           file://CVE-2019-19624.patch \
>             "
>  PV = "4.1.0"
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
> 
>
>

--0000000000007d232105bdfa81dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This was now merged to dunfell branch and it doesn&#39;t a=
pply cleanly:<div><br></div><div>WARNING: opencv-4.1.0-r0 do_patch: Fuzz de=
tected:<br><br>Applying patch CVE-2019-14491.patch<br>patching file modules=
/objdetect/src/cascadedetect.cpp<br>Hunk #1 succeeded at 46 with fuzz 1 (of=
fset -1 lines).<br>Hunk #2 succeeded at 540 (offset -1 lines).<br>Hunk #3 s=
ucceeded at 552 (offset -1 lines).<br>Hunk #4 succeeded at 613 (offset -1 l=
ines).<br>Hunk #5 succeeded at 774 (offset -1 lines).<br>Hunk #6 succeeded =
at 825 (offset -1 lines).<br>Hunk #7 succeeded at 1470 (offset -36 lines).<=
br>patching file modules/objdetect/src/cascadedetect.hpp<br><br>The context=
 lines in the patches can be updated with devtool:<br><br>=C2=A0 =C2=A0 dev=
tool modify opencv<br>=C2=A0 =C2=A0 devtool finish --force-patch-refresh op=
encv &lt;layer_path&gt;<br><br>Don&#39;t forget to review changes done by d=
evtool!<br><br>WARNING: opencv-4.1.0-r0 do_patch: QA Issue: Patch log indic=
ates that patches do not apply cleanly. [patch-fuzz]<br></div><div><br></di=
v><div>Can you please update the patches to apply cleanly?</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar=
 9, 2021 at 5:40 PM Neetika.Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.=
com" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: Neetika Singh &lt;<a hre=
f=3D"mailto:Neetika.Singh@kpit.com" target=3D"_blank">Neetika.Singh@kpit.co=
m</a>&gt;<br>
<br>
Added patches to fix below CVE&#39;s:<br>
<br>
1. CVE-2019-14491, CVE-2019-14492<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9=
afb9203f0918d8d57c067ed" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/opencv/opencv/commit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed</a><br>
<br>
2. CVE-2019-14493<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/5691d998ead1d9b05=
42bcfced36c2dceb3a59023" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/opencv/opencv/commit/5691d998ead1d9b0542bcfced36c2dceb3a59023</a><br>
<br>
3. CVE-2019-15939<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/5a497077f109d543a=
b86dfdf8add1c76c0e47d29" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/opencv/opencv/commit/5a497077f109d543ab86dfdf8add1c76c0e47d29</a><br>
<br>
4. CVE-2019-19624<br>
Link: <a href=3D"https://github.com/opencv/opencv/commit/d1615ba11a93062b1=
429fce9f0f638d1572d3418" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/opencv/opencv/commit/d1615ba11a93062b1429fce9f0f638d1572d3418</a><br>
<br>
Signed-off-by: Neetika.Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com"=
 target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../opencv/opencv/CVE-2019-14491.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 148 +++++++++++++<br>
=C2=A0.../opencv/opencv/CVE-2019-14493.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 237 +++++++++++++++++++++<br>
=C2=A0.../opencv/opencv/CVE-2019-15939.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 73 +++++++<br>
=C2=A0.../opencv/opencv/CVE-2019-19624.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 157 ++++++++++++++<br>
=C2=A0meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 =C2=A04 +<br>
=C2=A05 files changed, 619 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14=
491.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-14=
493.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-15=
939.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-19=
624.patch<br>
<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch b/=
meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch<br>
new file mode 100644<br>
index 0000000..b82bea5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14491.patch<br>
@@ -0,0 +1,148 @@<br>
+From 321c74ccd6077bdea1d47450ca4fe955cb5b6330 Mon Sep 17 00:00:00 2001<br=
>
+From: Alexander Alekhin &lt;<a href=3D"mailto:alexander.alekhin@intel.com=
" target=3D"_blank">alexander.alekhin@intel.com</a>&gt;<br>
+Date: Thu, 25 Jul 2019 17:15:59 +0300<br>
+Subject: [PATCH] objdetect: validate feature rectangle on reading<br>
+<br>
+CVE: CVE-2019-14491<br>
+CVE: CVE-2019-14492<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/co=
mmit/ac425f67e4c1d0da9afb9203f0918d8d57c067ed.patch" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/opencv/opencv/commit/ac425f67e4c1d0da9afb=
9203f0918d8d57c067ed.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com=
" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
+---<br>
+ modules/objdetect/src/cascadedetect.cpp | 43 +++++++++++++++++++++----<b=
r>
+ modules/objdetect/src/cascadedetect.hpp |=C2=A0 6 ++--<br>
+ 2 files changed, 40 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/modules/objdetect/src/cascadedetect.cpp b/modules/objdetect/=
src/cascadedetect.cpp<br>
+index 4b2078306fe..bd62cd21a1b 100644<br>
+--- a/modules/objdetect/src/cascadedetect.cpp<br>
++++ b/modules/objdetect/src/cascadedetect.cpp<br>
+@@ -47,6 +47,10 @@<br>
+ #include &quot;opencv2/objdetect/objdetect_c.h&quot;<br>
+ #include &quot;opencl_kernels_objdetect.hpp&quot;<br>
+<br>
++#if defined(_MSC_VER)<br>
++#=C2=A0 pragma warning(disable:4458)=C2=A0 // declaration of &#39;origWi=
nSize&#39; hides class member<br>
++#endif<br>
++<br>
+ namespace cv<br>
+ {<br>
+<br>
+@@ -537,7 +541,7 @@ bool FeatureEvaluator::setImage( InputArray _image, c=
onst std::vector&lt;float&gt;&amp; _s<br>
+<br>
+ //----------------------------------------------=C2=A0 HaarEvaluator ---=
------------------------------------<br>
+<br>
+-bool HaarEvaluator::Feature :: read( const FileNode&amp; node )<br>
++bool HaarEvaluator::Feature::read(const FileNode&amp; node, const Size&a=
mp; origWinSize)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0FileNode rnode =3D node[CC_RECTS];<br>
+=C2=A0 =C2=A0 =C2=A0FileNodeIterator it =3D rnode.begin(), it_end =3D rno=
de.end();<br>
+@@ -549,11 +553,23 @@ bool HaarEvaluator::Feature :: read( const FileNode=
&amp; node )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rect[ri].weight =3D 0.f;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 const int W =3D origWinSize.width;<br>
++=C2=A0 =C2=A0 const int H =3D origWinSize.height;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0for(ri =3D 0; it !=3D it_end; ++it, ri++)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FileNodeIterator it2 =3D (*it).begin();=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 it2 &gt;&gt; rect[ri].r.x &gt;&gt; rect[ri].=
r.y &gt;&gt;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rect[ri].r.width &gt;&gt; rect=
[ri].r.height &gt;&gt; rect[ri].weight;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Feature::RectWeigth&amp; rw =3D rect[ri];<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 it2 &gt;&gt; rw.r.x &gt;&gt; rw.r.y &gt;&gt;=
 rw.r.width &gt;&gt; rw.r.height &gt;&gt; rw.weight;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // input validation<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckGE(rw.r.x, 0, &quot;In=
valid HAAR feature&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckGE(rw.r.y, 0, &quot;In=
valid HAAR feature&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLT(rw.r.x, W, &quot;In=
valid HAAR feature&quot;);=C2=A0 // necessary for overflow checks<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLT(rw.r.y, H, &quot;In=
valid HAAR feature&quot;);=C2=A0 // necessary for overflow checks<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLE(rw.r.x + rw.r.width=
, W, &quot;Invalid HAAR feature&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLE(rw.r.y + rw.r.heigh=
t, H, &quot;Invalid HAAR feature&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0tilted =3D (int)node[CC_TILTED] !=3D 0;<br>
+@@ -598,7 +614,7 @@ bool HaarEvaluator::read(const FileNode&amp; node, Si=
ze _origWinSize)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0for(i =3D 0; i &lt; n; i++, ++it)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!ff[i].read(*it))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!ff[i].read(*it, _origWinSize))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( ff[i].tilted )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasTiltedFeatures =3D tru=
e;<br>
+@@ -759,11 +775,24 @@ int HaarEvaluator::getSquaresOffset() const<br>
+ }<br>
+<br>
+ //----------------------------------------------=C2=A0 LBPEvaluator ----=
---------------------------------<br>
+-bool LBPEvaluator::Feature :: read(const FileNode&amp; node )<br>
++bool LBPEvaluator::Feature::read(const FileNode&amp; node, const Size&am=
p; origWinSize)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0FileNode rnode =3D node[CC_RECT];<br>
+=C2=A0 =C2=A0 =C2=A0FileNodeIterator it =3D rnode.begin();<br>
+=C2=A0 =C2=A0 =C2=A0it &gt;&gt; rect.x &gt;&gt; rect.y &gt;&gt; rect.widt=
h &gt;&gt; rect.height;<br>
++<br>
++=C2=A0 =C2=A0 const int W =3D origWinSize.width;<br>
++=C2=A0 =C2=A0 const int H =3D origWinSize.height;<br>
++=C2=A0 =C2=A0 // input validation<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckGE(rect.x, 0, &quot;Invalid LBP feat=
ure&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckGE(rect.y, 0, &quot;Invalid LBP feat=
ure&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLT(rect.x, W, &quot;Invalid LBP feat=
ure&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLT(rect.y, H, &quot;Invalid LBP feat=
ure&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLE(rect.x + rect.width, W, &quot;Inv=
alid LBP feature&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_CheckLE(rect.y + rect.height, H, &quot;In=
valid LBP feature&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0return true;<br>
+ }<br>
+<br>
+@@ -797,7 +826,7 @@ bool LBPEvaluator::read( const FileNode&amp; node, Si=
ze _origWinSize )<br>
+=C2=A0 =C2=A0 =C2=A0std::vector&lt;Feature&gt;&amp; ff =3D *features;<br>
+=C2=A0 =C2=A0 =C2=A0for(int i =3D 0; it !=3D it_end; ++it, i++)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!ff[i].read(*it))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(!ff[i].read(*it, _origWinSize))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0nchannels =3D 1;<br>
+@@ -1477,6 +1506,8 @@ bool CascadeClassifierImpl::Data::read(const FileNo=
de &amp;root)<br>
+=C2=A0 =C2=A0 =C2=A0origWinSize.width =3D (int)root[CC_WIDTH];<br>
+=C2=A0 =C2=A0 =C2=A0origWinSize.height =3D (int)root[CC_HEIGHT];<br>
+=C2=A0 =C2=A0 =C2=A0CV_Assert( origWinSize.height &gt; 0 &amp;&amp; origW=
inSize.width &gt; 0 );<br>
++=C2=A0 =C2=A0 CV_CheckLE(origWinSize.width, 1000000, &quot;Invalid windo=
w size (too large)&quot;);<br>
++=C2=A0 =C2=A0 CV_CheckLE(origWinSize.height, 1000000, &quot;Invalid wind=
ow size (too large)&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0// load feature params<br>
+=C2=A0 =C2=A0 =C2=A0FileNode fn =3D root[CC_FEATURE_PARAMS];<br>
+diff --git a/modules/objdetect/src/cascadedetect.hpp b/modules/objdetect/=
src/cascadedetect.hpp<br>
+index f9910530b94..d9a288fcdda 100644<br>
+--- a/modules/objdetect/src/cascadedetect.hpp<br>
++++ b/modules/objdetect/src/cascadedetect.hpp<br>
+@@ -317,12 +317,12 @@ class HaarEvaluator CV_FINAL : public FeatureEvalua=
tor<br>
+=C2=A0 =C2=A0 =C2=A0struct Feature<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Feature();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool read( const FileNode&amp; node );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool read(const FileNode&amp; node, const Si=
ze&amp; origWinSize);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool tilted;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum { RECT_NUM =3D 3 };<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct RectWeigth<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rect r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0float weight;<br>
+@@ -412,7 +412,7 @@ class LBPEvaluator CV_FINAL : public FeatureEvaluator=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Feature( int x, int y, int _block_w, in=
t _block_h=C2=A0 ) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rect(x, y,=
 _block_w, _block_h) {}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool read(const FileNode&amp; node );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool read(const FileNode&amp; node, const Si=
ze&amp; origWinSize);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rect rect; // weight and height for blo=
ck<br>
+=C2=A0 =C2=A0 =C2=A0};<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch b/=
meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch<br>
new file mode 100644<br>
index 0000000..88d6a7f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-14493.patch<br>
@@ -0,0 +1,237 @@<br>
+From 5691d998ead1d9b0542bcfced36c2dceb3a59023 Mon Sep 17 00:00:00 2001<br=
>
+From: Alexander Alekhin &lt;<a href=3D"mailto:alexander.alekhin@intel.com=
" target=3D"_blank">alexander.alekhin@intel.com</a>&gt;<br>
+Date: Thu, 25 Jul 2019 15:14:22 +0300<br>
+Subject: [PATCH] core(persistence): added null ptr checks<br>
+<br>
+CVE: CVE-2019-14493<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/co=
mmit/5691d998ead1d9b0542bcfced36c2dceb3a59023.patch" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/opencv/opencv/commit/5691d998ead1d9b0542b=
cfced36c2dceb3a59023.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com=
" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
+---<br>
+ modules/core/src/persistence_json.cpp | 12 ++++++++++++<br>
+ modules/core/src/persistence_xml.cpp=C2=A0 | 21 +++++++++++++++++++++<br=
>
+ modules/core/src/persistence_yml.cpp=C2=A0 | 21 +++++++++++++++++++++<br=
>
+ 3 files changed, 54 insertions(+)<br>
+<br>
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/per=
sistence_json.cpp<br>
+index ae678e1b8b1..89914e6534f 100644<br>
+--- a/modules/core/src/persistence_json.cpp<br>
++++ b/modules/core/src/persistence_json.cpp<br>
+@@ -296,6 +296,8 @@ class JSONParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ( is_eof =3D=3D false &amp;&amp; =
is_completed =3D=3D false )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_C=
PP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch ( *ptr )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* comment =
*/<br>
+@@ -381,6 +383,7 @@ class JSONParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( is_eof || !is_completed )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D fs-&gt;bufferStar=
t();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_Assert(ptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ptr =3D &#39;\0&#39;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs-&gt;setEof();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( !is_completed )<br>
+@@ -392,6 +395,9 @@ class JSONParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* parseKey( char* ptr, FileNode&amp; collection, =
FileNode&amp; value_placeholder )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( *ptr !=3D &#39;&quot;&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot=
;Key must start with \&#39;\&quot;\&#39;&quot; );<br>
+<br>
+@@ -430,6 +436,9 @@ class JSONParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* parseValue( char* ptr, FileNode&amp; node )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id value input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D skipSpaces( ptr );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( !ptr || !*ptr )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot=
;Unexpected End-Of-File&quot; );<br>
+@@ -817,6 +826,9 @@ class JSONParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0bool parse( char* ptr )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D skipSpaces( ptr );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !ptr || !*ptr )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/pers=
istence_xml.cpp<br>
+index fb30d90896e..89876dd3da8 100644<br>
+--- a/modules/core/src/persistence_xml.cpp<br>
++++ b/modules/core/src/persistence_xml.cpp<br>
+@@ -360,6 +360,9 @@ class XMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* skipSpaces( char* ptr, int mode )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int level =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for(;;)<br>
+@@ -441,6 +444,9 @@ class XMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* parseValue( char* ptr, FileNode&amp; node )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FileNode new_elem;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool have_space =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int value_type =3D node.type();<br>
+@@ -456,6 +462,8 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(c =3D=3D &=
#39;&lt;&#39; &amp;&amp; ptr[1] =3D=3D &#39;!&#39; &amp;&amp; ptr[2] =3D=3D=
 &#39;-&#39;) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D ski=
pSpaces( ptr, 0 );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV=
_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have_space =
=
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D *ptr;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -502,6 +510,8 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0ptr =3D fs-&gt;parseBase64( ptr, 0, new_elem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0ptr =3D skipSpaces( ptr, 0 );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D par=
seTag( ptr, key2, type_name, tag_type );<br>
+@@ -645,6 +655,9 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0char* parseTag( char* ptr, std::string&amp; tag_name,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0std::string&amp; type_name, int&amp; tag_type )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id tag input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( *ptr =3D=3D &#39;\0&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot=
;Unexpected end of the stream&quot; );<br>
+<br>
+@@ -702,6 +715,8 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( *ptr !=
=3D &#39;=3D&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0ptr =3D skipSpaces( ptr, CV_XML_INSIDE_TAG );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Invalid attribute&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if( *ptr !=3D &#39;=3D&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot;Attribute name should be follow=
ed by \&#39;=3D\&#39;&quot; );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -740,6 +755,8 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( c !=3D &#39;&gt;&#39;=
 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D ski=
pSpaces( ptr, CV_XML_INSIDE_TAG );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV=
_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D *ptr;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -781,6 +798,8 @@ class XMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// CV_XML_INSIDE_TAG is used to prohibi=
t leading comments<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D skipSpaces( ptr, CV_XML_INSIDE_=
TAG );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( memcmp( ptr, &quot;&lt;?xml&quot;, =
5 ) !=3D 0 )=C2=A0 // FIXIT ptr[1..] - out of bounds read without check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot=
;Valid XML should start with \&#39;&lt;?xml ...?&gt;\&#39;&quot; );<br>
+@@ -791,6 +810,8 @@ class XMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while( ptr &amp;&amp; *ptr !=3D &#39;\0=
&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D skipSpaces( ptr, =
0 );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_C=
PP(&quot;Invalid input&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( *ptr !=3D &#39;\0&#39=
; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+diff --git a/modules/core/src/persistence_yml.cpp b/modules/core/src/pers=
istence_yml.cpp<br>
+index 4129ca1dc57..7742e827701 100644<br>
+--- a/modules/core/src/persistence_yml.cpp<br>
++++ b/modules/core/src/persistence_yml.cpp<br>
+@@ -330,6 +330,9 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* skipSpaces( char* ptr, int min_indent, int max_=
comment_indent )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for(;;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while( *ptr =3D=3D &#39; =
&#39; )<br>
+@@ -374,6 +377,9 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0bool getBase64Row(char* ptr, int indent, char* &amp;b=
eg, char* &amp;end)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beg =3D end =3D ptr =3D skipSpaces(ptr,=
 0, INT_MAX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ptr || !*ptr)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false; // end of f=
ile<br>
+@@ -394,6 +400,9 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* parseKey( char* ptr, FileNode&amp; map_node, Fi=
leNode&amp; value_placeholder )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char c;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *endptr =3D ptr - 1, *saveptr;<br>
+<br>
+@@ -422,6 +431,9 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0char* parseValue( char* ptr, FileNode&amp; node, int =
min_indent, bool is_parent_flow )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char* endptr =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char c =3D ptr[0], d =3D ptr[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int value_type =3D FileNode::NONE;<br>
+@@ -508,6 +520,8 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*endptr =3D d;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D skipSpaces( endpt=
r, min_indent, INT_MAX );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_C=
PP(&quot;Invalid input&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D *ptr;<br>
+<br>
+@@ -634,6 +648,8 @@ class YAMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FileNode el=
em;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D ski=
pSpaces( ptr, new_min_indent, INT_MAX );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV=
_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( *ptr =
=3D=3D &#39;}&#39; || *ptr =3D=3D &#39;]&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if( *ptr !=3D d )<br>
+@@ -647,6 +663,8 @@ class YAMLParser : public FileStorageParser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0if( *ptr !=3D &#39;,&#39; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0CV_PARSE_ERROR_CPP( &quot;Missing , between the elements&=
quot; );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0ptr =3D skipSpaces( ptr + 1, new_min_indent, INT_MAX );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Invalid input&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( struct_=
type =3D=3D FileNode::MAP )<br>
+@@ -746,6 +764,9 @@ class YAMLParser : public FileStorageParser<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0bool parse( char* ptr )<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ptr)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_PARSE_ERROR_CPP(&quot;Inval=
id input&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool first =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ok =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FileNode root_collection(fs-&gt;getFS()=
, 0, 0);<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/=
meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch<br>
new file mode 100644<br>
index 0000000..35d62cf<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch<br>
@@ -0,0 +1,73 @@<br>
+From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001<br=
>
+From: Alexander Alekhin &lt;<a href=3D"mailto:alexander.alekhin@intel.com=
" target=3D"_blank">alexander.alekhin@intel.com</a>&gt;<br>
+Date: Fri, 23 Aug 2019 16:14:53 +0300<br>
+Subject: [PATCH] objdetect: add input check in HOG detector<br>
+<br>
+CVE: CVE-2019-15939<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/co=
mmit/5a497077f109d543ab86dfdf8add1c76c0e47d29.patch" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/opencv/opencv/commit/5a497077f109d543ab86=
dfdf8add1c76c0e47d29.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com=
" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
+---<br>
+ modules/objdetect/src/hog.cpp | 19 ++++++++++++-------<br>
+ 1 file changed, 12 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cp=
p<br>
+index 9524851eebb..378bab30876 100644<br>
+--- a/modules/objdetect/src/hog.cpp<br>
++++ b/modules/objdetect/src/hog.cpp<br>
+@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW}=
;<br>
+<br>
+ static int numPartsWithin(int size, int part_size, int stride)<br>
+ {<br>
++=C2=A0 =C2=A0 CV_Assert(stride !=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0return (size - part_size + stride) / stride;<br>
+ }<br>
+<br>
+@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size pa=
rt_size,<br>
+<br>
+ static size_t getBlockHistogramSize(Size block_size, Size cell_size, int=
 nbins)<br>
+ {<br>
++=C2=A0 =C2=A0 CV_Assert(!cell_size.empty());<br>
+=C2=A0 =C2=A0 =C2=A0Size cells_per_block =3D Size(block_size.width / cell=
_size.width,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 block_size.height / cell_size.height);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block_size.height / cell_size.he=
ight);<br>
+=C2=A0 =C2=A0 =C2=A0return (size_t)(nbins * cells_per_block.area());<br>
+ }<br>
+<br>
+ size_t HOGDescriptor::getDescriptorSize() const<br>
+ {<br>
++=C2=A0 =C2=A0 CV_Assert(!cellSize.empty());<br>
++=C2=A0 =C2=A0 CV_Assert(!blockStride.empty());<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0CV_Assert(blockSize.width % cellSize.width =3D=3D 0 &=
amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blockSize.height % cellSize.height =3D=
=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0CV_Assert((winSize.width - blockSize.width) % blockSt=
ride.width =3D=3D 0 &amp;&amp;<br>
+@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode&amp; obj)<br>
+=C2=A0 =C2=A0 =C2=A0if( !obj.isMap() )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0FileNodeIterator it =3D obj[&quot;winSize&quot;].begi=
n();<br>
+-=C2=A0 =C2=A0 it &gt;&gt; winSize.width &gt;&gt; winSize.height;<br>
++=C2=A0 =C2=A0 it &gt;&gt; winSize.width &gt;&gt; winSize.height; CV_Asse=
rt(!winSize.empty());<br>
+=C2=A0 =C2=A0 =C2=A0it =3D obj[&quot;blockSize&quot;].begin();<br>
+-=C2=A0 =C2=A0 it &gt;&gt; blockSize.width &gt;&gt; blockSize.height;<br>
++=C2=A0 =C2=A0 it &gt;&gt; blockSize.width &gt;&gt; blockSize.height; CV_=
Assert(!blockSize.empty());<br>
+=C2=A0 =C2=A0 =C2=A0it =3D obj[&quot;blockStride&quot;].begin();<br>
+-=C2=A0 =C2=A0 it &gt;&gt; blockStride.width &gt;&gt; blockStride.height;=
<br>
++=C2=A0 =C2=A0 it &gt;&gt; blockStride.width &gt;&gt; blockStride.height;=
 CV_Assert(!blockStride.empty());<br>
+=C2=A0 =C2=A0 =C2=A0it =3D obj[&quot;cellSize&quot;].begin();<br>
+-=C2=A0 =C2=A0 it &gt;&gt; cellSize.width &gt;&gt; cellSize.height;<br>
+-=C2=A0 =C2=A0 obj[&quot;nbins&quot;] &gt;&gt; nbins;<br>
++=C2=A0 =C2=A0 it &gt;&gt; cellSize.width &gt;&gt; cellSize.height; CV_As=
sert(!cellSize.empty());<br>
++=C2=A0 =C2=A0 obj[&quot;nbins&quot;] &gt;&gt; nbins; CV_Assert(nbins &gt=
; 0);<br>
+=C2=A0 =C2=A0 =C2=A0obj[&quot;derivAperture&quot;] &gt;&gt; derivAperture=
;<br>
+=C2=A0 =C2=A0 =C2=A0obj[&quot;winSigma&quot;] &gt;&gt; winSigma;<br>
+=C2=A0 =C2=A0 =C2=A0obj[&quot;histogramNormType&quot;] &gt;&gt; histogram=
NormType;<br>
+=C2=A0 =C2=A0 =C2=A0obj[&quot;L2HysThreshold&quot;] &gt;&gt; L2HysThresho=
ld;<br>
+=C2=A0 =C2=A0 =C2=A0obj[&quot;gammaCorrection&quot;] &gt;&gt; gammaCorrec=
tion;<br>
+-=C2=A0 =C2=A0 obj[&quot;nlevels&quot;] &gt;&gt; nlevels;<br>
++=C2=A0 =C2=A0 obj[&quot;nlevels&quot;] &gt;&gt; nlevels; CV_Assert(nleve=
ls &gt; 0);<br>
+=C2=A0 =C2=A0 =C2=A0if (obj[&quot;signedGradient&quot;].empty())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signedGradient =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch b/=
meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch<br>
new file mode 100644<br>
index 0000000..923ca2a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-19624.patch<br>
@@ -0,0 +1,157 @@<br>
+From d1615ba11a93062b1429fce9f0f638d1572d3418 Mon Sep 17 00:00:00 2001<br=
>
+From: Thang Tran &lt;<a href=3D"mailto:TranKimThang279@gmail.com" target=
=3D"_blank">TranKimThang279@gmail.com</a>&gt;<br>
+Date: Mon, 27 May 2019 08:18:26 +0200<br>
+Subject: [PATCH] video:fixed DISOpticalFlow segfault from small img<br>
+<br>
+CVE: CVE-2019-19624<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opencv/opencv/co=
mmit/d1615ba11a93062b1429fce9f0f638d1572d3418.patch" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/opencv/opencv/commit/d1615ba11a93062b1429=
fce9f0f638d1572d3418.patch</a>]<br>
+Comment: No changes in any hunk<br>
+<br>
+Signed-off-by: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com=
" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
+---<br>
+ modules/video/src/dis_flow.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 67 ++=
++++++++++++++++++++++-<br>
+ modules/video/test/test_OF_accuracy.cpp | 28 +++++++++++<br>
+ 2 files changed, 93 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/modules/video/src/dis_flow.cpp b/modules/video/src/dis_flow.=
cpp<br>
+index a453d8b2b51..806d6f1ddaf 100644<br>
+--- a/modules/video/src/dis_flow.cpp<br>
++++ b/modules/video/src/dis_flow.cpp<br>
+@@ -140,6 +140,8 @@ class DISOpticalFlowImpl CV_FINAL : public DISOptical=
Flow<br>
+=C2=A0 =C2=A0 =C2=A0void prepareBuffers(Mat &amp;I0, Mat &amp;I1, Mat &am=
p;flow, bool use_flow);<br>
+=C2=A0 =C2=A0 =C2=A0void precomputeStructureTensor(Mat &amp;dst_I0xx, Mat=
 &amp;dst_I0yy, Mat &amp;dst_I0xy, Mat &amp;dst_I0x, Mat &amp;dst_I0y, Mat =
&amp;I0x,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat &amp;I0y);<br>
++=C2=A0 =C2=A0 int autoSelectCoarsestScale(int img_width);<br>
++=C2=A0 =C2=A0 void autoSelectPatchSizeAndScales(int img_width);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0struct PatchInverseSearch_ParBody : public ParallelLo=
opBody<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -435,6 +437,44 @@ void DISOpticalFlowImpl::precomputeStructureTensor(M=
at &amp;dst_I0xx, Mat &amp;dst_I0yy,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
++int DISOpticalFlowImpl::autoSelectCoarsestScale(int img_width)<br>
++{<br>
++=C2=A0 =C2=A0 const int fratio =3D 5;<br>
++=C2=A0 =C2=A0 return std::max(0, (int)std::floor(log2((2.0f*(float)img_w=
idth) / ((float)fratio * (float)patch_size))));<br>
++}<br>
++<br>
++void DISOpticalFlowImpl::autoSelectPatchSizeAndScales(int img_width)<br>
++{<br>
++=C2=A0 =C2=A0 switch (finest_scale)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_size =3D 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 coarsest_scale =3D autoSelectCoarsestScale(i=
mg_width);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finest_scale =3D std::max(coarsest_scale-2, =
0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_size =3D 12;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 coarsest_scale =3D autoSelectCoarsestScale(i=
mg_width);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finest_scale =3D std::max(coarsest_scale-4, =
0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_size =3D 12;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 coarsest_scale =3D autoSelectCoarsestScale(i=
mg_width);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finest_scale =3D std::max(coarsest_scale-5, =
0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 // default case, fall-through.<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_size =3D 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 coarsest_scale =3D autoSelectCoarsestScale(i=
mg_width);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 finest_scale =3D std::max(coarsest_scale-2, =
0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ DISOpticalFlowImpl::PatchInverseSearch_ParBody::PatchInverseSearch_ParBo=
dy(DISOpticalFlowImpl &amp;_dis, int _nstripes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int _hs, Mat &amp;dst_Sx, Ma=
t &amp;dst_Sy,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat &amp;src_Ux, Mat &amp;sr=
c_Uy, Mat &amp;_I0, Mat &amp;_I1,<br>
+@@ -1318,9 +1358,20 @@ bool DISOpticalFlowImpl::ocl_calc(InputArray I0, I=
nputArray I1, InputOutputArray<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flow.create(I1Mat.size(), CV_32FC2);<br=
>
+=C2=A0 =C2=A0 =C2=A0UMat &amp;u_flowMat =3D flow.getUMatRef();<br>
+-=C2=A0 =C2=A0 coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.row=
s) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for max=
imal movement of width/4 */<br>
++=C2=A0 =C2=A0 coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.row=
s) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for max=
imal movement of width/4 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / lo=
g(2.0)));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Deepest pyrami=
d level greater or equal than patch*/<br>
+<br>
++=C2=A0 =C2=A0 if (coarsest_scale&lt;0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_Error(cv::Error::StsBadSize, &quot;The in=
put image must have either width or height &gt;=3D 12&quot;);<br>
++<br>
++=C2=A0 =C2=A0 if (coarsest_scale&lt;finest_scale)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // choose the finest level based on coarsest=
 level.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Refs: <a href=3D"https://github.com/tikro=
eger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L23=
9" rel=3D"noreferrer" target=3D"_blank">https://github.com/tikroeger/OF_DIS=
/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239</a><br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int original_img_width =3D I0.size().width;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoSelectPatchSizeAndScales(original_img_wi=
dth);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0ocl_prepareBuffers(I0Mat, I1Mat, u_flowMat, use_input=
_flow);<br>
+=C2=A0 =C2=A0 =C2=A0u_Ux[coarsest_scale].setTo(0.0f);<br>
+=C2=A0 =C2=A0 =C2=A0u_Uy[coarsest_scale].setTo(0.0f);<br>
+@@ -1385,8 +1436,20 @@ void DISOpticalFlowImpl::calc(InputArray I0, Input=
Array I1, InputOutputArray flo<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flow.create(I1Mat.size(), CV_32FC2);<br=
>
+=C2=A0 =C2=A0 =C2=A0Mat flowMat =3D flow.getMat();<br>
+-=C2=A0 =C2=A0 coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.row=
s) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code serach for max=
imal movement of width/4 */<br>
++=C2=A0 =C2=A0 coarsest_scale =3D min((int)(log(max(I0Mat.cols, I0Mat.row=
s) / (4.0 * patch_size)) / log(2.0) + 0.5), /* Original code search for max=
imal movement of width/4 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 (int)(log(min(I0Mat.cols, I0Mat.rows) / patch_size) / lo=
g(2.0)));=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Deepest pyrami=
d level greater or equal than patch*/<br>
++<br>
++=C2=A0 =C2=A0 if (coarsest_scale&lt;0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_Error(cv::Error::StsBadSize, &quot;The in=
put image must have either width or height &gt;=3D 12&quot;);<br>
++<br>
++=C2=A0 =C2=A0 if (coarsest_scale&lt;finest_scale)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // choose the finest level based on coarsest=
 level.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Refs: <a href=3D"https://github.com/tikro=
eger/OF_DIS/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L23=
9" rel=3D"noreferrer" target=3D"_blank">https://github.com/tikroeger/OF_DIS=
/blob/2c9f2a674f3128d3a41c10e41cc9f3a35bb1b523/run_dense.cpp#L239</a><br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int original_img_width =3D I0.size().width;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 autoSelectPatchSizeAndScales(original_img_wi=
dth);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0int num_stripes =3D getNumThreads();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0prepareBuffers(I0Mat, I1Mat, flowMat, use_input_flow)=
;<br>
+diff --git a/modules/video/test/test_OF_accuracy.cpp b/modules/video/test=
/test_OF_accuracy.cpp<br>
+index affbab65866..b99ffce2a8b 100644<br>
+--- a/modules/video/test/test_OF_accuracy.cpp<br>
++++ b/modules/video/test/test_OF_accuracy.cpp<br>
+@@ -121,6 +121,34 @@ TEST(DenseOpticalFlow_DIS, ReferenceAccuracy)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanZero)<br>
++{<br>
++=C2=A0 =C2=A0 cv::Ptr&lt;cv::DISOpticalFlow&gt; of =3D cv::DISOpticalFlo=
w::create();<br>
++=C2=A0 =C2=A0 const int mat_size =3D 10;<br>
++<br>
++=C2=A0 =C2=A0 cv::Mat x(mat_size, mat_size, CV_8UC1, 42);<br>
++=C2=A0 =C2=A0 cv::Mat y(mat_size, mat_size, CV_8UC1, 42);<br>
++=C2=A0 =C2=A0 cv::Mat flow;<br>
++<br>
++=C2=A0 =C2=A0 ASSERT_THROW(of-&gt;calc(x, y, flow), cv::Exception);<br>
++}<br>
++<br>
++// make sure that autoSelectPatchSizeAndScales() works properly.<br>
++TEST(DenseOpticalFlow_DIS, InvalidImgSize_CoarsestLevelLessThanFinestLev=
el)<br>
++{<br>
++=C2=A0 =C2=A0 cv::Ptr&lt;cv::DISOpticalFlow&gt; of =3D cv::DISOpticalFlo=
w::create();<br>
++=C2=A0 =C2=A0 const int mat_size =3D 80;<br>
++<br>
++=C2=A0 =C2=A0 cv::Mat x(mat_size, mat_size, CV_8UC1, 42);<br>
++=C2=A0 =C2=A0 cv::Mat y(mat_size, mat_size, CV_8UC1, 42);<br>
++=C2=A0 =C2=A0 cv::Mat flow;<br>
++<br>
++=C2=A0 =C2=A0 of-&gt;calc(x, y, flow);<br>
++<br>
++=C2=A0 =C2=A0 ASSERT_EQ(flow.rows, mat_size);<br>
++=C2=A0 =C2=A0 ASSERT_EQ(flow.cols, mat_size);<br>
++}<br>
++<br>
+ TEST(DenseOpticalFlow_VariationalRefinement, ReferenceAccuracy)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0Mat frame1, frame2, GT;<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a> b/meta-oe/rec=
ipes-support/opencv/<a href=3D"http://opencv_4.1.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">opencv_4.1.0.bb</a><br>
index d781da6..de708fd 100644<br>
--- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
+++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
@@ -50,6 +50,10 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/op=
encv/opencv.git;name=3Dopencv" rel=3D"noreferrer" target=3D"_blank">github.=
com/opencv/opencv.git;name=3Dopencv</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Dont-use-isystem.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-carotene-Replace-ipc=
p-unit-growth-with-ipa-cp-unit-g.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://download.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-14491.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-14493.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-15939.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-19624.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0PV =3D &quot;4.1.0&quot;<br>
<br>
--<br>
2.7.4<br>
<br>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007d232105bdfa81dc--
