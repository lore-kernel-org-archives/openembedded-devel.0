Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Qlm8X-00032A-76
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 20:13:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E93C820C9526
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 12:09:30 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id tVBPvqYLbf8p
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 12:09:29 -0600 (MDT)
Received: from [172.20.102.0] (vpn00.camp.se-eng.com [172.20.102.0])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 7B4BB20C9524
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 12:09:29 -0600 (MDT)
Message-ID: <4E2F02D8.4030002@se-eng.com>
Date: Tue, 26 Jul 2011 12:09:28 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>	<1311018697.20601.2.camel@mattotaupa>	<1311019495.20601.13.camel@mattotaupa>
	<1311198469.6129.16.camel@mattotaupa>
In-Reply-To: <1311198469.6129.16.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: calibrator: also problems with <svn://svn.bec-systems.com/>
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
X-List-Received-Date: Tue, 26 Jul 2011 18:13:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I apologize Paul - I did something with my email filters and missed=20
this.  You are correct; the URL is wrong in this patch.  The correct URL =
is:
http://svn.bec-systems.com/pub/calibrator/

No - I don't have rights yet.  How do I go about getting commit rights?

I'm following up on this and the other comments today.

Thanks,
Ray

On 07/20/2011 03:47 PM, Paul Menzel wrote:
> Dear Raymond,
>
>
> Am Montag, den 18.07.2011, 22:04 +0200 schrieb Paul Menzel:
>
>> Am Montag, den 18.07.2011, 21:51 +0200 schrieb Paul Menzel:
>>> Am Montag, den 18.07.2011, 13:25 -0600 schrieb Raymond Danks:
>>>> * The SVN repository for this project has changed URI.
> actually testing your patch I am experiencing the following problem wit=
h
> task fetch.
>
>          svn: OPTIONS of 'http://svn.bec-systems.com/svn/pub/calibrator=
': authorization failed: Could not authenticate to server: rejected Basic=
 challenge (http://svn.bec-systems.com)
>          NOTE: package calibrator-0.9e+svnr21-r0: task Fetch failed: Un=
able to fetch URL svn://svn.bec-systems.com/svn/pub;module=3Dcalibrator;p=
roto=3Dhttp from any source.: Failed
>          ERROR: Function 'Fetch failed: Unable to fetch URL svn://svn.b=
ec-systems.com/svn/pub;module=3Dcalibrator;proto=3Dhttp from any source.'=
 failed
>
>>>> * Upgrade to and patch the latest version for use with current tools=
.
>> actually thinking about this, two patches would have been better. I wi=
ll
>> split this patch up.
>>
>>>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>
>>>> ---
>>>>   recipes/calibrator/calibrator_svn.bb               |    6 +-
>>>>   .../calibrator/files/round_conflicting_types.patch |   91 ++++++++=
++++++++++++
>>>>   2 files changed, 95 insertions(+), 2 deletions(-)
>>>>   create mode 100644 recipes/calibrator/files/round_conflicting_type=
s.patch
>>>>
>>>> diff --git a/recipes/calibrator/calibrator_svn.bb b/recipes/calibrat=
or/calibrator_svn.bb
>>>> index bd7bb1f..60eeaf9 100644
>>>> --- a/recipes/calibrator/calibrator_svn.bb
>>>> +++ b/recipes/calibrator/calibrator_svn.bb
>>>> @@ -2,11 +2,13 @@ DESCRIPTION =3D "The Calibrator, a Cache-Memory an=
d TLB Calibration Tool"
>>>>   HOMEPAGE =3D "http://monetdb.cwi.nl/Calibrator/"
>>>>   LICENSE =3D "AS IS"
>>>>
>>>> -SRCREV =3D "21"
>>>> +SRCREV =3D "138"
>>>>   PV =3D "0.9e+svnr${SRCPV}"
>>>>   PR =3D "r0"
>>>>
>>>> -SRC_URI =3D "svn://dev.bec-systems.com/svn/pub;module=3Dcalibrator;=
proto=3Dhttp"
>>>> +SRC_URI =3D "\
>>>> +	svn://svn.bec-systems.com/pub;module=3Dcalibrator;proto=3Dhttp \
>>>> +	file://round_conflicting_types.patch"
>>> Maybe also put the last " on a new line to make future diffs smaller?
>>>
>>>>   inherit autotools
>>>>
>>>> diff --git a/recipes/calibrator/files/round_conflicting_types.patch =
b/recipes/calibrator/files/round_conflicting_types.patch
>>>> new file mode 100644
>>>> index 0000000..520c945
>>>> --- /dev/null
>>>> +++ b/recipes/calibrator/files/round_conflicting_types.patch
>>>> @@ -0,0 +1,91 @@
>>>> +round is a conflicting type ; rename to custom_round instead.
>>> Did you send that patch upstream?
>>>
>>>> +
>>>> +diff -urN calibrator.orig/calibrator.c calibrator/calibrator.c
>>>> +--- calibrator.orig/calibrator.c	2011-07-11 16:40:32.000000000 -060=
0
>>>> ++++ calibrator/calibrator.c	2011-07-11 16:44:22.333626120 -0600
>>>> +@@ -128,7 +128,7 @@
>>> [=E2=80=A6]
>>>
>>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>> I forgot to ask, do you have write/commit access to the Git repository=
?
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


