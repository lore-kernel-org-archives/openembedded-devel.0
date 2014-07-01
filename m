Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id A91E360809
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 19:28:49 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id hw13so8164902qab.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=soJYE47NNAAXPZs7b6MIs9nBvUF4Bu5zQmyOYSA5E3A=;
	b=n2RWqLM37VOHCmMY9PvfoPaGKcMI/N94f6C6DGbE8u11DBGmla7IZkVeuhjPv05zdd
	DZ+wheGBTF4hqFJumyvix3723LuPH8Fc19n5j/K5+cXi1cbWzqAk2ZFwlROr6z7qA1X4
	ZzlVHPMqs1K03lEvln5RQlBRdU4HvpK1GsaYUfRvqA/yjvnl4DqIQAEUE22I4CsCuiIa
	3G3qbwbwAmUr1q/ad5X1jxQiDCjITiJZkrqRJhZCUePUoVTlBBBAgd29IMid+D2fdZKL
	1K8wOTzqDHEa6akVLKujRv2fjjm/Qgf1mvXKqQMhzrN5GfNW9AhiVuWXl4kLpjurL3DT
	r3dQ==
MIME-Version: 1.0
X-Received: by 10.224.152.5 with SMTP id e5mr75275233qaw.65.1404242931175;
	Tue, 01 Jul 2014 12:28:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.140.108.73 with HTTP; Tue, 1 Jul 2014 12:28:51 -0700 (PDT)
In-Reply-To: <CAOd_LFxT6M-cCu4PJ9AwTZG6mTQihEJyS7mwRNonzBHZcyyq9Q@mail.gmail.com>
References: <CAOd_LFx-3ko_BrD_9VpPj-oairm8XQrfoWzq8JEWmcsFQuK_GQ@mail.gmail.com>
	<CAOd_LFxT6M-cCu4PJ9AwTZG6mTQihEJyS7mwRNonzBHZcyyq9Q@mail.gmail.com>
Date: Tue, 1 Jul 2014 16:28:51 -0300
X-Google-Sender-Auth: BaT86c933yTTY2zSq7TXBiUiZpc
Message-ID: <CAP9ODKp_ZtoFw_bCPRR_AmerTXMLh6eV_ycjaz0HoP3YQt9GyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][daisy] pull request rng-tools, ptpd
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
X-List-Received-Date: Tue, 01 Jul 2014 19:28:51 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Jul 1, 2014 at 4:16 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> (added branch name)
>
> The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:
>
>   live555: fix fetch problem (2014-06-23 12:58:31 +0200)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge-2014-07-01
>
> for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>
>   rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>
> ----------------------------------------------------------------
> Balasubramanian, Aparna (1):
>       rng-tools: Update rng-tools version to 4
>
> Franklin Cooper Jr (1):
>       ptpd: update to 2.3.0
>
>  meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> | 37 -------------------------------------
>  meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
> | 21 +++++++++++----------
>  meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
>  3 files changed, 13 insertions(+), 49 deletions(-)
>  delete mode 100644
> meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
>  rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =>
> ptpd_2.3.0.bb} (56%)
>  rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb =>
> rng-tools_4.bb} (84%)
>
> On Tue, Jul 1, 2014 at 3:13 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:
>>
>>   live555: fix fetch problem (2014-06-23 12:58:31 +0200)
>>
>> are available in the git repository at:
>>
>>   https://github.com/cbrake/meta-openembedded.git
>>
>> for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:
>>
>>   rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)
>>
>> ----------------------------------------------------------------
>> Balasubramanian, Aparna (1):
>>       rng-tools: Update rng-tools version to 4
>>
>> Franklin Cooper Jr (1):
>>       ptpd: update to 2.3.0
>>
>>  meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
>> | 37 -------------------------------------
>>  meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
>> | 21 +++++++++++----------
>>  meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
>>  3 files changed, 13 insertions(+), 49 deletions(-)
>
>
>
> --
> =================
> http://bec-systems.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

