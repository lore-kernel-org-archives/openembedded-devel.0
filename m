Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6D970101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:00:50 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id k90so134346942qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=yuqqbClPj//FW4Fz5vvy8h13ah4KYN2T5Ar1icGEmkA=;
	b=RLBHu6UVRIx5wDfllyAzgL+YAlKJzgNFx2PjeBw+W57+GgzyL7kR4KT6qZf4Yc4eXn
	fMxkfBOQkU+vkN3lvNe4Dn0SGCn+WqgK38SSu11reZCrT8hnfLOLyVtpu222NI4f+IvL
	TGppZVzEuhgN77miIwa3aGnD2Cq3YffL/sl/PTcuOA7wL8yaCn7OxIlF/q1dOW2rdtNk
	NFqzudZ6z7eeBphnMDm0FRzwu0tantHlVHFd8LL0hLI3SKf7VTT6BZu9EuILrj4H/KYo
	MRY35Excuq0lECd+TUMgnHF7dC21jLxytO+u+g/hbYBGU56sxiEhoskoCLUeh/6F6JRA
	3KFw==
X-Received: by 10.140.220.136 with SMTP id q130mr35583617qhb.24.1450800051235; 
	Tue, 22 Dec 2015 08:00:51 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	u202sm16380571qka.10.2015.12.22.08.00.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 08:00:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1450758431-18974-1-git-send-email-twoerner@gmail.com>
	<1450758431-18974-2-git-send-email-twoerner@gmail.com>
	<CAJ86T=X7-FxDqTZ1fJgx-sQaVUjM+Xe-E_QXe1QfXfgQMptLww@mail.gmail.com>
	<56796C6B.9070002@gmail.com> <20151222154940.GA2556@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <567973AF.2090905@gmail.com>
Date: Tue, 22 Dec 2015 11:00:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151222154940.GA2556@jama>
Subject: Re: [meta-oe][PATCH v3 1/1] nodejs: cleanup and update
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
X-List-Received-Date: Tue, 22 Dec 2015 16:00:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Martin,

On 12/22/15 10:49, Martin Jansa wrote:
>> That was what I was trying to do :-) I don't have much experience in
>> this, I've been asking on IRC and the mailing lists, and there aren't
>> many examples to copy. I think the following works:
>>
>>     COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
>>     COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
>>     COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
>>
>> ?
> It's not nice but you can use:
> COMPATIBLE_MACHINE_arm = "(.*)"
> COMPATIBLE_MACHINE_armv4 = "(-)"
> COMPATIBLE_MACHINE_armv5 = "(-)"
> COMPATIBLE_MACHINE_mips64 = "(-)"
>
> If these 3 are the only 3 unsupported, then you can drop override for
> x86, x86-64, arm and change the default to (.*).

Okay, those look like they might work too. I build-tested[1] the
COMPATIBLE_MACHINE lines I proposed and the build did what I wanted it
to do against the 12 I tried. I get the feeling the ones I proposed
might do better against things like "armv5te" and those sorts of
variants? But I'm happy to send a v5 if yours (or something else) are
better.

Best regards,
    Trevor




[1] I run-tested them yesterday, so I probably don't have to re-do that
test

