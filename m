Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TiNTV-0000Ug-TP
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 11:54:12 +0100
Received: by mail-ie0-f170.google.com with SMTP id k10so11725106iea.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=a8Bs2lJ9Z9yD/YWUO8m777yfdq4e//tUUzbZwLIeON0=;
	b=qr0HASmm+pgS9yDQKMnvGY+Sl7QMC/93Exl8OaIKPLnj8EvMoBcmAghOKgsWKQSUmp
	A26Fp1UNJQSwP2NHmYKzGXt2s6sufBgBOoX7x0xP4VX9FhDvbWlRcF57itlD6x7MYMfo
	1WGqjUJq7v2nRgUE6aoo5rAugGTRYwTK3eVxSlDUEXd3uYfeeB9sK0sZsMpqcQeqG1mQ
	Bvhe2BGLtt+nhaRTtqUQOMS86zEimBU9A8XkO5uAx7j9IWiFbn2R9A9krRmUaF1uGrOB
	lRt7rlR6GfvMflKCa29D/FGxdbRWAPmXBbXslBz6eeYpQ+pQxJP6G8RV5CLxzCZxRXGK
	iDAA==
MIME-Version: 1.0
Received: by 10.50.184.232 with SMTP id ex8mr9314220igc.30.1355222377425; Tue,
	11 Dec 2012 02:39:37 -0800 (PST)
Received: by 10.64.14.194 with HTTP; Tue, 11 Dec 2012 02:39:37 -0800 (PST)
In-Reply-To: <CA+chaQfU+Ehchj46abTkNcAnFO5rCCq5xSeY85TSJHigHURQEw@mail.gmail.com>
References: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
	<CA+chaQfU+Ehchj46abTkNcAnFO5rCCq5xSeY85TSJHigHURQEw@mail.gmail.com>
Date: Tue, 11 Dec 2012 11:39:37 +0100
Message-ID: <CAAQYJAsR7PHXN1=TP9emD0eaon+7ZC=4erkZoyzOjK=BVvySuA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.4: initial commit for Zaurus
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
X-List-Received-Date: Tue, 11 Dec 2012 10:54:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 11, 2012 at 11:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Dec 1, 2012 at 12:42 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> * based on linux-yocto-standard cfg fragments
>> * kernel 3.4 boots though size is too big
>> * put together pending/submitted patches
>> * for the moment DEFAULT_PREFERENCE = "-1"
>
> This bbappend is changing D_P for all machines including qemu* where
> it's causing downgrade from 3.4 to 3.2 unless P_V is specified.

My bad.
Should I limit it setting specificly DEFAULT_PREFERENCE_spitz = "-1"
and so on for other machines?

Regards

Andrea


>
> Cheers,
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


