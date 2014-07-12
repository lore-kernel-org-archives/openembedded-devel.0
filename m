Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 42EEF6AC93
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 14:08:55 +0000 (UTC)
Received: (qmail 22926 invoked by uid 1003); 12 Jul 2014 14:08:56 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.171)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	12 Jul 2014 14:08:53 -0000
Message-ID: <53C14156.1090703@balister.org>
Date: Sat, 12 Jul 2014 10:08:22 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1405087761-4791-1-git-send-email-philip@balister.org>
	<CAMKF1spHrcy4EU-z-9rpdjV1UgxGGbeeG68WnfsvUcRXrwn+sQ@mail.gmail.com>
In-Reply-To: <CAMKF1spHrcy4EU-z-9rpdjV1UgxGGbeeG68WnfsvUcRXrwn+sQ@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCHv2] postgresql : Fix build using pkg-config for libxml-2.0.
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
X-List-Received-Date: Sat, 12 Jul 2014 14:08:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/12/2014 01:09 AM, Khem Raj wrote:
> On Fri, Jul 11, 2014 at 7:09 AM, Philip Balister <philip@balister.org> wrote:
>> Use package-config instead of binconfig for libxml-2.0.
>>
>> The pgac_option processing is filtering the output from
>> the xml-config programming. The pkgconfig output is good
>> enough to use without such filtering.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  ...0001-Use-pkg-config-for-libxml2-detection.patch | 43 ++++++++++++++++++++++
>>  meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
>>  2 files changed, 44 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
>>
>> diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
>> new file mode 100644
>> index 0000000..d08ec6a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
>> @@ -0,0 +1,43 @@
>> +From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 2001
>> +From: Philip Balister <philip@balister.org>
>> +Date: Tue, 1 Jul 2014 09:40:44 -0400
>> +Subject: [PATCH] Use pkg-config for libxml2 detection.
>> +
>> +Upstream-Status: Inappropriate [configuration]
> 
> this looks a good one to submit upstream to me. are you just avoiding that :0)

Yes :) I'll look into how to submit patches to postgresql.

Philip

> 
>> +
>> +xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
>> +
>> +Signed-off-by: Philip Balister <philip@balister.org>
>> +---
>> + configure.in | 15 ++-------------
>> + 1 file changed, 2 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index f8bf466..1f4fabf 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
>> +               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
>> +
>> + if test "$with_libxml" = yes ; then
>> +-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
>> +-  if test -n "$XML2_CONFIG"; then
>> +-    for pgac_option in `$XML2_CONFIG --cflags`; do
>> +-      case $pgac_option in
>> +-        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
>> +-      esac
>> +-    done
>> +-    for pgac_option in `$XML2_CONFIG --libs`; do
>> +-      case $pgac_option in
>> +-        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
>> +-      esac
>> +-    done
>> +-  fi
>> ++  CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
>> ++  LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
>> + fi
>> +
>> + AC_SUBST(with_libxml)
>> +--
>> +1.8.3.1
>> +
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
>> index 4e5ec02..79d1281 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>> @@ -28,6 +28,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
>>             file://postgresql.init \
>>             file://postgresql-bashprofile \
>>             file://postgresql.pam \
>> +           file://0001-Use-pkg-config-for-libxml2-detection.patch \
>>  "
>>
>>  LEAD_SONAME = "libpq.so"
>> --
>> 1.8.3.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

