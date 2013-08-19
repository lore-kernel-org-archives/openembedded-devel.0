Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2082569686
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 05:10:04 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id ea20so3078113lab.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 22:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=OuYampWGvnaOURS+59pgXv/wka/Td+8p7fi+ergzoMU=;
	b=Mst4Fjq4hRkQtuO+j5nNxoVs/DFkMU3Ay4t6eAkvAl3D24gkuOcE0fsIubWVq5osFE
	IkJ28BAMbIyVp0La8pcSA2hEBFQVJhLjvIli0znveDBWE6dBjnWlOuvJ7o9+CzBJP3PY
	pO31oNTkLKHKQxUp7s9Cu6JeEX+TmfLImaNx8nR1ps+INqqoYPBmMD5alLp7TCOWmRmu
	4qnguMa+V/JI7dmI9krLVQX3u3NZTbABbXC9GXMaPOfkbb/o32CsjtQuXLgu5oouf21j
	OG0Ojx5ifvBIpFGxUFHxxROdjTwmz/22Eig49CpKUECXUbQ/UQeCYJoGClyH22BtKpnO
	GkbA==
X-Gm-Message-State: ALoCoQnwgdGHLCMnCU+2iGnHz2IO344B0lyBPxfnXcj5tYFwnTKUsugLIwKEE9ccNsuwMCLlHFb7
MIME-Version: 1.0
X-Received: by 10.112.72.229 with SMTP id g5mr10172377lbv.10.1376889004911;
	Sun, 18 Aug 2013 22:10:04 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Sun, 18 Aug 2013 22:10:04 -0700 (PDT)
In-Reply-To: <5211762A.3020201@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
	<a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
	<CAGNsrLDyg3Rq0Gk+sG8Vp4y0i+=me2eTjadW2tt4dyU_qU0_cw@mail.gmail.com>
	<5211762A.3020201@windriver.com>
Date: Mon, 19 Aug 2013 08:10:04 +0300
Message-ID: <CAGNsrLDdKhgixhCE+1B8KgYGxw1ySpyWWB99WiERsoTDDsgGrA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Mon, 19 Aug 2013 05:10:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 August 2013 04:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 08/18/2013 02:22 PM, Fathi Boudra wrote:
>>
>> Hi,
>>
>> On 14 August 2013 09:30, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>>
>>> This layer contains filesystem related recipes.
>>
>> My build started to fail with:
>> ERROR: Nothing RPROVIDES 'sshfs-fuse'
>>
>> After adding meta-filesystems layer, I've got another error:
>> ERROR: ParseError at
>>
>> meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:8:
>> Could not inherit file classes/gitpkgv.bbclass
>
>
> As README said, meta-filesystems layer depends on:
>
>
> +This layer depends on:
> +
> +  URI: git://git.openembedded.org/bitbake
> +  branch: master
> +
> +  URI: git://git.openembedded.org/openembedded-core
> +  layers: meta
> +  branch: master
> +
> +  URI: git://git.openembedded.org/meta-openembedded
> +  layers: meta-oe
>
> gitpkgv.bbclass is in meta-oe.

I had meta-oe in my conf. The root cause of my issue was a  typo...

Sorry for the noise.

