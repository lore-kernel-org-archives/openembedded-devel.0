Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4692D608BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:00:31 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 13so2572329lba.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=zp+0cJ8DTUBCWIomWkCVd9jMMYLSxAm8KTQFNGw+stM=;
	b=EuazB9TvQkNmqEK8gX3G5OsDgOTJjjdjhs31FBvrI4vyh83Gu7L10K74zUNvPBU+4m
	1VnNc7qVZskxcXkc8WpSgdBl5MQjfzRx1gJugyYyjejwiFDBseLCN4t+ja1tmChHfunL
	fz6S0Kg3DbaQa2FXQmAf/iai0j+/zTQpcpVB7UiaZvF5biQ1jdwU7SuFUIPP68Wk97rj
	FqZKxyTPbygF0kt8ylPvFkZBit3x+npnID+1TeFEBj1rz6QL/AOotSpavwrj6c8xIifz
	oLSepirbcw5dq4MAX3WYaJmVY0mqoFha94VjqCwP4BdLKL5+PtH0m0FyaF38y/1d43jM
	TKCA==
X-Gm-Message-State: ALoCoQlSwY40sSb02xv4J8vQhX8dnoaKeyPHGYoGp2QXorO/XM8Ia/r2N+J4FEpwUo0RwgLmWLrl
MIME-Version: 1.0
X-Received: by 10.152.120.73 with SMTP id la9mr3837420lab.3.1375977630993;
	Thu, 08 Aug 2013 09:00:30 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Thu, 8 Aug 2013 09:00:30 -0700 (PDT)
In-Reply-To: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
References: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
Date: Thu, 8 Aug 2013 19:00:30 +0300
Message-ID: <CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
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
X-List-Received-Date: Thu, 08 Aug 2013 16:00:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 8 August 2013 08:48, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Often I see this error when parsing angstrom-next, has anyone seen someth=
ing similar or delved into the reason behind
> it ?
>
> NOTE: Started PRServer with DBfile: /builds1/angstrom/cache/prserv.sqlite=
3, IP: 127.0.0.1, PORT: 45141, PID: 6728
> Parsing recipes...ERROR: ExpansionError during parsing /builds1/angstrom/=
sources/meta-linaro/meta-aarch64/recipes-kernel/linux/linux-linaro_git.bb: =
Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)=
} which triggered exception FetchError: Fetcher failure: Fetch command fail=
ed with exit code 128, output:
> fatal: read error: Connection reset by peer
>
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.

I'm seeing a similar issue[1] on another recipe (libhugetlbfs[2] for instan=
ce).
It's worth mentioning:
- only on my local machine (it doesn't happen on daily builds using
EC2 instances)
- also from meta-linaro/meta-aarch64
- also code pull from git, using SRCPV/AUTOREV

[1] Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcre=
v(d)}
[2] https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dblob=
;f=3Dmeta-aarch64/recipes-extended/libhugetlbfs/libhugetlbfs_2.16.bb;hb=3Dm=
aster

Cheers,
Fathi

