Received: from [213.4.149.66] (helo=ctsmtpout3.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <joaquinduran@adtelecom.es>) id 1Gh2aH-00037B-HW
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Nov 2006 12:24:09 +0100
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout3.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4541EE940014A0AC for openembedded-devel@lists.openembedded.org;
	Mon, 6 Nov 2006 12:22:52 +0100
Message-ID: <454F2893.50107@adtelecom.es>
Date: Mon, 06 Nov 2006 12:20:35 +0000
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>	<B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>
	<37367b3a0611060252qf813f34y9db9bddb4ae60cb2@mail.gmail.com>
In-Reply-To: <37367b3a0611060252qf813f34y9db9bddb4ae60cb2@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Nov 2006 11:24:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alan,

I think that the library Xext is not installed. The dependency line of 
the file should be similar to:

DEPENDS = "zlib jpeg libpng libxext"

Well, I'm trying to build FLTK with support for anti aliased fonts. ASAP 
the build image is created successfully, I'll submit the patch.

Thanks and Best Regards,
Joaquim Duran



En/na Alan Carvalho de Assis ha escrit:
> Hi Holger,
> 
> On 11/5/06, Holger Freyther <freyther@gmx.net> wrote:
>> because you inherit gpe.bbclass after setting the SRC_URI and the
>> SRC_URI will be overwritten. Take a look at the gpe.bbclass
>>
> 
> Sure, it solve the first one problem.
> 
> Do you have some idea to solve these undefined references in libfltk.so:
> undefined reference to `XUnsetICFocus'
> undefined reference to `XGetIMValues'
> undefined reference to `XSetICValues'
> undefined reference to `Xutf8LookupString'
> undefined reference to `XSetICFocus'
> undefined reference to `XVaCreateNestedList'
> 
>> h.
>>
> 
> Cheers,
> 
>> --
>> Holger 'zecke' Freyther
>> geek, QA monkey, OpenEmbedded Engineer
>>
> 
> Alan
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



