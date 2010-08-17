Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlTU3-0008IQ-3D
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 23:14:31 +0200
Received: by wwb39 with SMTP id 39so55513wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 14:13:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.17.194 with SMTP id j44mr6198126wej.68.1282079627632; Tue,
	17 Aug 2010 14:13:47 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Tue, 17 Aug 2010 14:13:47 -0700 (PDT)
In-Reply-To: <AANLkTi=baeypmvV4Kx2NtHxQOO6w8HPYNoZH=gm2QaM=@mail.gmail.com>
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>
	<1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
	<AANLkTik73cayAjmykmJvp8KqsJ_XrBfQTOkM8MJWydsP@mail.gmail.com>
	<AANLkTik=gnhtadZjsjx7i-g38iJxyF=PFkNOE9JydCO-@mail.gmail.com>
	<AANLkTi=baeypmvV4Kx2NtHxQOO6w8HPYNoZH=gm2QaM=@mail.gmail.com>
Date: Tue, 17 Aug 2010 17:13:47 -0400
Message-ID: <AANLkTim255+exQJGd98htcvT8E9DQngz8c=mY=tDiaOQ@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org, 
	Koen Kooi <koen@dominion.thruhere.net>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-olddemo-image: saved off beagleboard-demo-image
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
X-List-Received-Date: Tue, 17 Aug 2010 21:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2010 at 5:01 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
>> On Tue, Aug 17, 2010 at 3:54 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
>>>> I want to use the name beagleboard-demo-image for what actually ships
>>>> with the xM boards.
>>>>
>>>> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
>>>> ---
>>>> =A0recipes/images/beagleboard-olddemo-image.bb | =A0 30 ++++++++++++++=
+++++++++++++
>>>> =A01 files changed, 30 insertions(+), 0 deletions(-)
>>>> =A0create mode 100644 recipes/images/beagleboard-olddemo-image.bb
>>>>
>>>> diff --git a/recipes/images/beagleboard-olddemo-image.bb b/recipes/ima=
ges/beagleboard-olddemo-image.bb
>>>> new file mode 100644
>>>> index 0000000..d83281c
>>>> --- /dev/null
>>>> +++ b/recipes/images/beagleboard-olddemo-image.bb
>>>> @@ -0,0 +1,30 @@
>>>> +# Demo image for beagleboard
>>>> +
>>>> +IMAGE_LINGUAS =3D "de-de fr-fr en-gb en-us pt-br es-es kn-in ml-in ta=
-in"
>>>> +
>>>> +XSERVER ?=3D "xserver-xorg \
>>>> + =A0 =A0 =A0 =A0 =A0 xf86-input-evdev \
>>>> + =A0 =A0 =A0 =A0 =A0 xf86-input-mouse \
>>>> + =A0 =A0 =A0 =A0 =A0 xf86-video-fbdev \
>>>> + =A0 =A0 =A0 =A0 =A0 xf86-input-keyboard \
>>>> +"
>>>> +
>>>> +ANGSTROM_EXTRA_INSTALL ?=3D ""
>>>> +SPLASH =3D "exquisite exquisite-themes exquisite-theme-angstrom"
>>>> +
>>>> +export IMAGE_BASENAME =3D "Beagleboard-demo-image"
>>>> +
>>>> +DEPENDS =3D "task-base"
>>>> +IMAGE_INSTALL =3D "\
>>>> + =A0 =A0${XSERVER} \
>>>> + =A0 =A0${ANGSTROM_EXTRA_INSTALL} \
>>>> + =A0 =A0task-beagleboard-demo \
>>>> + =A0 =A0${SPLASH} \
>>>> + =A0 =A0"
>>>> +
>>>> +IMAGE_PREPROCESS_COMMAND =3D "create_etc_timestamp"
>>>> +
>>>> +#zap root password for release images
>>>> +ROOTFS_POSTPROCESS_COMMAND +=3D 'install_linguas; ${@base_conditional=
("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
>>>> +
>>>> +inherit image
>>>> --
>>>
>>> What about a better name? E.g. XM-demo-iimage?
>>
>> I don't know why we need two demo images. =A0This should run on Rev Cx a=
s well.
>
> Actually XM-demo-image was just a proposal
> For me beagleboard-olddemo-image indicates that it is not really an up
> to date version.
> I think I would prefer a name that better indicates the purpose. Maybe
> add stable in the name?
> Another option would be to have the image delivered with the XM as
> e.g. beagleboard-demo-image_1.0 and the newer versions e.g. 1.1 etc
> (or 2.0 or whatever)

Koen wanted to keep the old one around--I'm not sure for what purpose.

>>
>>>
>>> And to widen the question: do we want to maintain customer/supplier
>>> specific images in the oe repo?
>>> The company I work for also has some images, but for now we opted to
>>> keep them in a private overlay.
>>
>> I want this to be public and part of the mainline to make it easy for
>> people to reproduce. =A0It is for a relatively broad target. =A0Is there=
 a
>> reason it shouldn't be there?
>>
>
> Ok, I understand that (and I have not really a problem with that). It
> is just the name that didn't make me too happy.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


