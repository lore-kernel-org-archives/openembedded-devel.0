Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nd1fF-0005Wt-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 14:22:37 +0100
Received: by fg-out-1718.google.com with SMTP id e12so11981fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 05:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Xt5AD0dexeAehoT81cSoeiNMCbc2H993Thv3SkMOfA4=;
	b=dhPx1VBU6UTfbv+1R0IF1lNNh6G398VWfzvZJESt4x09gdeBJQFhgHhkIeB+0hEzUd
	UoIsOTgKm2BIdknv+ioLRpy4elDLfSmGK0oxWO4gs8LildkTRb97QCT0xCCfPECv2yf+
	msVN5cjVw9jEOzNBUW+NIVr4wVz7B3DoWvWEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UTPCGLM1Zp3lj5WHWGrxOIUfWL8tJDu9Cez4JOkUNdzaiWSrhACs/htHC8TeuGyr2Q
	sjgy6GJtf0izzvZbm9oCp5GKfzsJXvHiXp9ooEVrEOYpxLSX9MBACi/WgY0KF45v0kzA
	njX2Lu554aFo8zdwTLDZrk1lULlAEsT9UYLJI=
Received: by 10.87.15.22 with SMTP id s22mr2168968fgi.56.1265289606999;
	Thu, 04 Feb 2010 05:20:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm50272fxm.14.2010.02.04.05.20.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Feb 2010 05:20:05 -0800 (PST)
Date: Thu, 4 Feb 2010 14:19:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: vivek tambakad <vivektambakad@gmail.com>
Message-ID: <20100204131927.GT3401@jama>
References: <ad82c8891002030412hc3e797djc4097d8ca965c548@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ad82c8891002030412hc3e797djc4097d8ca965c548@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Touchscreen is not working in compulab Em-x270 board
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
X-List-Received-Date: Thu, 04 Feb 2010 13:22:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2010 at 05:42:05PM +0530, vivek tambakad wrote:
> Hi martin,
>               I am troubling you again. I have ported X11-image to Em-X270
> board.
> But touchscreen not working. Please guide me in troubleshooting this.

Hi,

seen your email in oe-devel ML, but I cannot help you more than what
Dennis.Yxun said. And please stay on the list (I know nothing about
Em-x270 as device).

Check if kernel is generating evdev input events (maybe you're missing
some kernel option - as I did with ts filters).

Then check xorg.conf if you really want tslib or better evdev driver
(make sure that device name is right one wrt /proc/bus/input/devices).

Then check if calibration is ok, you can try xinput_calibrator.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


