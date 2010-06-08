Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLzb5-0000N6-IQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:17:48 +0200
Received: by yxf34 with SMTP id 34so52965yxf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=BzxTEVKu6Y/+L5R00K57+nf+QkKLbzmNQHouyOLODWE=;
	b=Wq9yJfRNbnFuJ0QvEi09Tf+YcRG6izqDNPPJLvpZNMZx37IphOp254+Kb0r1Q1/qQj
	5rif4OnuEoRxcRaewK4ObP0kWsV0yTLRP5paMBKd48muj7Zl5xBXp7E4gzZrRa/mE59X
	UchwBHTEahVOw50N9TifQslLVTzBZ2m6lp35Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=nq4NbQ5nf810NxcKvKPQtAAlcreOpaN1vtxy6bvOmqHAn6UltjVlsu0A5SyM543Q8n
	Q5X7HFVwu+Wn8TMAV/vykemO01J/97AATMwIaOzm5tt/UjLnadcCBZVydgfmz7VZ30QY
	gfxwxfGjw7IpKJfH/qlEJSQRzVeki02fppJok=
Received: by 10.150.213.17 with SMTP id l17mr15360686ybg.37.1276006305079; 
	Tue, 08 Jun 2010 07:11:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 07:11:23 -0700 (PDT)
In-Reply-To: <20100608095356.GF1403@jama>
References: <E1OLvSl-0003gY-9Y@melo.openembedded.org>
	<20100608095356.GF1403@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 07:11:23 -0700
Message-ID: <AANLkTilBquk9xed37qY0OQi-v1YXyWySNLVoKmbKWsx-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Henning Heinold : zziplib: convert to BBCLASSEXTEND and use new patch system
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
X-List-Received-Date: Tue, 08 Jun 2010 14:19:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 2:53 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Jun 08, 2010 at 09:51:15AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 8031ee4953f3510d53022ce0e53bc903d3089f30
>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcom=
mit;h=3D8031ee4953f3510d53022ce0e53bc903d3089f30
>>
>> Author: Henning Heinold <heinold@inf.fu-berlin.de>
>> Date: =A0 Tue Jun =A08 01:34:58 2010 +0200
>>
>> zziplib: convert to BBCLASSEXTEND and use new patch system
>>
>> ---
>>
>> diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zzipli=
b_0.13.49.bb
>> index 3aecb74..256b13d 100644
>> --- a/recipes/zziplib/zziplib_0.13.49.bb
>> +++ b/recipes/zziplib/zziplib_0.13.49.bb
>> @@ -3,8 +3,9 @@ require zziplib.inc
>> =A0PR =3D "r2"
>>
>> =A0SRC_URI +=3D "\
>> - =A0file://zip_c.patch \
>> - =A0file://zziplib-autoconf.patch \
>> + =A0file://zip_c.patch;apply=3Dyes \
>> + =A0file://zziplib-autoconf.patch;apply=3Dyes \
>> + =A0file://automake.patch;apply=3Dyes \
>
> Isn't apply=3Dyes default for .patch, .diff extensions? Why did you need
> to add it?

old habbits. :) I guess it will take some time for devs to get used to
new syntax


>
> Thanks
>
> Regards,
> --
> Jansa 'JaMa' Martin =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


