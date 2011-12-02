Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWTtF-0008T6-Nl
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 15:15:02 +0100
Received: by lagj5 with SMTP id j5so1275464lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2Dhw/Yt+xLO3UmD6AM2pmkRRWuT49TPIYHIYODIVcjc=;
	b=G5FVSoy7qqgqtsBnwK4uyN56MJjcWsY4ml6jjSs9hQK7EyjKl68gnK9MX39zAsOh6I
	2bbzCGa7ZVhXEY2AOEuSygRQQqVeuHdIqeXfoIaIn7YsXtaRIKtpju/wGVeSltKbjLj3
	pYC8dhHQkY1dMGJuOhFfrlVHYjyiR2wmdV/Fo=
Received: by 10.152.125.196 with SMTP id ms4mr8073951lab.50.1322834894435;
	Fri, 02 Dec 2011 06:08:14 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id mo6sm8600880lab.11.2011.12.02.06.08.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 06:08:13 -0800 (PST)
Message-ID: <4ED8DBC7.6080708@googlemail.com>
Date: Fri, 02 Dec 2011 14:08:07 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
References: <4ED8307F.2060306@googlemail.com>
	<201112021120.17762.GNUtoo@no-log.org>
In-Reply-To: <201112021120.17762.GNUtoo@no-log.org>
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
X-List-Received-Date: Fri, 02 Dec 2011 14:15:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Denis 'GNUtoo' Carikli wrote:
> What are you using?
> SHR-core or openembedded classic?
>   
Don't know if I am honest - there is a (very good) wiki page I have been 
following to build this -> 
http://www.openembedded.org/wiki/Getting_started. I presume it is 
openembedded classic since I downloaded all the stuff from that page 
(git://github.com/openembedded/openembedded.git is the repository used).

As I indicated earlier, I successfully built the shr-image (GUI-based) - 
it boots up OK on my smartphone, but I have no luck whatsoever with the 
console (i.e. just cli) images - I tried two: "console-image" and 
"fso-console-image", both unsuccessful (they do build, but my smartphone 
is having problems booting up properly with these).

> If you are using shr-core you need to fix that file:
> openembedded-core/meta/conf/machine/include/arm/arch-armv6.inc
> to include support for armv6-novfp and add a tune file for the CPU of the 
> htcdream and then require that cpu tune file in the htcdream machine recipe.
>   
I don't know whether I would need this. I also discovered yesterday that 
there is another openembedded git repository on freesmartphone.org 
(git://git.freesmartphone.org/openembedded.git), but not sure whether 
this is the same as the one I have been using...



