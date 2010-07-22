Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1Obp6P-0003Ys-LD
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 08:18:22 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 22 Jul 2010 08:17:42 +0200
X-TM-IMSS-Message-ID: <0c81ba1700004611@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0c81ba1700004611 for
	<jaap.dejong@nedap.com>; Thu, 22 Jul 2010 08:17:38 +0100
Message-ID: <4C47E285.708@nedap.com>
Date: Thu, 22 Jul 2010 08:17:41 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Lightning/1.0b1 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4704CB.2010204@gmail.com>
	<i275t3$65g$1@dough.gmane.org>	<4C475AC4.6010302@gmail.com>
	<AANLkTimMZU5mXUn1ZSFJ0_8aDu8ykWYDXMD55iZW8s7A@mail.gmail.com>
In-Reply-To: <AANLkTimMZU5mXUn1ZSFJ0_8aDu8ykWYDXMD55iZW8s7A@mail.gmail.com>
X-OriginalArrivalTime: 22 Jul 2010 06:17:42.0105 (UTC)
	FILETIME=[978A4C90:01CB2965]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg : angstrom fails console-image build
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
X-List-Received-Date: Thu, 22 Jul 2010 06:18:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've made a completely clean build last night and it breaks at the same 
problem.


> You have an 'opkg' package and an 'opkg-nogpg-nocurl' package. As far
> as I can tell, if you had built from a clean dev tree then there would
> be no 'opkg' package. Angstrom currently uses opkg-nogpg-nocurl, so
> that is the only package you should have.
>
> This indicates that you have a non clean dev tree, or have had a non
> clean dev tree in the past. If you've done a build in the past with
> patches applied, then you've reverted the patches, you probably need
> to remove your temp dir and start the build again.
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    


