Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NTr4C-0005lp-Jo
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 07:14:29 +0100
Received: by iwn40 with SMTP id 40so4017955iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XZHCUH0XewpVOSlzDC3TfcwgHmIdaXQ6v2uu55nGlic=;
	b=OYM4G8avL2upPPVuT52TSmZya1IpjWRrr9tfKxmyWienaGq7raLqup+fdt0Edt8icI
	nrm8ec/GlL4kswTt5pddn8AmBZmPF0cenKPW/MvkJWr6gsA2bhfSon2mWHSbifgPwDSU
	hQnsInTiXq2XxhVTk/9SOBE6ZgqYBaWLLQFQw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R7axHdta8IUJ+eT5VB5++wtqMVQ7Aa2n9HLt6ZNIwGb1rkH+jbRgx0t1vKSZMk24fU
	n04z/F6pmrloYuCDA6C5DeG228dBXLBGAYer5im/pqUZvLCiBWMi7Y8bfsF3UdfC8onI
	v24wPA7pfl2HAviuKb7Ea5SU541Y5nf83uUMw=
MIME-Version: 1.0
Received: by 10.231.170.136 with SMTP id d8mr2010821ibz.17.1263103936534; Sat, 
	09 Jan 2010 22:12:16 -0800 (PST)
In-Reply-To: <20100109000256.GA31902@denix.org>
References: <1262985279.3445.2.camel@pblack-ubuntu>
	<20100109000256.GA31902@denix.org>
Date: Sat, 9 Jan 2010 22:12:16 -0800
Message-ID: <19c1b8a91001092212o5e37740ak774b7a0680fd70e9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: small fix for u-boot on DM365 DVM
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
X-List-Received-Date: Sun, 10 Jan 2010 06:14:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2010 at 4:02 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Jan 08, 2010 at 04:14:39PM -0500, Phil Black wrote:
>> The machine conf for the davinci dm365 EVM board was wrong. =A0This patc=
h
>> fixes it.
>>
>> diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm365-evm.conf
>> index 1fd5123..5a51616 100644
>> --- a/conf/machine/dm365-evm.conf
>> +++ b/conf/machine/dm365-evm.conf
>> @@ -5,4 +5,4 @@
>> =A0require conf/machine/include/davinci.inc
>> =A0require conf/machine/include/dm365.inc
>>
>> -UBOOT_MACHINE =3D "davinci_dm365evm_config"
>> +UBOOT_MACHINE =3D "davinci_dm365_evm_config"
>
> Unfortunately, it's not that simple. U-boot 2009.08 and later uses dm365e=
vm
> name, while older versions use dm365_evm name. The latest update to u-boo=
t
> recipe changed PV forward to 2009.11-rc1, while SRCREV was changed backwa=
rds
> to 2009.06-rc0, which is not correct. So, the actual code was downgraded,=
 but
> the name change was not reflected in the conf file...
> The above inconsistency needs to be changed first before changing the nam=
e.

I should probably stay out of u-boot :) feel free to revert.

>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


