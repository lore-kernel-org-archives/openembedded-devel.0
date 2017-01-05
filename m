Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1279571AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 18:57:02 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d5so33440249uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 10:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=I+4NXNWJqF2to2TK23+yUzhANUUURJiJimyvgzNd7ho=;
	b=KYIC88Xa/PjToBjrfsstv/TDS/l6bXmfvmMvRWg1uqhZu/7ShSHwKtBbzybuoDx530
	l5cREw3dZ6ZmQHexAelqbl4xD4+h6bIRpK97RJtw2yku2xBbn2cdP2rqB/bA85FWx/6D
	ZP9o3JkPEC118fVPer0GiDmhzEVt64rcMslAU41LbOOIbi1/heJ4QnDXLkbTIC6mkce1
	vO28WQTPQCWnTrinyWFL8JBBKFzvlZoC5ebRA8oI/2S+W3TnBdPDSc1WL5V6fgqBF9Mb
	7pjscWUuCqBLjH9E8TA3sD1TkkBCoTqvGKWE6jQoX6r1XgiYps+OeuaLdt7XxWzekYdg
	fGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=I+4NXNWJqF2to2TK23+yUzhANUUURJiJimyvgzNd7ho=;
	b=cMFxYty9iWC1LoawS08wRav0N4X4ASTynNn8XW0qCzim9gRvGMMhoVQ8flufAQF3yB
	j7rezQnufV+o/ybsu65rL0sNSYBvRcpN+/bzUlmTWk+coVOyvSA4Tm22zYZGe1Xw0lhp
	yD+DKNLD0G8z9B5ec77jxaJBkL46KBuAtO4VdLsrRf9mJ+/he43Jl1g30b5SrofQLDq4
	WAT9jLLmOlYANW59rEk9Rv/RJcvohl3BdeHGIo8LBzGoe2X88RE6+VQGUfaLX6YQfRMx
	ZK8bLSFUY7zb9TWKk3bsZDfZnVLKN9cHaQMPkocNh6nquei1oGjBktHWYFW9ELspiqtx
	t9Tw==
X-Gm-Message-State: AIkVDXJbAIZ0pHY9gRDuhZKfcafOKwboeKeXmHAhp4Of59WbGnUTOVVzUn+plg/hPT17/UBej4z4HYK3AEwaLA==
X-Received: by 10.159.35.15 with SMTP id 15mr4785620uae.47.1483642622895; Thu,
	05 Jan 2017 10:57:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Thu, 5 Jan 2017 10:57:02 -0800 (PST)
In-Reply-To: <20170105180458.GC3243@jama>
References: <1483493243-30984-1-git-send-email-schnitzeltony@googlemail.com>
	<1483493243-30984-3-git-send-email-schnitzeltony@googlemail.com>
	<20170105180458.GC3243@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 5 Jan 2017 19:57:02 +0100
Message-ID: <CALbNGRSqm5k70BgM3Dzy_5or6+whtQ-yAjvqapQJRXHa7g0oGw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][V2 2/2] raptor2: initial add 2.0.15
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
X-List-Received-Date: Thu, 05 Jan 2017 18:57:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2017 at 7:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Jan 04, 2017 at 02:27:23AM +0100, Andreas M=C3=BCller wrote:
>> * it is it in meta-office for a while. Now I need it in meta-qt5-extra t=
oo
>> * LICENSE.txt summarizes all licenses and explains that ot is user's cho=
ice
>>   which one to use
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  ...c-do-additional-checks-on-libxml2-also-wh.patch | 34 +++++++++++++++=
+++++++
>>  meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb  | 25 +++++++++++++++=
+
>>  2 files changed, 59 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/raptor2/files/0001-configure=
.ac-do-additional-checks-on-libxml2-also-wh.patch
>>  create mode 100644 meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
>>
>> diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-=
additional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor=
2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
>> new file mode 100644
>> index 0000000..7faeb13
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additio=
nal-checks-on-libxml2-also-wh.patch
>> @@ -0,0 +1,34 @@
>> +From 3f97aac5a1f43ef57b02fb9ccdcadd41a6b69fa9 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> +Date: Tue, 27 Oct 2015 10:21:24 +0100
>> +Subject: [PATCH] configure.ac: do additional checks on libxml2 also whe=
n
>> + detected by pkg-config
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Applied [1]
>> +
>> +[1] https://github.com/dajobe/raptor/pull/33
>> +
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 10ff870..35fa08e 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -601,7 +601,7 @@ have_libxml=3D0
>> + need_libxml=3D0
>> +
>> + oCPPFLAGS=3D"$CPPFLAGS"
>> +-if test "X$XML_CONFIG" !=3D X; then
>> ++if test "X$libxml_source" !=3D X; then
>> +   CPPFLAGS=3D"$LIBXML_CFLAGS $CPPFLAGS"
>> +   LIBS=3D"$LIBS $LIBXML_LIBS"
>> +   AC_CHECK_FUNC(xmlCreatePushParserCtxt, have_xmlCreatePushParserCtxt=
=3Dyes, have_xmlCreatePushParserCtxt=3Dno)
>> +--
>> +2.1.0
>> +
>> diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb b/meta-oe=
/recipes-support/raptor2/raptor2_2.0.15.bb
>> new file mode 100644
>> index 0000000..8c6d008
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.15.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY =3D "Library for parsing and serializing RDF syntaxes"
>> +LICENSE =3D "GPLv2 | LGPLv2.1 | Apache-2.0"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://LICENSE.txt;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>> +    file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
>> +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>> +    file://LICENSE-2.0.txt;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>> +"
>
> I haven't checked why, but doesn't match for me:
>
> ERROR: raptor2-2.0.15-r0 do_populate_lic: QA Issue: raptor2: The LIC_FILE=
S_CHKSUM does not match for file://LICENSE.txt;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1
> raptor2: The new md5 checksum is b840e5ae3aeb897f45b473341348cd9c
>
Strange: it is not the first time for me that a recipes build and then
on fresh rebuild I see this kind of error. Will look into this.

Andreas

