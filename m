Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SgqJb-00073z-5p
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 06:45:19 +0200
Received: by qcso7 with SMTP id o7so3182964qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=jStikegU9AG7soE6gfTYOyxsf4RaoPXN1os2w0w9efg=;
	b=Rsm5de+vZqTTRerW4wyAOjyOjbhyPUyf8juKOL2EzFK/e/fIuDEe5Ov08wENrXHfCJ
	9kxvgNgqdnEPcqsVKlA9qhXzVHiBqx2NlUEYq0YuAlLLlCLUGYk6c1KE2nWPVvsu6GoJ
	uC+d14h9jttHFGc0oM1qB1GMTNQSebNgU2U1Qa6MGRh74QUenass9M8dDSqOK8gxb+72
	biA/wyD7OG1U6ZLG6pSH+LH1NByfIxauRoY6lZtGXzCaZlHkTN0Z/GldMEkp/YhsgO9o
	9EKRHC9UFK+7W7O4d4bETY7x95XKeyzygArRGDZL72vOAde5/bxdEX4VdkQEgpsdCFc5
	yCvg==
Received: by 10.224.184.82 with SMTP id cj18mr31503013qab.81.1340080475476;
	Mon, 18 Jun 2012 21:34:35 -0700 (PDT)
Received: from [192.168.1.2] (dpc693570121.direcpc.com. [69.35.70.121])
	by mx.google.com with ESMTPS id gy9sm46062470qab.22.2012.06.18.21.34.30
	(version=SSLv3 cipher=OTHER); Mon, 18 Jun 2012 21:34:34 -0700 (PDT)
Message-ID: <4FE00142.30908@gmail.com>
Date: Mon, 18 Jun 2012 21:34:10 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
	<7888297.NxAaM4fFbI@pink>
In-Reply-To: <7888297.NxAaM4fFbI@pink>
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
X-List-Received-Date: Tue, 19 Jun 2012 04:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2012 05:32 PM, Ciprian Ciubotariu wrote:
> On Monday 18 June 2012 11:57:01 Dallas Clement wrote:
>> Lastly, it is possible to avoid the repeated fetching of source
>> packages?  In other words, can the source URI's point to packages in a
>> local file system repository?
> I have extracted some minimal code from the old OE srctree.bbclass file that
> allows us to do minimal rebuilds when developing:
>
> S="/path/to/your/sources/"
> SRC_URI=""
>
> def remove_tasks(deltasks, d):
>      for task in filter(lambda k: d.getVarFlag(k, "task"), d.keys()):
>          deps = d.getVarFlag(task, "deps")
>          for preptask in deltasks:
>              if preptask in deps:
>                  deps.remove(preptask)
>          d.setVarFlag(task, "deps", deps)
>
> #addtask configure after do_setscene
>
> python () {
>      remove_tasks(["do_patch", "do_unpack", "do_fetch"], d)
> }
>
>
> Note that setting S there makes bitbake treat this as the work folder, so
> you'll get oe-core build artifacts there.
>
> Also, you need to bitbake -c cleanall <your-package> to make bitbake forget it

Isnt bitbake -c cleansstate <your-package> a better method of cleaning a 
build you want to do again?

If not does anyone know what the actual difference is?
> has already built your package, and next bitbake <your-package> to perform the
> minimal build.
>
>> Thanks much,
>>
>> Dallas
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




