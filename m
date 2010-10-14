Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P6ILb-0003Ye-9j
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:35:32 +0200
Received: by pwj9 with SMTP id 9so41907pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 00:35:00 -0700 (PDT)
Received: by 10.142.70.8 with SMTP id s8mr8490570wfa.155.1287041699415;
	Thu, 14 Oct 2010 00:34:59 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id y42sm6859981wfd.10.2010.10.14.00.34.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 00:34:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <AANLkTimNgCnmgcPq1vJupEa6fJZAaAOPhxRZ9B_CyQzf@mail.gmail.com>
Date: Thu, 14 Oct 2010 15:34:56 +0800
Message-Id: <F560D1D9-5F2C-46DC-819D-8E35E9F7011A@chumby.com>
References: <6976AB00-560A-4D45-A6CA-33F03D38502C@chumby.com>
	<AANLkTimNgCnmgcPq1vJupEa6fJZAaAOPhxRZ9B_CyQzf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] c-ares: Fix configure script
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
X-List-Received-Date: Thu, 14 Oct 2010 07:35:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On 14-Oct-2010, at 7:39 AM, Khem Raj wrote:

> On Wed, Oct 13, 2010 at 1:12 PM, Sean Cross <sean@chumby.com> wrote:
>>=20
>> The syntax of one of the AC_CHECK_FUNCS is incorrect.  Removing the
>> lines in question allows the package to configure and build.
>=20
>=20
> instead of removing the check completely it would be better if we =
fixed it.
> you can also cache the result and not run autoreconf on it but thats a =
fall
> back.
>=20

Alright.  I'm not very familiar with m4 hacking, so I'd like some =
feedback to make sure the patch I'm sending is sane.

>> ---
>>  .../0001-remove-broken-configure.ac-commands.patch |   32 =
++++++++++++++++++++
>>  recipes/c-ares/c-ares_1.5.3.bb                     |    4 ++-
>>  2 files changed, 35 insertions(+), 1 deletions(-)
>>  create mode 100644 =
recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
>>=20
>> diff --git =
a/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch =
b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
>> new file mode 100644
>> index 0000000..799332a
>> --- /dev/null
>> +++ b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
>> @@ -0,0 +1,32 @@
>> +diff -ur c-ares-1.5.3-stock/configure.ac c-ares-1.5.3/configure.ac
>> +--- c-ares-1.5.3-stock/configure.ac    2010-10-13 19:12:51.792124107 =
+0000
>> ++++ c-ares-1.5.3/configure.ac  2010-10-13 19:25:12.932123380 +0000
>> +@@ -796,28 +796,6 @@
>> + )
>> +
>> +
>> +-AC_CHECK_FUNCS([bitncmp \
>> +-  gettimeofday \
>> +-  if_indextoname
>> +-],[
>> +-],[
>> +-  func=3D"$ac_func"
>> +-  AC_MSG_CHECKING([deeper for $func])
>> +-  AC_LINK_IFELSE([
>> +-    AC_LANG_PROGRAM([[
>> +-    ]],[[
>> +-      $func ();
>> +-    ]])
>> +-  ],[
>> +-    AC_MSG_RESULT([yes])
>> +-    eval "ac_cv_func_$func=3Dyes"
>> +-    AC_DEFINE_UNQUOTED([AS_TR_CPP([HAVE_$func])], [1],
>> +-      [Define to 1 if you have the $func function.])
>> +-  ],[
>> +-    AC_MSG_RESULT([but still no])
>> +-  ])
>> +-])
>> +-
>> +
>> + dnl check for inet_pton
>> + AC_CHECK_FUNCS(inet_pton)
>> diff --git a/recipes/c-ares/c-ares_1.5.3.bb =
b/recipes/c-ares/c-ares_1.5.3.bb
>> index 0def152..fa75f3f 100644
>> --- a/recipes/c-ares/c-ares_1.5.3.bb
>> +++ b/recipes/c-ares/c-ares_1.5.3.bb
>> @@ -1,7 +1,9 @@
>>  DESCRIPTION =3D "c-ares is a C library that resolves names =
asynchronously."
>>  HOMEPAGE =3D "http://daniel.haxx.se/projects/c-ares/"
>>  SECTION =3D "libs"
>> -SRC_URI =3D =
"http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz"
>> +SRC_URI =3D =
"http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz \
>> +           file://0001-remove-broken-configure.ac-commands.patch \
>> +"
>>  LICENSE =3D "MIT"
>>  S =3D "${WORKDIR}/c-ares-${PV}"
>>  PR =3D "r1"
>> --
>> 1.7.0.4
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



