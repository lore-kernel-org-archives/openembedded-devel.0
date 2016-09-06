Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id C2CC5776F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 21:29:37 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v189so4901899vkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Sy15AtVMjd66ZuEREur7n00P4o8tYr70BkXQAIBEPWI=;
	b=e5JgfgPeDLuoGuhOObbZGI8NIdsq0fBRtM8Bn8MvFTNPPcZCLbnniqQTaGfy7zxJ/a
	o9x+d5H/NTk5dQGH6ujRACwe5Pdw1V/MsvFdJuyXyRAB6Yozur4WOVhb+RlgIo0sjLYf
	PSMFbiMnwjZU7nuwjr8MYLRottGhHCBUX40JDEzcXFwF/WuQMDBg3M8l0JDC0ZdHtduj
	ZWMmhBGu5wRPZUlBHxUFM6p16lTJMVvy+l9TvR1Yz/x1oHZEHycT4Pk5QbhZeTbpO/EA
	Yi03uCbmVI8HRIWO7R9F37mffaqI8uGXyjSkxIfAeXseJY7g43cIRP5fek1n9HtZreDL
	RDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Sy15AtVMjd66ZuEREur7n00P4o8tYr70BkXQAIBEPWI=;
	b=ZM1hutvVb6yHyAejH6FylQbvhH0TRqLVeFbCywdPTgYKhnx1CZfUAxM+QnLaxKxVaz
	i82W5cu3BrEitzmg46PbsAMOq8yjb3wosGFyWlUDSloUrPQK3epgK0s0CXYSosocvGix
	uh0nl4CJc2o59BVQj25hAOF37uxIIi7UIKPpGcjJd4SOfez6NxjP669OzBgM1M6LzxpO
	aMQlQr7e09D1Fq4d57VEmJKYWxMJUub9UOZAIz9cSIZGNBp8cBZ9tL7/ZmlhuEBl2C0l
	DUkO3PqOBhhCJJ6/yRxGX187f/Zlb/S9w0HOpT47vEzAcnWpMLAtH8Iw+n5zgbtSSrMr
	LFig==
X-Gm-Message-State: AE9vXwN+w+SlIj065bMSlH35pXru4sMQlRUbTbmbKdrL+pgjbfkRuhLR+gKpLLQxzQ8P3Zkn5EIb26mI1SzK2A==
X-Received: by 10.31.210.66 with SMTP id j63mr13565862vkg.113.1473197378133;
	Tue, 06 Sep 2016 14:29:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 6 Sep 2016 14:29:37 -0700 (PDT)
In-Reply-To: <294CDBE1-7350-4CDB-90C0-6E5110BF2466@gmail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
	<294CDBE1-7350-4CDB-90C0-6E5110BF2466@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Sep 2016 23:29:37 +0200
Message-ID: <CALbNGRQgokOGY1-kCjvxnxA1v-_mtwO2du7V-dE6dDcSy9fHoQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 06 Sep 2016 21:29:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2016 at 8:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 4, 2016, at 1:15 PM, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
>>
>> Use this workaround as long as there is no better (upstream) fix
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> index e35d527..3205c5d 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> @@ -88,7 +88,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
>>                 "
>> DISABLE_STATIC =3D ""
>>
>> -LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>> +LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES=
', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}=E2=80=9D
>
> what is the original problem ?
>
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbghdrclass'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbgtext'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'DEBUGLEVEL_CLASS'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'make_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbghdrclass'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbgtext'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'DEBUGLEVEL_CLASS'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'make_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbghdrclass'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbgtext'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'DEBUGLEVEL_CLASS'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'make_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbghdrclass'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbgtext'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'DEBUGLEVEL_CLASS'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'make_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbghdrclass'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'dbgtext'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'DEBUGLEVEL_CLASS'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'generate_random_buffer'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'GetTimeOfDay'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'tdb_wrap_open'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'string_term_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'make_tdb_data'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_tdb'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_hash_size'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'lpcfg_tdb_flags'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'map_nt_error_from_unix'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'loadparm_init_s3'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'become_root'
| default/source3/libsamba-cluster-support-samba4.so: error: undefined
reference to 'unbecome_root'
| collect2: error: ld returned 1 exit status
| Waf: Leaving directory
`/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-li=
nux-gnueabi/samba/4.4.5-r0/samba-4.4.5/bin'
| Build failed:
|  -> task failed (err #1):
|     {task: cc_link vlp_232.o -> vlp}
|  -> task failed (err #1):
|     {task: cc_link notifydd_4.o,notifyd_1.o -> notifydd}
|  -> task failed (err #1):
|     {task: cc_link msgtest_192.o -> msgtest}
|  -> task failed (err #1):
|     {task: cc_link msg_sink_194.o -> msg_sink}
|  -> task failed (err #1):
|     {task: cc_link tests_2.o -> notifyd-tests}
|  -> task failed (err #1):
|     {task: cc_link version_test_218.o -> versiontest}
| WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-a=
ngstrom-linux-gnueabi/samba/4.4.5-r0/temp/run.do_compile.20288:1
exit 1 from 'python ./buildtools/bin/waf -j8'
| ERROR: Function failed: do_compile (log file is located at
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-lin=
ux-gnueabi/samba/4.4.5-r0/temp/log.do_compil

