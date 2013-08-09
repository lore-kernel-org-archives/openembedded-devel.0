Return-Path: <riku.voipio@linaro.org>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 266AF6077D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 06:51:31 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id o19so741180qap.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2013 23:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mPXme6kbiasCIAAZ/19Um2qReRzbNj4dcvIDbD0Gs/Q=;
	b=Cxw2gH5wTTAXzUUELgsX0GL+A/BGTsK36xCVrUIBG1AaGXwp8B42o/sc0jUWuMdgfH
	DdabnpukBRBfwitGHN7If7aH4s82UBsMfPLdZwqZ/so/KQCxWsS47V3P7GyYygVfxVS4
	rf2lvWMfEmIRSmrQuMLRYlHOJmZvbm1aAhU2Kq8BtOJdlnuIOMN88rMYN8Lj67Rjm+Gu
	mTvXafRmn6vQb57l6sgchv2VaF6MxT0ButRL1CIc8mNTHoqFuEqnYRcw32YV0Y9EXUaZ
	e357r5lcMFKmwA7lLCj+Z4odBK+JcPaEgxRicKiFw6+5OiK20U2OL2QyIJxIn3pkytoX
	himg==
X-Gm-Message-State: ALoCoQkEf18GP9bZbpe51lQZ3hqiptPL7Ts2e/L/ek57q8jslBLjMs6zQNFfOTmvoL75sNOu62yo
MIME-Version: 1.0
X-Received: by 10.49.13.131 with SMTP id h3mr9839479qec.3.1376031091275; Thu,
	08 Aug 2013 23:51:31 -0700 (PDT)
Received: by 10.49.120.162 with HTTP; Thu, 8 Aug 2013 23:51:31 -0700 (PDT)
In-Reply-To: <C3C519DD-1E4E-49C0-8C6C-B50BFFA89A5C@gmail.com>
References: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
	<CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
	<C3C519DD-1E4E-49C0-8C6C-B50BFFA89A5C@gmail.com>
Date: Fri, 9 Aug 2013 09:51:31 +0300
Message-ID: <CAAqcGHkBfysXdfJMSvLquAAtKJQ14Erfohj9pMTMaa865Ep4yA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: parsing errors with angstrom/meta-linaro
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
X-List-Received-Date: Fri, 09 Aug 2013 06:51:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

The problem is that git.linaro.org is not providing good service and
often fails to respond to git requests. When bitbake fails to fetch
the latest git, it is unable to expand AUTOREV, and throws in the
towel. You can reproduce the issue easily with any recipe that has a
git:// url and AUTOREV by disconnecting the OE build machine from the
network.

Could we make AUTOREV to expand to latest version found from
downloads/git2 in case the git fetch fails?

Riku



On 8 August 2013 20:28, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Aug 8, 2013, at 9:00 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>
>> Hi,
>>
>> On 8 August 2013 08:48, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi
>>>
>>> Often I see this error when parsing angstrom-next, has anyone seen some=
thing similar or delved into the reason behind
>>> it ?
>>>
>>> NOTE: Started PRServer with DBfile: /builds1/angstrom/cache/prserv.sqli=
te3, IP: 127.0.0.1, PORT: 45141, PID: 6728
>>> Parsing recipes...ERROR: ExpansionError during parsing /builds1/angstro=
m/sources/meta-linaro/meta-aarch64/recipes-kernel/linux/linux-linaro_git.bb=
: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(=
d)} which triggered exception FetchError: Fetcher failure: Fetch command fa=
iled with exit code 128, output:
>>> fatal: read error: Connection reset by peer
>>>
>>> ERROR: Command execution failed: Exited with 1
>>>
>>> Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.
>>
>> I'm seeing a similar issue[1] on another recipe (libhugetlbfs[2] for ins=
tance).
>> It's worth mentioning:
>> - only on my local machine (it doesn't happen on daily builds using
>> EC2 instances)
>> - also from meta-linaro/meta-aarch64
>> - also code pull from git, using SRCPV/AUTOREV
>>
>> [1] Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_sr=
crev(d)}
>> [2] https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Db=
lob;f=3Dmeta-aarch64/recipes-extended/libhugetlbfs/libhugetlbfs_2.16.bb;hb=
=3Dmaster
>
> if I pull out meta-aarch64 from the bblayers all works ok. I don't hit th=
is error at all
> so somethins is fishy with this layer
>
>>
>> Cheers,
>> Fathi
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

