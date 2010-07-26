Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ranjithkannikara@gmail.com>) id 1OdLWZ-0001xR-5v
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 13:07:12 +0200
Received: by gwb15 with SMTP id 15so5529gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 04:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=3jcmZRboQCfAAGYRWg6KVwtl5p8wnbTFRasiOmVSPX8=;
	b=pIXBnuO3w998UEK6T3CevTbNpq5hCDsUO8irkKDxc/ARDA9s4ffxc0j+X3vYVeA8/H
	nK/UW+Nf/YgbRN7zc78EoZwRw8e0xCN34NyugbyerDZSpXrNLCriKAJM0YPewgnUju1c
	htFLAOg5x7zBhujJL/3OojjdJ3Vc951m9yCE8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=qu/NDrVZ4FU+OnoNWZrdtE+1dEopHfngVH9rgLsfgqOeoTo6SzBaAfTdQXpKYyVWYk
	Q2r5AUuQ8ORA75I3nzVun+ciyMULaHWyZuA1VLvV9Zkt7gYD2ob0W0shxqreWG/0zY3w
	6c7zpK3dy3IsfEZXJTpFe9QidO8NntdQVE7mE=
Received: by 10.100.154.8 with SMTP id b8mr7492828ane.189.1280142414241; Mon, 
	26 Jul 2010 04:06:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.181.166 with HTTP; Mon, 26 Jul 2010 04:06:33 -0700 (PDT)
From: ranjith kannikara <ranjithkannikara@gmail.com>
Date: Mon, 26 Jul 2010 16:36:33 +0530
Message-ID: <AANLkTikNf=aE5dENWpkWxT3VY0p0Ap0f75Z=SRzjD=g=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: ranjithkannikara@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake fso-illume-image returns error on gtk+ ..still not working
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
X-List-Received-Date: Mon, 26 Jul 2010 11:07:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 26, 2010 at 4:12 PM, ranjith kannikara <
ranjithkannikara@gmail.com> wrote:

>
>
> On Mon, Jul 26, 2010 at 3:45 PM, Thomas Zimmermann <ml@vdm-design.de>wrote:
>
>> Am Montag 26 Juli 2010, 11:56:07 schrieb ranjith kannikara:
>> > Hi,
>> > I am a newbie in openembedded. I tried bitbake helloworld and it worked.
>> > But when i was running "bitbake fso-illume-image" . It returned an error
>> > that do_compile for gtk+ failed.
>> >
>> > The respective error log entry was
>> >
>> >
>> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
>> > : ignoring invalid character `\001' in script
>> > and
>> >
>> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
>> > : syntax error in VERSION script
>> >
>> > I tried googling and even asked in the irc channel #oe but dint get any
>> > useful information.
>> >
>> > Can any one tell me how to get this error cleared.
>> >
>> > I ran bitbake -crebuild gtk+ also , which ran succesfully at first and
>> when
>> > again i run bitbate fso-illume-image it gave the same error
>> > And now when i run bitbake -crebuild gtk+ that too shows the same error.
>> >
>> > Regards,
>> > Ranjith
>>
>> There is sth strange in the VERSION file of gtk+.
>> You have 2 alternatives:
>> 1) use bash
>
> 2) clean the VERSION file
>>
>
> I am already using bash, Anyway i shall try the next alternative you have
> given.
> Thanks for  your response
>

I am already using bash and i have also tried cleaning the  VERSION file but
the file is created whenever the "bitbake fso-illume-image" is run and it
generates the same error.
Can anyone tell me why is it so. and how to make the build complete.

Regards,
Ranjith

Regards,
> Ranjith
>
>>
>> Greets
>> Thomas
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Ranjith Babu Kannikara
> 0091 9809215273
> Student, Computer science and engg, GEC Thrissur...
> Student developer google ( 2008 GSOC ).
> http://sourceforge.net/users/kannikara
> http://www.ranjithkannikara.blogspot.com/
>



-- 
Ranjith Babu Kannikara
0091 9809215273
Student, Computer science and engg, GEC Thrissur...
Student developer google ( 2008 GSOC ).
http://sourceforge.net/users/kannikara
http://www.ranjithkannikara.blogspot.com/

