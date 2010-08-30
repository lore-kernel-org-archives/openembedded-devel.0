Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Oq8Ao-0004OC-Hx
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 19:30:41 +0200
Received: by qwa26 with SMTP id 26so2846233qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 10:28:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.1.129 with SMTP id 1mr3281351qcf.163.1283189336985; Mon,
	30 Aug 2010 10:28:56 -0700 (PDT)
Received: by 10.229.11.11 with HTTP; Mon, 30 Aug 2010 10:28:56 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008301851400.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
	<alpine.LNX.2.00.1008301851400.5745@asterix.crazy-teaparty.dyndns.org>
Date: Mon, 30 Aug 2010 10:28:56 -0700
Message-ID: <AANLkTimOpx8UcC3F0e+OVggMGSA6e_DK3GdM1g+nXo2=@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFD] increased dependency checking
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
X-List-Received-Date: Mon, 30 Aug 2010 17:30:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have been using a addition that I made to the stamp policy a while ago.
I sent it to the OE list and the bitbake list but I don't think that it was
ever adopted,
eventhough I *think* that I got one or two positive replies to it:

http://article.gmane.org/gmane.comp.handhelds.openembedded/29858/

I would love to see this patch added to bitbake so I don't have to keep it
around
in my repository.

do any of you have any ferther comments?

thanks.


On Mon, Aug 30, 2010 at 9:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:

> Hello Frans,
>
>
> On Sat, 28 Aug 2010, Frans Meulenbroeks wrote:
>
>  Currently if a package in the DEPENDS list is modified, a package that
>> depends on it does not get updated even if explicitly build
>> E.g. when I just updated libexif and after that did a bitbake
>> mythplugins (which has a DEPENDS on libexif) libexif got build but
>> mythplugins did not get rebuild.
>>
>
> First: bitbake isn't make.  So doing it half-automatic is OK.
>
>
>  This is not really proper. E.g. if the lib changed a .h file the build
>> of the using package could fail, but it could easily get unnoticed as
>> one will only become aware of this when forcefully rebuilding that
>> using package.
>>
>
> In my opinion a change of a header is a change of interface, and a change
> of the package the lib is packed into.  This always requires a bump of PR of
> that package.
>
>
>  I think we can do better by better exploiting the timestamp.
>> E.g. what about doing it this way:
>>
>
> So you don't need to exploit the timestamps, you "just" have to keep the
> dependency chain at the moment a package was built.  On the next run you
> compare the dependency chain and rebuild if a package got a new PV-PR.
>
> This information could be kept in the bitbake cache.  When someone changes
>  distro / machine / local conf he has to do the rebuild himself.  after
> all, bitbake isn't make.
>
> Best regards,
>   Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

