Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OiR6Z-00028Q-BP
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 14:05:25 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 2573343F0C34
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Aug 2010 15:05:11 +0300 (EEST)
Message-ID: <4C5FEF0B.2070600@dcombus.com>
Date: Mon, 09 Aug 2010 15:05:31 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>	<1281353772-30862-1-git-send-email-henri.bragge@dcombus.com>
	<1281354725.3767.25.camel@mattotaupa>
In-Reply-To: <1281354725.3767.25.camel@mattotaupa>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] gsnmp-0.3.0: fix quoting in autoconf macros
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Aug 2010 12:05:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Paul Menzel wrote:
> Is there an upstream bug for this? If not, it would be great if you
> could sent it upstream.
>  =20

The bug is still present in upstream too, but I will send this patch to=20
the gsnmp maintainer if it does the trick (or should it be the other way=20
around?).

> Am Montag, den 09.08.2010, 14:36 +0300 schrieb Henri Bragge:
>  =20
>> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
>> ---
>>  recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch |   24 ++++++++++++++++++++=
++++
>>  recipes/gsnmp/gsnmp_0.3.0.bb              |    3 ++-
>>  2 files changed, 26 insertions(+), 1 deletions(-)
>>  create mode 100644 recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch
>>
>> diff --git a/recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch b/recipes/gsnmp=
/gsnmp-0.3.0/quote-fix.patch
>> new file mode 100644
>> index 0000000..138c9e6
>> --- /dev/null
>> +++ b/recipes/gsnmp/gsnmp-0.3.0/quote-fix.patch
>> @@ -0,0 +1,24 @@
>> +diff -Nurd gsnmp-0.3.0.orig/acinclude.m4 gsnmp-0.3.0/acinclude.m4
>> +--- gsnmp-0.3.0.orig/acinclude.m4	2010-02-19 10:35:29.000000000 +0200
>> ++++ gsnmp-0.3.0/acinclude.m4	2010-08-09 13:30:32.000000000 +0300
>> +@@ -6,7 +6,7 @@
>> + dnl usually in <utime.h>.
>> + dnl Some systems have utime.h but don't declare the struct anywhere.
>> +=20
>> +-AC_DEFUN(jm_CHECK_TYPE_STRUCT_UTIMBUF,
>> ++AC_DEFUN([jm_CHECK_TYPE_STRUCT_UTIMBUF],
>> + [
>> +   AC_CHECK_HEADERS(utime.h)
>> +   AC_REQUIRE([AC_HEADER_TIME])
>> +diff -Nurd gsnmp-0.3.0.orig/gsnmp.m4 gsnmp-0.3.0/gsnmp.m4
>> +--- gsnmp-0.3.0.orig/gsnmp.m4	2010-02-19 10:35:29.000000000 +0200
>> ++++ gsnmp-0.3.0/gsnmp.m4	2010-08-09 13:30:46.000000000 +0300
>> +@@ -1,7 +1,7 @@
>> + dnl AM_PATH_GSNMP()
>> + dnl=20
>> +=20
>> +-AC_DEFUN(AM_PATH_GSNMP,
>> ++AC_DEFUN([AM_PATH_GSNMP],
>> + [
>> +   PKG_CHECK_MODULES(GSNMP, glib-2.0 >=3D 2.0.1)
>> + ])
>>    =20
>
> Why is this check needed? Maybe add a note to the commit message or
> split the patch.
>  =20

About that I've no idea, notice that I just added the brackets there.

>  =20
>> diff --git a/recipes/gsnmp/gsnmp_0.3.0.bb b/recipes/gsnmp/gsnmp_0.3.0.=
bb
>> index b191762..6287010 100644
>> --- a/recipes/gsnmp/gsnmp_0.3.0.bb
>> +++ b/recipes/gsnmp/gsnmp_0.3.0.bb
>> @@ -4,7 +4,8 @@ LICENSE =3D "GPLv2"
>>  DEPENDS =3D "glib-2.0 gnet"
>>  PR =3D "r0"
>>    =20
>
> I guess you need to increase `PR`.
>
> [=E2=80=A6]
>  =20

Will do.

- Henri


