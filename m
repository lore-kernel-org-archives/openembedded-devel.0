Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QchR0-000262-7d
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 19:23:18 +0200
Received: by pvf24 with SMTP id 24so2910551pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7xMDeper/m2m+wIm6NSEW8rUKE4dDE66wZhIrh0fL18=;
	b=VBV78np2XBw7H9iWmKFpXE9AV0RJ+ScTvtUd598qPD++10cAh4Vb+Ca89p9BiNCsfZ
	FZ1UOSDE9mJWFzpSt+Xc2D1D4VvCEKzoGlP2aUoPU0Dmhbqswafja0p5zcLGOkOcpgQC
	TiO431/Z/meUzbv8fCKg+LREcSJXZqPrudJYc=
Received: by 10.142.177.1 with SMTP id z1mr1450099wfe.174.1309540769574;
	Fri, 01 Jul 2011 10:19:29 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d15sm2198534wfl.18.2011.07.01.10.19.28
	(version=SSLv3 cipher=OTHER); Fri, 01 Jul 2011 10:19:29 -0700 (PDT)
Message-ID: <4E0E019F.8050007@gmail.com>
Date: Fri, 01 Jul 2011 10:19:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
	<1309510049.4418.10.camel@mattotaupa>
In-Reply-To: <1309510049.4418.10.camel@mattotaupa>
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 17:23:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2011 01:47 AM, Paul Menzel wrote:
> Am Donnerstag, den 30.06.2011, 22:38 -0700 schrieb Khem Raj:
>
> As far as I know the `bb` extension should be omitted in the commit
> summary?
>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> Does systemd build for you with this patch and uClibc?

ofcourse

>
>> ---
>>   .../systemd/systemd/paper-over-mkostemp.patch      |   19 +++++++++++++++++++
>>   meta-oe/recipes-core/systemd/systemd_git.bb        |    3 ++-
>>   2 files changed, 21 insertions(+), 1 deletions(-)
>>   create mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>>
>> diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>> new file mode 100644
>> index 0000000..ca10440
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
>> @@ -0,0 +1,19 @@
>> +uclibc does not have mkostemp() so we redefine it to use mkstemp()
>> +
>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> Is that patch for upstream inclusion?

not yet

>
> […]
>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



