Received: from [209.85.217.12] (helo=mail-gx0-f12.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1L9fuH-0001El-9J
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 14:12:13 +0100
Received: by gxk5 with SMTP id 5so1093099gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=d9Nc/Z1j8XRjNjF7ZkT3+bJU2Jsj4lDM1Hzb8hphll4=;
	b=FiYIpSe5wwYa1JtLM6ikR7QpVeIe23g+HuHJdvkTqLyRxx2jUsPGoN2CyWVJ6p0UKU
	n9ewinl0iL+MqSQ03hSMfLMclAIGNEfFoSVE6HmOTjAyZ3vbAOhr0pQEZl/v5Hm7t62E
	mf3B6k/A0lJ1cEmuIR9z2G4tGwfE0vs9GOB10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=g/ZBzeyJoM+zlE26/RVgZNmER94gvjNW7FT8umXVPdgIINM74WGZkqPoLhI0Z4Dl1c
	JO0raPQtQb2MucDn2sSN2x8LZDXsKnj32cPgXEtLSgh8Ta8sszKMMD8sWS3J5Oz07n5d
	6N5BQ3gll1PgQ+bHdQF8JZo1gSJJqaRE+hBS8=
Received: by 10.151.113.5 with SMTP id q5mr3321957ybm.134.1228741699105;
	Mon, 08 Dec 2008 05:08:19 -0800 (PST)
Received: by 10.150.137.10 with HTTP; Mon, 8 Dec 2008 05:08:19 -0800 (PST)
Message-ID: <48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com>
Date: Mon, 8 Dec 2008 16:08:19 +0300
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <493D1A83.1070500@balister.org>
MIME-Version: 1.0
References: <C41AF57F04424526AD798F542197E674@aeglos>
	<493D1A83.1070500@balister.org>
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 13:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 8, 2008 at 4:00 PM, Philip Balister <philip@balister.org> wrote:
> Ulf Samuelsson wrote:
>>
>> I have now succeeded (after some hassle) to build
>> Angstrom for the AT91SAM9263EK using:
>>
>> linux-2.6.18-rc7     Requires new recipy
>> u-boot-1.3.4          Requires new recipy
>
> Any chance you could use u-boot-2008.10 instead? I've been meaning to add
> that version as well.
why not just use u-boot_git and add version tag? u-boot use time-based
releases now,
so I don't see real point in using versioned approach.

S.


>
> Philip
>
>> dataflashboot.bin    Requires a patch and updated recipy.
>> shasum-native        Recipy need bugfix.                   qemu
>>           Need to update host files for OpenSuSE 10.2.
>> checksums.ini        Needs to be updated with data for four tarballs.
>>
>> While doing that, I also updated the machine descriptions for the
>> at32stk1000 and atngw100 to use the latest u-boot,
>> and added/cleaned out some machine descriptions for other at91sam9
>> machines
>>
>> Would like to share it with the community,
>> so access to a personal git tree would be nice.
>>
>> Best Regards
>> Ulf Samuelsson
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


