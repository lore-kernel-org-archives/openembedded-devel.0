Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWaDt-0003iK-76
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 20:56:13 +0100
Received: by pvd12 with SMTP id 12so1526238pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 11:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=Ntnw8ftCQbCJLUIziRgZL/Z3KfzuazvFlQ3sxN8YOuI=;
	b=q21CuBCQY5bcbhJDtGq24WQQzYIunX1XB691Qw7evNAHmLy8/Snw6pJ6ls6qjEBsE3
	wX5SLiEj4vnXyUm2W1nRU4qZ+USVy1Mg2o9/wxcVp2V6LUZvLUpp7qaqPwcOo5eTaOkV
	+zC0URC+gDGrhtGOLCDQGXUqvUtKOGezWXzg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Qd5hxajxVW9do9IUqBU1Dl/5bH6rq3oxv6kvKaPMOdC3834ukAu5BcrCV95xLhL+hD
	5uztvvuAJ6tb70189Rl9TmDpFE6N1HW67Ixy2HoYijtIAyBNwvtQHoGruJFCabwkh/Wf
	xR+La6uJ9kNI2lsh4FFPvjRUbrCsqYdj6UolI=
Received: by 10.142.203.16 with SMTP id a16mr8467559wfg.144.1293306954480;
	Sat, 25 Dec 2010 11:55:54 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm14596905wfd.13.2010.12.25.11.55.52
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 11:55:53 -0800 (PST)
Message-ID: <4D164C48.9020500@gmail.com>
Date: Sat, 25 Dec 2010 11:55:52 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>	<1293274109-15695-3-git-send-email-khimov@altell.ru>	<4D162AF0.3050608@gmail.com>
	<201012252105.20486.roman@khimov.ru>
In-Reply-To: <201012252105.20486.roman@khimov.ru>
Subject: Re: [PATCH 3/5] perl-native: fix ExtUtils::Liblist::Kid library check for cross-build
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
X-List-Received-Date: Sat, 25 Dec 2010 19:56:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/2010 10:05 AM, Roman I Khimov wrote:
> В сообщении от Суббота 25 декабря 2010 20:33:36 автор Khem Raj написал:
>> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
>>> MakeMaker uses it to check for libraries presence and if the library is
>>> not found in host dirs (/lib, /usr/lib, etc) it fails with messages like:
>>>
>>> Note (probably harmless): No library found for -lpcap
>>>
>>> Unfortunately it's not harmless, since MakeMaker removes such libs from
>>> flags passed to link target modules which obviously breaks them.
>>>
>>> As I don't know exact semantic and all use-cases of libpth config
>>> variable I've workarounded this issue by prepending ldflags (and this
>>> does contain the right path) to lib flags.
>>>
>>> Signed-off-by: Roman I Khimov<khimov@altell.ru>
>>
>> is this a problem for perl-native or target perl ?
>
> For target perl libraries. Seen that on Net::PCAP, the package built fine, but
> the actual library wasn't linked to pcap, thus not working. But in order for
> target perl libraries to build properly native perl needs to be patched.

got it.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



