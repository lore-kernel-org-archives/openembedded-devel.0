Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfI1D-00081x-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 22:51:23 +0200
Received: by wyg30 with SMTP id 30so1817076wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YgDtxuJ1jo0hUmv49Hqx5NJB+x0iuhTNxMrnS04w1JI=;
	b=vGPahu0Z0c1RmohEOrAQUUiat78uyxrvOLW1WUJl207uAaQviBIQsfa5wNX644nqRh
	Nt0CsNCcdwetObgDoHFR+VAtRsXdCLmCSzt0KORSEALf4ScS1foAF98SdwqAIw8ipOIp
	5oOrMHd2AA9PEuHLzYAs/249OOySFxK0N4Gyw=
MIME-Version: 1.0
Received: by 10.227.28.212 with SMTP id n20mr2134953wbc.82.1310158049667; Fri,
	08 Jul 2011 13:47:29 -0700 (PDT)
Received: by 10.227.200.15 with HTTP; Fri, 8 Jul 2011 13:47:29 -0700 (PDT)
In-Reply-To: <8F7AF80515AF0D4D93307E594F3CB40E93380EE2@dlee03.ent.ti.com>
References: <1310017138-8936-1-git-send-email-agnel.joel@gmail.com>
	<1310022018.4532.21.camel@mattotaupa>
	<CAD=GYpaAHX=RiS98pXAqE3bRbBs6gsbXQoSCdcs8+9u=2F267w@mail.gmail.com>
	<CAD=GYpZX9Y5JbQH9YQ7Ozu6Kp6uf72ooFiys-2Ga_aR_q29R6A@mail.gmail.com>
	<1310140540.4517.1.camel@mattotaupa>
	<1310140818.4517.3.camel@mattotaupa>
	<13872098A06B02418CF379A158C0F14601620D1E2B@dnce02.ent.ti.com>
	<CAD=GYpZgya_v86J+OhDUN-rQXnXGBDT3QT-HXTj_+G0sKme7wA@mail.gmail.com>
	<8F7AF80515AF0D4D93307E594F3CB40E93380EE2@dlee03.ent.ti.com>
Date: Fri, 8 Jul 2011 15:47:29 -0500
Message-ID: <CAD=GYpYBSV=m3m7s+GKMrt3NyJQ5+qaFsp9N-qMdUQG1fFn-tw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kridner, Jason" <jdk@ti.com>
Cc: "Fernandes, Joel A" <joelagnel@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Paul Menzel <paulepanter@users.sourceforge.net>, "Kooi,
	Koen" <k-kooi@ti.com>
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
X-List-Received-Date: Fri, 08 Jul 2011 20:51:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 8, 2011 at 3:11 PM, Kridner, Jason <jdk@ti.com> wrote:
>> -----Original Message-----
>> From: Joel A Fernandes [mailto:agnel.joel@gmail.com]
>> Sent: Friday, July 08, 2011 3:11 PM
>> To: Kooi, Koen
>> Cc: Paul Menzel; openembedded-devel@lists.openembedded.org; Kridner,
>> Jason; Fernandes, Joel A
>> Subject: Re: [oe] [PATCH v2] pulseaudio: Run as system-wide instance
>> instead of per-user
>>
>> On Fri, Jul 8, 2011 at 11:07 AM, Kooi, Koen <k-kooi@ti.com> wrote:
>> > (posting from the airport)
>> >
>> > If I understood correctly Joel is going to try out 0.9.22 to see if
>> that fixes session mode, and it not, try to make systemmode a separate
>> recipe that both .15 and .22 could optionally use.
>> >
>> > Joel, please correct me if I'm wrong :)
>>
>> Hi Koen,
>>
>> That's right :)
>>
>> While I'm doing a build, I am also posting detailed logs to pulseaudio
>> ML about the failure of an older version, just incase.
>>
>> Just mentioning that I'm setting PREFERRED_VERSION_pulseaudio to
>> 0.9.22 in conf/.../angstrom-2008-preferred-versions.inc
>
> Is it 2008 or 2010 that gets used?

Oh! I use the angstrom setup scripts so my DISTRO is set to
angstrom-2008.1 . Is this a problem?

The various 'year' version are confusing,

Do you know which DISTRO= would Narcissus assembled images be using?

Pulseaudio on the Narcissus assembled C5 image is on 0.9.15 , this is
set only in 2008:
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-2008-preferred-versions.inc?h=2011.03-maintenance#n47

Also, if I'm right that the C5 image packages were built with DISTRO
set to 2008, then shouldn't we be rebuilding pulseaudio with DISTRO =
2008?

Thanks
Joel


