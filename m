Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1Qlot4-0006sB-N2
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 23:09:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id E3BB920C9526
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:05:44 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id mvE8vtfVDhht
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:05:43 -0600 (MDT)
Received: from [172.20.102.0] (vpn00.camp.se-eng.com [172.20.102.0])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 4EB4320C9453
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:05:43 -0600 (MDT)
Message-ID: <4E2F2C24.7050501@se-eng.com>
Date: Tue, 26 Jul 2011 15:05:40 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>	<1311018697.20601.2.camel@mattotaupa>	<1311019495.20601.13.camel@mattotaupa>	<1311198469.6129.16.camel@mattotaupa>
	<4E2F02D8.4030002@se-eng.com> <j0n5dr$561$1@dough.gmane.org>
In-Reply-To: <j0n5dr$561$1@dough.gmane.org>
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
X-List-Received-Date: Tue, 26 Jul 2011 21:09:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07/26/2011 01:43 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 26-07-11 20:09, Raymond Danks schreef:
>> I apologize Paul - I did something with my email filters and missed th=
is.  You are correct; the URL is wrong in this patch.  The correct URL is=
: http://svn.bec-systems.com/pub/calibrator/
>>
>> No - I don't have rights yet.  How do I go about getting commit rights=
?
> Technically you still have them since you had monotone access :) I thin=
k nowadays you send your ssh key to cliff + khem and they'll sort it out.

Thanks Koen!  I'll get in touch with Cliff and Khem.  I think I lost=20
that other key...
>> I'm following up on this and the other comments today.
>>
>> Thanks, Ray
>>
>> On 07/20/2011 03:47 PM, Paul Menzel wrote:
>>> Dear Raymond,
>>>
>>>
>>> Am Montag, den 18.07.2011, 22:04 +0200 schrieb Paul Menzel:
>>>
>>>> Am Montag, den 18.07.2011, 21:51 +0200 schrieb Paul Menzel:
>>>>> Am Montag, den 18.07.2011, 13:25 -0600 schrieb Raymond Danks:
>>>>>> * The SVN repository for this project has changed URI.
>>> actually testing your patch I am experiencing the following problem w=
ith task fetch.
>>>
>>> svn: OPTIONS of 'http://svn.bec-systems.com/svn/pub/calibrator': auth=
orization failed: Could not authenticate to server: rejected Basic challe=
nge (http://svn.bec-systems.com) NOTE: package calibrator-0.9e+svnr21-r0:=
 task Fetch failed: Unable to fetch URL
>>> svn://svn.bec-systems.com/svn/pub;module=3Dcalibrator;proto=3Dhttp fr=
om any source.: Failed ERROR: Function 'Fetch failed: Unable to fetch URL=
 svn://svn.bec-systems.com/svn/pub;module=3Dcalibrator;proto=3Dhttp from =
any source.' failed
>>>
>>>>>> * Upgrade to and patch the latest version for use with current too=
ls.
>>>> actually thinking about this, two patches would have been better. I =
will split this patch up.
>>>>
>>>>>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>  --- recipes/ca=
librator/calibrator_svn.bb               |    6 +- .../calibrator/files/r=
ound_conflicting_types.patch |   91 ++++++++++++++++++++ 2 files changed,=
 95 insertions(+), 2 deletions(-) create mode 100644
>>>>>> recipes/calibrator/files/round_conflicting_types.patch
>>>>>>
>>>>>> diff --git a/recipes/calibrator/calibrator_svn.bb b/recipes/calibr=
ator/calibrator_svn.bb index bd7bb1f..60eeaf9 100644 --- a/recipes/calibr=
ator/calibrator_svn.bb +++ b/recipes/calibrator/calibrator_svn.bb @@ -2,1=
1 +2,13 @@ DESCRIPTION =3D "The Calibrator, a Cache-Memory and TLB Calibr=
ation
>>>>>> Tool" HOMEPAGE =3D "http://monetdb.cwi.nl/Calibrator/" LICENSE =3D=
 "AS IS"
>>>>>>
>>>>>> -SRCREV =3D "21" +SRCREV =3D "138" PV =3D "0.9e+svnr${SRCPV}" PR =3D=
 "r0"
>>>>>>
>>>>>> -SRC_URI =3D "svn://dev.bec-systems.com/svn/pub;module=3Dcalibrato=
r;proto=3Dhttp" +SRC_URI =3D "\ +    svn://svn.bec-systems.com/pub;module=
=3Dcalibrator;proto=3Dhttp \ +    file://round_conflicting_types.patch"
>>>>> Maybe also put the last " on a new line to make future diffs smalle=
r?
>>>>>
>>>>>> inherit autotools
>>>>>>
>>>>>> diff --git a/recipes/calibrator/files/round_conflicting_types.patc=
h b/recipes/calibrator/files/round_conflicting_types.patch new file mode =
100644 index 0000000..520c945 --- /dev/null +++ b/recipes/calibrator/file=
s/round_conflicting_types.patch @@ -0,0 +1,91 @@ +round is a conflicting =
type
>>>>>> ; rename to custom_round instead.
>>>>> Did you send that patch upstream?
>>>>>
>>>>>> + +diff -urN calibrator.orig/calibrator.c calibrator/calibrator.c =
+--- calibrator.orig/calibrator.c    2011-07-11 16:40:32.000000000 -0600 =
++++ calibrator/calibrator.c    2011-07-11 16:44:22.333626120 -0600 +@@ -=
128,7 +128,7 @@
>>>>> [=E2=80=A6]
>>>>>
>>>>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>>>> I forgot to ask, do you have write/commit access to the Git reposito=
ry?
>>> Thanks,
>>>
>>> Paul
>>>
>>>
>>> _______________________________________________ Openembedded-devel ma=
iling list Openembedded-devel@lists.openembedded.org http://lists.linuxto=
go.org/cgi-bin/mailman/listinfo/openembedded-devel
>> _______________________________________________ Openembedded-devel mai=
ling list Openembedded-devel@lists.openembedded.org http://lists.linuxtog=
o.org/cgi-bin/mailman/listinfo/openembedded-devel
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOLxj7MkyGM64RGpERAgoYAJkBqgcN+ORwAy5auUY8zCP1UeE1mQCgsBs6
> gqgy7B3i/IiLGO+l1NJDFl8=3D
> =3DKyIu
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



