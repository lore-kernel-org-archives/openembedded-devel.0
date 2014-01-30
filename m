Return-Path: <sanjay_dorairaj@cable.comcast.com>
Received: from cable.comcast.com (pacdcavout01.cable.comcast.com
	[69.241.43.119])
	by mail.openembedded.org (Postfix) with ESMTP id C89186E98D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 23:12:46 +0000 (UTC)
Received: from ([24.40.56.122])
	by pacdcavout01.cable.comcast.com with ESMTP  id 97wm3m1.81548249;
	Thu, 30 Jan 2014 18:12:46 -0500
Received: from PACDCEXMB12.cable.comcast.com ([169.254.6.198]) by
	pacdcexhub05.cable.comcast.com ([fe80::3d40:bdea:7266:7f5a%18]) with
	mapi id 14.03.0158.001; Thu, 30 Jan 2014 18:13:10 -0500
From: "Dorairaj, Sanjay" <Sanjay_Dorairaj@cable.comcast.com>
Thread-Topic: [oe] Errors when using populate_sdk - has anyone encountered
	this before?
Thread-Index: AQHPHcAoamcSiPXbe0Gl8VYvFAPP6pqdz/EAgAAI9oCAAAmFgIAABEwAgAAKVACAACXzgIAAELQA//+MEIA=
Date: Thu, 30 Jan 2014 23:12:45 +0000
Message-ID: <CF101C5B.40876%Sanjay_Dorairaj@cable.comcast.com>
In-Reply-To: <lceiek$4oe$1@ger.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.3.4.130416
x-originating-ip: [68.87.16.247]
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "ridish.ra@lntinfotech.com"
	<ridish.ra@lntinfotech.com>
Subject: Re: Errors when using populate_sdk - has anyone encountered this before?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2014 23:12:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D33F574BDD147847A9855008D5C1F8B6@cable.comcast.com>
Content-Transfer-Encoding: quoted-printable



Sanjay Dorairaj
Comcast Silicon Valley Innovation Center
1050 Enterprise Way, Suite 100
Sunnyvale, CA 94089
Desk: (408)900-8737 Cell:(215)900-2349
Skype: dorairajsanjay





On 1/30/14 2:07 PM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Nicolas Dechesne schreef op 30-01-14 22:07:
>> hi,
>>=20
>> On Thu, Jan 30, 2014 at 10:52 AM, Ridish RA <Ridish.RA@lntinfotech.com>
>> wrote:
>>> I think I got the root cause of the issue, meta-linaro that we have
>>> depends on openembedded-core dylan-qt5.1, but Nicolas recently updated
>>> openembedded-core to dora. And I think this is the root cause of the
>>> issue of the relocatable patch being not able to apply?
>>>=20
>>> So do we have meta-linaro layer based openembedded-core dora?
>>>=20
>>=20
>> yes, the problem is a misalignment between oe-core and meta-linaro.
>> meta-linaro is using a recent qemu upstream commit, and the list of
>> patches from oe-core no longer works with meta-linaro qemu_git recipe.
>> the 2 commits in upstream qemu responsible for the misalignment are:
>>=20
>> 53db78543e473bdf7650a406767d0901c6e26480
>> 964c6fa16f50a607f9da5068d6bf15ccc93872c0
>>=20
>> I am cc'ing riku and koen since that needs fixing in meta-linaro
>> (nativesdk-qemu does not build).
>
>Can you push cherry-picks for:
>
>http://git.linaro.org/openembedded/meta-linaro.git/commit/2def4e0a5548cadf
>edcf9511f835af9456b40953
>
>and
>
>http://git.linaro.org/openembedded/meta-linaro.git/commit/fc9473336a77603e
>dabda89ae0bac58ef652d649
>
>to gerrit? I'm off to fosdem tomorrow and have a day off monday, so
>tuesday
>is the earliest I can look at it.
>
>regards,
>
>Koen
>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.4.5 (Darwin)
>Comment: GPGTools - http://gpgtools.org
>
>iD8DBQFS6s0sMkyGM64RGpERAoqHAJsEe/DFtL4TZYq/Hx+CDA0YVwKXpACggj6+
>wIlhhY8LamC7C+lf/BobULY=3D
>=3D8Jo3
>-----END PGP SIGNATURE-----
>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-devel


