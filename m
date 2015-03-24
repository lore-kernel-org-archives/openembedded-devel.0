Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 463CC73A99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 16:36:22 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so1946674iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=N9Fm/mgkBcXH4Nc1cVgdxmcn4RXqej9vFUDtIfeqXxE=;
	b=Hqy7lx4WYir2yAhxgEkcyJc/34sf7HfYmpwO7//318APT5CBEDriLki9C8yl8lEPVV
	GW4w9cMd7HU1Mh3nzHLtZxlzV0VPkVQNzuBNPzfRHMZMfyPXINr6ijLywqb4AOIxGT7D
	r9+tJs6BVMTEkUW9+DDeR1rn1VhVxStQZ3LxDaYqnOXTkylsWPQJgkki2A3Z1qNbaBrB
	bx7CAeHKkm6bcv8Uh2ns2niilbQM+x2UZeTMreg8OLlya9L5isfSNFzak7o1AdfLkzRw
	xXnsoazEI+14SbesckmJIpDpyy+JehF7zZMwjvl+v3XbwJ6CrTPydxt7yEARMMwn75q8
	/ubQ==
MIME-Version: 1.0
X-Received: by 10.42.67.19 with SMTP id r19mr2153153ici.30.1427214983912; Tue,
	24 Mar 2015 09:36:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Tue, 24 Mar 2015 09:36:23 -0700 (PDT)
In-Reply-To: <8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>
References: <1427045315-13142-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKp=x2GpWVZLB1kf2CjZpMCuBfGZxYuOAQRUsx-D+uRiVw@mail.gmail.com>
	<CAMKF1sqm5ARrWih-TgnzFXgEGXR97o=iUU_xR-fvp_bLC=SyEQ@mail.gmail.com>
	<CAP9ODKoFdepGX7OZu8XxMQVr-ssUCG_Ndyyj6GROOACViiMhEw@mail.gmail.com>
	<8A51FBCF-FD07-4A7A-9829-14964E58A121@gmail.com>
Date: Tue, 24 Mar 2015 13:36:23 -0300
X-Google-Sender-Auth: TOZHU-_myBKGr24NHzh6lDg_E44
Message-ID: <CAP9ODKqL1d447vjyEv6wQvJzS_uz1wFFmgOOjh+MKv83xsjTkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: meta-browser][PATCH V2] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Tue, 24 Mar 2015 16:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2015 at 12:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 24, 2015, at 4:56 AM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
>>
>>
>> I'd prefer to do it once and avoid adding another recipe and handle
>> same problems we had solved there. Also this allows for example the
>> use of i.MX patches on meta-fsl-arm.
>
> My usecase is not i.MX moreover I do not have i.MX h/w to test as well, c=
urrent set work fine for the architectures I need it for, if someone wants =
to help in testing on other machines, its welcome. however as I said, it wi=
ll be in subsequent work to unite both recipes due to the overhead as expla=
ined in last email.

I am not asking you to test cef3 on i.MX, this is fine. I don't want
another giant build recipe with duplication.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

