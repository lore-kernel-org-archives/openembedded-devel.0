Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O45W5-0000yT-JW
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Apr 2010 06:56:58 +0200
Received: by fg-out-1718.google.com with SMTP id e12so2099973fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 21:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=h/BE9d0/vHp7chEt4y0y7morI+icv2ZC8JXEVlUhcAE=;
	b=qwKPckS5FQjDiAOhxH40/N8V7nq6rUCKl07hQgUbfjmNprCq3R8WLqNA1OGZpvD7CW
	k3CPle/all3hB7G48LtK8nw9HvtGCZjBl4y8rOhrq+7r1M2Q20+l5y04lVYgjKoSbxeH
	LKqxH9sTPcwWH31WP+vFLkLLmuC/nHZ+Bzdpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ILkuAyrDIztVI0SdHkOAKxNa+2WGAIGaM/hWLOAHOyTNmAiWi/0rw8H6cZls9w6KEf
	RplnhobHTAqrkumpfyI2BIuoi6i1Nv/pJjVp0h/AeapB4ATtitItNHENnBC2D0hQC+80
	Y0hd6O8fiHGlIVkY4pm1ukWaHr5CEbKqK7T54=
Received: by 10.223.161.204 with SMTP id s12mr565412fax.103.1271739202008;
	Mon, 19 Apr 2010 21:53:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 1sm1509352fks.24.2010.04.19.21.53.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Apr 2010 21:53:20 -0700 (PDT)
Date: Tue, 20 Apr 2010 06:53:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100420045324.GE3485@jama>
References: <20100416123920.GB3323@jama> <hq9ogk$k1j$2@dough.gmane.org>
	<201004161541.23250.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201004161541.23250.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Tue, 20 Apr 2010 04:56:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 16, 2010 at 03:41:22PM +0200, Marcin Juszkiewicz wrote:
> Dnia piątek, 16 kwietnia 2010 o 15:25:40 Koen Kooi napisał(a):
> >   Wouldn't it be better to merge the scripts from xserver-kdrive-common
> > and xserver-common and then fix all the sed/awk calls in one place?

Hi,

it's better with xserver-common, here are bootcharts again from
Freerunner

http://build.shr-project.org/tests/jama/bootchart-2.6.32.11.xserver-common.png

and without udevd/hald combo:
http://build.shr-project.org/tests/jama/bootchart-2.6.32.11.xserver-common.no-udev.png

I'll add /etc/X11/Xsession.d/90xXWindowManager and
/etc/X11/Xsession.d/89xTs_Calibrate from xserver-kdrive-common to
xserver-common (if you don't mind or have better place for them) and
push it (enabled by default for SHR).

Thanks,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


