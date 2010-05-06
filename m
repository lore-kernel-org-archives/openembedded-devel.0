Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>) id 1O9xpx-0002Mw-9s
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 11:57:46 +0200
Received: by gwj23 with SMTP id 23so2460999gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 02:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=WAkTEIR0Jf/sVd5pajKutHRjQhZ0iOdBpOfZ71dYw1s=;
	b=Zn80sy9DJwQA8y3AzdNMFFK9k6oLZQaIlpj8xQ5Q38beCYVQ2dnF+efTAgPbID/YhG
	2QD1yUYsH2lGHGTd56ACY2QaTMQYwcecB5RwQ3kbK+ZksOkdryF1B4sEZ+qfq9qvMtP0
	Jt9pA/dq+0111ecz4ZSpe81XXV9t+K+XsVBlo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BgTNdkWftAdUivX7mcJ6NY1gsD0hlf5vvPverPp1ye02sLQV33Fxc/J5UPZ/2vddvO
	BCiG1uH68zhesuCLyM0kS6w6HO5XhFy9x/aodQ7kNDO0mA2TZhu74GvAaUUs9fI9+MwF
	AFoH4BxgzDrRgyW6cAAE3qovHlAFOe5TXkgwc=
Received: by 10.150.209.2 with SMTP id h2mr1203323ybg.36.1273139635496; Thu, 
	06 May 2010 02:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.124.11 with HTTP; Thu, 6 May 2010 02:53:35 -0700 (PDT)
In-Reply-To: <4BDFC996.5060606@eukrea.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com> 
	<hr3im2$gf6$1@dough.gmane.org>
	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
	<hr4t3j$tds$1@dough.gmane.org>
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
	<4BD84B08.4000300@eukrea.com>
	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
	<4BDFC996.5060606@eukrea.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Thu, 6 May 2010 15:23:35 +0530
Message-ID: <AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Thu, 06 May 2010 09:57:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 4, 2010 at 12:45 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> Le 04/05/2010 09:02, Abhishek Sharma a =E9crit :
>
>  I am finished making the image which has a qtehelloworld program
>> "installed"
>> in it. But the moment I run<qtehelloworld -qws>  in the qemu machine i g=
et
>> the error
>> QFontDatabase: Cannot find font directory /usr/lib/fonts.
>>
>> I googled the error and in most of the cases it was shown that while
>> "configuring" qte the prefix variable was not properly set. What step
>> should
>> i take next?? Do i need to change any recipe of qt embedded or is this
>> some
>> different problem.
>>
>>  add "qt4-embedded-fonts" to your IMAGE_INSTALL
>
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the solution Eric. I was also facing problems regarding tslib,
which u answered on the irc. I did
IMAGE_INSTALL +=3D "qt4-embedded-plugin-mousedriver-tslib"

but still when I am running the qtehelloworld app on the created image in
qemu, everything is being "displayed" fine but the mouse pointer is not
moving when I try it to, in other words the touch screen ain't working with
the image while it works when i try to run a preconfigured opie-image.
Please help.

Thank You.

--=20
Abhishek Sharma

