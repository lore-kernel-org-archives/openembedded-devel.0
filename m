Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OEsGT-0007UY-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 01:01:25 +0200
Received: by gwj19 with SMTP id 19so1287584gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Xa9lQC+Tm4I4Gjj7/ovGMfUbUc/YCNaWaUREPt3jxpM=;
	b=ZiJatA1xjDHyaXIZeQ8U1Ry3zk3wKcmQ6HQrdtCR0PF5T8HUelsHj80VDGow1W4Nvf
	jIYV2mL6Iij05+V9cQ1ivLoBJuDUDzLgtELoLRZ+SZMi/B+WkTJkeMVFmI3dUI9pCeJ8
	vLy1dBYZ/HiaIqxMIYIPJoRNyH6W522XgJzv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tIhacF2+w7gh23VyZobCe3zICuC0mOV0184HaZquTBhdV7K+UOnAbUEaWn8FudDNLx
	NUZa7N6GY0f85hkrrMDoyPsRCXPwkYvZmSmqFX2DhKNvtbFccimvSWix4AvlkDuhSn2J
	3tZJWAznR48ux75CWStn5IdtFmz13gtP8WCOE=
MIME-Version: 1.0
Received: by 10.101.160.30 with SMTP id m30mr11498699ano.192.1274309843380; 
	Wed, 19 May 2010 15:57:23 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Wed, 19 May 2010 15:57:23 -0700 (PDT)
In-Reply-To: <1274035921.24454.68.camel@rex>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
	<1273881865.8005.205.camel@trini-m4400>
	<1274035921.24454.68.camel@rex>
Date: Thu, 20 May 2010 00:57:23 +0200
Message-ID: <AANLkTimze8vRUUloa6gaRBU6jvp8zrcSAKDvqCu3ppaY@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Wed, 19 May 2010 23:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Same issue happens during rebuild from packaged staging


Cannot load module
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/.libs/im-xim.so:
undefined symbol: g_realloc_n
| /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la
does not export GTK+ IM module API:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/.libs/im-xim.so:
undefined symbol: g_realloc_n

...

NOTE: package gtk+-native-2.20.0-r8.0: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/oe/openembedded/recipes/gtk+/gtk+_2.20.0.bb do_compile
failed
...

Andrea


