Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QfJ4j-0000nK-Fb
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 23:59:05 +0200
Received: by bwf20 with SMTP id 20so2418568bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 14:55:12 -0700 (PDT)
Received: by 10.204.42.137 with SMTP id s9mr541102bke.292.1310162111251;
	Fri, 08 Jul 2011 14:55:11 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id f16sm3489503bke.4.2011.07.08.14.55.09
	(version=SSLv3 cipher=OTHER); Fri, 08 Jul 2011 14:55:10 -0700 (PDT)
Received: by bwf20 with SMTP id 20so2418522bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 14:55:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.32.207 with SMTP id e15mr1604358bkd.60.1310162109164; Fri,
	08 Jul 2011 14:55:09 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Fri, 8 Jul 2011 14:55:09 -0700 (PDT)
In-Reply-To: <CAD=GYpYBSV=m3m7s+GKMrt3NyJQ5+qaFsp9N-qMdUQG1fFn-tw@mail.gmail.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
	<CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
	<8F7AF80515AF0D4D93307E594F3CB40E93380EE2@dlee03.ent.ti.com>
	<CAD=GYpYBSV=m3m7s+GKMrt3NyJQ5+qaFsp9N-qMdUQG1fFn-tw@mail.gmail.com>
Date: Fri, 8 Jul 2011 17:55:09 -0400
Message-ID: <CA+T6QPkJm1GcoWtHZ2okRg7QCNU4NJHSs_eYfQKpZLb70VoBPw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: "Fernandes, Joel A" <joelagnel@ti.com>, "Kooi, Koen" <k-kooi@ti.com>,
	"Kridner, Jason" <jdk@ti.com>,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH v2] pulseaudio: Run as system-wide instance instead of per-user
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
X-List-Received-Date: Fri, 08 Jul 2011 21:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 8, 2011 at 4:47 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> On Fri, Jul 8, 2011 at 3:11 PM, Kridner, Jason <jdk@ti.com> wrote:
>>> -----Original Message-----
>>> From: Joel A Fernandes [mailto:agnel.joel@gmail.com]
>>> Sent: Friday, July 08, 2011 3:11 PM
>>> To: Kooi, Koen
>>> Cc: Paul Menzel; openembedded-devel@lists.openembedded.org; Kridner,
>>> Jason; Fernandes, Joel A
>>> Subject: Re: [oe] [PATCH v2] pulseaudio: Run as system-wide instance
>>> instead of per-user
>>>
>>> On Fri, Jul 8, 2011 at 11:07 AM, Kooi, Koen <k-kooi@ti.com> wrote:
>>> > (posting from the airport)
>>> >
>>> > If I understood correctly Joel is going to try out 0.9.22 to see if
>>> that fixes session mode, and it not, try to make systemmode a separate
>>> recipe that both .15 and .22 could optionally use.
>>> >
>>> > Joel, please correct me if I'm wrong :)
>>>
>>> Hi Koen,
>>>
>>> That's right :)
>>>
>>> While I'm doing a build, I am also posting detailed logs to pulseaudio
>>> ML about the failure of an older version, just incase.
>>>
>>> Just mentioning that I'm setting PREFERRED_VERSION_pulseaudio to
>>> 0.9.22 in conf/.../angstrom-2008-preferred-versions.inc
>>
>> Is it 2008 or 2010 that gets used?
>
> Oh! I use the angstrom setup scripts so my DISTRO is set to
> angstrom-2008.1 . Is this a problem?

Whatever is setup by the setup scripts is right, I just didn't know
which file was getting used.

>
> The various 'year' version are confusing,

Agreed.

>
> Do you know which DISTRO= would Narcissus assembled images be using?

I got as far as figuring out that the images are served up using the
configuration at
https://gitorious.org/angstrom/narcissus/trees/master/conf/beagleboard/configs/2011.03
which contains angstrom-feed-configs_1.0-r14.6_beagleboard.ipk.  I
don't know the easy way to unpack that IPK to see what URLs it points
to.

I believe that file comes from
http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv7a/machine/beagleboard/angstrom-feed-configs_1.0-r14.6_beagleboard.ipk.

Trying to track backwards gets a bit difficult for me from there as I
don't know where to find a copy of the autobuilder.  I also think
stuff on gitorious isn't the latest.

>
> Pulseaudio on the Narcissus assembled C5 image is on 0.9.15 , this is
> set only in 2008:
> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-2008-preferred-versions.inc?h=2011.03-maintenance#n47

Well, that makes it pretty clear, eh?

>
> Also, if I'm right that the C5 image packages were built with DISTRO
> set to 2008, then shouldn't we be rebuilding pulseaudio with DISTRO =
> 2008?

Do what the script says!

>
> Thanks
> Joel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


