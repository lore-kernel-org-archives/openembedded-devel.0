Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TTnt2-0004FP-SK
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 07:04:16 +0100
Received: by mail-la0-f47.google.com with SMTP id h5so1519247lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 22:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hNrmBCg9ztEB0ApdG/zHd7lFbLRZ0bnrS+MRivGUil0=;
	b=jwRcRGBaQWeQpakohBpjO4K8tjsQACHd4K2dpBu7MLlfYkIGKdBLZzjpZ28wN9cipG
	MyDlEhiLMKLVyH42FpcEser390W19mRj73P04l3pJjs+H6B4ggQ5Vr9zbtk3r0dmxIY5
	WLKyyvsmkNn3nXO16FHnn4B2HERHGqMHD8GpdTSVYO6zYV5gT22c5iLcb6hXz9YovTpv
	vsOxZppkWz3OybKwNQudESYpSvxlNp4IKekzgpMJoq1dVXLhKri//8QIVLMUsybFqcTj
	zJcfbcOFtvupvTO/McplWTiUFkI02Cza4ada8LtgqimfVB2/D3p4/tNZ2E+VsE/541s7
	zQcw==
Received: by 10.112.30.65 with SMTP id q1mr14417249lbh.83.1351749038784;
	Wed, 31 Oct 2012 22:50:38 -0700 (PDT)
Received: from [192.168.1.101] ([37.191.128.59])
	by mx.google.com with ESMTPS id ps11sm1878189lab.12.2012.10.31.22.50.36
	(version=SSLv3 cipher=OTHER); Wed, 31 Oct 2012 22:50:37 -0700 (PDT)
Message-ID: <50920DAB.7070206@gmail.com>
Date: Thu, 01 Nov 2012 06:50:35 +0100
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121024 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1351009220-30119-4-git-send-email-morgan.little@windriver.com>
	<3989989.S5U52SNN0R@helios>
In-Reply-To: <3989989.S5U52SNN0R@helios>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Thu, 01 Nov 2012 06:04:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/12 02:08, Paul Eggleton wrote:
> On Tuesday 23 October 2012 12:20:20 Morgan Little wrote:
>> -PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
> ...
>> +PACKAGES += "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
> I'm not particularly happy with this change. Apart from the fact that it
> wasn't mentioned in the commit message, it breaks any recipe that depends upon
> the previous ntpdate package. Could we go back to the old ntpdate name for the
> package or at the very least provide an RPROVIDES for the old name? I'm happy
> to submit a patch to do this once there is agreement either way.
>
> Cheers,
> Paul
>
I agree with you. Also find it kind of strange to change from ntpdate to 
ntp-date, as the universally known name of that module is ntpdate. Don't 
really see the rational of changing that to ntp-date in the recipe.

- Martin


