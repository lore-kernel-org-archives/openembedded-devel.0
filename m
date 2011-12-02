Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWcz3-0002uu-Vr
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 00:57:38 +0100
Received: by wgbds11 with SMTP id ds11so1823945wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 15:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZhFVZCFIbDo0napHK/89oN+NWXhKTl3gs1cs9yBpGYs=;
	b=qhOXj+hcbxwzYNHTSrhCh2dYXTcdAe9LCsbj7wIykINvOnXlujNcPZJ3xpdXDtzGVT
	IqiI6CYoBndzJXD77EaIhJbc/PJroDOToxk6OQr3S3JwRFZYMsM8QsHQdpWGctpspKYy
	SDCeVNUhCnY5ieA5UJM0M+KFt/z2Jq4LP2Cuw=
Received: by 10.216.203.163 with SMTP id f35mr103327weo.13.1322869851998;
	Fri, 02 Dec 2011 15:50:51 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id n9sm7557280wbo.16.2011.12.02.15.50.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 15:50:51 -0800 (PST)
Message-ID: <4ED96455.8060008@googlemail.com>
Date: Fri, 02 Dec 2011 23:50:45 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
References: <4ED8307F.2060306@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
	<4ED92FC0.2050502@googlemail.com>
	<201112022324.09104.GNUtoo@no-log.org>
	<4ED960AB.5040502@googlemail.com>
In-Reply-To: <4ED960AB.5040502@googlemail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 23:57:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 
> I use bitbake to compile/build everything - how do I get that done 
> there (I presume there must be some sort of .config file somewhere)?
Right, after a bit of digging, I found this in my 
recipes/linux/linux-leviathan/defconfig (I think that's the kernel used 
to build my htcdream image, if not, then I'm wrong!):

# CONFIG_DISPLAY_SUPPORT is not set
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE is not set

Apart from setting "CONFIG_FRAMEBUFFER_CONSOLE=y" (and possibly setting 
"# CONFIG_DUMMY_CONSOLE is not set") should I activate anything else 
from the above? Is that all what's needed?


