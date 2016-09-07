Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2534560017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 16:51:13 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x24so1188607pfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=iAKBY8fS92yK0FYSaBFCopL8J7ibC89C1WB2DAu/mek=;
	b=Q4IlgDMuXtHAThdxF0Ezo8ls3A5Ld1nwqr3li7aJqVrwR6GVytkcbRe2J2DlFoUky+
	1XcJcUPhblo9ituohclnRqYdnmPNApkSlXloJwKpKR6nx0VmkAoMgkHFW0l8QKhNGymC
	JIwWWaaYd24AtmUdL+8eI2L7KpDadL0aNsegJSF15W6qYzAlUVJoENOGtxA+Xbihv9xJ
	ej1LHDkVEEqcWN05HojHzvi9yovNk9LGmgepfKmjVu3MyzOYC7zbxafwnl62kJU8wGNw
	ZnytFvgzkTWDGbCASTiU2biHRfV5j/lmApoXFPEYYFECyqKPOQQ22g10VA3YDbynq4y7
	aVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=iAKBY8fS92yK0FYSaBFCopL8J7ibC89C1WB2DAu/mek=;
	b=Xup+BJ6WHEpuGpfDnqqbbMz4ry3tfixnHCKe41DpUk7O5YhRqjFFCKelEk3AllVKx0
	a24nL3MznQJN8mIdvtdwGLQ82MCGoCm4GSu/XDuXDslkcK7zBCs+J6hWztucKrAQ9u6J
	+s/sediw9dJZ/sDmxqREihXXSndQ1rfWKwKdCCbdrnqarExAP/H+/y4Ts4zcRgbsDrEC
	b6MQ63RIZITpwmADldNtj0qTjCa4HM7ar89GyZ7LVD7IBO0URzL9jgtq+8CtClcCV1y8
	Oo3YMAGGhBPal0oeVzpdo5IFVFlgXlRFGc4ux3YXY2eiJq4OYqZaX6y6qImYFmmRdclu
	CyAg==
X-Gm-Message-State: AE9vXwMLF2fAvUFJADUQuhdHFGjb24lhbIg2pCd1pI1JR6EjIUOTU+GqeFmZR6dmd19VzQ==
X-Received: by 10.98.60.71 with SMTP id j68mr11310854pfa.154.1473267074425;
	Wed, 07 Sep 2016 09:51:14 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:9989:9d3a:10f0:29e7?
	([2601:647:4c00:3edf:9989:9d3a:10f0:29e7])
	by smtp.gmail.com with ESMTPSA id
	p74sm34446707pfk.68.2016.09.07.09.51.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 09:51:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRQgokOGY1-kCjvxnxA1v-_mtwO2du7V-dE6dDcSy9fHoQ@mail.gmail.com>
Date: Wed, 7 Sep 2016 09:51:20 -0700
Message-Id: <4DE889CF-CC0B-425B-89D0-1FC26ECCF07B@gmail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
	<294CDBE1-7350-4CDB-90C0-6E5110BF2466@gmail.com>
	<CALbNGRQgokOGY1-kCjvxnxA1v-_mtwO2du7V-dE6dDcSy9fHoQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 5/5] samba: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Wed, 07 Sep 2016 16:51:14 -0000
X-Groupsio-MsgNum: 63003
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0CC57558-D1DD-4330-B09F-066353A1393E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0CC57558-D1DD-4330-B09F-066353A1393E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 6, 2016, at 2:29 PM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Tue, Sep 6, 2016 at 8:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Sep 4, 2016, at 1:15 PM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>>>=20
>>> Use this workaround as long as there is no better (upstream) fix
>>>=20
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git =
a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>> index e35d527..3205c5d 100644
>>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>> @@ -88,7 +88,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
>>>                "
>>> DISABLE_STATIC =3D ""
>>>=20
>>> -LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>>> +LDFLAGS +=3D "-Wl,-z,relro,-z,now =
${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=3Dbfd =
', '', d)}=E2=80=9D
>>=20
>> what is the original problem ?
>>=20
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to =E2=80=98dbghdrclass'


Does it mean that we are missing some library or object on linker =
cmdline ?


> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbgtext'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'DEBUGLEVEL_CLASS'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'make_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbghdrclass'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbgtext'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'DEBUGLEVEL_CLASS'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'make_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbghdrclass'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbgtext'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'DEBUGLEVEL_CLASS'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'make_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbghdrclass'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbgtext'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'DEBUGLEVEL_CLASS'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'make_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbghdrclass'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'dbgtext'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'DEBUGLEVEL_CLASS'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'generate_random_buffer'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'GetTimeOfDay'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'tdb_wrap_open'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'string_term_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'make_tdb_data'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_tdb'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_hash_size'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'lpcfg_tdb_flags'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'map_nt_error_from_unix'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'loadparm_init_s3'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'become_root'
> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
> reference to 'unbecome_root'
> | collect2: error: ld returned 1 exit status
> | Waf: Leaving directory
> =
`/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-l=
inux-gnueabi/samba/4.4.5-r0/samba-4.4.5/bin'
> | Build failed:
> |  -> task failed (err #1):
> |     {task: cc_link vlp_232.o -> vlp}
> |  -> task failed (err #1):
> |     {task: cc_link notifydd_4.o,notifyd_1.o -> notifydd}
> |  -> task failed (err #1):
> |     {task: cc_link msgtest_192.o -> msgtest}
> |  -> task failed (err #1):
> |     {task: cc_link msg_sink_194.o -> msg_sink}
> |  -> task failed (err #1):
> |     {task: cc_link tests_2.o -> notifyd-tests}
> |  -> task failed (err #1):
> |     {task: cc_link version_test_218.o -> versiontest}
> | WARNING: =
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-li=
nux-gnueabi/samba/4.4.5-r0/temp/run.do_compile.20288:1
> exit 1 from 'python ./buildtools/bin/waf -j8'
> | ERROR: Function failed: do_compile (log file is located at
> =
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-li=
nux-gnueabi/samba/4.4.5-r0/temp/log.do_compil
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_0CC57558-D1DD-4330-B09F-066353A1393E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfQRYgACgkQuwUzVZGdMxRjTgCffJ9gvP95eYHGttP2bPTypiHr
Q80Ani/yacniBCGNmtvUSQU4jUkN1xKI
=3Cov
-----END PGP SIGNATURE-----

--Apple-Mail=_0CC57558-D1DD-4330-B09F-066353A1393E--
