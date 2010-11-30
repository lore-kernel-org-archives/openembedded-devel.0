Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNUbt-00026L-JN
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:07:26 +0100
Received: by ywt2 with SMTP id 2so2963727ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=hl368jMP0UWpKoBLnS9wqvULeK7auHiEep3gcEdOLf8=;
	b=weJw5/bktJ7UoMUvsp+fDTx3H/eArzQHnf2nPHRYPcpAHEuJ2PZPdcexivAVreOn1m
	J1VskRFNG1fm9yHSyvZmLclcv1Rd3eVzlWknL6tjWcdrtdsvEW5clKLqoKSHDFlBasMd
	+5FbGLebfUPe5HIp5Xt9R1jha0fXI+5ZRI5aE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=FdZnDIY5ZzS5bE4z3QCxtcNhZ1PRaXqqzepmxU8k+Obaqmfng1GsQENtLwNseJSdwR
	VR7lykHeRFOp7YXP0WoRdNpu2FUXwN1V6qBDOFAOTdOxCtbcr0FhxU1NyQjQIF71BGzW
	hfhs4SrUGjH3crTLlvei4R1Dn03Sn6h13oflQ=
Received: by 10.91.87.20 with SMTP id p20mr61342agl.129.1291140363632; Tue, 30
	Nov 2010 10:06:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 10:05:43 -0800 (PST)
In-Reply-To: <4CF4CA46.8000302@atmel.com>
References: <4CE69DDB.9030500@atmel.com> <20101119160716.GD3411@jama>
	<4CE6A5F8.4090301@atmel.com> <4CF4CA46.8000302@atmel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 10:05:43 -0800
Message-ID: <AANLkTikC4dfW6kMjzaxxyW6Uoh8Nh=-uV-K8gsvOL_Uv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: release-2010.12 (was: parsing error while building from scratch: literki_git.bb)
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
X-List-Received-Date: Tue, 30 Nov 2010 18:07:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 1:56 AM, Nicolas Ferre <nicolas.ferre@atmel.com> wr=
ote:
> Le 19/11/2010 17:29, Nicolas Ferre :
>> Le 19/11/2010 17:07, Martin Jansa :
>>> On Fri, Nov 19, 2010 at 04:55:07PM +0100, Nicolas Ferre wrote:
>>>> Hi,
>>>>
>>>> While trying to build from scratch the latest .dev branch with:
>>>> - at91sam9m10g45ek machine
>>>> - angstrom-2010.x distribution
>>>> - bitbake 1.10.1
>>>>
>>>> I have the following error just after bitbake parsing .bb files:
>>>
>>> what does it show if you do
>>> git ls-remote http://git.senfdax.de/git/literki master
>>> in terminal?
>>
>> It seems to work:
>> $ git ls-remote http://git.senfdax.de/git/literki master
>> 1da40724369c8adc069288f1bfc6b2e167bbb87b =C2=A0 =C2=A0 =C2=A0 =C2=A0refs=
/heads/master
>>
>>> are you using BB_LOCALCOUNT_OVERRIDE and/or BB_GIT_CLONE_FOR_SRCREV (ie
>>> in your local.conf?
>>
>> No, neither the one nor the other.
>
> My build on top of release-2010.12 is only working with the following
> commit form org.openembedded.dev:
> dc07958c6fad86917bd7d1b65614b14a1eec8c11
>
> Please include in release...

thanks for informing. I have included cherry picked commit.

>
> Bye,
> --
> Nicolas Ferre
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


