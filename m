Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P7VQh-0007Rs-IQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 17:45:48 +0200
Received: by gwb17 with SMTP id 17so17337gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 08:45:14 -0700 (PDT)
Received: by 10.150.227.7 with SMTP id z7mr5149558ybg.8.1287330313083;
	Sun, 17 Oct 2010 08:45:13 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id q8sm3480956ybk.12.2010.10.17.08.45.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 08:45:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <AANLkTikn1+_p_nwaqR4iV31co+qi_BaNShqx-eYgvgfS@mail.gmail.com>
Date: Sun, 17 Oct 2010 23:45:07 +0800
Message-Id: <06FE5F22-DDAB-4DE1-A03D-9E93DCD49FF7@chumby.com>
References: <50C3C89D-F86C-423F-814A-88602DD959E1@chumby.com>
	<AANLkTikn1+_p_nwaqR4iV31co+qi_BaNShqx-eYgvgfS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsamplerate: Fix checksums to match downloaded file
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
X-List-Received-Date: Sun, 17 Oct 2010 15:45:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On 17-Oct-2010, at 7:22 PM, Frans Meulenbroeks wrote:

> 2010/10/17 Sean Cross <sean@chumby.com>:
>> libsamplerate-0.1.7.tar.gz has changed upstream.  The Angstrom mirror =
has an old version of the file.  Pulling it from the source, I see that =
the following two changes have been made without bumping the version:
>>=20
>> diff -ur old-libsamplerate-0.1.7/ChangeLog =
libsamplerate-0.1.7/ChangeLog
>> --- old-libsamplerate-0.1.7/ChangeLog   2009-02-14 11:37:27.000000000 =
+0000
>> +++ libsamplerate-0.1.7/ChangeLog       2009-02-15 00:17:35.000000000 =
+0000
>> @@ -11,7 +11,7 @@
>>     This bug has zero security implications beyond the ability to =
cause a
>>     program hitting this bug to exit immediately with a segfault.
>>     See : http://www.mega-nerd.com/erikd/Blog/2009/Feb/14/index.html
>> -    Thanks to David Cournapeau for the bug report.
>> +    Thanks to David Cournapeau and Lev Givon for the bug report.
>>=20
>>     * doc/win32.html Makefile.am configure.ac
>>     Reinstate Win32/MSVC compile instructions.
>> diff -ur old-libsamplerate-0.1.7/Win32/config.h =
libsamplerate-0.1.7/Win32/config.h
>> --- old-libsamplerate-0.1.7/Win32/config.h      2009-02-14 =
11:42:49.000000000 +0000
>> +++ libsamplerate-0.1.7/Win32/config.h  2009-02-14 11:46:40.000000000 =
+0000
>> @@ -190,8 +190,7 @@
>>  #define STDC_HEADERS 1
>>=20
>>  /* Version number of package */
>> -<<<<<<< diff from left file
>> -#define VERSION "0.1.4"
>> +#define VERSION "0.1.7"
>>=20
>>=20
>>=20
>> @@ -203,6 +202,3 @@
>>  */
>>=20
>>  #define inline __inline
>> -=3D=3D=3D=3D=3D=3D=3D=3D
>> -#define VERSION "0.1.7"
>> ->>>>>>> diff from right file
>>=20
>>=20
>> The following patch corrects the checksums for the new version.
>>=20
>> ---
>>  recipes/libsamplerate/libsamplerate0_0.1.7.bb |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/recipes/libsamplerate/libsamplerate0_0.1.7.bb =
b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
>> index 737e934..8b457ba 100644
>> --- a/recipes/libsamplerate/libsamplerate0_0.1.7.bb
>> +++ b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
>> @@ -12,5 +12,5 @@ S =3D "${WORKDIR}/libsamplerate-${PV}"
>>  inherit autotools pkgconfig
>>=20
>>=20
>> -SRC_URI[md5sum] =3D "ad093e60ec44f0a60de8e29983ddbc0f"
>> -SRC_URI[sha256sum] =3D =
"e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
>> +SRC_URI[md5sum] =3D "6731a81cb0c622c483b28c0d7f90867d"
>> +SRC_URI[sha256sum] =3D =
"78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
>> --
>> 1.7.0.4
>>=20
>=20
> Yuk; changing the contents of a release.
> While I feel this patch is better than nothing (or we need to
> maintain/store our own copy and always use that), I suggest at least a
> PR bump to trigger a rebuild.
>=20
> Thinking of it:
> We might need a mechanism that the mirrors also get updated.
> And it would be nice if the system would attempt a reload from the
> source if the version in the downloads dir does not match the
> checksums.
> That way the problem of people having an older copy of the source in
> their downloads dir do get the latest version if upstream changes.
> (we might only do this if the recipe is newer than the copy in
> downloads, just to avoid fetching over and over again).

This actually came about because I'm overriding angstrom-mirrors.bbclass =
in an overlay to be empty.  I did this largely to prevent passwords from =
leaking out.  In order to authenticate with the SVN server, I'm putting =
the username and password as part of the URI, and I believe the URI gets =
flattened and appended as part of the mirror check.  But as a side =
effect I'm finding a few problems like this, or packages that are =
outright missing upstream.

One side effect of this is that the Angstrom mirror has an older version =
of the file.  Changing the sum and bumping the PR will break builds for =
Angstrom.  They'll need to re-mirror the file in order to get things =
working again.


Sean=


