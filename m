Received: from [213.4.149.66] (helo=ctsmtpout3.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GhPmB-0001V4-Df
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Nov 2006 13:09:59 +0100
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout3.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4541EE94001827EC for openembedded-devel@lists.openembedded.org;
	Tue, 7 Nov 2006 13:08:36 +0100
Message-ID: <455084CF.9020102@adtelecom.es>
Date: Tue, 07 Nov 2006 13:06:23 +0000
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>	<B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>	<37367b3a0611060252qf813f34y9db9bddb4ae60cb2@mail.gmail.com>	<454F2893.50107@adtelecom.es>
	<37367b3a0611070219n3fb80edcva6572bcb8baa993@mail.gmail.com>
In-Reply-To: <37367b3a0611070219n3fb80edcva6572bcb8baa993@mail.gmail.com>
Subject: Re: Problems creating a bitbake package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2006 12:09:59 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alan,

Yesterday, I submitted the patch, but it has not been integrated with 
the repository (http://bugs.openembedded.org/show_bug.cgi?id=1555).

No, I'm not an FLTK programmer. I would like to use FLTK because in the 
company that I'm working, it's interested in develop a portable 
oscilloscope. I needed a plot widget to represent the data acquired, and 
FLTK had one. I've write a prototype but seen the philosophy of the 
FTLK, I'll not use if I can.

Some days ago I compiled qwt4.2 rc1 with qte 2.3.10 and qpe1. I'm 
thinking to switch this environment. Next steps:
- Port QWT 4.2.0 to qte2
- Make a step over and use QTopia 4.2 (that someone else ported) and 
port qwt 5 to qtopia 4.2 (released today, I think).

Joaquim Duran


En/na Alan Carvalho de Assis ha escrit:
> Hi Joaquim,
> 
> On 11/6/06, Joaquim Duran <joaquinduran@adtelecom.es> wrote:
>> Alan,
>>
>> I think that the library Xext is not installed. The dependency line of
>> the file should be similar to:
>>
>> DEPENDS = "zlib jpeg libpng libxext"
>>
> 
> Thank you very much.
> 
>> Well, I'm trying to build FLTK with support for anti aliased fonts. ASAP
>> the build image is created successfully, I'll submit the patch.
>>
> 
> Sure, good work. Anyway after I will port ipatience to use GTK because
> everything in gpe use it and FLTK is not so much used.
> 
> Joaquim, do you are a FLTK programmer?
> 
>> Thanks and Best Regards,
> 
> Cheers,
> 
>> Joaquim Duran
>>
> 
> Alan
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



