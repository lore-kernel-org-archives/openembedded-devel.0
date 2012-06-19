Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SgqVk-0007JD-2t
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 06:57:52 +0200
Received: by qcso7 with SMTP id o7so3185769qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 21:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=fWnyDjOY/zvfCeS61JTn9TjUChfMzbO6RuEYLly4IdI=;
	b=TZHUdUF46ZZUTZha6i8IYlTZ3SzhDuq74JOSTJfqZiL71Lqd276LoC2jhfCc7ZkG6S
	GL+9qXLd4xjT3CH547262PN3Bcfl7PXFDj2wohpOc4C6b/6Pg8kc1pwYNsukvYziS5Bj
	8g9T8BmzJNUEfr1iPy8QamHLyIOzSABJmuJa01zxkalrdaEYv1jdulVhWu3zmtppOK1F
	JgCJgJWCnykmfOyQDf+84tip3KmmOncqbiqxpLSJ/dM0FKXBEQcjntJqGefjQn2KV+H1
	38RTJU4lCWSkgeXfBgZMdoI5RYS7bHaujgaoF0aIIa88vUq7dDxWgr5QLSJiYE3QK0jb
	RgJg==
Received: by 10.229.137.145 with SMTP id w17mr398253qct.27.1340081228813;
	Mon, 18 Jun 2012 21:47:08 -0700 (PDT)
Received: from [192.168.1.2] (dpc693570121.direcpc.com. [69.35.70.121])
	by mx.google.com with ESMTPS id x14sm35896231qac.1.2012.06.18.21.47.02
	(version=SSLv3 cipher=OTHER); Mon, 18 Jun 2012 21:47:08 -0700 (PDT)
Message-ID: <4FE00430.2070307@gmail.com>
Date: Mon, 18 Jun 2012 21:46:40 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
	<7888297.NxAaM4fFbI@pink> <4FE00142.30908@gmail.com>
	<CAMKF1sr6ekWbucQzJD+uM7ToH2mZfQ9yYVOPbhOKr8uLZjCTrQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr6ekWbucQzJD+uM7ToH2mZfQ9yYVOPbhOKr8uLZjCTrQ@mail.gmail.com>
Subject: Re: Package selection
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
X-List-Received-Date: Tue, 19 Jun 2012 04:57:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2012 09:40 PM, Khem Raj wrote:
> On Mon, Jun 18, 2012 at 9:34 PM, j <vwyodapink@gmail.com> wrote:
>>> Also, you need to bitbake -c cleanall <your-package> to make bitbake
>>> forget it
>>
>> Isnt bitbake -c cleansstate <your-package> a better method of cleaning a
>> build you want to do again?
>>
>> If not does anyone know what the actual difference is?
> clean - cleans the builddir
> cleansstate - cleans builddir as well as shared state copy of this
> package if any
> cleanall - clean builddir, shared state and the downloaded src tar
> file from DL_DIR
>
> you usually only should need clean in general. cleansstate should be seldom used
> but its preferred to see why cleansstate is needed and if there is
> anything wrong
> with sstate we would like to know.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Thanks Khem, been wondering that info just had not looked into it as of 
yet. Makes perfect sense now.



