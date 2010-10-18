Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P7skE-0007u0-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 18:39:40 +0200
Received: from source ([209.85.210.52]) by na3sys009aob105.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLx4HUKjFgjRMCFg4RelthgrFxyaqTxC@postini.com;
	Mon, 18 Oct 2010 09:38:59 PDT
Received: by mail-pz0-f52.google.com with SMTP id 36so101874pzk.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 09:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.11.8 with SMTP id r8mr3611877ebr.54.1287419084673; Mon, 18
	Oct 2010 09:24:44 -0700 (PDT)
Received: by 10.220.181.8 with HTTP; Mon, 18 Oct 2010 09:24:44 -0700 (PDT)
In-Reply-To: <AANLkTikd0LMn776zpRRBF82ZavJrPKFOCJum_q_K8jU_@mail.gmail.com>
References: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
	<1287154849.4233.19.camel@mattotaupa>
	<1287220606.3980.3.camel@mattotaupa>
	<1287225695.3980.56.camel@mattotaupa>
	<AANLkTikd0LMn776zpRRBF82ZavJrPKFOCJum_q_K8jU_@mail.gmail.com>
Date: Mon, 18 Oct 2010 12:24:44 -0400
Message-ID: <AANLkTik+-O+DPYD_506fnsq+gjBFVwHr4-c7cRkHHRhv@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.75
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH, resend] gmp: assign --target to --host to avoid configure error
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
X-List-Received-Date: Mon, 18 Oct 2010 16:39:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 8:33 AM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
> HI Paul,
>
> Thank you for all your testing of gmp builds.
>
> On Sat, Oct 16, 2010 at 6:41 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> [...]
>> Am Samstag, den 16.10.2010, 11:16 +0200 schrieb Paul Menzel:
>> > Am Freitag, den 15.10.2010, 17:00 +0200 schrieb Paul Menzel:
>> > > I tried to build `gmp-native` without your patch and it worked for m=
e
>> > > with `minimal` (eglibc) for `MACHINE =3D "beagleboard"`. Is there a
>> > > difference how things are handled between distributions?
>> >
>> > It also built without problems with `angstrom-2010.x`.
>>
>> =85 and `angstrom-2008.1`, `minimal-{uclibc,libc}`.
>
> So that's a positive result for 'angstrom-200{8.1,0.x}' , {uclibc,libc}..=
.
>
> I guess the culprit must be my use of external CSL toolchain. I will
> try a build of gmp in 'angstrom-2008.1' 'libc' from
> f58a5d59b755bdb725497f574a8059529c134c27 of master without external
> toolchain and post the results.

In 'angstrom-2008.1' 'libc' from
f58a5d59b755bdb725497f574a8059529c134c27 and without any external
toolchain specified: gmp and gmp-native built OK

In 'angstrom-2008.1' 'libc' from
f58a5d59b755bdb725497f574a8059529c134c27 plus "[PATCH] distro,
toolchain-external: override TARGET_VENDOR with TOOLCHAIN_VENDOR" [1]
and with external CSL 2009q1 toolchain specified: gmp and gmp-native
built OK

In 'angstrom-2008.1' 'libc' from
f58a5d59b755bdb725497f574a8059529c134c27 and with external CSL 2009q1
toolchain specified: gmp and gmp-native fail:

NOTE: Running task 160 of 171 (ID: 93,
[...]/oe/recipes/libtool/libtool-native_2.2.6b.bb, do_package_stage)
ERROR: function do_configure failed
ERROR: log data follows
([...]/tmp/work/x86_64-linux/gmp-native-5.0.1-r1.1/temp/log.do_configure.15=
901)
[...]
| configure: error: --target is not appropriate for GMP
| Use --build=3DCPU-VENDOR-OS if you need to specify your CPU and/or system
| explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
| manual for more on this).

I think I know what's happening.

Without "[PATCH] distro, toolchain-external: override TARGET_VENDOR
with TOOLCHAIN_VENDOR" [1] applied, TARGET_SYS =3D
"arm-none-linux-gnueabi" must be set to avoid lots of
"arm-angstrom-linux-gnueabi not found" errors. With the patch applied
I don't have to which must make the --target and --host arguments
match again.

I'm sorry for the noise, I'll withdraw this patch from consideration.

Best Regards,
Ben Gardiner

[1] http://patchwork.openembedded.org/patch/3240/

---
Nanometrics Inc.
http://www.nanometrics.ca


