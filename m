Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SKDvp-0006rW-MR
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Apr 2012 21:19:17 +0200
Received: by qafl39 with SMTP id l39so800785qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2012 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=2JG7Fa3jnNnu/OXRUgeF27fyHzlm2BxSMTcwU8rh1C4=;
	b=LQ+YyXAYgEG2oYgvWGBrQSY7t94F8rGktQqMcah83Z34LVQcOrdeJhQnrddoFyJ0AX
	7nd2SNYg8h1InjxXqlLG+Tqpc+FPMa3x8ug5N/7kDnYAPlD5/fdY3/DbLI89KOzlYb/F
	dYVZ5oGs12tF5pXFBd4FwkU8gvbOXeG1OjwNsHt6tlabj0JtRAAJcLCOgghIqmP0dAYO
	26IgJHa6q5J/6FZGxhpLhRKmbISRIJlDuxL8pstdlrG5W63o4gFHTbY8rTseYOj9lUTe
	B0FePMajg13iO8khTjvEXH8i+g1D8OkXo6Zq+4+EWdYR1vb++KFySp0ZCr/K9ztDuhPG
	N2tw==
Received: by 10.224.202.193 with SMTP id ff1mr23008772qab.36.1334689790790;
	Tue, 17 Apr 2012 12:09:50 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id i8sm18579589qap.0.2012.04.17.12.09.46
	(version=SSLv3 cipher=OTHER); Tue, 17 Apr 2012 12:09:50 -0700 (PDT)
Message-ID: <4F8DBFF3.2060508@gmail.com>
Date: Tue, 17 Apr 2012 12:09:39 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
In-Reply-To: <CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Tue, 17 Apr 2012 19:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 09:13 AM, J. L. wrote:
> <snip>
>
>
>             <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>
>
>
I went for a build on the borrowed machine again but this time I did not 
go into X just stayed in RL3. Then ran bitbake perl, on a clean build 
dir. It is just about to finish building a few steps away but where I 
normally get the segfaults, it has not spit those out. There are no QA 
logs being generated either. So looks like it had/has something to do 
with running X, both systems are running nvidia graphics cards. The 
laptop has a new mobile one, borrowed an old one that is nouveau 
compatible. So both open and closed nvidia drivers were tried. But 
something when in the graphical environment is giving the segfault 
issues I have been seeing. I have not yet verified if killing X on the 
laptop builds and eliminates the issues as well.

Will post back once I have built the kernel on both machines with no X 
running.

Thank you

