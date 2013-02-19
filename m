Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1U7nm4-0001g2-O7
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 15:02:30 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Tue, 19 Feb 2013
	14:46:11 +0100
X-TM-IMSS-Message-ID: <215f11a200009c65@nedap.com>
Received: from [10.17.16.7] ([10.17.16.7]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 215f11a200009c65 ;
	Tue, 19 Feb 2013 14:46:06 +0100
Message-ID: <51238222.40804@nedap.com>
Date: Tue, 19 Feb 2013 14:46:10 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <511E373D.1070109@nedap.com>
	<CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
	<5121F224.4080906@nedap.com>
	<CAPESJy4eKSJq3VMtTKDDsYaR+0s=pAk+4kASqT74WzS2xQrVDg@mail.gmail.com>
In-Reply-To: <CAPESJy4eKSJq3VMtTKDDsYaR+0s=pAk+4kASqT74WzS2xQrVDg@mail.gmail.com>
Subject: Re: opkg-make-index not found
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
X-List-Received-Date: Tue, 19 Feb 2013 14:02:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 02/18/2013 04:19 PM, Takeshi Hamasaki wrote:
> Hi,
>
> this may or may not help you:
>
> $ bitbake -e package-index > bbenv.package-index
> $ grep PACKAGEINDEXES bbenv.package-index
> (
>   for me, the result was:
>
>   # PACKAGEINDEXES= package_update_index_ipk;
>   PACKAGEINDEXES="package_update_index_ipk;"
>
> )
>
> Then I tried searching "package_update_index_ipk" in bbenv.package-index
> using a text editor. It is a function, and in it, opkg-make-index
> is called in a line:
>
>   flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages
> -p $pkgdir/Packages -m $pkgdir/"
>
> What do you find in your box?
For both I find the same results.
The funny thing is that on the same machine my buildserver is running 
and that one is having no problems...
Jaap



