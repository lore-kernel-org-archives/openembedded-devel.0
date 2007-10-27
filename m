Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IlpZ8-0003Q5-2f
	for openembedded-devel@openembedded.org; Sat, 27 Oct 2007 19:35:18 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9RHRbUo015612 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2007 19:27:38 +0200
Message-ID: <47237509.8070405@student.utwente.nl>
Date: Sat, 27 Oct 2007 19:27:37 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <471FC1C0.4010103@linux.it>
	<20071025001926.GA14645@lenovo>	<472047C3.20208@student.utwente.nl>
	<20071025121153.GA8231@lenovo>	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>	<20071026134528.GA6182@lenovo>
	<1193483219.6376.100.camel@toontown> <20071027153928.GA6118@lenovo>
In-Reply-To: <20071027153928.GA6118@lenovo>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: getting started - docbook
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
X-List-Received-Date: Sat, 27 Oct 2007 17:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:
> On Sat, Oct 27, 2007 at 01:06:59PM +0200, Tobias Pflug wrote:
>> on 1: 
>> with big picture I mean there should be a description of the 
>> "system" with its main components. Currently i think there is too
>> little of that, and too many use-cases. ("In order to change xyz,
>> apply abc to 123").
> 
> I finished a rough draft of getting started this morning.  I am going
> to let it sit for a week before looking at it again.  Then I will
> rework as needed and submitte for review.
> 
> In the mean time I am starting on a introduction chapter.  This will
> be a very high level overview.  Below is a first stab at the outline.

Even if 99.9% if the people use OE to build linux stuff, it is able to
build nonlinux targets like bare-metal stuff for the msp430
microcontroller and things like arm-wince-pe or arm-apple-darwin.

> 1.1. Linux ................................................
>       1.1.1. Linux Overview ...................
>       1.1.2. Linux Arctoture ...................

^ typo

regards,

Koen

>       1.1.3. Linux Development Model..
>       1.1.4. Linux Open Source..............
> 1.2. Embedded Device ............................
>       1.2.1. Device Architure..................
>       1.2.2. Processor..............................
>       1.2.3. Storage.................................
>       1.2.4. Device..................................
> 1.3. Linux Distribution............................
>       1.3.1. Kernel ..................................
>       1.3.2. Userspace.............................
>       1.3.3. File System ..........................
>       1.3.4. Updating ..............................
> 1.4. System startup ..................................
>       ...
> 1.5. Host/Target .......................................
>       ...
> 1.6. Overview ..........................................
> 1.7. History..............................................
> 
>> For starters a diagram would do some good. I did one for a small
>> report at work which however is rather incomplete. I should polish
>> that a little. Depicting the interaction between bitbake, the different
>> config file sets, internet resources, distributions and images. I think
>> all of this should be presented before even starting to elaborate on
>> how to build something
> 
> Diagrams may take awhile;(  I never seem to have the time to learn how
> to make them.
>  
>> on 2:
>> To me the biggest black box is still bitbake. The documentation
>> seems somewhat lacking and I have a bad feeling about carrying out tasks
>> where I don't quite understand what's going on. 
>>
>> I still don't quite get how the dependency checking works and when
>> changes to specific files will trigger an automatic rebuild and when
>> I'll have to trigger that myself with a -crebuild / or maybe even 
>> by fiddling with timestamps? Although my guts tell me that the latter
>> is a NO-NO.
> 
> I have been avoiding these types of details until later sections. 
> 
>  
>> David, I gather you are still working on the setup section? Maybe I
>> could try contributing a "big picture" description, however my
>> text will certainly require a lot of refinement from those with
>> more background knowledge. 
> 
> At this point, what would be most helpful is looking at and tearing
> apart the suggestions and drafts I submit;)  Between the introduction
> and the getting started we should be able to provide a good big
> picture.  Additionally, we can define terms which can be used
> consistently through the rest of the documentation.
> 
> 
>> David, will you also write on how to set up an OEDEV directory sturcure/
>> sharing of working directories etc? Personally I am using the structure
>> that cliff presented on the ml (I think) at some point which I find
>> comfortable.
> 
> Again this will wait to a later chapter.  I think we will have a better
> idea of the full outline after the introduction chapter is more filled
> in.
> 
> Thanks
> David Farning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHI3UJMkyGM64RGpERAgSpAJ9GER7+9ldWT9zP6TaIoC0zHvGsgwCeIvam
zHz0AOpfLC9DRQOAb/0WQzY=
=SeHo
-----END PGP SIGNATURE-----


