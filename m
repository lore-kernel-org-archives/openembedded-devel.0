Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NYivS-00065k-A1
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 17:33:34 +0100
Received: by bwz9 with SMTP id 9so1679595bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 08:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=gN+K/hM0xQYGAaAr15nCcc0NyzxtDbxuSkYcoVwXXo8=;
	b=bSFJKNNg63LzlAS8+Fgd+tohQBUu3oBwNEqwOd8pkI4/bIlY9BzHwXr4YPHACz/IqI
	YeppgJymH3pF3U4E7w7jDtdXVFJTg83pLEk5l6Ev6NQ3JwGBzJiR0HVEM1s4EUZ6+L1B
	U4sPtMNeUNUGx+h8dj6FmqO+FO7Tngr5mGjEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CxQ3Owey7Bwv09pIlizcOoT1LbSfhF6c42i/ivloF8s+FCQcNRuGyXIudGKFB2Kf1S
	Sd+phT2dEzqfTGnUEJ/04YybO99hna73KjuhH7Cp8DxOVvnFaz9blDDWat/+/0PDJLpz
	VkxbCIRUJ28XGwuzsJ7D9W7HZUQ3YRJonlGaE=
Received: by 10.204.8.220 with SMTP id i28mr2448215bki.143.1264264271397;
	Sat, 23 Jan 2010 08:31:11 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.154.251])
	by mx.google.com with ESMTPS id 13sm1478780bwz.6.2010.01.23.08.31.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 08:31:10 -0800 (PST)
Message-ID: <4B5B2448.1050202@gmail.com>
Date: Sat, 23 Jan 2010 21:31:04 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B5B1BDB.7050100@gmail.com>
In-Reply-To: <4B5B1BDB.7050100@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Wrong content of /dev directory
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
X-List-Received-Date: Sat, 23 Jan 2010 16:33:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Seems I can answer by myself, all this devices was created by 
/etc/rcS.d/S05devices based on /etc/device_table

On 23.01.2010 20:55 Dmitry Vinokurov wrote:
> Hello,
>
> I work on non-udev image (IMAGE_DEV_MANAGER = ""), device table is set 
> via IMAGE_DEVICE_TABLES = 
> "recipes/images/cgv-image/device_table_phy3250-cgv.txt".
>
> Result rootfs image got all needed files, but when I run board, /dev 
> dir is absolutely different, I can't see my files there, but many 
> unnecessary. Seems like some dev manager worked.
>
> Could anybody explain this thing? It's really strange and unexpected.
>
> Thanks
>
-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



