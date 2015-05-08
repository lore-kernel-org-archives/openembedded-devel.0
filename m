Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD76760034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 17:03:00 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so88903690pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2015 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rSToUl/WCXbwiR5UcVNrPeNtY00nutqewLcRfbtXozA=;
	b=cV6TJUfJIlgX9DAA2uOP2C2dwdZJwd4vVvUx4uNzL8JqkxC/TvPPCh2NYijZ0HMcfd
	YhrIPrC3yBxUaBRNyjwTOdI6ymQuYkcMvjqwn4IfYUPU8V2l0fe/vi7dKaKYIaGpTG2B
	QTjQhu5k2kJF/WR9N2HyMVn38i6YDhuu6oGsB7v/bVPcYN256JFQgts3Dvvd6fi+2E9q
	EXrUItAr2wXMhAwZ9O0QK7qnwyJnI0irCS87dEKoTaqxyB3YGj/YpOAzwK13bryKbZi/
	2Wk5aSUP3IOsYlpfxHrLMWkUaJAOQ1Xs7Wggrv7IDgbKrLUaN5BgLJfLVVXSYfODK/JW
	wa0w==
X-Received: by 10.66.63.72 with SMTP id e8mr56088pas.3.1431104564650;
	Fri, 08 May 2015 10:02:44 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:3156:7dfd:b20c:fb83?
	([2601:c:a700:3ba7:3156:7dfd:b20c:fb83])
	by mx.google.com with ESMTPSA id sl9sm5744893pac.41.2015.05.08.10.02.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 10:02:43 -0700 (PDT)
Message-ID: <554CEC31.3000809@gmail.com>
Date: Fri, 08 May 2015 10:02:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150508151207.GA7280@mentor.com>
In-Reply-To: <20150508151207.GA7280@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Fri, 08 May 2015 17:03:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Joe,


On 05/08/2015 08:12 AM, Joe MacDonald wrote:
> Hi Armin,
>
> I don't know if you've noticed, but it looks like this caused an issue
> with the current world build:

You mean the Galaxy build Martin does? no I have not.

>
> commit 00ea492451d221fcc4af5613732035184b8ee43a
> Author: Armin Kuster <akuster808@gmail.com>
> Date:   Sat Apr 4 14:52:03 2015 -0700
>
>      networkmanger: meta-oe world build failes
>
>      ERROR: Nothing RPROVIDES 'dnsmasq' (but /home/akuster/oss/clean/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb RDEPENDS on or otherwise requires it)
>      NOTE: Runtime target 'dnsmasq' is unbuildable, removing...
>      Missing or unbuildable dependency chain was: ['dnsmasq']
>      ERROR: Required build target 'networkmanager' has no buildable providers.
>      Missing or unbuildable dependency chain was: ['networkmanager', 'dnsmasq']
>
>      move networkmanager from meta-oe to meta-networking.
>
>      Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> I'll see if I can reproduce it, it's not obvious to me on the surface
> why this would be an issue with your patch.

maybe it prefers to live in meta-oe ; )
thanks.
>
> -J.
>
> [[meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit] On 15.05.04 (Mon 20:18) Armin Kuster wrote:
>
>> WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a build dependency? [build-deps]
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb     | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
>> index 8d37c98..36a4a7e 100644
>> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
>> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
>> @@ -37,11 +37,12 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','conso
>>   PACKAGECONFIG[systemd] = " \
>>       --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
>>       --without-systemdsystemunitdir, \
>> -    polkit \
>> +    polkit, polkit \
>>   "
>>   # consolekit is not picked by shlibs, so add it to RDEPENDS too
>>   PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
>>   PACKAGECONFIG[concheck] = "--enable-concheck,--disable-concheck,libsoup-2.4"
>> +PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, , polkit"
>>
>>   # Work around dbus permission problems since we lack a proper at_console
>>   do_install_prepend() {

