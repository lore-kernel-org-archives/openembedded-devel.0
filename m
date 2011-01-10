Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcKtW-0000IL-Qt
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:46:59 +0100
Received: by pxi17 with SMTP id 17so3671234pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 08:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=GSqT/VeqN8/bdawbtkIGPELY7t9nZamEoIrd2i7nJgs=;
	b=kHp9eACaJHx4wZQoDoW2PYKFZmiuZPcHciPN856EYcJXbtiI/SHSRBr+49Rp13xn3S
	UCHb3J4iILHlkTyrbOTA3FN0PhWo2Z3pUSK9xSKfb7Gyv8xAFA+bbalv2EGp7JI68rNB
	Nb1hvQf7XVX1G+h1ZCbM953i7+j0pZFigsAkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=AsN5Hto6CS0MxmgNMwpPYuf9fy1tWqH3egvbgOFF+3ksB9zBpVomGEGnrZak7Jjica
	LsVoOyxOLQqtWS5Qq1RSdcN2GNzNMKA+TSfdhWWDkaSQt66Zg6q5arlGggfEWoLzYfzX
	Slue8CXaTzv7ZwCnhEECL1xizipLlHOVYVg7Q=
Received: by 10.142.211.20 with SMTP id j20mr4549070wfg.408.1294677987521;
	Mon, 10 Jan 2011 08:46:27 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm7903734wfa.11.2011.01.10.08.46.25
	(version=SSLv3 cipher=RC4-MD5); Mon, 10 Jan 2011 08:46:25 -0800 (PST)
Message-ID: <4D2B37DE.6020209@gmail.com>
Date: Mon, 10 Jan 2011 08:46:22 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
In-Reply-To: <AANLkTik6N-zh9_o819ipEyu7-k3k5Nt24+GbVTg0q24n@mail.gmail.com>
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Mon, 10 Jan 2011 16:46:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/2011 12:31 AM, Martin Jansa wrote:
> On Thu, Dec 16, 2010 at 2:48 PM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>> * X11R7.6-RC1 was already released
>>   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
>>   so it's IMHO time to start migration there
>> * preferred-xorg-versions-live.inc was tracking latest stable released
>>   tarballs, but only reason I was maintaining it was to overwrite older
>>   preferred-xorg-versions-X11R7.5.inc if your distribution included ie
>>   X11R7.5.inc and you wanted live.inc from local.conf
>> * default recipe versions without any preferred-xorg-versions include
>>   are now the same as live.inc
>> * we will get better test coverage if we use same versions
>> * if someone really needs older release then pinning only core stuff
>>   like xserver/libx11 will be probably better, than pinning every xorg
>>   app/proto/font etc.
>> * I can slow down adding newest xorg stuff or ie keep it everytime for
>>   at least a week on ML for another review and test on more targets
>>   (I'm testing it only on om-gta02/spitz/nokia900)
>>
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> ---
>>   .../include/angstrom-2010-preferred-versions.inc   |    1 -
>>   .../preferred-xorg-versions-X11R7.5-latest.inc     |  126 ------
>>   .../include/preferred-xorg-versions-X11R7.5.inc    |  286 -------------
>>   .../include/preferred-xorg-versions-live.inc       |  450 --------------------
>>   conf/distro/jlime-2010.1.conf                      |    1 -
>>   conf/distro/metano.conf                            |    1 -
>>   conf/distro/micro.conf                             |    5 -
>>   conf/distro/minimal.conf                           |    1 -
>>   .../bump.preferred-xorg-versions-7.5.sh            |    7 -
>>   .../bump.preferred-xorg-versions-live.sh           |   25 --
>>   10 files changed, 0 insertions(+), 903 deletions(-)
>>   delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
>>   delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>>   delete mode 100644 conf/distro/include/preferred-xorg-versions-live.inc
>
> Can I get more comments on this? :)
>
> Or just push and see who complains? :/

looks fine

Acked-by: Khem Raj <raj.khem@gmail.com>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



