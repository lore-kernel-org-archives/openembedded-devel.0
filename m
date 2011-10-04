Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RB97U-0001Ba-HI
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 19:49:32 +0200
Received: by vwe42 with SMTP id 42so634601vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Oct 2011 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=E/I+e0OeQ/2Ag36urg2oOi7lraCTq2LzPFCNbx3Ybdo=;
	b=YKq5ZU+zX43RVwgGlaV0x+wo7aaz9G3JL4xOFY2150sfo0xVLnNi1Dfab55wEbkjLs
	KrsZB0+93jcj75BzmePf5SGMRrsxlYWRAx5GzSMFH4lHON6ntflUQaq4nhwzDf2QFDPx
	Fe3SbiZTcteU9jz9QtU5paTAKPouqhVS+6yG4=
Received: by 10.68.31.199 with SMTP id c7mr11513034pbi.73.1317750238060; Tue,
	04 Oct 2011 10:43:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 4 Oct 2011 10:43:28 -0700 (PDT)
In-Reply-To: <20111004164552.GA23650@denix.org>
References: <1317025776-2433-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
	<4E8B2D57.6060004@gmail.com> <20111004164552.GA23650@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2011 10:43:28 -0700
Message-ID: <CAMKF1soFxjRNw391zLK+Tr8kjwDhfEyF8sY-0y0J2xrt0TF+=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 17:49:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 9:45 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Oct 04, 2011 at 08:59:19AM -0700, Khem Raj wrote:
>> On 10/3/2011 11:47 PM, Reizer, Eyal wrote:
>>> Ping on this patch.
>>>
>>
>> I would suggest to rebase this patch against openembedded-core
>> and resubmit
>
> Nothing prevents these changes to be submitted to oe-core, but they were
> meant to eventually get into 2011.03-maintenance branch.

For 2011.03-maintenance yes ofcourse. However I would like to encourage cha=
nges
to go into oe-core and other appropriate layers as well since that makes it=
 easy
to upgrade to the layered structure in future since it will have
changes that went
into 2011.03-maintenance branch

>
> --
> Denys
>
>
>>>> -----Original Message-----
>>>> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
>>>> Sent: Monday, September 26, 2011 11:30 AM
>>>> To: openembedded-devel@lists.openembedded.org
>>>> Cc: Reizer, Eyal
>>>> Subject: [PATCH] wpa_supplicant update to use a newer commit
>>>>
>>>> Signed-off-by: Eyal Reizer<eyalr@ti.com>
>>>> ---
>>>> =C2=A0 recipes/wpa-supplicant/wpa-supplicant_git.bb | =C2=A0 =C2=A02 +=
-
>>>> =C2=A0 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>>> b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>>> index 8f6971e..7408808 100644
>>>> --- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>>> +++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>>> @@ -1,6 +1,6 @@
>>>> =C2=A0 require wpa-supplicant-0.7.inc
>>>>
>>>> -SRCREV =3D "b8fb017272ed4794339978c9fbc0e74571a44728"
>>>> +SRCREV =3D "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
>>>> =C2=A0 PR =3D "r0"
>>>> =C2=A0 PV =3D "0.7.3+0.8.0-rc"
>>>> =C2=A0 PR_append =3D "+gitr${SRCPV}"
>>>> --
>>>> 1.7.0.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


