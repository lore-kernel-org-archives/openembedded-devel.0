Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PuXrT-0000Jl-Of
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 23:16:08 +0100
Received: from homiemail-a76.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 0EE923755C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 11:35:29 -0800 (PST)
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 1C5F0458081
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 11:35:23 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=BHJVSwxb87RoGEl0iEwf1mkmq+CYZ2EGWl4Oh0TFOeDBOu3UveV/grfUzbjys
	E34dpaFoHZaz5Bf8ebsuX11GKXyTSNiCIQxspPr/RFjQsnFWFDCJuJcCxtjrgvpV
	b0ZYvQpPzFhOJWlMasPnxtoqXjJ2TU35HZNBf9QPXQLH/Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=74EY8
	l8ozd2q3I9dAAyEVtqufaA=; b=EEE9OAfJsiuLRQcKP0UgGU7qng7M9vTnwVA60
	wFdaKK/X6LkVA0k4lzo8ikjaCXtpVd+FGRzavsiAq7dkdw77Whx0J0g9YjwTuBgZ
	u7+qOSSWlsRrYZAlgHJJFALW2fffwxJG8rle+VOblETjSFXkcoDXplL1upd4wKIN
	GsEZlw=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 5963445807D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 11:35:21 -0800 (PST)
Message-ID: <4D6D4A52.8060907@gumstix.com>
Date: Tue, 01 Mar 2011 11:34:42 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64B565.3040006@dresearch.de> <4D64EB62.2080103@dresearch.de>
	<4D6D1EEB.3030709@gumstix.com>
In-Reply-To: <4D6D1EEB.3030709@gumstix.com>
Subject: Re: NetworkManager-0.8.1 do_compile failed
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
X-List-Received-Date: Tue, 01 Mar 2011 22:16:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  $ bitbake -c clean libnl

Seems to have done the trick. Not sure why though since, like Steffen, I 
was doing a clean build.

--
Neil

On 11-03-01 08:29 AM, Neil MacMunn wrote:
> I'm having the same problem. Any idea how to fix this?
>
> --
> Neil
>
> On 11-02-23 03:11 AM, Steffen Sledz wrote:
>> BTW: This error also occurs when building angstrom-gnome-image. :(
>>
>> Steffen
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



