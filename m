Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Ol9iU-0004u0-If
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 02:07:47 +0200
Received: by wwb34 with SMTP id 34so5964419wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 17:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.43.9 with SMTP id u9mr5106093wbe.41.1282003649175; Mon, 16
	Aug 2010 17:07:29 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Mon, 16 Aug 2010 17:07:29 -0700 (PDT)
In-Reply-To: <4C69CD3E.5090007@mentor.com>
References: <1281998751-10781-1-git-send-email-jkridner@beagleboard.org>
	<4C69CD3E.5090007@mentor.com>
Date: Mon, 16 Aug 2010 20:07:29 -0400
Message-ID: <AANLkTikGKtyVsmKKD4A8nuXS5wSGNOvCMb1apeFHPYE0@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] flex: disabled packaged staging of native builds
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
X-List-Received-Date: Tue, 17 Aug 2010 00:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2010 at 7:43 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Jason Kridner wrote:
>>
>> ---
>> =A0recipes/flex/flex.inc | =A0 =A04 +++-
>> =A01 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/flex/flex.inc b/recipes/flex/flex.inc
>> index 49b26e8..5d3f076 100644
>> --- a/recipes/flex/flex.inc
>> +++ b/recipes/flex/flex.inc
>> @@ -4,7 +4,7 @@ LICENSE =3D "BSD"
>> =A0DEPENDS =3D "gettext"
>> =A0-INC_PR =3D "r5"
>> +INC_PR =3D "r6"
>> =A0S =3D "${WORKDIR}/flex-${PV}"
>> =A0@@ -16,3 +16,5 @@ inherit autotools gettext
>> =A0# static-only library; that might be an error
>> =A0FILES_${PN} +=3D "${libdir}/libfl.a"
>> +
>> +PSTAGING_DISABLED_virtclass-native =3D "1"
>
> I assume you've ran into 2.3.35 not being relocation happy? =A0Have you b=
een
> able to look at this at all? =A02.3.31 works so it's something 'bad' done
> upstream. =A0Thanks!

I did, but I didn't look into the details.  bison-native wouldn't
rebuild when I used my flex-native pstage.  bitbake -c clean
flex-native fixed it, so...

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


