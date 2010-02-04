Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nczz1-0001hc-Ux
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 12:34:55 +0100
Received: by fxm7 with SMTP id 7so2796205fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 03:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=yWrpjxI7mFOpY/TznAYwk3UumKyN1H7dpWWE6j0M4e4=;
	b=acJISTjYRGEf2wGGZXOlaUQBHhQIAWOZ+Kt6a3QwUUnf32ogiOkQu/DyN6LiiZMo8d
	53xpdndVbl9COqMs9MZ6Rh9nWMkks4cTWmEuGOEQsDhsSWhCg3vqZv37nuxIV8hL42R9
	HF6YVC5OBZfrEOCQNKuL8ROpH2i2LfTUCWjXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=c23J95A/YWfbS3PhAJPYA2NEU1cTykWrW37g8Agc3rN5/cn8YmrPBEQumfsCMcBG/o
	XaDBWbzZUC+F4v9P3lLmrsd2N2szCv3D/T7nr+Dw7T7zjIhHFkUtCFHvcjF9763kE700
	YZNRn8bsVvm5+3xM82ALAXeQuj8nUcAYVA8BY=
Received: by 10.223.127.203 with SMTP id h11mr1049100fas.24.1265283143413;
	Thu, 04 Feb 2010 03:32:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm7995fxm.4.2010.02.04.03.32.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Feb 2010 03:32:22 -0800 (PST)
Date: Thu, 4 Feb 2010 12:31:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marco Cavallini <m.cavallini@koansoftware.com>
Message-ID: <20100204113145.GR3401@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.215
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: xinput-calibrator
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
X-List-Received-Date: Thu, 04 Feb 2010 11:34:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've seen your patches for xinput-calibrator. I'm not sure if you're
the author (github is down now ;/), but maybe you could add this
anyways.

For shr I've added small shell script to run calibration only if 
/etc/pointercal.xinput doesn't exist and after calibration store values
there for next reboot.
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=48dd2427c14edb8349e9f16150ad0f9c037c2ab8

This is then used in Xsession.d script.
Problem is when user wait too long when starting xorg for first time and LCD 
screen is blanked, then first touchscreen tap to unblank it counts as
first point for calibration (way off the right mark).

I've workarrounded it with forcing LCD to stay on while calibrator is
running but still not best solution (ie user can touch ts by accident
even with display on.

Could you add option (ie enabled by command line param, or even by
default) to repeat calibration when user doesn't confirm that he did it
right and touchscreen is working for him?

Something like (while still in xinput-calibrator gui):

Do you want to use/store calibration values?
If yes, press touchscreen for 10s.
If no, press once and calibration will start again.
(maybe some 3rd option to exit calibration without storing)

(buttons would be easier to use, but difficult to press the right one if 
user messed calibration really badly).

Thanks!

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


