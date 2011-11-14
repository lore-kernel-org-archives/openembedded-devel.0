Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RQ52G-0003Ov-LA for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 23:29:55 +0100
Received: by wyg8 with SMTP id 8so2040748wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 14:23:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.205.130 with SMTP id fq2mr17232863wbb.17.1321309410836;
	Mon, 14 Nov 2011 14:23:30 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Mon, 14 Nov 2011 14:23:30 -0800 (PST)
In-Reply-To: <CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
Date: Mon, 14 Nov 2011 16:23:30 -0600
Message-ID: <CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 22:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, so I fight a install of gcc-4.6 onto ubuntu lts and same error. I
first tried for weeks to get Compulab CM-T35 stuff to work per their
instructions. Then I get the scripts and all seems well, now this. I
have spent a month on trying to build a cm-t35 so I can then add in
additional functionality. At ever turn it fails.  4 weeks and nothing.

I mean, how hard can this be?


On Mon, Nov 14, 2011 at 12:59 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
> <david.thomas@microbee-systems.com> wrote:
>> I am getting a gcc error
>>
>> cc1: error: -Werror=unused-but-set-variable: No option -Wunused-but-set-variable
>>
>> Using the Angstrom scripts I can run machine=beagleboard and complete.
>> However, machine=cm-t35 with a cm-t35.conf file throws this error.
>>
>> I am having to guess that the machine file is all that was required,
>> it seems to pich all the right arch, etc.
>>
>> I had asked on Angstrom for any CM-T35 related info to no avail...
>
> This error is on by default for the compiler for OE now. You can get
> around it by
>
> 1) Fixing the (potential) errors in the source code
> 2) Turning off the error in the build (EXTRA_CFLAGS =
> "-Wno-error=unused-but-set-variable" or something similiar)
>
> -M
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


