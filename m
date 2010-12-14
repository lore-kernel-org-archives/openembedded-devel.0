Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSYPj-0006Rt-FS
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 18:11:47 +0100
Received: by ywi6 with SMTP id 6so491308ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=gSp6b++vvu+2MBGZHiSAc1nPbwicR1GfD4c1naIMGsw=;
	b=P+tDtu5Vpcllu7vu+svsfAB7wT2x8OzMCL2RB9WmDVf6QtBw82FGWHlRk6LQJ+1eus
	VGg/CpX5Us/lWz+dE9uBmusW2YjXfzJCL+X58DYZdAhWkXaqZpz+GOhYvZvyOjG6aN8k
	ptnEv7cyXTVqO7qFjaPTfMbvCZ4BEkbUzJZM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=VANGM8ENn04zksKB1bc8fAwmvdglqpXu2pknhmF730FxDDBEgflL/wLrquv32VwEmf
	jWEuF62pXeIY4/vs37NeuMBlheAEw7854xdnq/5DSDSbI9Go3wC48bAXhYO3M2Ss1MOc
	w7enQDb7fd/WdZn17a87LhwUxCZ/FpfmC/VnU=
Received: by 10.90.120.17 with SMTP id s17mr6902989agc.193.1292346609910; Tue,
	14 Dec 2010 09:10:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 14 Dec 2010 09:09:49 -0800 (PST)
In-Reply-To: <4D079B88.9010503@dell.com>
References: <4D065431.6080304@dell.com>
	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>
	<4D079B88.9010503@dell.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Dec 2010 09:09:49 -0800
Message-ID: <AANLkTinEpPDQ-hkykiL=YhqiFjH2UB7x=Y7Qtkw4kLd1@mail.gmail.com>
To: Ryan D Phillips <ryan_d_phillips@dell.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Tue, 14 Dec 2010 17:11:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2010 at 8:30 AM, Ryan D Phillips
<ryan_d_phillips@dell.com> wrote:
> On 12/13/2010 2:00 PM, Khem Raj wrote:
>>
>> On Mon, Dec 13, 2010 at 9:13 AM, Ryan D Phillips
>> <ryan_d_phillips@dell.com> =C2=A0wrote:
>>>
>>> =C2=A0SVN over HTTP is a more reliable transport for developers behind
>>> restrictive
>>> proxies.
>>>
>>
>> and how much slower/faster is it when compared to svn protocol ?
>>
>
> The speed depends on which subversion client backend someone is using. HT=
TP
> will be slower than using the svn native protocol, but the serf subversio=
n
> backend will perform parallel fetches.
>
> I would like to see this patch get into the OE tree to make the tree more
> robust to proxies. Currently, this is the only customization I need for t=
he
> projects I work on.

Yes your pie :) but this is not the only problem I guess in OE with
regard to fetching behind the proxies.
you can also use a appending mechanism in your layer and make this
change without changing OE at all


>
> Regards,
> Ryan Phillips
>


