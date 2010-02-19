Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NiUwc-0008Ri-Cz
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 16:39:09 +0100
Received: by fxm20 with SMTP id 20so203121fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=L9hstixFfDJ+ahpe2YufRPTAESmdfe56ueLyUP43Rlk=;
	b=ip5YxVRLOx0F8jlBX49Cl6AnU3ifJlyeaPmWuHq+94n1H5sccULgkXHIqlgY9uDc/o
	oAY2fTwPjqBOzk4svorLv6ViZFYNZu/UFJzv/0dMup68m+OJiKquEVzmOH8hOkBBq4wu
	z2BLY9ps/YJe7nQzN2PVZhVAMKVTKrpbpQN20=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B5OZx1rohwV9CEJoOMerizheiNlKcfzpUHzwrRpAvxPqOET0tWbZHfKPLJQ0BLZLB1
	IKtYezTMabwuZ0g41ZZXu7HGUTPX0lNudQ2ErsMlV9uZVSBcU/lSuSRDq80C8UKBOwFv
	RMc3od+neF+qZFGCSBWggWelAj1Ur97vo9DwA=
MIME-Version: 1.0
Received: by 10.223.143.71 with SMTP id t7mr6806163fau.38.1266593785089; Fri, 
	19 Feb 2010 07:36:25 -0800 (PST)
In-Reply-To: <20100218195502.GA6823@excalibur.local>
References: <1266435248-17054-1-git-send-email-aalonso00@gmail.com>
	<20100218195502.GA6823@excalibur.local>
Date: Fri, 19 Feb 2010 09:36:25 -0600
Message-ID: <d1ded4381002190736v2718e87ve7878e134b35ff38@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] xilinx-ml507.conf: fix u-boot config file
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
X-List-Received-Date: Fri, 19 Feb 2010 15:39:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes the ML507 board is similar to the ML310 the only main difference is the
processor version
ppc440 - ppc405 since they share the same bus processor (PLB) chances are
that hardware designs
can be reused with minimal changes to be supported by the Linux kernel.
At my lab university we are working on hardware/software co-design but we
wan't to get rid off
xilinx linux bsp since they are based on old kernel version and have a
considerable cost, that's way we consider
OE as flexible infrastructure that can be reused to make easier the
co-design process.


On Thu, Feb 18, 2010 at 1:55 PM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Wed, 2010-02-17 at 13:34, Adrian Alonso wrote:
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
>
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
>
> Applied on top of the oether and compile tested. (BTW, is this machine
> something
> like a successor of the ML310? Eventually I did some work on this in a lab
> at
> university to learn about software hardware co-design. :))
>
> I'll wait 2-3 days more for feedback that the PowerPC guys may have and
> push
> them all afterwards if no problems arise.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

