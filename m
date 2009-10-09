Received: from [209.85.221.180] (helo=mail-qy0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MwJTO-0006ye-9V
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 19:41:49 +0200
Received: by qyk10 with SMTP id 10so3095286qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iGJC5J9UAz37SGNxolFL4tI6bmxMUqjmcuDW/d3R1nk=;
	b=Ip2Dm+EKGqmMONxh7ZRTSaZfFqxCLE8epLaGKZNnDSPOav6MDIA+Z2bBiiaKukwIrx
	YcmWKi7/aw5ak4WVmeRoPIfBgqc9h5Xefgy52mdgXI8cGOpBre4m/a0iMpj6WxwoXxKr
	QGTZV5M8/urdDPSS0nMWN8LNDEBHcgR21lCUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PrlM9PUQeZjB/mUa2Mwk572Y+nSu+9PKFQNfFU9YEzBZb11cOkk0Nfca9zjEBfiYnK
	siZghceiVCY2mOqc8X+72NZF+d6SZn9+v4cx8S+gYoce9FPi9rfhjABWEh8c9lKpe8YU
	IJwfVuZ0jFGkt/n+R1sPZVmU7KRBFvx21Eai8=
MIME-Version: 1.0
Received: by 10.229.51.219 with SMTP id e27mr1809313qcg.7.1255110054637; Fri, 
	09 Oct 2009 10:40:54 -0700 (PDT)
In-Reply-To: <4ACF36E3.3000906@eukrea.com>
References: <4ACEFD4C.6060606@dresearch.de> <4ACF317D.7060808@dresearch.de>
	<4ACF36E3.3000906@eukrea.com>
Date: Fri, 9 Oct 2009 10:40:54 -0700
Message-ID: <19c1b8a90910091040x5010ece4j93327b03ee023b54@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build exception in sgmlspl-native
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
X-List-Received-Date: Fri, 09 Oct 2009 17:41:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

The problem is this that I forgot to include x86_64-linux-gnu site
file for x86_64-linux target
in siteinfo.bbclass if the build box is a amd64 machine. but I have
the patch to revert the triplet
back to -linux which should fix this too.

Thanks

-Khem

On Fri, Oct 9, 2009 at 6:13 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Steffen,
>
> Steffen Sledz a =C3=A9crit :
>>
>> Steffen Sledz wrote:
>>>
>>> 'bitbake sgmlspl-native' fails in dev-branch (with last commit
>>> b696acdd7296726efce684e3434f6a6445ddd992) with this exception:
>>>
>>> ERROR: Error in executing:
>>>
>>> /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_=
1.03ii.bb
>>> ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
>>>
>>> For details see attached log. Could this be a linux vs. linux-gnu
>>> related problem?
>>
>> I've done some tests and the build was definitly broken by
>>
>> =C2=A0commit d685ab28a425740b4d6c98abb1423d7904240724
>> =C2=A0Author: Khem Raj <raj.khem@gmail.com>
>> =C2=A0Date: =C2=A0 Wed Oct 7 12:39:04 2009 -0700
>>
>> =C2=A0 =C2=A0insane.bbclass: Use linux-gnu for TARGET_OS
>>
>> =C2=A0 =C2=A0* Add linux-uclibcspe
>
> same thing here with
> ERROR: Error in executing:
> /home/ebenard/OMAP/openembedded/recipes/openssl/openssl-native_0.9.8j.bb
> ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
>
> reverting d685ab28a425740b4d6c98abb1423d7904240724 solves the problem.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


