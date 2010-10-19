Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8GeJ-0006zx-90
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 20:11:00 +0200
Received: by ywl5 with SMTP id 5so1495865ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=qAdwr9o1MybGzVDRTH/OD2Z52opbTiMXChRryrV+IpI=;
	b=IrILvjb1h4o84J/Vpz5mKxAuc2nF1U6IrilTXrM8jq8wS200vT/3pj07368HBvDYXZ
	idkLjyJNjoxY7oMYCCXv2hUXUAfpQNDwcPeBoO8d01TPWbzfHnvsRKM9BcDo3gJnjSlV
	VFNKvAcoPlg6pSq9p/DuVZKxpHZ4OHw8oD71M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=sTCbymIElZue81S3Y+VNfBY5m1NKAntG07bYOtugJFt+LwtjTLQCMSDg9v82C+Hx6O
	X5klFBiCR29qt6C25VXm84sEJfuM6+YeJD/TP84KtUYWB04P9o5yWwI/Xp+/O3q1UmED
	8xc4/ZWTPOy3+iySvXcH2few/LaYSn8g0vVME=
Received: by 10.90.119.5 with SMTP id r5mr2891484agc.88.1287511819872; Tue, 19
	Oct 2010 11:10:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Tue, 19 Oct 2010 11:09:59 -0700 (PDT)
In-Reply-To: <1287483180.4030.30.camel@mattotaupa>
References: <1287444108.3927.82.camel@mattotaupa>
	<AANLkTimti+Lv7xzDUrq8MppJdkru3pZgLi3CmMvEwop1@mail.gmail.com>
	<1287483180.4030.30.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Oct 2010 11:09:59 -0700
Message-ID: <AANLkTik3F0guMoW8sbyPze6jK6673Pn7otCbZRCh7RCT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openldap_2.4.23: `do_configure` fails with `cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or directory`
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
X-List-Received-Date: Tue, 19 Oct 2010 18:11:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2010 at 3:13 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Montag, den 18.10.2010, 16:36 -0700 schrieb Khem Raj:
>> On Mon, Oct 18, 2010 at 4:21 PM, Paul Menzel wrote:
>
>> > trying to build OpenLDAP to test 980a1e [1], task `do_configure` of
>> > `opldap_2.4.23.bb` [2] fails with the following error with `minimal`
>> > (eglibc) and `angstrom-2008.1` for `MACHINE =3D "beagleboard"`.
>> >
>> >        [=E2=80=A6]
>> >        Log data follows:
>> >        | cp: cannot stat `/oe/build-minimal-eglibc/minimal-dev/sysroot=
s/armv7a-oe-linux-gnueabi/usr/share/libtool/ltmain.sh': No such file or dir=
ectory
>> >        | ERROR: Function do_configure failed
>> >        NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>> >        ERROR: TaskFailed event exception, aborting
>> >        ERROR: Build of /oe/openembedded/recipes/openldap/openldap_2.4.=
23.bb do_configure failed
>> >        ERROR: Task 11 (/oe/openembedded/recipes/openldap/openldap_2.4.=
23.bb, do_configure) failed with 256
>>
>> can you search where ltmain.sh exist in your target staging ?
>
> Ah right. I should have provided that information in the first place.
>
>> find /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnuea=
bi -name "ltmain.sh"
>
>        /oe/build-minimal-libc$ find minimal-dev/sysroots/armv7a-oe-linux-=
gnueabi/ -name "ltmain.sh"
>        minimal-dev/sysroots/armv7a-oe-linux-gnueabi/oe/build-minimal-libc=
/minimal-dev/sysroots/i686-linux/usr/share/libtool/ltmain.sh
>        minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/share/doc/gettext=
/examples/hello-c++-kde/admin/ltmain.sh
>
> Did something go wrong during staging of `ltmain.sh`?

somehow libtool-cross seems not to be staged in your case. I wonder why

>
>
> Thanks,
>
> Paul
>
>
>> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D98=
0a1ea8d5bbe2c0c6e4b8f79883b0f294de979b
>> > [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/op=
enldap/openldap_2.4.23.bb?id=3D980a1ea8d5bbe2c0c6e4b8f79883b0f294de979b
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


