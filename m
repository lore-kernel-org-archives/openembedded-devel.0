Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C2DC46B8D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 00:08:00 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so6393604ier.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Mar 2014 17:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=4r/WpYeEryw/QNyBB5G9SQ9s/gVnRDuKVewcsBtJT4g=;
	b=vOI1BwrR+6Z/PpqUSHLiZ2gfkzURP3iIzZ3Ib8cDzW7TRNDqRwbJRgMAQU5pWk04BD
	ftSXUs04ZWsCg4k6CTEF23c16iBw9HhUUYZ1Y0UWAQiyWBWmnr4fiBPTsM0+EkdTqOnD
	uiaHcodRr5c8xSY7baDc8+vogOh9fOpU0QSfttq+wWcRhq7LBsnOMbGym6wMBUslH2IU
	YnxDkSA0vtMcc/KcV4qMlOOXeZPGerq2DfFTvp+uG1TagQJveIP8QXNaC86vZWuODiMc
	P7yPV2FKYVRQr2BaLJ9/bnX4/iNYwJ7aaEVAnPTKF6qG3i88WfXseRjfEG6RQRDt3A7X
	FbOg==
X-Received: by 10.43.150.80 with SMTP id kn16mr474686icc.63.1396138080911;
	Sat, 29 Mar 2014 17:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sat, 29 Mar 2014 17:07:30 -0700 (PDT)
In-Reply-To: <1487041.bBRm1EH4qA@localhost.localdomain>
References: <45034856.Fj98ikVczS@localhost.localdomain>
	<5335B790.1010107@balister.org>
	<1487041.bBRm1EH4qA@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Mar 2014 17:07:30 -0700
Message-ID: <CAMKF1sqgL7ZH+c8JLdw6MjQCj0CiRVV3hNqOxx4of5Jota4Lgg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: ntpd fails to start if libcap not installed
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
X-List-Received-Date: Sun, 30 Mar 2014 00:08:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 11:04 AM, Diego <diego.ml@zoho.com> wrote:
> In data venerd=C3=AC 28 marzo 2014 10:55:28, Philip Balister ha scritto:
>> On 03/28/2014 06:40 AM, Diego wrote:
>> > Hi openembedders!
>> >
>> > I've noticed that if ntp is built without libcap, ntpd fails to start =
from
>> > the initscript:
>> > /etc/init.d/ntpd
>> >
>> > giving the error:
>> > Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -=
-
>> > built without --enable-clockctl or --enable-linuxcaps
>> > ntpd - NTP daemon program - Ver. 4.2.6p5
>> > USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=3D| }<val>] ]...
>> >
>> > That is caused by the line:
>> > start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p
>> > /var/run/ntp.pid "$@"
>> >
>> > and in particular by the option "-u ntp:ntp" which is not supported wh=
ich
>> > is not supported if ntp is build without --enable-clockctl.
>> >
>> > Is anybody else experiencing this problem?
>>
>> Oddly enough, I was about to report the symptom today also :)
>>
>> Any ntp experts know what the proper solution is? I'd be glad to propose
>> a patch.
>>
>
> Hi Philip,
>
> I'd like to rephrase better my statement, as I put two errors in it:
> The problem is caused by the option "-u ntp:ntp" which is not supported i=
f ntp
> is build without "--enable-linuxcaps".
>
> As far as the manual goes, the "--enable-clockctl" is a build option for
> NetBSD:
> http://www.eecis.udel.edu/~mills/ntp/html/ntpd.html
>
> Removing the "-u ntp:ntp" makes the initscript work, but I don't know if
> shipping different ntpd initscripts based on pkgconfig is the correct thi=
ng to
> do. Any expert opinion?
>

remove the cap PKGCONFIG its redundant and everything in recipe wants
it enabled, it was  added just for having consistent builds otherwise
it was autodetected by autotools and if you had libpcap staged then it
was enabled automatically otherwisie not.

so you can either change PACKAGECONFIG ??=3D "" to PACKAGECONFIG_append =3D=
 " cap"

or remove this completely and add the dependencies on libcap unconditionall=
y.

