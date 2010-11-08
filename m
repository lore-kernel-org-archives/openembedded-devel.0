Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PFa76-0008RP-Iw
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 23:22:56 +0100
Received: by wye20 with SMTP id 20so307665wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 14:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tn3Zn0fJwLg/JNHUvCDDMVqh+m3CvPZCZQBvlu8v9VQ=;
	b=aNkXV8kHPs2pGpbVPUrhqWahwtqn7foQW50bp+ve13Gk4TSgAm43z0/k4wsXOQGVUx
	NNukrzOPRcrsMswk/+iuBRLb6DvITz6L2VwZI9QSHsvmPxmBFBeNaPdtuZoSrDvPYTKG
	/tPw9cvwDCJAnSbQ20ZdL3Ri66RdE9nLJSqro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sIXs2/gIhIUa5viy856FYCuJ+2GuKkz3Ccb6w5yUWvzZAk7MxlYgGQSVgb4kJE6nfk
	zh/lts+6oLatHCMaoH94Vd+JkYJDmiq3GIjrTfN7nbnhDQNHz2qHJhx0IQmVNvywFO9V
	nZpGl7Js/UkpTgnfEk0gkqD0wDB8SooQ3YTxE=
MIME-Version: 1.0
Received: by 10.227.135.9 with SMTP id l9mr5949481wbt.49.1289254919499; Mon,
	08 Nov 2010 14:21:59 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Mon, 8 Nov 2010 14:21:59 -0800 (PST)
In-Reply-To: <AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
References: <4CD731A8.3020809@gmail.com>
	<AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
Date: Tue, 9 Nov 2010 08:51:59 +1030
Message-ID: <AANLkTi=JbmuXAXPD=8jNS2kTsuC9SS=UL4vepkHw1Wqt@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake weirdness during -k world
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
X-List-Received-Date: Mon, 08 Nov 2010 22:22:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 November 2010 05:52, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Nov 7, 2010 at 3:09 PM, Graham Gower <graham.gower@gmail.com> wrote:
>> I have a 1gb world.log file after running:
>> bitbake -k world | tee world.log
>>
>
> I have this very same problem too and its recent enough. We should be
> able to find which commit is causing it (bisect bitbake)
> I am using bitbake master are you using same too ?
>

Yep, bitbake master.


