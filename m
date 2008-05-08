Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Ju6dj-0005Lh-PT
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 15:58:31 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1747332rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2008 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=DmVQJbZGKmfQueNeV1wjMVfyO5psqdhQavyqteIpyaQ=;
	b=hUzvSJjCbC4OkeRGoASUTIXavwJNdCfjUnQ7vniRBP+3LIjFWVf+79fFcRmiEXxNTpFhyAERz1twG/i3xvKZ3nfTVUlq2yTGxLluzJ0lJhVILuhTQrf2dl9wIaxgFA66b63kuKBjEgAxOphNTD5kvD7ZgAkhl2Fbs3FeCUy+1Kw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=auTKhLMJefyuOpohKAiP1G4uKt4/TBfi6O2xxOjko1yTT27FOTwwoG3kInjXqmUU7n9zooCRgmX+OrAS3Ftkp99Cl9eTCWVupMGUfcOnpsGAxak9RaN7pdJLBdrVBRBt4DxSukh91oJeUWveDWQGdN1SWB2G9Af+FPOh4tOj+Z0=
Received: by 10.141.88.3 with SMTP id q3mr1547852rvl.46.1210255069808;
	Thu, 08 May 2008 06:57:49 -0700 (PDT)
Received: by 10.141.129.10 with HTTP; Thu, 8 May 2008 06:57:49 -0700 (PDT)
Message-ID: <f96d234e0805080657j76d5b8cfhd280bc6dcb1d9b45@mail.gmail.com>
Date: Thu, 8 May 2008 09:57:49 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0805080514s6561aff8t273eff90fca1db85@mail.gmail.com>
MIME-Version: 1.0
References: <200805080215.23729.zecke@selfish.org>
	<f96d234e0805080506t458743b8g7ea65ab4dcb15525@mail.gmail.com>
	<c384c5ea0805080514s6561aff8t273eff90fca1db85@mail.gmail.com>
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 13:58:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 8, 2008 at 8:14 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
>  On Thu, May 8, 2008 at 2:06 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>  >  export TOPDIR="${OEDIR}/build/angstrom-2007.1"
>
>  A warning here, I have seen breakage with some environment variables.
>
>  I think TOPDIR is used by u-boot or some such.
>
>  Think of a better (more uniquer) namespace, such as OE_TOPDIR.

Good point.  TOPDIR is currently coded in bitbake:

./lib/bb/parse/parse_py/ConfHandler.py:    if not
bb.data.getVar('TOPDIR', data):
./lib/bb/parse/parse_py/ConfHandler.py:
bb.data.setVar('TOPDIR', os.getcwd(), data)
./lib/bb/build.py:        prevdir = data.expand('${TOPDIR}', d)

so, it won't be trivial to change without breaking existing build environments.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


