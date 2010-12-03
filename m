Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1POVkX-00005G-5F
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 14:32:34 +0100
Received: by qyk36 with SMTP id 36so6515133qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 05:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=CQi033RovOQVGzSy0hOFux9Z8Or/TgZXTLCcbg53axw=;
	b=t01Uk8Z+98n9C6GAZYrAvdfhZ+UyB+9vMbJ6GId7ex3EJarzqy7kZJ0v2VXkfL4F+0
	UtEqs0Q6ndhOPeVwBW/SMN1clex4wbZ6YOwdWx574G08dKjdrV9kNaD9IFxQt3bnynge
	0T6DRum1+OUueY4D/qwqs/HzpfHhqupj5Cajs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=mOiMwyINrm8YAmLF8yxpKmy5UcCNBLg99x46f4qK1JgDXm25dB+GLfRX5yXu7F99y3
	zAzLYhQ1P3wTaUz7QsYNVKBstKBUyO3lSHQKuK2e0VKzlwmSReh0eYdtqGve9DEyKKsK
	0gwbrHwZ6bx/PoV3qtioHe3k/RiW6d8zsXCyY=
Received: by 10.229.183.135 with SMTP id cg7mr1197207qcb.296.1291383068652;
	Fri, 03 Dec 2010 05:31:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Fri, 3 Dec 2010 05:28:18 -0800 (PST)
In-Reply-To: <AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
	<4CF56767.3050007@freyther.de>
	<AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
	<AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 3 Dec 2010 14:28:18 +0100
Message-ID: <AANLkTikPoB-_uDc79kh5XE5yLpvrS8ETukvAL6XsRWUG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Fri, 03 Dec 2010 13:32:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Martin could you sum up here what is wrong please ?
for those interested by my attempts to build Phonon-VLC backend
here is my personal/modified recipes
http://pare.sylvain.perso.sfr.fr/recipes-perso.tar.gz
containing qt4-tools-native.bb modified , automoc-native updated to git and
qt4-plugin-phonon-backend-vlc.bb
For now I am done about it.
Thanks.
Regards,

Sylvain (aka GarthPS)

ps: if your are intersted like me in this backend, there could be an other
way to do : to fix cmake's needs of the phonon vlc backend itself
to don't need automoc-native anymore. it was proposed to me by j-b on
#phonon chanel but i don't have the skill to that.


2010/12/1 Sylvain Par=E9 <sylvain.pare@gmail.com>

> Ok I made some progress!
> Automoc build now ( attached my recipe for it)
> but qt4-plugin-phonon-backend-vlc failed =3D>
> http://tinderbox.openembedded.org/packages/1159577/
>
> I have attached my recipe too.
> If someone can give me an hint.
> thanks.
> regards,
>
> Sylvain (aka GarthPS)
>
> 2010/12/1 Sylvain Par=E9 <sylvain.pare@gmail.com>
>
> Hello Holger,
>> I tried with qt4-tools-native but Phonon-VLC backend trally needs automo=
c4
>> "Did not find automoc4"
>>
>> 2010/11/30 Holger Freyther <holger+oe@freyther.de<holger%2Boe@freyther.d=
e>
>> >
>>
>> On 11/30/2010 08:03 PM, Sylvain Par=E9 wrote:
>>> > Thanks for your interest!
>>> > here is my too recipes which are not soo valueable as it is mainly bu=
mp
>>> > version or so.
>>> > here my automoc-native :
>>> >
>>>
>>> sorry, I didn't completely follow the thread but qt4-tools-native
>>> installs
>>> moc4, rcc4 and all the other tools to build Qt applications.
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

